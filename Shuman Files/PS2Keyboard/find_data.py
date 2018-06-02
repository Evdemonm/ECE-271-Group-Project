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
            # try:
            if(line[2] != '' or line[0] !=''):
                t=float(line[2])
                time = float(line[0])
            # except Exception as e:
            # else:
            #     # print("value: ", line[2])
            #     # print("time", line[0])
            timeAdd = 0
            timeAdd2 = 0
            if idx > 14 and t < 1 and check == 0:
                # print("falling - time:", time, "\n");
                check = 1
                timefall = time
            if idx > 14 and t > 4 and check == 1:
                timerise = time - timefall
                print("Time:", timerise, "\n");
                check = 0
                timeAdd2 = time
