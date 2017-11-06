#!/usr/bin/env python
# -*- coding: utf-8 -*-


import pandas as pd

from bokeh.plotting import figure, show, output_file
from bokeh.sampledata.us_states import data as states
from bokeh.models import (
    ColumnDataSource,
    HoverTool
)

df = pd.read_csv('MassShooting.csv')

# Assigning the column names
df.columns = ['ID', 'Date', 'State', 'City', 'Address', 'Killed', 'Injured']

# Combining the both
df['Total'] = df['Killed'] + df['Injured']

# deleting the AK and HI because the map gets too large 
del states['AK']
del states['HI']

# Finding the unique state
states_unique = df['State'].unique()
states_df = {}

for i in range(0,len(df)):
    if df['State'][i] in states_df:
        states_df[df['State'][i]] = states_df[df['State'][i]] + df['Total'][i]
    else:
        states_df[df['State'][i]] = 0

state_xs = [states[code]["lons"] for code in states]
state_ys = [states[code]["lats"] for code in states]
state_name = [states[code]["name"] for code in states]

state_missing = [state for state in state_name if state not in list(states_df.keys())]

for i in range(len(state_missing)):
	states_df[state_missing[i]] = 0

state_total = [states_df[states[code]["name"]] for code in states]

color_scheme = list(states_df.values())
color_scheme_to_pd = pd.Series(color_scheme)
summary = color_scheme_to_pd.describe()

colors = ['#084594', '#c6dbef',"#D4B9DA", "#980043"]
state_color = {}
state_list = list(states.keys())
for abbre in state_list:
    if states_df[states[abbre]['name']] >= summary['min'] and states_df[states[abbre]['name']] <= summary['25%']:
        state_color[states[abbre]['name']] = colors[0]
    if states_df[states[abbre]['name']] >= summary['25%'] and states_df[states[abbre]['name']] <= summary['50%']:
        state_color[states[abbre]['name']] = colors[1]
    if states_df[states[abbre]['name']] >= summary['50%'] and states_df[states[abbre]['name']] <= summary['75%']:
        state_color[states[abbre]['name']] = colors[2]
    if states_df[states[abbre]['name']] >= summary['75%'] and states_df[states[abbre]['name']] <= summary['max']:
        state_color[states[abbre]['name']] = colors[3]

state_color = [state_color[states[code]["name"]] for code in states]
state_severe = []

for i in range(len(state_color)):
    if state_color[i] == '#084594':
        state_severe.append('Safe')
    elif state_color[i] == '#c6dbef':
        state_severe.append('Okay')        
    elif state_color[i] == "#D4B9DA":
        state_severe.append('Dangerous')
    elif state_color[i] == "#980043":
        state_severe.append('Very Dangerous')

source = ColumnDataSource(data=dict(
    x=state_xs,
    y=state_ys,
    name=state_name,
    total=state_total,
    color=state_color,
    safe=state_severe
))

TOOLS = "pan,wheel_zoom,reset,hover,save"

p = figure(title="The number of people killed and injured in mass shooting between 2012 and 2016", 
           toolbar_location="left", tools = TOOLS,
           plot_width=1100, plot_height=700,
           x_axis_location=None, y_axis_location=None)

p.patches(state_xs, state_ys, source=source, fill_color=state_color, 
          fill_alpha=0.7, line_color="white", line_width=0.5)
p.legend.location = "top_left"

hover = p.select_one(HoverTool)
hover.point_policy = "follow_mouse"
hover.tooltips = [
    ("State", "@name"),
    ("Total Number of people killed + injured", "@total"),
    ("(Long, Lat)", "($x, $y)"),
    ("How Dangerous?", "@safe"),
]

output_file("bokeh_map.html", title="bokeh_map example")
show(p)

