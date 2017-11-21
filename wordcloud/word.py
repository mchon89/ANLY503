#!/usr/bin/env python
# -*- coding: utf-8 -*-


from os import path 
from PIL import Image
import numpy as np
import matplotlib.pyplot as plt

from wordcloud import WordCloud, STOPWORDS


d = path.dirname(__file__)

jane = ['Austen_Emma.txt', 'Austen_Pride.txt', 'Austen_Sense.txt']

emma = open('Austen_Emma.txt', 'r')
text = emma.read()

for i in range(1,3):
	temp = open(jane[i], 'r')
	text = text + temp.read()

jane_mask = np.array(Image.open(path.join(d, "jane_mask1.jpg")))

stopwords = set(STOPWORDS)
stopwords.add("said")

wc = WordCloud(background_color="white", max_words=2000, mask=jane_mask, stopwords=stopwords)
# generate word cloud
word = wc.generate(text)

# store to file
word.to_file(path.join(d, "alice.png"))

# show
fig = plt.figure(figsize=(8,6))
plt.imshow(wc, interpolation='bilinear')
plt.axis("off")
plt.figure()
plt.imshow(jane_mask, cmap=plt.cm.gray, interpolation='bilinear')
plt.axis("off")
plt.show()
fig.savefig('jane.png')