#!/usr/bin/env python
# -*- coding: utf-8 -*-


import pandas as pd
import numpy as np
import os

import plotly
from plotly import tools
import plotly.plotly as py
import plotly.graph_objs as go

from collections import OrderedDict


# getting the path
os.chdir('..')
path = os.getcwd()

# reading the file
df = pd.read_csv(path + '/TerrorismDATA_Real_1970_2016.csv', encoding='utf-8', low_memory=False)

# only 1970 and 2016
df_1970 = df.ix[df['iyear'] == 1970].reset_index(drop=True)
df_2016 = df.ix[df['iyear'] == 2016].reset_index(drop=True)

# fill zeros and drop nas
df_1970['nkill'] = df_1970['nkill'].fillna(0)
df_2016['nkill'] = df_2016['nkill'].fillna(0)

df_1970['weaptype1_txt'] = df_1970['weaptype1_txt'].dropna()
df_2016['weaptype1_txt'] = df_2016['weaptype1_txt'].dropna()

# unique weapon list
weapon_1970 = sorted(list(df_1970['weaptype1_txt'].unique()))
weapon_2016 = sorted(list(df_2016['weaptype1_txt'].unique()))

# getting the nkill by weapon
list_1970 = []
for i in range(len(weapon_1970)):
	sub_df = df_1970.ix[df_1970['weaptype1_txt']==weapon_1970[i]].reset_index(drop=True)
	list_1970.append(sub_df['nkill'].sum())

list_2016 = []
for i in range(len(weapon_2016)):
	sub_df = df_2016.ix[df_2016['weaptype1_txt']==weapon_2016[i]].reset_index(drop=True)
	list_2016.append(sub_df['nkill'].sum())

# plotting
fig = {
  "data": [
    {
      "values": list_1970,
      "labels": weapon_1970,
      "domain": {"x": [0, .48]},
      "name": "1970",
      "hoverinfo":"label+percent+name",
      "hole": .4,
      "type": "pie"
    },     
    {
      "values": list_2016,
      "labels": weapon_2016,
      "textposition":"inside",
      "domain": {"x": [.52, 1]},
      "name": "2016",
      "hoverinfo":"label+percent+name",
      "hole": .4,
      "type": "pie"
    }],
  "layout": {
        "title":"Deaths by weapons in 1970 and 2016",
        "annotations": [
            {
                "font": {
                    "size": 20
                },
                "showarrow": False,
                "text": "1970",
                "x": 0.20,
                "y": 0.5
            },
            {
                "font": {
                    "size": 20
                },
                "showarrow": False,
                "text": "2016",
                "x": 0.8,
                "y": 0.5
            }
        ]
    }
}

plotly.offline.plot(fig, filename='takehome_9.html')
