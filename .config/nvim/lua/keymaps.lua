-- 키맵 설정 헬퍼 함수
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }  -- noremap: 재귀 방지, silent: 명령어 표시 X

-- ⌨️ 기본 키맵
--keymap("i", "jk", "<ESC>", opts)   -- jk를 빠르게 누르면 ESC로 변환 (입력 모드 탈출)
keymap("n", "<leader>w", ":w<CR>", opts)  -- <leader>w로 빠른 저장


-- 🔍 Telescope 단축키 (파일 검색)
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)

-- 📂 NvimTree (파일 탐색기 열기/닫기)
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- 🚀 버퍼 관리
keymap("n", "<leader>q", ":bd<CR>", opts)  -- 현재 버퍼 닫기
keymap("n", "<Tab>", ":bnext<CR>", opts)  -- 다음 버퍼로 이동
keymap("n", "<S-Tab>", ":bprev<CR>", opts)  -- 이전 버퍼로 이동

