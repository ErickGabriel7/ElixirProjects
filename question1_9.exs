list = ["a", "very", "fine", "collection", "of", "words", "enunciated"]
Enum.map(list, fn (list) -> String.replace(list,"e","X") end)
