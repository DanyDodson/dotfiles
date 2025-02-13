-- no-status
require("no-status"):setup()

-- full-border
require("full-border"):setup({
	type = ui.Border.ROUNDED,
})

-- hide-preview
if os.getenv("NVIM") then
	require("hide-preview"):entry()
end

require("mime-ext"):setup({
	with_files = { makefile = "text/makefile" },
	with_exts = { mk = "text/makefile" },
	fallback_file1 = false,
})
