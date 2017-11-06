#!/usr/bin/env python
# -*- coding: utf-8 -*-


import pandas as pd 
import numpy as np

from bokeh.layouts import gridplot, widgetbox, row
from bokeh.plotting import figure, show, output_file
from bokeh.models.widgets import Panel, Tabs

from sklearn import preprocessing


df = pd.read_csv('Gold Oil CPI.csv')

# Linking Month to Year, e.g Year-Month
df['Year-Month'] = df['Year'].astype(str) + '-' + df['Month'].astype(str)

# dropping Month and Year
df = df.drop(['Year', 'Month'], 1)

# fill NaN with zero
df['Gold Price'] = df['Gold Price'].fillna(0)
df['Oil Price'] = df['Oil Price'].fillna(0)
df['CPI'] = df['CPI'].fillna(0)

# removing comma in gold price
df['Gold Price'] = df['Gold Price'].map(lambda x: x.replace(',', ''))

# turn to numeric vlaue
df['Gold Price'] = pd.to_numeric(df['Gold Price'])
df['Oil Price'] = pd.to_numeric(df['Oil Price'])
df['CPI'] = pd.to_numeric(df['CPI'])

# pandas datetime 
df['Year-Month'] = pd.to_datetime(df['Year-Month'])

# normalizing price
min_max_scaler = preprocessing.MinMaxScaler()
df['Gold Price'] = min_max_scaler.fit_transform(df['Gold Price'])
df['Oil Price'] = min_max_scaler.fit_transform(df['Oil Price'])
df['CPI'] = min_max_scaler.fit_transform(df['CPI'])

# Setting variables to numpy array
gold = np.array(df['Gold Price'])
oil = np.array(df['Oil Price'])
cpi = np.array(df['CPI'])
dates = np.array(df['Year-Month'], dtype=np.datetime64)

# One-Year Average for each variable
window_size = 12
window = np.ones(window_size)/float(window_size)

gold_avg = np.convolve(gold, window, 'same')
oil_avg = np.convolve(oil, window, 'same')
cpi_avg = np.convolve(cpi, window, 'same')

# Generating four charts with a tab widget

# Gold
p2 = figure(x_axis_type="datetime", title="One-Year Average")
p2.grid.grid_line_alpha = 0
p2.xaxis.axis_label = 'Date'
p2.yaxis.axis_label = 'Gold Price'
p2.ygrid.band_fill_color = "olive"
p2.ygrid.band_fill_alpha = 0.1

p2.circle(x = dates, y = gold, size=4, legend='month',color='darkgrey', alpha=0.3)
p2.line(x = dates, y = gold_avg, legend='avg', color='navy', line_width=3)
p2.legend.location = "top_left"
tab1 = Panel(child=p2, title="Gold")

# Oil
p3 = figure(x_axis_type="datetime", title="One-Year Average")
p3.grid.grid_line_alpha = 0
p3.xaxis.axis_label = 'Date'
p3.yaxis.axis_label = 'Oil Price'
p3.ygrid.band_fill_color = "olive"
p3.ygrid.band_fill_alpha = 0.1

p3.circle(x = dates, y = oil, size=4, legend='month',color='darkgrey', alpha=0.3)
p3.line(x = dates, y = oil_avg, legend='avg', color='navy', line_width=3)
p3.legend.location = "top_left"
tab2 = Panel(child=p3, title="Oil")

# CPI
p4 = figure(x_axis_type="datetime", title="One-Year Average")
p4.grid.grid_line_alpha = 0
p4.xaxis.axis_label = 'Date'
p4.yaxis.axis_label = 'CPI'
p4.ygrid.band_fill_color = "olive"
p4.ygrid.band_fill_alpha = 0.1

p4.circle(x = dates, y = cpi, size=4, legend='month',color='darkgrey', alpha=0.3)
p4.line(x = dates, y = cpi_avg, legend='avg', color='navy', line_width=3)
p4.legend.location = "top_left"
tab3 = Panel(child=p4, title="CPI")

# All but not avg 
p1 = figure(x_axis_type="datetime", title="Prices")
p1.grid.grid_line_alpha=0.3
p1.xaxis.axis_label = 'Date'
p1.yaxis.axis_label = 'Price'

p1.line(df['Year-Month'], df['Gold Price'], line_color="indigo", legend='Gold Price')
p1.circle(df['Year-Month'], df['Gold Price'], fill_color=None)
p1.line(df['Year-Month'], df['Oil Price'], line_color="gold", line_width=2, legend='Oil Price')
p1.line(df['Year-Month'], df['CPI'], line_color="coral", line_width=2, legend='CPI')
p1.legend.location = "top_left"
tab4 = Panel(child=p1, title="All (Non-avg)")

tabs = Tabs(tabs=[tab1, tab2, tab3, tab4])
output_file("bokeh_1.html", title="Gold vs Oil vs CPI")
show(tabs)

