#!/bin/python3

import math
import os
import random
import re
import sys


#
# Complete the 'minOperations' function below.
#
# The function is expected to return an INTEGER.
# The function accepts following parameters:
#  1. INTEGER_ARRAY arr
#  2. INTEGER threshold
#  3. INTEGER d
#
from collections import defaultdict as dd


def minOperations(arr, threshold, d):
    result = sys.maxsize
    arr.sort()
    dictArr = dd(lambda: [0, 0])
    
    for i in arr:
        counter = 0
        while True:
            dictArr[i][0] += 1
            dictArr[i][1] += counter
            
            if dictArr[i][0] >= threshold:
                result = min(result, dictArr[i][1])
            if i == 0:
                break
            i = i//d
            counter += 1
            
    return result
    
if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    arr_count = int(input().strip())

    arr = []

    for _ in range(arr_count):
        arr_item = int(input().strip())
        arr.append(arr_item)

    threshold = int(input().strip())

    d = int(input().strip())

    result = minOperations(arr, threshold, d)

    fptr.write(str(result) + '\n')

    fptr.close()
