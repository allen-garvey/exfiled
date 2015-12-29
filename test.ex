file_extensions = ["ex", "md", "rb"]
#use System.user_home instead of ~ since it won't be expanded
files = Stream.map(file_extensions, fn x -> System.cmd "find", ["../", "-type", "f", "-name", "*.#{x}"]  end)

file_strings = Stream.map files, fn x -> {g,_} = x
g
end

file_strings2 = Stream.filter file_strings, fn x -> x != "" end

file_string_list = Enum.map file_strings2, fn x -> String.split x, "\n"  end
