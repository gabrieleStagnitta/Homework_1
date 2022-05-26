import csv
from os import path

file_path = path.dirname(__file__) + "\statistiche.csv"

with open (file_path,mode ='r') as file:
    counter = 0
    id = 0
    ruolo = ''
    nome = ''
    squadra = ''
    for row in file:
        if counter == 0:
            counter+=1
        else:
            id=row.split(';')[0]
            ruolo=row.split(';')[1]
            nome=row.split(';')[2]
            squadra=row.split(';')[3]
            fileQuery = open(path.dirname(__file__) +"\insert.txt","a")
            buff='INSERT INTO calciatore(id,ruolo,nome,infortunato,squadra) VALUES(',id,',\"',ruolo,'\",\"',nome,'\",0,\"',squadra,'\");\n'
            fileQuery.write("".join(buff))
            fileQuery.close()