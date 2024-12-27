---@diagnostic disable: undefined-global
local M = {}

function M:peek(job)
	-- launch process
	local process, code = Command("transmission-show")
		:args({
			tostring(job.file.url),
		})
		:stdout(Command.PIPED)
		:spawn()

	local limit = job.area.h
	-- read and count lines from process
	local i, lines = 0, ""
	repeat
		local next, event = process:read_line()
		if event ~= 0 then
			break
		end

		i = i + 1
		-- only concatenate lines that are past 'skip' number of STDOUT
		if i > job.skip then
			lines = lines .. next
		end
	until i >= job.skip + limit -- until reader reaches max number of lines on screen plus skip

	process:start_kill()

	-- if paged below all output, run peek again with smaller skip
	if job.skip > 0 and i < job.skip + limit then
		ya.manager_emit(
			"peek",
			{ tostring(math.max(0, i - limit)), only_if = tostring(job.file.url), upper_bound = "" }
		)
	-- preview torrent
	else
		ya.preview_widgets(job, { ui.Text(lines):area(job.area):wrap(ui.Text.RIGHT) })
	end
end

function M:seek(job)
	local h = cx.active.current.hovered
	if h and h.url == job.file.url then
		local step = math.floor(job.units * job.area.h / 10)
		ya.manager_emit("peek", {
			math.max(0, cx.active.preview.skip + step),
			only_if = job.file.url,
		})
	end
end

return M
