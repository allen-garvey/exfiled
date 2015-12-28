file_extensions = ["rb", "md"]
#use System.user_home instead of ~ since it won't be expanded
files = Enum.map(file_extensions, fn x -> System.cmd "find", [".", "-type", "f", "-name", "*.#{x}"]  end)
