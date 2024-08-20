{
  colorschemes.dracula.enable = true;

  plugins = {
    neocord.enable = true;

    #treesitter
    treesitter = {
      enable = true;
      nixGrammars = true;
      indent = true;
    };
    treesitter-context = {
      enable = true;
      settings = {max_lines = 2;};
    };
    rainbow-delimiters.enable = true;

    lightline.enable = true;

    nvim-tree = {
      enable = true;
      openOnSetupFile = true;
      autoReloadOnWrite = true;
    };

    toggleterm = {
      enable = true;
      settings = {
        open_mapping = "[[<C-t>]]";
      };
    };

    which-key.enable = true;

    copilot-chat.enable = true;
    copilot-lua = {
      enable = true;
      suggestion.enabled = false;
      panel.enabled = false;
    };
  };

  globals.mapleader = " ";
  keymaps = [
    {
      key = "<C-n>";
      action = "<CMD>NvimTreeToggle<CR>";
      options.desc = "Toggle NvimTree";
    }
    {
      key = "<leader>c";
      action = "+context";
    }
    {
      key = "<leader>co";
      action = "<CMD>TSContextToggle<CR>";
      options.desc = "Toggle Treesitter context";
    }

    #copilot chat
    {
      key = "<leader>co";
      action = "<CMD>TSContextToggle<CR>";
      options.desc = "Toggle Treesitter context";
    }
    {
      key = "<leader>ct";
      action = "<CMD>CopilotChatToggle<CR>";
      options.desc = "Toggle Copilot Chat Window";
    }
    {
      key = "<leader>cf";
      action = "<CMD>CopilotChatFix<CR>";
      options.desc = "Fix the selected code";
    }
    {
      key = "<leader>cs";
      action = "<CMD>CopilotChatStop<CR>";
      options.desc = "Stop current Copilot output";
    }
    {
      key = "<leader>cr";
      action = "<CMD>CopilotChatReview<CR>";
      options.desc = "Review the selected code";
    }
    {
      key = "<leader>ce";
      action = "<CMD>CopilotChatExplain<CR>";
      options.desc = "Give an explanation for the selected code";
    }
    {
      key = "<leader>cd";
      action = "<CMD>CopilotChatDocs<CR>";
      options.desc = "Add documentation for the selection";
    }
    {
      key = "<leader>cp";
      action = "<CMD>CopilotChatTests<CR>";
      options.desc = "Add tests for my code";
    }
  ];
}
