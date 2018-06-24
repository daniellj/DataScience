# Instalando biblioteca "readxl" se necessario
package_readxl <- find.package("readxl")
package_dplyr <- find.package("dplyr")
package_ggplot2 <- find.package("ggplot2")
package_rmarkdown <- find.packages("rmarkdown")
#typeof(package_readxl) # retorna uma string com o caminho da instalacao da biblioteca

if (is.null(package_readxl) && is.na(package_readxl) && package_readxl == "")
  {
  install.packages("readxl")
  } else
  {
    cat("Pacote readxl ja esta instalado!")
  }

if (is.null(package_dplyr) && is.na(package_dplyr) && package_dplyr == "")
{
  install.packages("dplyr")
} else
{
  cat("Pacote dplyr ja esta instalado!")
}

if (is.null(package_ggplot2) && is.na(package_ggplot2) && package_ggplot2 == "")
{
  install.packages("ggplot2")
} else
{
  cat("Pacote ggplot2 ja esta instalado!")
}

if (is.null(package_rmarkdown) && is.na(package_rmarkdown) && package_rmarkdown == "")
{
  install.packages("rmarkdown")
} else
{
  cat("Pacote rmarkdown ja esta instalado!")
}

# Importando biblioteca(s)
library(readxl)
library(dplyr)
library(ggplot2)
library(markdown)

# Importando arquivo
path_file <- "/home/daniellj/Estudo/MBA-Unisinos/BigData-DataScience-Analytics/atlas2013_dadosbrutos_pt_somente municipio.xlsx"
#path_file <- "C:\\Users\\whitecube.daniel\\Desktop\\MBA\\atlas2013_dadosbrutos.xlsx"
atlas2013_dadosbrutos_pt_somente_municipio <- read_excel(path = path_file)

# Tipo do objeto criado:
cat("Tipo do objeto criado")
typeof(atlas2013_dadosbrutos_pt_somente_municipio)

cat("Quantidade de observacoes (LINHAS):", dim(atlas2013_dadosbrutos_pt_somente_municipio)[1])
cat("Quantidade de variaveis (COLUNAS):", dim(atlas2013_dadosbrutos_pt_somente_municipio)[2])

cat("Coluna(s) do dataset importado e amostras dos dados:")
str(atlas2013_dadosbrutos_pt_somente_municipio)

cat("Anos que contam dados no dataset:", unique(x = atlas2013_dadosbrutos_pt_somente_municipio$ANO))

cat("\n6 variaveis selecionadas para analise:\n")
cat("ESPVIDA (Esperanca de vida ao nascer)")
cat("GINI (Indice de Gini)")
cat("FECTOT (Taxa de fecundidade total)")
cat("T_FBSUPER (Taxa de frequencia bruta ao ensino superior)")
cat("PMPOB (Proporcao de pobres)")
cat("IDHM (Indice de Desenvolvimento Humano Municipal)")
#cat("P_FORMAL (Grau de formalizacao do trabalho das pessoas ocupadas)")
#cat("E_ANOSESTUDO (Expectativa de anos de estudo aos 18 anos de idade)")


cat("\n1 variavel ALVO para analise:\n")
cat("RDPC (Renda per capita media)")

# formatando um novo dataset contendo as 6 variaveis selecionadas + a variavel "alvo"
df_01 <- subset(x = atlas2013_dadosbrutos_pt_somente_municipio, select = c(ESPVIDA, GINI, FECTOT, T_FBSUPER, PMPOB, IDHM, RDPC), drop = FALSE)

# Exibindo informacaes de estatastica descritiva do datset formatado
cat("\n--->>> MEDIDAS DE POSICAO <<<---\n")
summary(df_01)

cat("\nExibindo a MODA para cada um dos campos do dataframe:\n")
statmod <- function(x)
{
  z <- table(as.vector(x));
  names(z)[z == max(z)]
}

cat("ESPVIDA:", statmod(df_01$ESPVIDA))
cat("GINI:", statmod(df_01$GINI))
cat("FECTOT:", statmod(df_01$FECTOT))
cat("T_FBSUPER:", statmod(df_01$T_FBSUPER))
cat("PMPOB:", statmod(df_01$PMPOB))
cat("IDHM:", statmod(df_01$IDHM))
cat("RDPC:", statmod(df_01$RDPC))

cat("\n--->>> MEDIDAS DE DISPERSAO <<<---\n")
cat("\nExibindo a AMPLITUDE para cada um dos campos do dataframe:\n")
cat("ESPVIDA:", max(df_01$ESPVIDA) - min(df_01$ESPVIDA))
cat("GINI:", max(df_01$GINI) - min(df_01$GINI))
cat("FECTOT:", max(df_01$FECTOT) - min(df_01$FECTOT))
cat("T_FBSUPER:", max(df_01$T_FBSUPER) - min(df_01$T_FBSUPER))
cat("PMPOB:", max(df_01$PMPOB) - min(df_01$PMPOB))
cat("IDHM:", max(df_01$IDHM) - min(df_01$IDHM))
cat("RDPC:", max(df_01$RDPC) - min(df_01$RDPC))

