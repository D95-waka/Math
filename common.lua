#!/usr/bin/env lua

local function env(env_name)
	local val = os.getenv(env_name)
	tex.write(val)
end

local function get_env(command_name)
	local command_value = os.getenv(command_name)
	token.set_macro(command_name, command_value)
end

local function tst_echo(a)
	tex.write(a, "#1")
end

local function generate_question()
	tex.print("\\section{Obsolete שאלה " .. Q_number .. "}")
	Q_number = Q_number + 1
	C_number = 1
end

local function generate_sub_question()
	tex.print("\\subsection{Obsolete סעיף " .. Letters[C_number] .. "'}")
	C_number = C_number + 1
end

local function generate_command(command_name, function_name, argc)
	local func_arg_string = ''
	for i = 1, argc do
		func_arg_string = func_arg_string .. '\'#' .. i .. '\''
		if i < argc then
			func_arg_string = func_arg_string .. ','
		end
	end

	local str = '\\newcommand{\\' .. command_name .. '}[' ..
		argc .. ']{\\directlua{ common.' .. function_name .. ' (' ..
		func_arg_string .. ')}}'
	tex.print(str)
end

local function main()
	Letters = { 'א', 'ב', 'ג', 'ד', 'ה', 'ו', 'ז', 'ח', 'ט', 'י',
		'כ', 'ל', 'מ', 'נ', 'ס', 'ע', 'פ', 'צ', 'ק', 'ר', 'ש', 'ת'
	}
	Q_number = 1
	C_number = 1

	generate_command('Env', 'env', 1)
	generate_command('GetEnv', 'get_env', 1)
	generate_command('Question', 'generate_question', 0)
	generate_command('Subquestion', 'generate_sub_question', 0)
end

main()
return {
	env = env,
	get_env = get_env,
	generate_question = generate_question,
	generate_sub_question = generate_sub_question,
	tst_echo = tst_echo
}
