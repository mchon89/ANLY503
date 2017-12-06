#!/usr/bin/env python
# -*- coding: utf-8 -*-


import pandas as pd
import numpy as np
import os

import plotly
from plotly import tools
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

# x-axis
x_list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]

# getting the nkill by each year
list_1970 = []
for i in range(len(x_list)):
	sub_df = df_1970.ix[df_1970['imonth']==x_list[i]].reset_index(drop=True)
	list_1970.append(sub_df['nkill'].sum())

list_2016 = []
for i in range(len(x_list)):
	sub_df = df_2016.ix[df_2016['imonth']==x_list[i]].reset_index(drop=True)
	list_2016.append(sub_df['nkill'].sum())

# plotting
trace1 = go.Scatter(
    x=x_list,
    y=list_1970,
    name='1970'
)

trace2 = go.Scatter(
    x=x_list,
    y=list_2016,
    name='2016'
)

fig = tools.make_subplots(rows=1, cols=2)

fig.append_trace(trace1, 1, 1)
fig.append_trace(trace2, 1, 2)

fig['layout'].update(height=600, width=800, title='1970 vs 2016 by months')
plotly.offline.plot(fig, filename='takehome_5.html')



