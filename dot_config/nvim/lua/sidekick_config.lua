local sidekick = require("sidekick")
local cli = require("sidekick.cli")

sidekick.setup({
    cli = {
        picker = "snacks",
        win = {
            layout = "right",
            split = {
                width = 88,
                height = 20,
            },
        },
    },
})

vim.o.autoread = true

vim.keymap.set({ "n", "t", "i", "x" }, "<C-.>", function()
    cli.focus()
end, { desc = "Sidekick focus CLI" })

vim.keymap.set("n", "<leader>aa", function()
    cli.toggle()
end, { desc = "Sidekick toggle CLI" })

vim.keymap.set("n", "<leader>as", function()
    cli.select({ filter = { installed = true } })
end, { desc = "Sidekick select CLI" })

vim.keymap.set("n", "<leader>ad", function()
    cli.close()
end, { desc = "Sidekick detach CLI session" })

vim.keymap.set({ "n", "x" }, "<leader>at", function()
    cli.send({ msg = "{this}" })
end, { desc = "Sidekick send this" })

vim.keymap.set("n", "<leader>af", function()
    cli.send({ msg = "{file}" })
end, { desc = "Sidekick send file" })

vim.keymap.set("x", "<leader>av", function()
    cli.send({ msg = "{selection}" })
end, { desc = "Sidekick send selection" })

vim.keymap.set({ "n", "x" }, "<leader>ap", function()
    cli.prompt()
end, { desc = "Sidekick select prompt" })

vim.keymap.set("n", "<leader>ac", function()
    cli.toggle({ name = "codex", focus = true })
end, { desc = "Sidekick toggle Codex" })

vim.keymap.set("n", "<leader>aC", function()
    cli.toggle({ name = "claude", focus = true })
end, { desc = "Sidekick toggle Claude" })
