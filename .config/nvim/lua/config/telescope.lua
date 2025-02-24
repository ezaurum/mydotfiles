local telescope = require("telescope")

-- Git 프로젝트이면 Git Root, 아니면 현재 디렉토리(pwd) 반환
local function get_project_root()
  local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
  if vim.v.shell_error == 0 then
    return git_root
  else
    -- 기본 `cwd`를 프로젝트 루트로 설정
    return vim.loop.cwd()
  end
end

telescope.setup({
  defaults = {
    cwd = get_project_root(), -- Git 프로젝트라면 Git Root, 아니면 현재 디렉토리
  },
  layout_config = {
    prompt_position = "top",
  },
})

vim.keymap.set("n", "<leader>ff", 
function()
    local builtin = require("telescope.builtin")
    builtin.find_files({ prompt_title = "Find Files" })

    local fzf = require("fzf-lua")
    fzf.lsp_workspace_symbols({ prompt = "LSP Symbols > ", fzf_layout = "reverse-list" })
    fzf.live_grep({ prompt = "Live Grep > ", fzf_layout = "reverse-list" })
end, 
{ noremap = true, silent = true })
