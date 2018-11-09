* Analise de estatistica descritiva 

sum wage age
*sum identificar o numero de observa�oes, a m�dia, o erro padr�o e minimo e max.
*float n�o tem limite de valores gigantescas
*byte contagens inteiras
*ln � para linearilisar a fun��o
gen lnwage = ln(wage)
gen agesqr = age^2
reg lnwage female age agesqr parttime

*A v�riavel agesqr n�o � significativa pq o pvalor (que � a probabilidade exata de) � acima de 0,1
*Analisando R- squared: As varia��es nas vari�veis independentes explicam varia��es no sal�rio (vari�vel dependente) em 41.8% 
*R2 ajustado esta ajustando R2 pelos graus de liberdade do modelo (sempre ser� menor que o R2)

* Comandos para gerar vari�veis dummy
*1-	PRIM�RIO (1� a 4� s�rie)
*2-	Gin�sio (5� a 8� serie )
*3-	Ensino M�dio 
*4-	Superior

gen d1 = 1 if educ ==2 
replace d1 = 0 if educ ~=2
gen d2 = 1 if educ ==3
replace d2 = 0 if educ ~=3
gen d3 = 1 if educ ==4
replace d3 = 0 if educ ~=4

*Multicolinearidade = combina��o linear
*Vari�vel de intera��o = quando voc� utiliza duas vari�veis para criar uma 3�

reg lnwage female 
*O modelo � estatisticamente significativo a 1%
*Rejeitando H0 a 99% de confian�a
*39,01 � F calculado (1 numerador, 498 denominador)
*Impactam (s� o coeficiente)
*R2 explica
*R2 ajustado (pelo grau de liberdade)
*O b1 � estatisticamente  significativo a 1 %
*Coeficiente B1, se for do sexo feminino o salario ser� impactado em -25,06%
*As mulheres recebem 25% a menos do que os homens

reg lnwage female age parttime d1 d2 d3
*R2 aumenta pois adicionou mais vari�veis 
*As varia��es nas vari�veis independentes explicam varia��es no salario (vari�vel dependente) em 71.61%
*Female n�o � significativo pois P valor = 0.206
*Criar vari�vel de intera��o female*d3
gen femaled3 = female*d3
* Fazer regress�o com a variavel intera��o 
reg lnwage female age parttime d1 d2 d3 femaled3
*-0,17+0,61= mulher ganha em geral mais que os homens
