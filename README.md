## How to use it
1. Create a new "package" for the config, the name doesn't matter. Package is just a folder
2. Inside that folder, copy the exact same structure path/directories from where this project is located to the location of the configs. Example:
    
    My Neovim setup is located at `~/.config/nvim` so inside the nvim package I create the same structure `.config/nvim`
3. Move your config to the created folder. Move, not copy. You want to make sure the original location doesn't exist as stow will create a symlink.
4. Run `stow <package_name>`, eg. `stow nvim`. This will create a symlink from your dotfiles to your system location you defined in the previous steps.
