file_extensions = ["ex", "md", "rb"]
#use System.user_home instead of ~ since it won't be expanded


file_extensions |> 
Stream.map(fn x -> System.cmd "find", ["../", "-type", "f", "-name", "*.#{x}"]  end) |>
Stream.map (fn x -> {g,_} = x
g
end) |>
Stream.filter(fn x -> x != "" end) |>
Enum.map(fn x -> String.split x, "\n"  end)

