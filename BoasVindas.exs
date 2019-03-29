bv = IO.gets "Ola! Digite uma velocidade em km/h\n>>>"
bv = String.trim(bv)
bv = String.to_integer(bv) #Quando coloquei String.to_float(bv) deu erro.
convert = fn(v) ->
  v/3.6
end
IO.puts("#{bv} km/h em m/s e: #{convert.(bv)}")
