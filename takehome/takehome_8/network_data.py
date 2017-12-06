#!/usr/bin/env python
# -*- coding: utf-8 -*-


import pandas as pd
import numpy as np
import os


# getting the path
os.chdir('..')
path = os.getcwd()

# reading the file
df = pd.read_csv(path + '/TerrorismDATA_Real_1970_2016.csv', encoding='utf-8', low_memory=False)

# only 1970 and 2016
df_1970 = df.ix[df['iyear'] == 1970].reset_index(drop=True)
df_2016 = df.ix[df['iyear'] == 2016].reset_index(drop=True)

# merging 
df_total = pd.concat([df_1970, df_2016])

# writing the network data
network = df_total[['country_txt','natlty1_txt','nkill']]
network = network.fillna(0)
network = network.ix[network['nkill'] > 0].reset_index(drop=True)

same = []
for i in range(len(network)):
	if network['country_txt'][i] == network['natlty1_txt'][i]:
		same.append(i)
	else:
		pass

network = network.drop(network.index[same]).reset_index(drop=True)

drop = []
for j in range(len(network)):
	if network['natlty1_txt'][j] == 0:
		drop.append(j)
	elif network['natlty1_txt'][j] == 'International':
		drop.append(j)
	elif network['natlty1_txt'][j] == 'Multinational':
		drop.append(j)
	else:
		pass

network = network.drop(network.index[drop]).reset_index(drop=True)

# writing to csv
network.to_csv('network_data.csv', sep=',', encoding='utf-8')

