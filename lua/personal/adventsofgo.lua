local default = -1
local buffer_number = default
local autocmd_id = default

local function log(_, data)
  if data then
    -- Make it temporarily writable so we don't have warnings.
    vim.api.nvim_buf_set_option(buffer_number, "readonly", false)

    -- Append the data.
    vim.api.nvim_buf_set_lines(buffer_number, -1, -1, true, data)

    -- Make readonly again.
    vim.api.nvim_buf_set_option(buffer_number, "readonly", true)

    -- Mark as not modified, otherwise you'll get an error when
    -- attempting to exit vim.
    vim.api.nvim_buf_set_option(buffer_number, "modified", false)

    -- Get the window the buffer is in and set the cursor position to the bottom.
    --   local buffer_window = vim.api.nvim_call_function("bufwinid", { buffer_number })
    --   local buffer_line_count = vim.api.nvim_buf_line_count(buffer_number)
    --   vim.api.nvim_win_set_cursor(buffer_window, { buffer_line_count, 0 })
  end
end
local function buffer_already_open()
  return buffer_number ~= default
end

local function open_buffer()
  -- Get a boolean that tells us if the buffer number is visible anymore.
  --
  -- :help bufwinnr
  local buffer_visible = vim.api.nvim_call_function("bufwinnr", { buffer_number }) ~= default

  if buffer_already_open() or not buffer_visible then
    -- Create a new buffer with the name "AUTOTEST_OUTPUT".
    -- Same name will reuse the current buffer.
    vim.api.nvim_command("botright vsplit AUTOTEST_OUTPUT")

    -- Collect the buffer's number.
    buffer_number = vim.api.nvim_get_current_buf()

    -- Mark the buffer as readonly.
    vim.opt_local.readonly = true
  end
end

function adventsofgo(cmd)
  if not cmd.bang then
    autocmd_id = vim.api.nvim_create_autocmd("BufWritePost", {
      group = vim.api.nvim_create_augroup("Autotestgroup", { clear = true }),
      pattern = "*.go",
      callback = function(args)
        -- Open our buffer, if we need to.
        open_buffer()

        -- Clear the buffer's contents incase it has been used.
        vim.api.nvim_buf_set_lines(buffer_number, 0, -1, true, { "Output of " .. args.file })

        -- Run the command.
        vim.fn.jobstart({ "go", "run", args.file }, {
          stdout_buffered = true,
          on_stdout = log,
          on_stderr = log,
        })
      end
    })
  elseif cmd.bang then
    if buffer_already_open() then
      vim.api.nvim_buf_delete(buffer_number, { unload = true })
    end
    if autocmd_id ~= default then
      vim.api.nvim_del_autocmd(autocmd_id)
    end
  end
end

vim.api.nvim_create_user_command('AdventsOfGo', adventsofgo, {
  bang = true,
  desc = "Activate auto 'go run %' on save of .go files",

})
