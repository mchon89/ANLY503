#!/usr/bin/env python
# -*- coding: utf-8 -*-


import pandas as pd
import numpy as np
import os

import plotly
import plotly.plotly as py
import plotly.graph_objs as go


# getting the path
os.chdir('..')
path = os.getcwd()

# Read the csv
df = pd.read_csv(path + '/TerrorismDATA_Real_1970_2016.csv', encoding='utf-8', low_memory=False)

# only 1970 and 2016
df_1970 = df.ix[df['iyear'] == 1970].reset_index(drop=True)
df_2016 = df.ix[df['iyear'] == 2016].reset_index(drop=True)

df_1970['nkill'] = df_1970['nkill'].fillna(0)
df_2016['nkill'] = df_2016['nkill'].fillna(0)

# merging 
df_total = pd.concat([df_1970, df_2016])

# attack type 
attack_list = list(df_total['attacktype1_txt'].unique())
attack_list = sorted(attack_list)

# target type
target_list = list(df_total['targtype1_txt'].unique())
target_list = sorted(target_list)

# geting nkill by attack and target types
list_2016 = []
for k in range(len(target_list)):
	sub_df = df_2016.ix[df_2016['targtype1_txt']==target_list[k]].reset_index(drop=True)
	temp_list = [0]*9
	for j in range(len(sub_df)):
		temp_index = attack_list.index(sub_df['attacktype1_txt'][j])
		kill_temp = sub_df['nkill'][j]
		temp_list[temp_index] += kill_temp
	list_2016.append(temp_list)

# writing a simpler target list
new_target = ['Abortion', 'Airports', 'Business', 'Educational', 'Food', 'Diplomatic', 
'General', 'Journalists', 'Maritime', 'Military', 'NGO', 'Other', 
'Police', 'Private', 'Religious', 'Telecommun', 'Terrorists', 'Tourists', 'Transport', 'Unknown', 'Utilities', 'Politician']

# plotting
trace = go.Heatmap(
        z=list_2016,
        x=attack_list,
        y=new_target,
        colorscale='Viridis',
    )

data = [trace]

layout = go.Layout(
    title='Attack vs Target Type: Deaths in 2016',
    width = 800,
    height = 600,
    xaxis = dict(ticks='', nticks=9),
    yaxis = dict(ticks='' )
)

fig = go.Figure(data=data, layout=layout)
plotly.offline.plot(fig, filename='takehome_4.html')


