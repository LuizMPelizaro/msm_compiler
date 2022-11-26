Algoritmo "primos"

Var
   Cont1, N, divisores, Cont2, primo: inteiro

Inicio
   para Cont1 de 1 ate 800 faca
      N = Cont1
      divisores = 0

      para Cont2 de 1 ate N faca
         se N == 0 entao
            divisores = divisores + 1
         fimse
      fimpara
      se (divisores == 2) entao
         primo = primo + 1
         escreva("Teste")
      fimse
   fimpara
   escreval("Total de numeros primos: ", primo)

Fimalgoritmo