local ok, obsidian = pcall(require, "obsidian")
if not ok then
    print("Obsidian not ready")
    return
end

local path = vim.fn.expand "~" .. "/Library/Mobile Documents/iCloud~md~obsidian/Documents/notes"

obsidian.setup({
    dir = path,

    daily_notes = {
      folder = "0 - inbox"
    },

    new_notes_location = "current_dir",
})
