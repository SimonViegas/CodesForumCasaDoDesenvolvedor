algoritmo "Montar tabela a partir de arquivo de texto"
arquivo "Dados_01.txt"
const
   MAX_LINHAS = 10
   SEPARADOR = "/"
var
   vetLinhas : vetor [1..MAX_LINHAS] de caractere
   contLinhas : inteiro
   linha, trechoDeLinhaAtual, dadosCelula : caractere
   posBarra, posDado, posLinha, i : inteiro

inicio

   repita
      leia(linha)

      se (linha = SEPARADOR+SEPARADOR) entao
         interrompa()
      fimSe

      contLinhas <- contLinhas+1
      vetLinhas[contLinhas] <- linha
   ate (contLinhas >= MAX_LINHAS)

   //EXTRAIR LEGENDAS DAS COLUNAS DA TABELA (Primeira linha)
   trechoDeLinhaAtual <- vetLinhas[1]
   escrevaL("  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  ")
   escreva (" | ")

   repita
      posBarra <- Pos("/", trechoDeLinhaAtual)

      se (posBarra <> 0) entao
         dadosCelula <- Copia(trechoDeLinhaAtual, 1, posBarra-1)
         escreva (dadosCelula:10, " | ")
         trechoDeLinhaAtual <- Copia(trechoDeLinhaAtual, posBarra+1, Compr(trechoDeLinhaAtual))
      fimSe
   ate (posBarra = 0)

   //EXTRAIR LINHAS DA TABELA
   para posLinha de 2 ate contLinhas faca
      escrevaL("")
      escreva (" | ")
      posDado <- 0
      trechoDeLinhaAtual <- vetLinhas[posLinha]

      repita
         posBarra <- Pos("/", trechoDeLinhaAtual)

         se (posBarra <> 0) entao
            dadosCelula <- Copia(trechoDeLinhaAtual, 1, posBarra-1)
            posDado <- posDado+1

            se (posDado = 3) entao
               para i de 1 ate 2 faca
                  trechoDeLinhaAtual <- Copia(trechoDeLinhaAtual, posBarra+1, Compr(trechoDeLinhaAtual))
                  posBarra <- Pos(SEPARADOR, trechoDeLinhaAtual)
                  dadosCelula <- dadosCelula + "/" + Copia(trechoDeLinhaAtual, 1, posBarra-1)
               fimPara
            fimSe

            escreva (dadosCelula:10, " | ")
            trechoDeLinhaAtual <- Copia(trechoDeLinhaAtual, posBarra+1, Compr(trechoDeLinhaAtual))
         fimSe
      ate (posBarra = 0)
   fimPara
   
   escrevaL("")
   escrevaL("  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  ")
fimAlgoritmo
{
https://forum.casadodesenvolvedor.com.br/topic/45182-visualg-montar-tabela-importando-um-arquivo
}