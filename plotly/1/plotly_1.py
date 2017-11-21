#!/usr/bin/env python
# -*- coding: utf-8 -*-

import pandas as pd

import plotly   
import plotly.plotly as py
from plotly.grid_objs import Grid, Column

# Reading the csv
# Data is too big, it is not included in this repository
df = pd.read_csv('data.csv', encoding='utf-8', low_memory=False)
df = df[['iyear', 'imonth', 'iday', 'country_txt', 'longitude', 'latitude', 'nkill', 'attacktype1_txt']]

# Adding the information on hover tooltip
df['text'] = df['country_txt'] + '<br>Terror Date: ' + df['imonth'].astype(str) + '/' + df['iday'].astype(str) + '<br>Longitude: ' + df['longitude'].astype(str) + '<br>Latitude: ' + df['latitude'].astype(str) + '<br>number of kill: ' + df['nkill'].astype(str) + '<br>attack type: ' + df['attacktype1_txt']

# Collecting the only last 6 years
unique =  list(df['iyear'].unique())
year_unique = unique[len(unique)-6:len(unique)]

# Appending dictionary to the list
datas = []
for i in range(len(year_unique)):
	sub_df = df.ix[df['iyear'] == year_unique[i]].reset_index(drop=True)
	data = dict(
			type = 'scattergeo',
			lon = sub_df['longitude'],
			lat = sub_df['latitude'],
			text = sub_df['text'],
			marker = dict(
				size = sub_df['nkill']*3,
				line = dict(width=0.5, color='rgb(40,40,40)'),
	            		sizemode = 'area'))
	datas.append(data)

# Appending the steps for the slider 
steps = []
for i in range(len(year_unique)):	
    step = dict(method='restyle',
                args=['visible', [False] * len(year_unique)],
                label='Year {}'.format(year_unique[i]))
    step['args'][1][i] = True
    steps.append(step)

# Slider format
sliders = [dict(active=0,
		pad={"t": 1},
		steps=steps)]

layout = dict(
		title = 'The Interactive Map of Terrorism in The World',
		showlegend = False,
		geo = dict(
        	scope='world',
            	projection=dict(type="natural earth"),			
		showland = True,
		landcolor = 'ryb(217, 217, 217)',
                subunitwidth=1,
                countrywidth=1,
                subunitcolor="ryb(255, 255, 255)",
                countrycolor="ryb(255, 255, 255)"
		),
	sliders=sliders)

# Plotting
fig=dict(data = datas, layout=layout)
py.plot(fig, validate=False, filename='plotly_1')