cat("\nExibindo a VARIANCIA para cada um dos campos do dataframe:\n")
cat("ESPVIDA:", var(df_01$ESPVIDA, na.rm = FALSE))
cat("GINI:", var(df_01$GINI, na.rm = FALSE))
cat("FECTOT:", var(df_01$FECTOT, na.rm = FALSE))
cat("T_FBSUPER:", var(df_01$T_FBSUPER, na.rm = FALSE))
cat("PMPOB:", var(df_01$PMPOB, na.rm = FALSE))
cat("IDHM:", var(df_01$IDHM, na.rm = FALSE))
cat("RDPC:", var(df_01$RDPC, na.rm = FALSE))

cat("\nExibindo o DESVIO PADRAO (= variancia ao quadrado) para cada um dos campos do dataframe:\n")
cat("ESPVIDA:", sd(df_01$ESPVIDA, na.rm = FALSE))
cat("GINI:", sd(df_01$GINI, na.rm = FALSE))
cat("FECTOT:", sd(df_01$FECTOT, na.rm = FALSE))
cat("T_FBSUPER:", sd(df_01$T_FBSUPER, na.rm = FALSE))
cat("PMPOB:", sd(df_01$PMPOB, na.rm = FALSE))
cat("IDHM:", sd(df_01$IDHM, na.rm = FALSE))
cat("RDPC:", sd(df_01$RDPC, na.rm = FALSE))

cat("\nExibindo o COEFICIENTE DE VARIACAO em % (= % desvio padrao em relacao a media) para cada um dos campos do dataframe:\n")
cat("ESPVIDA:", 100*sd(df_01$ESPVIDA)/mean(df_01$ESPVIDA))
cat("GINI:", 100*sd(df_01$GINI)/mean(df_01$GINI))
cat("FECTOT:", 100*sd(df_01$FECTOT)/mean(df_01$FECTOT))
cat("T_FBSUPER:", 100*sd(df_01$T_FBSUPER)/mean(df_01$T_FBSUPER))
cat("PMPOB:", 100*sd(df_01$PMPOB)/mean(df_01$PMPOB))
cat("IDHM:", 100*sd(df_01$IDHM)/mean(df_01$IDHM))
cat("RDPC:", 100*sd(df_01$RDPC)/mean(df_01$RDPC))

# Exibindo informacaes de estatastica descritiva do dataset formatado
cat("Calculando valores fora da curva (OUTLIERS) com Z-SCORE (valor da posicaoo - media / desvio padrao) considerando que o valor seja <= -3.0 OU >= +3.0")
# E possivel gerar o Z-SCORE com a funcao scala(). No caso abaixo, estarei desenvolvendo o calculo detalhado.
Z_SCORE_ESPVIDA <- array((df_01$ESPVIDA-mean(df_01$ESPVIDA))/sd(df_01$ESPVIDA))
Z_SCORE_GINI <- array((df_01$GINI-mean(df_01$GINI))/sd(df_01$GINI))
Z_SCORE_FECTOT <- array((df_01$FECTOT-mean(df_01$FECTOT))/sd(df_01$FECTOT))
Z_SCORE_T_FBSUPER <- array((df_01$T_FBSUPER-mean(df_01$T_FBSUPER))/sd(df_01$T_FBSUPER))
Z_SCORE_PMPOB <- array((df_01$PMPOB-mean(df_01$PMPOB))/sd(df_01$PMPOB))
Z_SCORE_IDHM <- array((df_01$IDHM-mean(df_01$IDHM))/sd(df_01$IDHM))
Z_SCORE_RDPC <- array((df_01$RDPC-mean(df_01$RDPC))/sd(df_01$RDPC))
#typeof(Z_SCORE_ESPVIDA)

#add a coluna de Z-SCORE para todas as variaveis do dataset
df_02 <- data.frame(df_01, Z_SCORE_ESPVIDA, Z_SCORE_GINI, Z_SCORE_FECTOT, Z_SCORE_T_FBSUPER, Z_SCORE_PMPOB, Z_SCORE_IDHM, Z_SCORE_RDPC)
cat("Exibindo as colunas do novo dataframe gerado atraves da concatenacao dos arrays do Z-SCORE com o dataframe inicial (DF_01)")
str(df_02)

cat("Exibindo as observacoes do dataframe onde o Z-SCORE seja <= -3.0 OU >= 3.0 para cada uma das variaveis")
valor_negativo <- -3
valor_positivo <- +3

