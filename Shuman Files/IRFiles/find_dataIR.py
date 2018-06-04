import csv
import sys

with open(sys.argv[1], newline = '') as file:
    print("=================================")
    print("File: ", sys.argv[1])
    print("=================================")
    a = csv.reader(file, delimiter=',', quotechar='|')
    data = []
    check = 0
    dataCount = 0
    timerise = 0
    for idx,line in enumerate(a):
        if idx > 14:
            # try:
            if(line[1] != '' or line[0] !=''):
                t=float(line[1])
                time = float(line[0])
            timeAdd = 0
            timeAdd2 = 0
            if idx > 14 and t < 1 and check == 0:
                # print("falling - time:", time, "\n");
                check = 1
                timefall = time
            if idx > 14 and t > 3 and check == 1:
                timerise = time - timefall
                print("Time:", timerise, "\n");
                check = 0
                timeAdd2 = time
            if timerise > .0009 and timerise < .003:
                data.append(1)
                dataCount = dataCount+1
                timerise = 0
            elif timerise < .001 and timerise > 0:
                data.append(0)
                dataCount = dataCount+1
                timerise = 0
    if(sys.argv[2] == "-w"):
        fileR = open("IRData.txt", "r")
        dataPrevious = fileR.read()
        fileR.close()
        file = open("IRData.txt", "w")
        dataWrite = dataPrevious + str(sys.argv[1]) + ": " + str(data) +"\n"
        file.write(dataWrite);
    print("Data: ", data)
