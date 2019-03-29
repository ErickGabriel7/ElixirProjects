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

defmodule Ler do                             #Definindo o modulo de leitura
  def mediaDistTot(leituras) do              #Funcao que calcula a media de todas as distancias
    ( Enum.reduce(leituras, 0, fn(leitura, acc) -> leitura.distancia + acc end) ) / 2
  end

  def leiturasDoDia(leituras, dia) do              #Funcao que retorna as leituras de um dado dia
    Enum.map(leituras, fn                          #Erro
  %{data: dia} -> leituras.distancia               #Tentei usar condicional e também deu Erro
  %{} -> ""                                        #Um aviso frequente foi que 'dia' nao foi usado
  end )
end

#  def mediaDistDia(leituras, dia) do              #Esta funcao precisaria do mesmo que nao consegui no item anterior
#
#  end
end

#IO.puts(Ler.mediaDistTot(leituras)) #61.5
#IO.each(Ler.leiturasDoDia(leituras, "2018-11-28"))
