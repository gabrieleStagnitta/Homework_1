from os import path
squadre= ["Atalanta","Bologna","Cagliari","Empoli","Fiorentina","Genoa","Inter","Juventus","Lazio","Milan","Napoli","Roma","Salernitana","Sampdoria","Sassuolo","Spezia","Torino","Udinese","Venezia","Verona"]
#INSERT INTO squadra (id,nome) VALUES (c,'i')
id=0
for squadra in squadre:
    id+=1
    file=open(path.dirname(__file__) +"\insertSquadre.txt","a")
    buff=f'INSERT INTO squadre(id,nome) VALUES(\"',str(id),'\",\"',squadra,'\");\n'
    file.write("".join(buff))
    file.close()