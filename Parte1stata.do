* Analise de estatistica descritiva 

sum wage age
*sum identificar o numero de observaçoes, a média, o erro padrão e minimo e max.
*float não tem limite de valores gigantescas
*byte contagens inteiras
*ln é para linearilisar a função
gen lnwage = ln(wage)
gen agesqr = age^2
reg lnwage female age agesqr parttime

*A váriavel agesqr não é significativa pq o pvalor (que é a probabilidade exata de) é acima de 0,1
*Analisando R- squared: As variações nas variáveis independentes explicam variações no salário (variável dependente) em 41.8% 
*R2 ajustado esta ajustando R2 pelos graus de liberdade do modelo (sempre será menor que o R2)

* Comandos para gerar variáveis dummy
*1-	PRIMÁRIO (1ª a 4ª série)
*2-	Ginásio (5ª a 8ª serie )
*3-	Ensino Médio 
*4-	Superior

gen d1 = 1 if educ ==2 
replace d1 = 0 if educ ~=2
gen d2 = 1 if educ ==3
replace d2 = 0 if educ ~=3
gen d3 = 1 if educ ==4
replace d3 = 0 if educ ~=4

*Multicolinearidade = combinação linear
*Variável de interação = quando você utiliza duas variáveis para criar uma 3ª

reg lnwage female 
*O modelo é estatisticamente significativo a 1%
*Rejeitando H0 a 99% de confiança
*39,01 – F calculado (1 numerador, 498 denominador)
*Impactam (só o coeficiente)
*R2 explica
*R2 ajustado (pelo grau de liberdade)
*O b1 é estatisticamente  significativo a 1 %
*Coeficiente B1, se for do sexo feminino o salario será impactado em -25,06%
*As mulheres recebem 25% a menos do que os homens

reg lnwage female age parttime d1 d2 d3
*R2 aumenta pois adicionou mais variáveis 
*As variações nas variáveis independentes explicam variações no salario (variável dependente) em 71.61%
*Female não é significativo pois P valor = 0.206
*Criar variável de interação female*d3
gen femaled3 = female*d3
* Fazer regressão com a variavel interação 
reg lnwage female age parttime d1 d2 d3 femaled3
*-0,17+0,61= mulher ganha em geral mais que os homens
