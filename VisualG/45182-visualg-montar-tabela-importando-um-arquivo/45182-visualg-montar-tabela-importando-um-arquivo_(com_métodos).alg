algoritmo "Montar tabela a partir de arquivo de texto (com métodos)"

arquivo "Dados_01.txt"

procedimento lerLinhaArquivo ()
var
   linha : caractere
inicio
   leia(linha)
fimProcedimento

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

procedimento exibirLinhaLegendas ()
var
   posBarra : inteiro
   trechoDeLinhaAtual : caractere
   dadosCelula : caractere
inicio
   trechoDeLinhaAtual <- vetLinhas[1]
       escreva ( "| ")
   repita
      posBarra <- Pos("/", trechoDeLinhaAtual)

      se (posBarra <> 0) entao
         dadosCelula <- Copia(trechoDeLinhaAtual, 1, posBarra-1)
         escreva (dadosCelula:10, " | ")
         trechoDeLinhaAtual <- Copia(trechoDeLinhaAtual, posBarra+1, Compr(trechoDeLinhaAtual))
      fimSe
   ate (posBarra = 0)

   escrevaL("")
fimProcedimento

procedimento imprimirLinhaTabela (tamanho : inteiro)
var
   i : inteiro
inicio
   para i de 1 ate tamanho faca
      escreva (" -")
   fimPara

   escrevaL("")
fimProcedimento

const
   SEPARADOR = "/"
   MAX_LINHAS = 10
var
   vetLinhas : vetor [1..MAX_LINHAS] de caractere
   qtdLinhas : inteiro

inicio
   qtdLinhas <- lerTodasLinhasArquivo()
   escrevaL("")
   escrevaL("")
   imprimirLinhaTabela(52)
   exibirLinhaLegendas()
   imprimirLinhaTabela(52)
fimAlgoritmo