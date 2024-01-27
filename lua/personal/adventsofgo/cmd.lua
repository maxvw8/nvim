local M = {
}
local default = -1


local function log(buffer_number, data)
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

local function buffer_already_open(buffer_number)
  return buffer_number ~= default
end
local function buffer_visible(buffer_number)
  -- Get a boolean that tells us if the buffer number is visible anymore.
  --
  -- :help bufwinnr
  return vim.api.nvim_call_function("bufwinnr", { buffer_number }) ~= default
end
local function open_buffer(buffer_number)
  if not buffer_already_open(buffer_number) or not buffer_visible(buffer_number) then
    -- Create a new buffer with the name "AUTOTEST_OUTPUT".
    -- Same name will reuse the current buffer.
    vim.api.nvim_command("botright vsplit AUTOTEST_OUTPUT")
    -- Mark the buffer as readonly.
    vim.opt_local.readonly = true
    -- Collect the buffer's number.
    return vim.api.nvim_get_current_buf()
  end

  return buffer_number
end

AdventsOfGoConfig = {}

function M.setup()
  local config = {
    buffer_number = -1,
    autocmd_id = -1,
  }
  AdventsOfGoConfig = config
end

local function mount(file, buffer_number)
  -- Open our buffer, if we need to.
  local opened_buffer = open_buffer(buffer_number)
  -- Clear the buffer's contents incase it has been used.
  vim.api.nvim_buf_set_lines(opened_buffer, 0, -1, true, { "Output of " .. file })
  -- Run the command.
  vim.fn.jobstart({ "go", "run", file }, {
    stdout_buffered = true,
    on_stdout = function(_, data)
      log(opened_buffer, data)
    end,
    on_stderr = function(_, data)
      log(opened_buffer, data)
    end,
  })
  return opened_buffer
end

local function unmount(buffer_number, autocmd_id)
  if buffer_already_open(buffer_number) then
    vim.api.nvim_buf_delete(buffer_number, { force = true, unload = true })
  end
  if autocmd_id ~= default then
    vim.api.nvim_del_autocmd(autocmd_id)
  end
end

function M.load_autocmd()
  print("loading autocmds!")
  AdventsOfGoConfig.autocmd_id = vim.api.nvim_create_autocmd({ "BufWritePost", "BufWinEnter" }, {
    group = vim.api.nvim_create_augroup("AutotestgroupMount", { clear = true }),
    pattern = "*.go",
    callback = function(args)
      AdventsOfGoConfig.buffer_number = mount(args.file, AdventsOfGoConfig.buffer_number)
    end
  })
  AdventsOfGoConfig.autocmd_id = vim.api.nvim_create_autocmd(
    { "ExitPre", "BufHidden" }, {
      group = vim.api.nvim_create_augroup("AutotestgroupUndmount", { clear = true }),
      pattern = "*.go",
      callback = function()
        unmount(AdventsOfGoConfig.buffer_number, AdventsOfGoConfig.autocmd_id)
        -- M.setup()
      end
    })
end

M.setup()
return M
