strings = Create Strings as file list: "fileList", "/Users/leonardoferraz/Documents/Coisas/Jobs/NayraPaiva/dados/contexto6"
fileCounter = Get number of strings

writeFileLine: "dados6.csv", "arquivo,", "sentenca,", "durSentenca,", "palavra,", "silaba,", "durSilaba,", "durPausaI,", "durPausaII,", "durPausaInesperada"

for i to fileCounter

	selectObject: strings
	filename$ = Get string: i
	Read from file: filename$
	numInterval = Get number of intervals: 2
	intervalSentence = Get number of intervals: 3
	durPausaI = 0
	durPausaII = 0
	durPausaIII = 0
	
	for j to intervalSentence
	label$ = Get label of interval: 3, j
	
		if label$ != ""
		start = Get start time of interval: 3, j
		end = Get end time of interval: 3, j
		durSentenca = end - start
		endif

	endfor

	for j to numInterval
	label$ = Get label of interval: 2, j

		sentenca$ = "A menina mexicana mundialmente famosa mandou o novo manuscrito"

		if label$ == "p1"
		start = Get start time of interval: 2, j
		end = Get end time of interval: 2, j
		durPausaI = end - start
		endif

		if label$ == "p2"
		start = Get start time of interval: 2, j
		end = Get end time of interval: 2, j
		durPausaII = end - start
		endif

		if label$ == "p3"
		start = Get start time of interval: 2, j
		end = Get end time of interval: 2, j
		durPausaIII = end - start
		endif

		if label$ == "ca"
		start = Get start time of interval: 2, j
		end = Get end time of interval: 2, j
		durSilabaI = end - start
		palavraI$ = "mexicana"
		silabaI$ = "ca"
		endif

		if label$ == "mo"
		start = Get start time of interval: 2, j
		end = Get end time of interval: 2, j
		durSilabaII = end - start
		palavraII$ = "famosa"
		silabaII$ = "mo"
		endif
		endif

	endfor

# ==================================================
# Adicionar linhas ao arquivo final
# ==================================================

appendFileLine: "dados6.csv", filename$, ",", sentenca$, ",", durSentenca, ",", palavraI$, ",", silabaI$, ",", durSilabaI, ",", durPausaI, ",", durPausaII, ",", durPausaIII
appendFileLine: "dados6.csv", filename$, ",", sentenca$, ",", durSentenca, ",", palavraII$, ",", silabaII$, ",", durSilabaII, ",", durPausaI, ",", durPausaII, ",", durPausaIII

endfor