print("BEGIN")

Scan_in_process = false
Theorems_buffer = ""
Theorems_c_arr = {}
Theorems_v_arr = {}
luatexbase.add_to_callback("process_input_buffer", function(line_content)
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

function Generate_end()
	local original_section = token.scan_string()
	for key, value in pairs(Theorems_v_arr) do
		local section_number = tonumber(string.match(Theorems_c_arr[key], "(%d+)%."))
		local theorem_number = tonumber(string.match(Theorems_c_arr[key], "%.(%d+)")) - 1
		tex.print("\\setcounter{theorem}{" .. theorem_number .. "}")
		tex.print("\\setcounter{section}{" .. section_number .. "}")
		tex.print(value)
	end

	tex.print("\\setcounter{section}{" .. original_section .. "}")
end

print("END")
