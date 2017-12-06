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

# list of attack type
attack_list = list(df_total['attacktype1_txt'].unique())
attack_list = sorted(attack_list)

# calculating nkill by the years
list_1970 = []
for i in range(len(attack_list)):
    sub_df = df_1970.ix[df_1970['attacktype1_txt']==attack_list[i]].reset_index(drop=True)
    kill_temp = 0
    for j in range(len(sub_df)):
        temp = sub_df['nkill'][j]
        kill_temp = kill_temp + temp
    list_1970.append(kill_temp)

list_2016 = []
for i in range(len(attack_list)):
    sub_df = df_2016.ix[df_2016['attacktype1_txt']==attack_list[i]].reset_index(drop=True)
    kill_temp = 0
    for j in range(len(sub_df)):
        temp = sub_df['nkill'][j]
        kill_temp = kill_temp + temp
    list_2016.append(kill_temp)

# plotting 
trace1 = go.Bar(
    x=attack_list,
    y=list_1970,
    name='1970'
)
trace2 = go.Bar(
    x=attack_list,
    y=list_2016,
    name='2016'
)

data = [trace1, trace2]
layout = go.Layout(
    barmode='stack',
    title="Death by terror means in 1970 and 2016"
)

fig = go.Figure(data=data, layout=layout)
plotly.offline.plot(fig, filename='takehome_3.html')

