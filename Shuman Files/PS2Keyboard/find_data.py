import csv
import sys

with open(sys.argv[1], newline = '') as file:
    print("=================================")
    print("File: ", sys.argv[1])
    print("=================================")
    a = csv.reader(file, delimiter=',', quotechar='|')
    data = []
    check = 0
    for idx,line in enumerate(a):
        if idx > 14:
            if(line[2] != '' or line[0] !='' or line[1] != ''):
                t=float(line[1])
                time = float(line[0])
            timeAdd = 0
            timeAdd2 = 0
            if idx > 14 and t < 1 and check == 0:
                check = 1
                timefall = time
            if idx > 14 and t > 4 and check == 1:
                timerise = time - timefall
                print("Time:", timerise)
                print("Value:", line[2])
                if(float(line[2]) > 4):
                    print("bit:", 1, "\n")
                    data.append(1)
                elif(float(line[2]) < 1):
                    print("bit:", 0, "\n")
                    data.append(0)
                check = 0
                timeAdd2 = time
    if(sys.argv[2] == "-w"):
        fileR = open("PS2Data.txt", "r")
        dataPrevious = fileR.read()
        fileR.close()
        file = open("PS2Data.txt", "w")
        dataWrite = dataPrevious + str(sys.argv[1]) + ": " + str(data) +"\n"
        file.write(dataWrite);
    print("Data:", data)
    # file = open("ps/2Data.txt", "w")
