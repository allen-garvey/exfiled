file_extensions = ["ex", "md", "rb"]
#use System.user_home instead of ~ since it won't be expanded
files = Enum.map(file_extensions, fn x -> System.cmd "find", ["../", "-type", "f", "-name", "*.#{x}"]  end)

file_strings = Enum.map files, fn x -> {g,_} = x
g
end

file_string_list = Enum.map file_strings, fn x -> String.split x, "\n"  end
