-- -- no-status
-- require("no-status"):setup()

-- -- full-border
-- require("full-border"):setup({
-- 	---@diagnostic disable-next-line: undefined-global
-- 	type = ui.Border.ROUNDED,
-- })

-- -- hide-preview
-- if os.getenv("NVIM") then
-- 	require("hide-preview"):entry()
-- end

-- require("mime-ext"):setup({
-- 	-- Expand the existing filename database (lowercase), for example:
-- 	with_files = {
-- 		makefile = "text/makefile",
-- 		-- ...
-- 	},
-- 	-- Expand the existing extension database (lowercase), for example:
-- 	with_exts = {
-- 		mk = "text/makefile",
-- 		-- ...
-- 	},
-- 	-- If the mime-type is not in both filename and extension databases,
-- 	-- then fallback to Yazi's preset `mime` plugin, which uses `file(1)`
-- 	fallback_file1 = false,
-- })
