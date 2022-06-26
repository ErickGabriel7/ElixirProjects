#Universidade Federal Rural de Pernambuco
#Unidade Academica do Cabo de Santo Agostinho
#PIBIC
#Autor: Erick Gabriel
#Data: 28/03/2019

#Metodo dos minimos quadrados e calculo da distancia dos pontos a reta

pontos1 = [
  %{x: 50, y: 70},
  %{x: 50, y: 80},
  %{x: 70, y: 50},
  %{x: 90, y: 50}
  ]

pontos2 = [
  %{x: 65, y: 105},
  %{x: 65, y: 125},
  %{x: 62, y: 110},
  %{x: 67, y: 120},
  %{x: 69, y: 140},
  %{x: 65, y: 135},
  %{x: 61, y: 95 },
  %{x: 67, y: 130}
]

pontosM = [
    %{x: 50,  y: 50},
    %{x: 50,  y: 70},   
    %{x: 50,  y: 80},
    %{x: 70,  y: 50},
    %{x: 90,  y: 50},
    %{x: 150, y: 49}
]

#modulo que calculara os coeficientes a e b da reta via metodo dos minimos quadrados
defmodule MinimosQuadraticos do
  def calcular(pontos) do
#   n     = Enum.sum(Enum.map(pontos, fn (ponto) -> 1 end))                     #numero de pontos
    n     = length(pontos)                                                      #ha uma funcao length
    sumX  = Enum.sum(Enum.map(pontos, fn (ponto) -> ponto.x end))               #soma das coordenadas x
    sumY  = Enum.sum(Enum.map(pontos, fn (ponto) -> ponto.y end))               #soma das coordenadas y
    sumX2 = Enum.sum(Enum.map(pontos, fn (ponto) -> (ponto.x)*(ponto.x) end))   #(soma das coordenadas x)^2
    sumXY = Enum.sum(Enum.map(pontos, fn (ponto) -> (ponto.x)*(ponto.y) end))   #(soma das coord. x)*(soma das coord. y)
    xMed  = sumX / n                                                            #media das coordenadas x
    yMed  = sumY / n
    IO.puts(sumX2)                                     #media das coordenadas y
    IO.puts(yMed)                                     #media das coordenadas y
    reta(n,sumX,sumY,sumX2,sumXY,xMed,yMed)
  end
  def reta(n,sumX,sumY,sumX2,sumXY,xMed,yMed) do
    IO.puts("n: #{n}")
    IO.puts(sumXY)
    IO.puts((sumX*sumY) / n )
    IO.puts((sumX2) - (sumX*sumX))
    a     = (sumXY - (sumX*sumY) / n ) / ((sumX2) - ((sumX*sumX) / n) )           #inclinacao da reta (R: ax + b)
    b     = yMed   - a*xMed                                                     #termo independente
    %{a: a, b: b}                                                               #retornando os coeficientes a e b da reta
  end
end

#modulo que calculara a distancia do conjunto de pontos ate a reta, e selecionara
#o ponto de maior distancia a reta
defmodule Dist do
  def calc(pontos) do
    reta       = MinimosQuadraticos.calcular(pontos)                            #pega a reta gerada no modulo anterior
    Enum.map(pontos, fn(ponto) ->                                                #calculo das distancias de cada ponto a reta obtida
       calcularDistancia(ponto,reta) end)
    #A saida dessa funcao sera uma lista com as distancias a reta dos respectivos pontos
  end

  def dMax(pontos) do
    distancias = Dist.calc(pontos)                                              #lista com as distancias de cada ponto a reta obtida
    md         = Enum.max(distancias)                                           #valor da maior distancia
    Enum.find_index(distancias, fn distancia -> distancia == md end)            #encontrando a posicao do ponto com maior distancia
    #Enum.fetch!(pontos, posicaoM)                                              #Retornando o ponto com a maior distancia
  end

  def calcularDistancia(ponto, reta) do                                         #funcao que calcula a distancia de um unico ponto a reta
    (abs(( ((reta.a)*(ponto.x)) - ponto.y + reta.b)) / (:math.sqrt(reta.a*reta.a + 1)) )
  end

  def dividir(pontos) do                                                        #funcao que divide o mapa de pontos em duas partes, a depender do ponto com maior distancia a reta
    [
      Enum.slice(pontos,0..dMax(pontos)),
      Enum.slice(pontos, dMax(pontos)..(length(pontos)-1))
    ]
  end

end


##############################################################################################
# resultado esperado 1: a = -0.46875  ,   b = 89.0625
#IO.inspect(MinimosQuadraticos.calcular(pontos1))

# resultado esperado 2: a = 4.706     ,   b = -186.74
#IO.inspect(MinimosQuadraticos.calcular(pontosM))
#IO.puts(:math.sqrt(9))
#reta = MinimosQuadraticos.
#IO.inspect(Dist.calcularDistancia(%{x: 50, y: 50}, MinimosQuadraticos.calcular(pontosM)))
#IO.inspect(Dist.calc(pontosM))

#IO.inspect(Dist.dMax(pontosM))

#IO.inspect(Dist.dividir(pontosM))
##############################################################################################

div = Dist.dividir(pontos2)
p1 = Enum.fetch!(div,0)
p2 = Enum.fetch!(div,1)
IO.inspect(MinimosQuadraticos.calcular(pontos2))
#IO.inspect(p1)
#IO.inspect(p2)
#IO.inspect(MinimosQuadraticos.calcular(p1))
#IO.inspect(MinimosQuadraticos.calcular(p2))
