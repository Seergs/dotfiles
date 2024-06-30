local ok, obsidian = pcall(require, "obsidian")
if not ok then
    print("Obsidian not ready")
    return
end

local path = vim.fn.expand "~" .. "/Library/Mobile Documents/iCloud~md~obsidian/Documents/notes"

obsidian.setup({
  workspaces = {
    {
      name = "Notes",
      path = path
    }
  },
  notes_subdir = "0 - inbox",
  new_notes_location = "0 - inbox",
})
