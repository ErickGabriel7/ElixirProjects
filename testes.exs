#Dados de entrada lidos
leituras = [
  %{distancia: 10, angulo: 10.5, data: "2018-11-28", hora: "10:20:12"},
  %{distancia: 12, angulo: 12  , data: "2018-11-28", hora: "10:20:14"},
  %{distancia: 15, angulo: 18.2, data: "2018-11-28", hora: "10:20:17"},
  %{distancia: 20, angulo: 30.4, data: "2018-11-28", hora: "10:20:30"},
  %{distancia: 2 , angulo: 80  , data: "2018-11-30", hora: "02:20:12"},
  %{distancia: 41, angulo: 241 , data: "2018-12-01", hora: "20:15:51"},
  %{distancia: 23, angulo: 110 , data: "2018-11-24", hora: "22:24:42"}
]

IO.inspect(Enum.map(leituras, fn
  leituras.data = "2018-11-28" -> leituras.distancia  end ))
