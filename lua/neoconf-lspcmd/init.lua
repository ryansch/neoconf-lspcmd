local Util = require("neoconf.util")
local Config = require("neoconf.config")

local logger = require("plenary.log").new({
	plugin = "neoconf-lspcmd",
	level = "info",
})

local M = {}

M.defaults = {
	enabled = true,
	log_level = "info",
	ls_mappings = {
		standardrb = "standardRuby",
	},
}

function M.on_schema(_) end

function M.setup()
	Config.options.plugins.lspcmd = Util.merge(M.defaults, Config.options.plugins.lspcmd)
	logger.level = Config.options.plugins.lspcmd.log_level

	Util.on_config({
		name = "settings/plugins/lspcmd",
		on_config = M.on_new_config,
	})
end

function M.on_new_config(config, root_dir, original_config)
	logger.debug("on_new_config", config, root_dir, original_config)

	logger.debug("config.settings", config.settings)

	local options = Config.get({ file = root_dir })
	if not options.plugins.lspcmd.enabled then
		return
	end

	local name = config["name"]
	local configName = options.plugins.lspcmd.ls_mappings[name] or name
	logger.debug("configName", configName)

	local commandPath = vim.tbl_get(config.settings, configName, "commandPath")
	logger.debug("commandPath", commandPath)

	if commandPath ~= nil then
		local args = vim.list_slice(config.cmd, 2, #config.cmd)
		config.cmd = vim.list_extend({ commandPath }, args)
		logger.debug("config.cmd", config.cmd)
	end
end

function M.on_update(_) end

return M
