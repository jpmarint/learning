#!/bin/python3

import math
import os
import random
import re
import sys



#
# Complete the 'anagram' function below.
#
# The function is expected to return an INTEGER.
# The function accepts STRING s as parameter.
#

from collections import Counter

def anagram(s):
    n = len(s)
    
    if n%2 != 0:
        return -1
    
    #Obtain the elements of the first half and the second half
    #Obtain the difference between the two counters, the difference in letters
    
    s = Counter(s[:n//2]) - Counter(s[n//2:])
    
    return sum(s.values()) #returns the numbers of elementes that needs to be change
    

if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    q = int(input().strip())

    for q_itr in range(q):
        s = input()

        result = anagram(s)

        fptr.write(str(result) + '\n')

    fptr.close()
