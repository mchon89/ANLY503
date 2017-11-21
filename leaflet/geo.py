#!/usr/bin/env python
# -*- coding: utf-8 -*-

import pandas as pd
from geopy.geocoders import Nominatim


data = pd.read_csv('pricepersqft.csv')
data['lat'] = ""
data['long'] = ""

geolocator = Nominatim()

for i in range(len(data['City'])):
	temp = data['City'][i]
	location = geolocator.geocode(temp)
	data['lat'][i] = location.latitude
	data['long'][i] = location.longitude


data.to_csv('pricepersqft1.csv')