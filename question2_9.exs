num = [5, 12, 9, 24, 9, 18]
Enum.reduce(num, fn (score, sum) -> sum * score end)
