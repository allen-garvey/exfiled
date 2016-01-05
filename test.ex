file_extensions = ["ex", "md", "rb"]
#use System.user_home instead of ~ since it won't be expanded
categories = [{~r/\.ex/i, "Elixir"}]

cat_finder = fn file, {pattern, name} -> 
				if Regex.match? pattern, file do
				   name
				else
					nil  
				end
			end

cat_finder.("hello.ex", {~r/\.ex/i, "Elixir"}) |> IO.puts

x = file_extensions |> 
Stream.map(fn x -> System.cmd "find", ["../", "-type", "f", "-name", "*.#{x}"]  end) |>
Stream.map (fn x -> Kernel.elem x, 0 end)
files = x |> Stream.filter(fn x -> x != "" end) |>
Enum.map(fn x -> String.split x, "\n"  end)

IO.inspect files


