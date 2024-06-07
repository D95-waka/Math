print("BEGIN")
--local t = token.get_next()
--tex.print(t.id .. " " .. t.tok .. " " .. t.command)

Scan_in_process = false
Theorems_buffer = ""
Theorems_c_arr = {}
Theorems_v_arr = {}
local id, error = luatexbase.add_to_callback("process_input_buffer", function(line_content)
	print("BODY -- " .. line_content)
	if string.find(line_content, "\\begin{theorem}") then
		Scan_in_process = true
		-- Theorems_buffer = Theorems_buffer .. " \\thetheorem "
		--local t = token.get_next()
		Theorems_buffer = Theorems_buffer .. line_content
		return line_content .. " \\directlua{ t = token.scan_word() table.insert(Theorems_c_arr, t) } \\thetheorem{} "
	end

	if Scan_in_process then
		Theorems_buffer = Theorems_buffer .. line_content
	end

	if string.find(line_content, "\\end{theorem}") then
		Scan_in_process = false
		table.insert(Theorems_v_arr, Theorems_buffer)
		Theorems_buffer = ""
	end

	return line_content
end, "finish")
-- print(id .. " " .. error)

function generate_end()
	for key, value in pairs(Theorems_v_arr) do
		tex.print("\\setcounter{theorem}{" .. (tonumber(string.match(Theorems_c_arr[key], "%.(%d+)")) - 1) .. "}")
		--tex.print(Theorems_c_arr[key])
		tex.print(value)
	end
end

print("END")
