#!/bin/python3

import math
import os
import random
import re
import sys

#
# Complete the 'plusMinus' function below.
#
# The function accepts INTEGER_ARRAY arr as parameter.
#

def plusMinus(arr):
    # Write your code here
    negatives,positives,zeros = 0,0,0
    for i in range(0, len(arr)):
        if arr[i]>0:
            positives += 1
        elif arr[i]<0:
            negatives += 1
        else :
            zeros += 1
    print(positives/len(arr))
    print(negatives/len(arr))
    print(zeros/len(arr))

if __name__ == '__main__':
    n = int(input().strip())

    arr = list(map(int, input().rstrip().split()))

    plusMinus(arr)
