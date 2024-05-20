algoritmo "Montar tabela a partir de arquivo de texto (com métodos)"

arquivo "Dados_01.txt"

const
   SEPARADOR = "/"
   MAX_LINHAS = 20

funcao lerTodasLinhasArquivo () : inteiro
var
   linha : caractere
   contLinhas : inteiro
inicio
   contLinhas <- 0

   repita
      leia(linha)

      se (linha = SEPARADOR+SEPARADOR) entao
         interrompa()
      fimSe

      contLinhas <- contLinhas+1
      vetLinhas[contLinhas] <- linha
   ate (contLinhas >= MAX_LINHAS)

   retorne contLinhas
fimFuncao

funcao obterProximoDadoLinha (var trechoDeLinhaAtual:caractere) : caractere
var
   posBarra, i : inteiro
   dadoCelula : caractere
inicio
   dadoCelula <- "?"
   posBarra <- Pos("/", trechoDeLinhaAtual)

   se (posBarra <> 0) entao
      dadoCelula <- Copia(trechoDeLinhaAtual, 1, posBarra-1)
      trechoDeLinhaAtual <- Copia(trechoDeLinhaAtual, posBarra+1, Compr(trechoDeLinhaAtual))
   fimSe

   retorne dadoCelula
fimFuncao

procedimento exibirLinhaLegendas ()
var
   posBarra : inteiro
   trechoDeLinhaAtual : caractere
   dadoCelula : caractere
inicio
   trechoDeLinhaAtual <- vetLinhas[1]
   escreva ( "| ")

   repita
      dadoCelula <- obterProximoDadoLinha(trechoDeLinhaAtual)

      se (dadoCelula <> "?") entao
         escreva (dadoCelula:10, " | ")
      fimSe
   ate (dadoCelula = "?")

   escrevaL("")
fimProcedimento

procedimento exibirLinhasDados (qtdLinhas:inteiro)
var
   posLinha : inteiro
   posDado, i : inteiro
   trechoDeLinhaAtual, dadoCelula : caractere
inicio
   para posLinha de 2 ate qtdLinhas faca
      trechoDeLinhaAtual <- vetLinhas[posLinha]
      posDado <- 0
      escreva ("| ")

      repita
         dadoCelula <- obterProximoDadoLinha(trechoDeLinhaAtual)

         se (dadoCelula <> "?") entao
            posDado <- posDado+1

            se (posDado = 3) entao //se dado de data, juntao dia, mes e ano
               dadoCelula <- dadoCelula + "/" + obterProximoDadoLinha(trechoDeLinhaAtual)
               dadoCelula <- dadoCelula + "/" + obterProximoDadoLinha(trechoDeLinhaAtual)
            fimSe

            escreva (dadoCelula:10, " | ")
         fimSe
      ate (dadoCelula = "?")

      escrevaL("")
   fimPara
fimProcedimento

procedimento imprimirLinhaTabela (tamanho:inteiro)
var
   i : inteiro
inicio
   para i de 1 ate tamanho faca
      escreva (" -")
   fimPara

   escrevaL("")
fimProcedimento

var
   vetLinhas : vetor [1..MAX_LINHAS] de caractere
   qtdLinhas : inteiro

inicio
   escrevaL("")
   escrevaL("")
   qtdLinhas <- lerTodasLinhasArquivo()
   imprimirLinhaTabela(52)
   exibirLinhaLegendas()
   exibirLinhasDados(qtdLinhas)
   imprimirLinhaTabela(52)
fimAlgoritmo
{
https://github.com/SimonViegas/CodesForumCasaDoDesenvolvedor/tree/master/VisualG/45182-visualg-montar-tabela-importando-um-arquivo
}