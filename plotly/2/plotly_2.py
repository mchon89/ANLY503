#!/usr/bin/env python
# -*- coding: utf-8 -*-


import plotly.plotly as py
import pandas as pd
import os

from sklearn.feature_extraction.text import CountVectorizer 
import numpy as np
import pandas as pd
from sklearn.metrics.pairwise import euclidean_distances 
from sklearn.metrics.pairwise import cosine_similarity 
from sklearn.manifold import MDS
from mpl_toolkits.mplot3d import Axes3D
from scipy.cluster.hierarchy import ward, dendrogram


foldername = 'british-fiction-corpus'
filenames = os.listdir(foldername)
path = os.getcwd()
fullpath = path + '/' + foldername + '/'

file_list = []
for i in range(len(filenames)):
	file_list.append(fullpath + filenames[i])

vectorizer = CountVectorizer(input='filename')
dtm = vectorizer.fit_transform(file_list)
vocab = vectorizer.get_feature_names()

dtm = dtm.toarray()
dist = euclidean_distances(dtm)
cosdist = 1 - cosine_similarity(dtm)

mds = MDS(n_components=3, dissimilarity="precomputed", random_state=1)
pos = mds.fit_transform(cosdist)

x_coor = list(pos[:, 0])
y_coor = list(pos[:, 1])
z_coor = list(pos[:, 2])

scatter1 = dict(
    mode = 'markers',
    name = "ABronte",
    type = "scatter3d",
    text = filenames[0:2],
    x = x_coor[0:2], y = y_coor[0:2], z = z_coor[0:2],
    marker = dict( size=5, color='rgb(165,0,38)', opacity = 0.6 )
)

scatter2 = dict(
    mode = 'markers',
    name = "Austen",
    type = "scatter3d",
    text = filenames[2:5],
    x = x_coor[2:5], y = y_coor[2:5], z = z_coor[2:5],
    marker = dict( size=5, color='rgb(215,48,39)', opacity = 0.6 )
)

scatter3 = dict(
    mode = 'markers',
    name = "CBronte",
    type = "scatter3d",
    text = filenames[5:8],
    x = x_coor[5:8], y = y_coor[5:8], z = z_coor[5:8],
    marker = dict( size=5, color='rgb(244,109,67)', opacity = 0.6 )
)

scatter4 = dict(
    mode = 'markers',
    name = "Dickens",
    type = "scatter3d",
    text = filenames[8:11],
    x = x_coor[8:11], y = y_coor[8:11], z = z_coor[8:11],
    marker = dict( size=5, color='rgb(253,174,97)', opacity = 0.6 )
)

scatter5 = dict(
    mode = 'markers',
    name = "EBronte",
    type = "scatter3d",
    text = filenames[11],
    x = x_coor[11], y = y_coor[11], z = z_coor[11],
    marker = dict( size=5, color='rgb(0,255,0)', opacity = 0.6 )
)

scatter6 = dict(
    mode = 'markers',
    name = "Eliot",
    type = "scatter3d",
    text = filenames[12:15],
    x = x_coor[12:15], y = y_coor[12:15], z = z_coor[12:15],
    marker = dict( size=5, color='rgb(255,255,0)', opacity = 0.6 )
)

scatter7 = dict(
    mode = 'markers',
    name = "Fielding",
    type = "scatter3d",
    text = filenames[15:17],
    x = x_coor[15:17], y = y_coor[15:17], z = z_coor[15:17],
    marker = dict( size=5, color='rgb(95,0,135)', opacity = 0.6 )
)

scatter8 = dict(
    mode = 'markers',
    name = "Richardson",
    type = "scatter3d",
    text = filenames[17:19],
    x = x_coor[17:19], y = y_coor[17:19], z = z_coor[17:19],
    marker = dict( size=5, color='rgb(0,128,128)', opacity = 0.6 )
)

scatter9 = dict(
    mode = 'markers',
    name = "Sterne",
    type = "scatter3d",
    text = filenames[19:21],
    x = x_coor[19:21], y = y_coor[19:21], z = z_coor[19:21],
    marker = dict( size=5, color='rgb(0,95,0)', opacity = 0.6 )
)

scatter10 = dict(
    mode = 'markers',
    name = "Thackeray",
    type = "scatter3d",
    text = filenames[21:24],
    x = x_coor[21:24], y = y_coor[21:24], z = z_coor[21:24],
    marker = dict( size=5, color='rgb(0,0,0)', opacity = 0.6 )
)

scatter11 = dict(
    mode = 'markers',
    name = "Sterne",
    type = "scatter3d",
    text = filenames[24:27],
    x = x_coor[24:27], y = y_coor[24:27], z = z_coor[24:27],
    marker = dict( size=5, color='rgb(178,178,178)', opacity = 0.6 )
)

clusters = dict(
    alphahull = 7,
    name = "y",
    opacity = 0.1,
    type = "mesh3d",    
    x = x_coor, y = y_coor, z = z_coor
)

layout = dict(
    title = '3D Point Clustering in British-fiction-corpus',
    scene = dict(
        xaxis = dict( zeroline=False ),
        yaxis = dict( zeroline=False ),
        zaxis = dict( zeroline=False ),
    )
)

fig = dict( data=[scatter1, scatter2, scatter3, scatter4, scatter5, scatter6, scatter7, scatter8,
	scatter9, scatter10, scatter11, clusters], layout=layout )
py.plot(fig, filename='3D Point Clustering in British-fiction-corpus')