subset(x = df_02, subset = (df_02$Z_SCORE_ESPVIDA<=valor_negativo | df_02$Z_SCORE_ESPVIDA>=valor_positivo), select = c(ESPVIDA, GINI, FECTOT, T_FBSUPER, PMPOB, IDHM, RDPC, Z_SCORE_ESPVIDA))
subset(x = df_02, subset = (df_02$Z_SCORE_GINI<=valor_negativo | df_02$Z_SCORE_GINI>=valor_positivo), select = c(ESPVIDA, GINI, FECTOT, T_FBSUPER, PMPOB, IDHM, RDPC, Z_SCORE_GINI))
subset(x = df_02, subset = (df_02$Z_SCORE_FECTOT<=valor_negativo | df_02$Z_SCORE_FECTOT>=valor_positivo), select = c(ESPVIDA, GINI, FECTOT, T_FBSUPER, PMPOB, IDHM, RDPC, Z_SCORE_FECTOT))
subset(x = df_02, subset = (df_02$Z_SCORE_T_FBSUPER<=valor_negativo | df_02$Z_SCORE_T_FBSUPER>=valor_positivo), select = c(ESPVIDA, GINI, FECTOT, T_FBSUPER, PMPOB, IDHM, RDPC, Z_SCORE_T_FBSUPER))
subset(x = df_02, subset = (df_02$Z_SCORE_PMPOB<=valor_negativo | df_02$Z_SCORE_PMPOB>=valor_positivo), select = c(ESPVIDA, GINI, FECTOT, T_FBSUPER, PMPOB, IDHM, RDPC, Z_SCORE_PMPOB))
subset(x = df_02, subset = (df_02$Z_SCORE_IDHM<=valor_negativo | df_02$Z_SCORE_IDHM>=valor_positivo), select = c(ESPVIDA, GINI, FECTOT, T_FBSUPER, PMPOB, IDHM, RDPC, Z_SCORE_IDHM))
subset(x = df_02, subset = (df_02$Z_SCORE_RDPC<=valor_negativo | df_02$Z_SCORE_RDPC>=valor_positivo), select = c(ESPVIDA, GINI, FECTOT, T_FBSUPER, PMPOB, IDHM, RDPC, Z_SCORE_RDPC))

cat("Plotando GRAFICOS DE FREQUENCIA (analise descritiva) para cada um dos campos do dataframe:")
hist(df_02$ESPVIDA)
hist(df_02$GINI)
hist(df_02$FECTOT)
hist(df_02$T_FBSUPER)
hist(df_02$PMPOB)
hist(df_02$IDHM)
hist(df_02$RDPC)
hist(df_02$Z_SCORE_ESPVIDA)
hist(df_02$Z_SCORE_GINI)
hist(df_02$Z_SCORE_FECTOT)
hist(df_02$Z_SCORE_T_FBSUPER)
hist(df_02$Z_SCORE_PMPOB)
hist(df_02$Z_SCORE_IDHM)
hist(df_02$Z_SCORE_RDPC)

cat("\n--->>> CORRELACAO ENTRE AS VARIAVEIS <<<---\n")
# Encontrando a correlacao entre a variavel ALVO com as variaveis PREDITORAS, considerando que todas as variaveis sao numericas
# ALVO: RDPC
# PREDITORAS: demais variaveis
cat("Correlacao entre a variavel ALVO <RDPC> com <ESPVIDA>", cor(df_02$RDPC, df_02$ESPVIDA))
cat("Correlacao entre a variavel ALVO <RDPC> com <GINI>", cor(df_02$RDPC, df_02$GINI))
cat("Correlacao entre a variavel ALVO <RDPC> com <FECTOT>", cor(df_02$RDPC, df_02$FECTOT))
cat("Correlacao entre a variavel ALVO <RDPC> com <T_FBSUPER>", cor(df_02$RDPC, df_02$T_FBSUPER))
cat("Correlacao entre a variavel ALVO <RDPC> com <IDHM>", cor(df_02$RDPC, df_02$IDHM))
cat("Correlacao entre a variavel ALVO <RDPC> com <PMPOB>", cor(df_02$RDPC, df_02$PMPOB))

cat("\nPlotando as correlacoes\n")
plot(x = df_02$RDPC, y = df_02$ESPVIDA)
plot(x = df_02$RDPC, y = df_02$GINI)
plot(x = df_02$RDPC, y = df_02$FECTOT)
plot(x = df_02$RDPC, y = df_02$T_FBSUPER)
plot(x = df_02$RDPC, y = df_02$IDHM)
plot(x = df_02$RDPC, y = df_02$PMPOB)

