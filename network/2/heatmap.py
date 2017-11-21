#!/usr/bin/env python
# -*- coding: utf-8 -*-


import pandas as pd
import plotly.plotly as py
import plotly.graph_objs as go


df = pd.read_csv('stormofswords.csv')

data = [
    go.Heatmap(
        z=df['Weight'],
        x=df['Source'],
        y=df['Target'],
        colorscale='Viridis',
    )
]

layout = go.Layout(
    title='The Heatmap of A Storm of Swords',
    xaxis = dict(ticks='', nticks=36),
    yaxis = dict(ticks='' )
)

fig = go.Figure(data=data, layout=layout)
py.plot(fig, filename='the heatmap of a storm of swords')


