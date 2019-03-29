#Autor: Erick Gabriel
#Data: 03/28/2019
#Metodo dos minimos quadrados

pontos = [                                                                      #Mapa de pontos
  %{x: 50, y: 50},
  %{x: 50, y: 70},
  %{x: 50, y: 80},
  %{x: 70, y: 50},
  %{x: 90, y: 50}
  ]

#defmodule MinimosQuadraticos do
#  def calculateLine(pontos) do
    n     = Enum.sum(Enum.map(pontos, fn (ponto) -> 1 end))                     #numero de pontos
    sumX  = Enum.sum(Enum.map(pontos, fn (ponto) -> ponto.x end))               #soma das coordenadas x
    sumY  = Enum.sum(Enum.map(pontos, fn (ponto) -> ponto.y end))               #soma das coordenadas y
    sumX2 = Enum.sum(Enum.map(pontos, fn (ponto) -> (ponto.x)*(ponto.x) end))   #(soma das coordenadas x)^2
    sumXY = Enum.sum(Enum.map(pontos, fn (ponto) -> (ponto.x)*(ponto.y) end))   #(soma das coord. x)*(soma das coord. y)

    xMed  = sumX / n                                                            #media das coordenadas x
    yMed  = sumY / n                                                            #media das coordenadas y

    a     = (sumXY - (sumX*sumY) / n ) / ((sumX2) - (sumX*sumX) / n )           #inclinacao da reta (R: ax + b)
    b     = yMed   - a*xMed                                                     #termo independente
#  end
#end

#IO.puts(len)
#IO.puts(sumX)
#IO.puts(sumY)
#IO.puts(sumX2)
#IO.puts(sumXY)

# resultado esperado: a = -0.46875  ,   b = 89.0625
IO.puts("Reta: #{a}x + #{b}")
