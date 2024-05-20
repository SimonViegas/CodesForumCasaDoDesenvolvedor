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

const
   SEPARADOR = "/"
   MAX_LINHAS = 10
var
   vetLinhas : vetor [1..MAX_LINHAS] de caractere
   qtdLinhas : inteiro

inicio
   qtdLinhas <- lerTodasLinhasArquivo()
   escrevaL("Quantidad de linhas :", qtdLinhas:1)
fimAlgoritmo