{pkgs, ...}: {
  vim = {
    globals.mapleader = " ";
    options.shiftwidth = 2;
    options.conceallevel =1;
    theme = {
      enable = true;
      name = "catppuccin";
      style = "mocha";
    };

    statusline.lualine.enable = true;
    telescope.enable = true;
    autocomplete.nvim-cmp.enable = true;
    filetree.neo-tree.enable = true;
    git.vim-fugitive.enable = true;

    languages = {
      enableLSP = true;
      enableTreesitter = true;

      nix.enable = true;
      rust.enable = true;
      python.enable = false;
      markdown.enable =true;
     
    };

    lazy.plugins = {
      "obsidian.nvim" = {
        package = pkgs.vimPlugins.obsidian-nvim;
        setupModule = "obsidian";
        setupOpts = {
            workspaces = [{name = "Eve" ; path = "~/Documents/vaults/Eve";}];
        };

        	
        lazy = true;
        cmd = ["ObsidianNew"];
        event = ["BufNewFile *.md" "BufWritePre *.md" "BufReadPost *.md"];
        after = ''
		-- greetings when package opened
		print('Obsidian.nvim loaded <3')
		'';
      };
    };


  };
}
