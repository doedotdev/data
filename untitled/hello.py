import ast
str = '''
{"quests":[{"title":"Phite Club","status":"COMPLETED","difficulty":3,"members":true,"questPoints":1,"userEligible":true},
                 {"title":"All Fired Up","status":"COMPLETED","difficulty":1,"members":true,"questPoints":1,"userEligible":true}]}
'''
print(str)
my_dict = ast.literal_eval(str)