cat("\nCriando um modelo de regressao linear multipla, considerando as 6 variaveis exploradas ate o momento\n")
# Para este modelo, nao serao considerados os valores do Z-SCORE
reg_linear_multipla=lm(formula = df_01$RDPC ~ df_01$ESPVIDA + df_01$GINI + df_01$FECTOT + df_01$T_FBSUPER + df_01$PMPOB + df_01$IDHM)
#summary(reg_linear_multipla)

cat("RESUMO E INTERPRETACAO DO MODELO")
cat("--->>> COEFICIENTE DE EXPLICACAO do modelo linear <<<---: (Multiple R-Squared) r2=", summary(reg_linear_multipla)$r.squared, ". Indica que", (summary(reg_linear_multipla)$r.squared)*100,"% da variação da variável DEPENDENTE é explicada pela variação das variáveis DEPENTES selecionadas no modelo gerado.")

cat("--->>> COEFICIENTE DE EXPLICACAO das variáveis do modelo: <<<---")
cat("As variaveis que tiverem BAIXO NIVEL DE SIGNIFICANCIA (valor -p > 0,05) perante o modelo serao removidas. Apos, o modelo de regresao sera recalculado. Seguem valores (Pr(>|t|)):")
summary(reg_linear_multipla)$coefficients[,4]

# Reajustando um novo dataframe com as colunas que atenderam o nível de SIGNIFICANCIA minimo (valor -p > 0,05)
df_03 <- data.frame(df_01$GINI, df_01$T_FBSUPER, df_01$PMPOB, df_01$RDPC)
cat("Exibindo as colunas do novo dataframe gerado")
str(df_03)

cat("\nCriando UM NOVO modelo de regressao linear multipla, considerando as 3 variaveis exploradas ate o momento que atendem os requisitos\n")
reg_linear_multipla_NEW=lm(formula = df_01$RDPC ~ df_01$GINI + df_01$T_FBSUPER + df_01$PMPOB)
#summary(reg_linear_multipla)

cat("RESUMO E INTERPRETACAO DO MODELO")
cat("--->>> COEFICIENTE DE EXPLICACAO do modelo linear <<<---: (Multiple R-Squared) r2=", summary(reg_linear_multipla_NEW)$r.squared, ". Indica que", (summary(reg_linear_multipla_NEW)$r.squared)*100,"% da variação da variável DEPENDENTE é explicada pela variação das variáveis DEPENTES selecionadas no modelo gerado.")

cat("--->>> COEFICIENTE DE EXPLICACAO das variáveis do modelo: <<<---")
cat("As variaveis que tiverem BAIXO NIVEL DE SIGNIFICANCIA (valor -p > 0,05) perante o modelo serao removidas. Apos, o modelo de regresao sera recalculado. Seguem valores (Pr(>|t|)):")
summary(reg_linear_multipla_NEW)$coefficients[,4]

summary(reg_linear_multipla_NEW)

######### Modelo final gerado #########

# Intervalos de confianca para os coeficientes da equacao
confint(reg_linear_multipla_NEW)

# Residuos
plot(x = fitted(reg_linear_multipla_NEW), y = residuals(reg_linear_multipla_NEW), xlab="Valores Ajustados", ylab="Residuos")
abline(h=0)

plot(df_01$GINI, residuals(reg_linear_multipla_NEW),xlab="GINI", ylab="Residuos")
abline(h=0)

plot(df_01$T_FBSUPER, residuals(reg_linear_multipla_NEW), xlab="T_FBSUPER", ylab="Residuos")
abline(h=0)

plot(df_01$PMPOB, residuals(reg_linear_multipla_NEW), xlab="PMPOB", ylab="Residuos")
abline(h=0)

# Avaliacao da homocedasticidade dos erros: teste de igualdade entre variancias
median_GINI <- median(df_01$GINI)
var.test(residuals(reg_linear_multipla_NEW)[df_01$GINI > median_GINI], residuals(reg_linear_multipla_NEW)[df_01$GINI < median_GINI])

median_T_FBSUPER <- median(df_01$T_FBSUPER)
var.test(residuals(reg_linear_multipla_NEW)[df_01$T_FBSUPER > median_T_FBSUPER], residuals(reg_linear_multipla_NEW)[df_01$T_FBSUPER < median_T_FBSUPER])

median_PMPOB <- median(df_01$PMPOB)
var.test(residuals(reg_linear_multipla_NEW)[df_01$PMPOB > median_PMPOB], residuals(reg_linear_multipla_NEW)[df_01$PMPOB < median_PMPOB])

# Avaliacao da suposicao de normalidade dos erros
qqnorm(residuals(reg_linear_multipla_NEW), ylab="Residuos", xlab="Quantis teoricos", main="")
qqline(residuals(reg_linear_multipla_NEW))
