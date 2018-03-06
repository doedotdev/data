from collections import defaultdict, OrderedDict
import json

# Starter data; a unordered, raw data set.
TRANSACTIONS = [['A', 'B', 'C', 'E', 'G', 'H'],
    ['A', 'B', 'E', 'F', 'M'],
    ['B', 'C', 'D', 'E', 'G', 'M'],
    ['A', 'B', 'C', 'H'],
    ['C', 'D', 'E', 'F', 'M'],
    ['A', 'B', 'C', 'E', 'H'],
    ['B', 'C', 'E', 'G', 'H', 'M']]

# TRANSACTIONS = [['beer','water','apple'],
#                 ['beer', 'water', 'bannana'],
#                 ['beer', 'diaper', 'apple'],
#                 ['mac', 'cheese', 'apple'],
#                 ['mac', 'cheese', 'beer']]

# get the frequency of each item in the raw data
frequencyDict = defaultdict(int)
for i in range(len(TRANSACTIONS)):
    trans = TRANSACTIONS[i]
    for i in range(len(trans)):
        frequencyDict[trans[i]] += 1

# order the frequencies descending
order = OrderedDict(sorted(frequencyDict.items(), key=lambda t: t[1], reverse=True))
print("\n")
print("FREQUENCIES")
print(json.dumps(order, indent=5))

# list to store all the frequency sorted transactions
masterList = []

# sort each transaction based on the frequency gathered above
for i in range(len(TRANSACTIONS)):
    tempArray = TRANSACTIONS[i]
    tempDict = {}
    for j in range(len(tempArray)):
        tempDict[tempArray[j]] = frequencyDict[tempArray[j]]
    tempOrder = OrderedDict(sorted(tempDict.items(), key=lambda t: t[1], reverse=True))
    tempList = list(tempOrder.keys())
    # masterList.append(''.join(tempList))
    masterList.append(tempList)

# this print out shows each sorted transaction
print("\n")
print("TRANSACTIONS IN FREQUENCY ORDER")
for idx, i in enumerate(masterList):
    print(i)
    # print("TRANSCATION " + str(idx) + ":" + " " + i)

# now lets put these into a tree structure (really just an altered dictionary)
def makeTree(*passedArrays):
    root = dict()
    for tempArray in passedArrays:
        for temp in tempArray:
            tempDict = root
            for j in temp:
                tempDict = tempDict.setdefault(j, {})
        return root

# print out final tree of transactions
print("\n")
print("FP-GROWTH TREE")
fpGrowthTree = (makeTree(masterList))
print json.dumps(fpGrowthTree, indent=5)

print("\n")
print("GET ITEM SETS OUT OF FP-GROWTH TREE BY TRAVERSAL")

rebuildMasterArray = []

def recursivePrintitems(tree, builder):
    for key, value in tree.items():
        if tree[key] == {}:
            builder += ',' + key
            rebuildMasterArray.append(builder[1:].split(','))
        else:
            recursivePrintitems(tree[key], builder + "," + key)

recursivePrintitems(fpGrowthTree, "")
for each in rebuildMasterArray:
    print(each)