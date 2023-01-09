#!/bin/python3

import math
import os
import random
import re
import sys

#
# Complete the 'bomberMan' function below.
#
# The function is expected to return a STRING_ARRAY.
# The function accepts following parameters:
#  1. INTEGER n
#  2. STRING_ARRAY grid
#
def bomberMan(n, grid):
    if n <= 1:
        return grid
    
    if n % 2 == 0:
        return ['O' * len(grid[0]) for i in range(len(grid))]
        
    # Convert grid to list of lists to simplify manipulation
    grid = [list(line) for line in grid]
    
    if ((n - 1) / 2) % 2 == 1:
        grid = invert_bombs(grid)
    
    elif ((n - 1) / 2) % 2 == 0:
        grid = invert_bombs(grid)
        grid = invert_bombs(grid)
    
    # Convert back to list of strings
    return [(''.join(line)) for line in grid]
    
    
def invert_bombs(grid):
    # Use 'x' to differ from '.' and '0'
    grid = [
        ['x' if cell == '.' else cell for cell in line] 
        for line in grid
    ]
    
    for i, line in enumerate(grid):
        for j, cell in enumerate(line):
            if cell == 'O':
                try_explode(grid, i + 1, j)
                try_explode(grid, i - 1, j)
                try_explode(grid, i, j + 1)
                try_explode(grid, i, j - 1)
                grid[i][j] = '.'

    # Convert 'x' to '0'            
    grid = [
        ['O' if cell == 'x' else cell for cell in line] 
        for line in grid
    ]
    return grid
    

def try_explode(grid, i, j):
    if i < 0 or j < 0:
        return
    try:
        if grid[i][j] != 'O':
            grid[i][j] = '.'
    except IndexError:
        pass
        

if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    first_multiple_input = input().rstrip().split()

    r = int(first_multiple_input[0])

    c = int(first_multiple_input[1])

    n = int(first_multiple_input[2])

    grid = []

    for _ in range(r):
        grid_item = input()
        grid.append(grid_item)

    result = bomberMan(n, grid)

    fptr.write('\n'.join(result))
    fptr.write('\n')

    fptr.close()
