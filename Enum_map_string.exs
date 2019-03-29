num_string = fn (x) ->
  IO.puts(String.length(x))
end
Enum.map(x, num_string)
