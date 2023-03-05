require('auto-session').setup({
	log_level = "info",
	auto_session_enable_last_session = false,
	auto_restore_enabled = false,
	auto_session_root_dir = vim.fn.stdpath('data')..'/sessions/',
	auto_save_enabled = true,
	auto_session_create_enabled = true,
})

require('session-lens').setup();
