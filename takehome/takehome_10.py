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

# uniques for 1970 and 2016
dbsource_1970_unique = sorted(list(df_1970['dbsource'].unique()))
dbsource_2016_unique = sorted(list(df_2016['dbsource'].unique()))

# counting each in the unique list
count_1970 = []
for i in range(len(dbsource_1970_unique)):
	sub_df = df_1970.ix[df_1970['dbsource']==dbsource_1970_unique[i]]
	count_1970.append(len(sub_df))

count_1970.append(0)

# calculating percentage
total_1970 = sum(count_1970)
for k in range(len(count_1970)):
	count_1970[k] = round(count_1970[k]/total_1970 * 100)

count_2016 = [0] * len(dbsource_1970_unique)
count_2016.append(100)

# the list of the total uniques
dbsource_1970_unique.append('SMART Primary')

# plotting
trace0 = go.Scatter(
    x=count_1970,
    y=dbsource_1970_unique,
    mode='markers',
    name='1970',
    marker=dict(
        color='rgba(156, 165, 196, 0.95)',
        line=dict(
            color='rgba(156, 165, 196, 1.0)',
            width=1,
        ),
        symbol='circle',
        size=16,
    )
)
trace1 = go.Scatter(
    x=count_2016,
    y=dbsource_1970_unique,
    mode='markers',
    name='2016',
    marker=dict(
        color='rgba(204, 204, 204, 0.95)',
        line=dict(
            color='rgba(217, 217, 217, 1.0)',
            width=1,
        ),
        symbol='circle',
        size=16,
    )
)

data = [trace0, trace1]
layout = go.Layout(
    title="Different database sources of terrorism for 1970 and 2016",
    xaxis=dict(
        showgrid=False,
        showline=True,
        linecolor='rgb(102, 102, 102)',
        titlefont=dict(
            color='rgb(204, 204, 204)'
        ),
        tickfont=dict(
            color='rgb(102, 102, 102)',
        ),
        autotick=False,
        dtick=10,
        ticks='outside',
        tickcolor='rgb(102, 102, 102)',
    ),
    margin=dict(
        l=140,
        r=40,
        b=50,
        t=80
    ),
    legend=dict(
        font=dict(
            size=10,
        ),
        yanchor='middle',
        xanchor='right',
    ),
    width=800,
    height=600,
    paper_bgcolor='rgb(254, 247, 234)',
    plot_bgcolor='rgb(254, 247, 234)',
    hovermode='closest',
)
fig = go.Figure(data=data, layout=layout)
plotly.offline.plot(fig, filename='takehome_10.html')


