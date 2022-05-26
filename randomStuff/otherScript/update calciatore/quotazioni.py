import csv
from os import path

with open(path.dirname(__file__) +"/quotazioni.csv",mode='r') as file:
    for row in file:
        quotazione=row.split(';')[4]
        id=row.split(';')[0]
        buff="UPDATE calciatore SET quotazione=",quotazione," WHERE id=",id,";\n"
        quotazioni=open(path.dirname(__file__) +"\update calciatore.txt",mode='a')
        quotazioni.write("".join(buff))
        quotazioni.close()