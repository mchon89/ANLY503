#!/usr/bin/env python
# -*- coding: utf-8 -*-


from os import path 
from PIL import Image
import numpy as np
import matplotlib.pyplot as plt

from wordcloud import WordCloud, STOPWORDS

# Current path
d = path.dirname(__file__)

# The list of the novels
jane = ['Austen_Emma.txt', 'Austen_Pride.txt', 'Austen_Sense.txt']

# Reading Emma first
emma = open('Austen_Emma.txt', 'r')
text = emma.read()

# Combining the rest
for i in range(1,3):
	temp = open(jane[i], 'r')
	text = text + temp.read()

# Reading the Jane_mask1.jpg into numpy array
jane_mask = np.array(Image.open(path.join(d, "jane_mask1.jpg")))

# Stopwords
stopwords = set(STOPWORDS)
stopwords.add("said")

# Generate word cloud based on the numpy array
wc = WordCloud(background_color="white", max_words=2000, mask=jane_mask, stopwords=stopwords)
word = wc.generate(text)

# Storing the file
word.to_file(path.join(d, "alice.png"))

# Showing
fig = plt.figure(figsize=(8,6))
plt.imshow(wc, interpolation='bilinear')
plt.axis("off")
plt.figure()
plt.imshow(jane_mask, cmap=plt.cm.gray, interpolation='bilinear')
plt.axis("off")
plt.show()
fig.savefig('jane.png')
