from collections import defaultdict, OrderedDict
from itertools import islice
import json

# Starter data; a unordered, raw data set.
TRANSACTIONS = [['A', 'B', 'C', 'E', 'G', 'H'],
    ['A', 'B', 'E', 'F', 'M'],
    ['B', 'C', 'D', 'E', 'G', 'M'],
    ['A', 'B', 'C', 'H'],
    ['B', 'E', 'A', 'C'],
    ['C', 'D', 'E', 'F', 'M'],
    ['A', 'B', 'C', 'E', 'H'],
    ['B', 'C', 'E', 'G', 'H', 'M']]

# TRANSACTIONS = [['beer', 'water', 'apple'],
#                 ['beer', 'water', 'bananas'],
#                 ['beer', 'diaper', 'apple'],
#                 ['mac', 'cheese', 'apple'],
#                 ['mac', 'cheese', 'beer']]

# define the first k items you want to be discovered
# items beyond k in priority level will not make it into the tree and final output
# if you set to -1 it will consider every item
K = -1

# get the frequency of each item in the raw data
frequencyDict = defaultdict(int)
for i in range(len(TRANSACTIONS)):
    trans = TRANSACTIONS[i]
    for i in range(len(trans)):
        frequencyDict[trans[i]] += 1

# order the frequencies descending
order = OrderedDict(sorted(frequencyDict.items(), key=lambda t: t[1], reverse=True))
print("\nFREQUENCIES")
print(json.dumps(order, indent=5))


def takeN(n, iterable):
    if n == -1: # use all frequencies and items if is -1
        return list(iterable)
    else:
        return list(islice(iterable, n))

topN = takeN(K, order)
print("\nTOP K FREQUENCIES WHERE K = " + str(K))
print(json.dumps(topN, indent=5))


# list to store all the frequency sorted transactions
masterList = []

# sort each transaction based on the frequency gathered above
for tempArray in TRANSACTIONS:
    tempDict = {}  # new this up every time
    for j in range(len(tempArray)):
        if tempArray[j] in topN:
            tempDict[tempArray[j]] = frequencyDict[tempArray[j]]
        # else do not put item in list beacuse it is not top N
    masterList.append(list(OrderedDict(sorted(tempDict.items(), key=lambda t: t[1], reverse=True)).keys()))

# this print out shows each sorted transaction
print("\nTRANSACTIONS IN FREQUENCY ORDER")
for idx, i in enumerate(masterList):
    print(i)
    # print("TRANSCATION " + str(idx) + ":" + " " + i)


def makeTree(allTransactionsMatrix):
    root = dict()
    for transaction in allTransactionsMatrix:
        tempDict = root
        for item in transaction:
            if item in tempDict.keys():
                tempDict[item]['count'] = tempDict[item]['count'] + 1
            tempDict = tempDict.setdefault(item, {'count': 1})
    return root


print("\nFP-GROWTH TREE")
fpGrowthTree = (makeTree(masterList))
print json.dumps(fpGrowthTree, indent=5)

#
#
# print("\nGET ITEM SETS OUT OF FP-GROWTH TREE BY TRAVERSAL + RECURSION")
# rebuildMasterArray = []
#
#
# def recursivePrintitems(tree, builder):
#     for key, value in tree.items():
#         if tree[key] == {}:
#             tempBuilder = builder
#             builder += ',' + key
#             rebuildMasterArray.append(builder[1:].split(','))
#             builder = tempBuilder
#         else:
#             recursivePrintitems(tree[key], builder + "," + key)
#
# recursivePrintitems(fpGrowthTree, "")
#
#
# print("\nPOSSIBLE PATH TO AN ITEM")
#
# pathsTo = []
# for each in rebuildMasterArray:
#     tempPath = []
#     for i in each:
#         tempPath.append(i)
#         pathsTo.append(list(tempPath))
#
# allPathsToDict = {}
# for each in pathsTo:
#     if each[-1] in allPathsToDict:
#         if each[:-1] not in allPathsToDict[each[-1]]['paths']:
#             allPathsToDict[each[-1]]['paths'].append(each[:-1])
#     else:
#         allPathsToDict[each[-1]] = {
#             'paths': [each[:-1]]
#         }
#
#
# print(json.dumps(allPathsToDict, indent=5))
