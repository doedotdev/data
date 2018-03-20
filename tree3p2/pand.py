import xlrd

file_loc='./winequality-red.xls'

wkb=xlrd.open_workbook(file_loc)
sheet=wkb.sheet_by_index(0)


_matrix=[]
for row in range (sheet.nrows):
    _row = []
    for col in range (sheet.ncols):
        _row.append(sheet.cell_value(row,col))
    _matrix.append(_row)

print(_matrix)
print(len(_matrix))

def getValueRow(row):
    if float(row[11-1]) <= 10.4:
        if float(row[4-1]) <= 8.1:
            return 5.460408
        else:
            return 5
    else:
        if float(row[11-1]) <=11.4:
            if float(row[11-1]) <=10.8:
                return 5.836
            else:
                return 6
        else:
            if float(row[11-1]) <= 12.2:
                return 6.267974
            else:
                return 7

diffMatrix = []

for row in _matrix[1200:]:
    print(getValueRow(row))
    diff = getValueRow(row) - float(row[11])
    diffMatrix.append(diff*diff)
    # print(row[4-1])

def mean(numbers):
    return float(sum(numbers)) / max(len(numbers), 1)

print(mean(diffMatrix))
