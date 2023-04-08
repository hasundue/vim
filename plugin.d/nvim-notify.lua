--
-- lua_source {
--
vim.notify = require("notify") -- override built-in notify

-- }

--
-- lua_add {
--
vim.api.nvim_set_hl(0, "FloatBorder", { link = "NotifyINFOBorder" })

-- }
