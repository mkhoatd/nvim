return {
  {
    "sourcegraph/sg.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim", --[[ "nvim-telescope/telescope.nvim ]]
    },
    --- @type sg.config
    opts = {
      accept_tos = true,
      enable_cody = true,
      download_binaries = true,
    },
    config = function(_, opts)
      require("sg").setup(opts)
      local cody_commands = require("sg.cody.commands")
      --- @type cody.ChatOpts
      local poi_opts = {
        model = "anthropic/claude-3-opus-20240229",
      }

      local commands = {}

      ---@command :CodyAsk [[
      --- Ask a question about the current selection.
      ---
      --- Use from visual mode to pass the current selection
      ---@command ]]
      commands.CodyAsk2 = {
        function(command)
          if command.range == 0 then
            cody_commands.ask(command.args, poi_opts)
          else
            local bufnr = vim.api.nvim_get_current_buf()
            cody_commands.ask_range(bufnr, command.line1, command.line2, command.args, poi_opts)
          end
        end,
        { range = 2, nargs = 1 },
      }

      ---@command :CodyExplain [[
      --- Ask a question about the current selection.
      ---
      --- Use from visual mode to pass the current selection
      ---@command ]]
      commands.CodyExplain2 = {
        function(command)
          local proto = require("sg.cody.protocol")

          if command.range == 0 then
            cody_commands.ask(command.args, poi_opts)
          else
            local bufnr = vim.api.nvim_get_current_buf()
            require("sg.cody.rpc").notify(
              "textDocument/didChange",
              proto.get_text_document(bufnr, {
                content = true,
                selection = {
                  start = {
                    line = command.line1 - 1,
                    character = 0,
                  },
                  ["end"] = {
                    line = command.line2,
                    character = 0,
                  },
                },
              })
            )
            cody_commands.ask_range(bufnr, command.line1 - 1, command.line2, command.args, poi_opts)
          end
        end,
        { range = 2 },
      }

      ---@command :CodyChat{!} {title} [[
      --- State a new cody chat, with an optional {title}
      ---
      --- If {!} is passed, will reset the chat and start a new chat conversation.
      ---
      --- For more configuation options, see: `:help sg.cody.commands.chat`
      ---@command ]]
      commands.CodyChat2 = {
        function(command)
          local name = nil
          if not vim.tbl_isempty(command.fargs) then
            name = table.concat(command.fargs, " ")
          end

          cody_commands.chat(command.bang, { name = name, model = poi_opts.model })
        end,
        { nargs = "*", bang = true },
      }

      ---@command :CodyToggle [[
      --- Toggles the current Cody Chat window.
      ---@command ]]
      commands.CodyToggle2 = {
        function(_)
          cody_commands.toggle()
        end,
        {},
      }

      ---@command :CodyTask {task_description} [[
      --- Instruct Cody to perform a task on selected text.
      ---@command ]]
      commands.CodyTask2 = {
        function(command)
          local bufnr = vim.api.nvim_get_current_buf()
          cody_commands.do_task(bufnr, command.line1 - 1, command.line2, command.args)
        end,
        { range = 2, nargs = 1 },
      }

      commands.CodyDo2 = {
        function(_)
          error("CodyDo is deprecated. Use CodyTask instead.")
        end,
        { range = 2, nargs = 1 },
      }

      local create_command = function(name)
        vim.api.nvim_create_user_command(name, unpack(commands[name]))
      end

      local delete_command = function(name)
        pcall(vim.api.nvim_del_user_command, name)
      end

      for k, _ in pairs({ "CodyAsk", "CodyChat", "CodyDo", "CodyExplain", "CodyTask" }) do
        delete_command(k)
      end
      for k, _ in pairs(commands) do
        create_command(k)
      end
      for k, _ in pairs({ "CodyAsk", "CodyChat", "CodyDo", "CodyExplain", "CodyTask" }) do
        delete_command(k)
      end
    end,
  },
}
