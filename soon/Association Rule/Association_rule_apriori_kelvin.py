# -*- coding: utf-8 -*-
"""
Created on Sat Sep 10 23:00:32 2022

@author: Kelvin
"""
#install apriori library
#!pip install apyori 


# Import libraries
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

# Data Preprocessing
dataset = pd.read_csv('Market_Basket_Optimisation.csv', header=None) # no headers in dataframe

# convert pandas dataframe to a list of transactions
transactions_list=[]
for i in range(0, 7501): #iterate over 7500 rows
    transactions_list.append([str( dataset.values[i,j] ) for j in range(0,20)] )

#Training the Apriori Model on the dataset
from apyori import apriori
rules = apriori(transactions = transactions_list, 
                min_support = 0.003, #product appears in atleast 3% of the time
                min_confidence = 0.2,
                min_lift = 3, #lift = rule of thumb = lifts below 3 makes rule irrelevant
                min_length= 2, max_length=2)   #two products in our rules

# min_support = 21/7501 = 0.00279 : products that appear in atleast 3 times a day =  21 times a week: 
# min_confidence = precision for rule to be correct = accurracy of correct rule 
#lift = rule of thumb = lifts below 3 makes rule irrelevant
#min & max length = buy one get one free % = two products in our rule


#VISUALIZING RESULTS
# Display first results from rules 
results = list(rules) 
results

#Putting results well organised in a Pandas Dataframe
def inspect(results):
    lhs         = [tuple(result[2][0][0])[0] for result in results]
    rhs         = [tuple(result[2][0][1])[0] for result in results]
    supports    = [result[1] for result in results]
    confidences = [result[2][0][2] for result in results]
    lifts       = [result[2][0][3] for result in results]
    return list(zip(lhs, rhs, supports, confidences, lifts))
resultsinDataFrame = pd.DataFrame(inspect(results), columns = ['Left Hand Side', 'Right Hand Side', 'Support', 'Confidence', 'Lift'])

# Display results non sorted
resultsinDataFrame

# Display results in Data frame sorted by lift column
resultsinDataFrame.nlargest(n = 10, columns='Lift')

#customers who buy fromage are 25% likely to buy Honey.