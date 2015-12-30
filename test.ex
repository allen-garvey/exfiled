file_extensions = ["ex", "md", "rb"]
#use System.user_home instead of ~ since it won't be expanded


x = file_extensions |> 
Stream.map(fn x -> System.cmd "find", ["../", "-type", "f", "-name", "*.#{x}"]  end) |>
Stream.map (fn x -> Kernel.elem x, 0 end)
y = x |> Stream.filter(fn x -> x != "" end) |>
Enum.map(fn x -> String.split x, "\n"  end)

IO.inspect y

