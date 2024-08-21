{
  plugins = {
    telescope = {
      enable = true;

      extensions = {
        file-browser = {
          enable = true;
        };

        fzf-native = {
          enable = true;
        };
      };

      settings = {
        defaults = {
          layout_config = {
            horizontal.promp_position = "top";
          };
        };
        sorting_strategy = "ascending";
      };

      keymaps = {
        "<C-p>" = "live_grep";
        "<leader>fg" = {
          action = "git_files";

          options = {
            desc = "Telescope Git Files";
          };
        };
        "<leader><space>" = {
          action = "find_files";
          options = {
            desc = "Find project files";
          };
        };
      };
    };
  };
}
