require("mason").setup()

local pylsp = require("mason-registry").get_package("python-lsp-server")
pylsp:on("install:success", function()
    local function mason_package_path(package)
      local path = vim.fn.resolve(vim.fn.stdpath("data") .. "/mason/packages/" .. package)
      return path
    end

    local path = mason_package_path("python-lsp-server")
    local command = path .. "/venv/bin/pip install pyls-flake8"
    print(command)
    os.execute(command)
end)
