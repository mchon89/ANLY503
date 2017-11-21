library(networkD3)
library(dplyr)


links = '[
  {
  "Source": "Aemon",
  "Target": "Grenn",
  "Weight": 5
  },
  {
  "Source": "Aemon",
  "Target": "Samwell",
  "Weight": 31
  },
  {
  "Source": "Aerys",
  "Target": "Jaime",
  "Weight": 18
  },
  {
  "Source": "Aerys",
  "Target": "Robert",
  "Weight": 6
  },
  {
  "Source": "Aerys",
  "Target": "Tyrion",
  "Weight": 5
  },
  {
  "Source": "Aerys",
  "Target": "Tywin",
  "Weight": 8
  },
  {
  "Source": "Alliser",
  "Target": "Mance",
  "Weight": 5
  },
  {
  "Source": "Amory",
  "Target": "Oberyn",
  "Weight": 5
  },
  {
  "Source": "Arya",
  "Target": "Anguy",
  "Weight": 11
  },
  {
  "Source": "Arya",
  "Target": "Beric",
  "Weight": 23
  },
  {
  "Source": "Arya",
  "Target": "Bran",
  "Weight": 9
  },
  {
  "Source": "Arya",
  "Target": "Brynden",
  "Weight": 6
  },
  {
  "Source": "Arya",
  "Target": "Cersei",
  "Weight": 5
  },
  {
  "Source": "Arya",
  "Target": "Gendry",
  "Weight": 43
  },
  {
  "Source": "Arya",
  "Target": "Gregor",
  "Weight": 7
  },
  {
  "Source": "Arya",
  "Target": "Jaime",
  "Weight": 11
  },
  {
  "Source": "Arya",
  "Target": "Joffrey",
  "Weight": 6
  },
  {
  "Source": "Arya",
  "Target": "Jon",
  "Weight": 7
  },
  {
  "Source": "Arya",
  "Target": "Rickon",
  "Weight": 8
  },
  {
  "Source": "Arya",
  "Target": "Robert",
  "Weight": 4
  },
  {
  "Source": "Arya",
  "Target": "Roose",
  "Weight": 5
  },
  {
  "Source": "Arya",
  "Target": "Sandor",
  "Weight": 46
  },
  {
  "Source": "Arya",
  "Target": "Thoros",
  "Weight": 18
  },
  {
  "Source": "Arya",
  "Target": "Tyrion",
  "Weight": 5
  },
  {
  "Source": "Balon",
  "Target": "Loras",
  "Weight": 4
  },
  {
  "Source": "Belwas",
  "Target": "Barristan",
  "Weight": 18
  },
  {
  "Source": "Belwas",
  "Target": "Illyrio",
  "Weight": 10
  },
  {
  "Source": "Beric",
  "Target": "Anguy",
  "Weight": 4
  },
  {
  "Source": "Beric",
  "Target": "Gendry",
  "Weight": 4
  },
  {
  "Source": "Beric",
  "Target": "Thoros",
  "Weight": 21
  },
  {
  "Source": "Bran",
  "Target": "Hodor",
  "Weight": 96
  },
  {
  "Source": "Bran",
  "Target": "Jojen",
  "Weight": 46
  },
  {
  "Source": "Bran",
  "Target": "Jon",
  "Weight": 12
  },
  {
  "Source": "Bran",
  "Target": "Luwin",
  "Weight": 4
  },
  {
  "Source": "Bran",
  "Target": "Meera",
  "Weight": 54
  },
  {
  "Source": "Bran",
  "Target": "Nan",
  "Weight": 14
  },
  {
  "Source": "Bran",
  "Target": "Rickon",
  "Weight": 35
  },
  {
  "Source": "Bran",
  "Target": "Samwell",
  "Weight": 11
  },
  {
  "Source": "Bran",
  "Target": "Theon",
  "Weight": 11
  },
  {
  "Source": "Brienne",
  "Target": "Loras",
  "Weight": 7
  },
  {
  "Source": "Bronn",
  "Target": "Gregor",
  "Weight": 5
  },
  {
  "Source": "Bronn",
  "Target": "Podrick",
  "Weight": 19
  },
  {
  "Source": "Brynden",
  "Target": "Lothar",
  "Weight": 4
  },
  {
  "Source": "Brynden",
  "Target": "Walder",
  "Weight": 5
  },
  {
  "Source": "Catelyn",
  "Target": "Bran",
  "Weight": 4
  },
  {
  "Source": "Catelyn",
  "Target": "Brienne",
  "Weight": 7
  },
  {
  "Source": "Catelyn",
  "Target": "Brynden",
  "Weight": 8
  },
  {
  "Source": "Catelyn",
  "Target": "Cersei",
  "Weight": 4
  },
  {
  "Source": "Catelyn",
  "Target": "Edmure",
  "Weight": 16
  },
  {
  "Source": "Catelyn",
  "Target": "Hoster",
  "Weight": 9
  },
  {
  "Source": "Catelyn",
  "Target": "Jaime",
  "Weight": 19
  },
  {
  "Source": "Catelyn",
  "Target": "Jeyne",
  "Weight": 10
  },
  {
  "Source": "Catelyn",
  "Target": "Lysa",
  "Weight": 8
  },
  {
  "Source": "Catelyn",
  "Target": "Petyr",
  "Weight": 5
  },
  {
  "Source": "Catelyn",
  "Target": "Robb",
  "Weight": 43
  },
  {
  "Source": "Catelyn",
  "Target": "Roose",
  "Weight": 4
  },
  {
  "Source": "Catelyn",
  "Target": "Roslin",
  "Weight": 6
  },
  {
  "Source": "Catelyn",
  "Target": "Sansa",
  "Weight": 8
  },
  {
  "Source": "Catelyn",
  "Target": "Stannis",
  "Weight": 4
  },
  {
  "Source": "Catelyn",
  "Target": "Tyrion",
  "Weight": 5
  },
  {
  "Source": "Catelyn",
  "Target": "Walder",
  "Weight": 19
  },
  {
  "Source": "Cersei",
  "Target": "Brienne",
  "Weight": 5
  },
  {
  "Source": "Cersei",
  "Target": "Bronn",
  "Weight": 4
  },
  {
  "Source": "Cersei",
  "Target": "Elia",
  "Weight": 4
  },
  {
  "Source": "Cersei",
  "Target": "Gregor",
  "Weight": 6
  },
  {
  "Source": "Cersei",
  "Target": "Ilyn",
  "Weight": 7
  },
  {
  "Source": "Cersei",
  "Target": "Jaime",
  "Weight": 36
  },
  {
  "Source": "Cersei",
  "Target": "Joffrey",
  "Weight": 23
  },
  {
  "Source": "Cersei",
  "Target": "Meryn",
  "Weight": 10
  },
  {
  "Source": "Cersei",
  "Target": "Pycelle",
  "Weight": 4
  },
  {
  "Source": "Cersei",
  "Target": "Robert",
  "Weight": 16
  },
  {
  "Source": "Cersei",
  "Target": "Sandor",
  "Weight": 6
  },
  {
  "Source": "Cersei",
  "Target": "Shae",
  "Weight": 4
  },
  {
  "Source": "Cersei",
  "Target": "Tyrion",
  "Weight": 46
  },
  {
  "Source": "Cersei",
  "Target": "Varys",
  "Weight": 4
  },
  {
  "Source": "Craster",
  "Target": "Karl",
  "Weight": 6
  },
  {
  "Source": "Daario",
  "Target": "Drogo",
  "Weight": 4
  },
  {
  "Source": "Daario",
  "Target": "Irri",
  "Weight": 5
  },
  {
  "Source": "Daenerys",
  "Target": "Aegon",
  "Weight": 8
  },
  {
  "Source": "Daenerys",
  "Target": "Barristan",
  "Weight": 20
  },
  {
  "Source": "Daenerys",
  "Target": "Belwas",
  "Weight": 26
  },
  {
  "Source": "Daenerys",
  "Target": "Daario",
  "Weight": 14
  },
  {
  "Source": "Daenerys",
  "Target": "Drogo",
  "Weight": 18
  },
  {
  "Source": "Daenerys",
  "Target": "Irri",
  "Weight": 17
  },
  {
  "Source": "Daenerys",
  "Target": "Jorah",
  "Weight": 47
  },
  {
  "Source": "Daenerys",
  "Target": "Kraznys",
  "Weight": 10
  },
  {
  "Source": "Daenerys",
  "Target": "Missandei",
  "Weight": 26
  },
  {
  "Source": "Daenerys",
  "Target": "Rakharo",
  "Weight": 7
  },
  {
  "Source": "Daenerys",
  "Target": "Rhaegar",
  "Weight": 12
  },
  {
  "Source": "Daenerys",
  "Target": "Robert",
  "Weight": 5
  },
  {
  "Source": "Daenerys",
  "Target": "Viserys",
  "Weight": 8
  },
  {
  "Source": "Daenerys",
  "Target": "Worm",
  "Weight": 14
  },
  {
  "Source": "Davos",
  "Target": "Cressen",
  "Weight": 4
  },
  {
  "Source": "Davos",
  "Target": "Salladhor",
  "Weight": 16
  },
  {
  "Source": "Eddard",
  "Target": "Arya",
  "Weight": 18
  },
  {
  "Source": "Eddard",
  "Target": "Beric",
  "Weight": 8
  },
  {
  "Source": "Eddard",
  "Target": "Bran",
  "Weight": 15
  },
  {
  "Source": "Eddard",
  "Target": "Catelyn",
  "Weight": 5
  },
  {
  "Source": "Eddard",
  "Target": "Cersei",
  "Weight": 6
  },
  {
  "Source": "Eddard",
  "Target": "Jaime",
  "Weight": 6
  },
  {
  "Source": "Eddard",
  "Target": "Jon",
  "Weight": 8
  },
  {
  "Source": "Eddard",
  "Target": "Rickon",
  "Weight": 8
  },
  {
  "Source": "Eddard",
  "Target": "Robb",
  "Weight": 13
  },
  {
  "Source": "Eddard",
  "Target": "Robert",
  "Weight": 10
  },
  {
  "Source": "Eddard",
  "Target": "Sandor",
  "Weight": 5
  },
  {
  "Source": "Eddard",
  "Target": "Sansa",
  "Weight": 6
  },
  {
  "Source": "Eddison",
  "Target": "Grenn",
  "Weight": 8
  },
  {
  "Source": "Edmure",
  "Target": "Brynden",
  "Weight": 7
  },
  {
  "Source": "Edmure",
  "Target": "Lothar",
  "Weight": 4
  },
  {
  "Source": "Edmure",
  "Target": "Roslin",
  "Weight": 16
  },
  {
  "Source": "Edmure",
  "Target": "Walder",
  "Weight": 9
  },
  {
  "Source": "Gendry",
  "Target": "Thoros",
  "Weight": 7
  },
  {
  "Source": "Gilly",
  "Target": "Craster",
  "Weight": 17
  },
  {
  "Source": "Gregor",
  "Target": "Elia",
  "Weight": 9
  },
  {
  "Source": "Gregor",
  "Target": "Ilyn",
  "Weight": 7
  },
  {
  "Source": "Gregor",
  "Target": "Meryn",
  "Weight": 7
  },
  {
  "Source": "Gregor",
  "Target": "Oberyn",
  "Weight": 24
  },
  {
  "Source": "Gregor",
  "Target": "Sandor",
  "Weight": 12
  },
  {
  "Source": "Hodor",
  "Target": "Jojen",
  "Weight": 35
  },
  {
  "Source": "Hodor",
  "Target": "Meera",
  "Weight": 41
  },
  {
  "Source": "Hoster",
  "Target": "Edmure",
  "Weight": 9
  },
  {
  "Source": "Irri",
  "Target": "Drogo",
  "Weight": 7
  },
  {
  "Source": "Jaime",
  "Target": "Balon",
  "Weight": 6
  },
  {
  "Source": "Jaime",
  "Target": "Barristan",
  "Weight": 4
  },
  {
  "Source": "Jaime",
  "Target": "Brienne",
  "Weight": 88
  },
  {
  "Source": "Jaime",
  "Target": "Edmure",
  "Weight": 5
  },
  {
  "Source": "Jaime",
  "Target": "Elia",
  "Weight": 4
  },
  {
  "Source": "Jaime",
  "Target": "Gregor",
  "Weight": 6
  },
  {
  "Source": "Jaime",
  "Target": "Joffrey",
  "Weight": 15
  },
  {
  "Source": "Jaime",
  "Target": "Loras",
  "Weight": 16
  },
  {
  "Source": "Jaime",
  "Target": "Meryn",
  "Weight": 11
  },
  {
  "Source": "Jaime",
  "Target": "Qyburn",
  "Weight": 11
  },
  {
  "Source": "Jaime",
  "Target": "Renly",
  "Weight": 7
  },
  {
  "Source": "Jaime",
  "Target": "Robert",
  "Weight": 17
  },
  {
  "Source": "Jaime",
  "Target": "Stannis",
  "Weight": 5
  },
  {
  "Source": "Jaime",
  "Target": "Tommen",
  "Weight": 8
  },
  {
  "Source": "Jaime",
  "Target": "Tyrion",
  "Weight": 31
  },
  {
  "Source": "Janos",
  "Target": "Alliser",
  "Weight": 9
  },
  {
  "Source": "Janos",
  "Target": "Bowen",
  "Weight": 5
  },
  {
  "Source": "Janos",
  "Target": "Mance",
  "Weight": 4
  },
  {
  "Source": "Joffrey",
  "Target": "Gregor",
  "Weight": 5
  },
  {
  "Source": "Joffrey",
  "Target": "Ilyn",
  "Weight": 4
  },
  {
  "Source": "Joffrey",
  "Target": "Kevan",
  "Weight": 8
  },
  {
  "Source": "Joffrey",
  "Target": "Loras",
  "Weight": 7
  },
  {
  "Source": "Joffrey",
  "Target": "Margaery",
  "Weight": 28
  },
  {
  "Source": "Joffrey",
  "Target": "Meryn",
  "Weight": 5
  },
  {
  "Source": "Joffrey",
  "Target": "Myrcella",
  "Weight": 5
  },
  {
  "Source": "Joffrey",
  "Target": "Oberyn",
  "Weight": 4
  },
  {
  "Source": "Joffrey",
  "Target": "Sandor",
  "Weight": 14
  },
  {
  "Source": "Joffrey",
  "Target": "Stannis",
  "Weight": 10
  },
  {
  "Source": "Joffrey",
  "Target": "Tommen",
  "Weight": 9
  },
  {
  "Source": "Joffrey",
  "Target": "Tyrion",
  "Weight": 54
  },
  {
  "Source": "Jojen",
  "Target": "Meera",
  "Weight": 33
  },
  {
  "Source": "Jojen",
  "Target": "Samwell",
  "Weight": 11
  },
  {
  "Source": "Jon",
  "Target": "Aemon",
  "Weight": 30
  },
  {
  "Source": "Jon",
  "Target": "Alliser",
  "Weight": 15
  },
  {
  "Source": "Jon",
  "Target": "Craster",
  "Weight": 7
  },
  {
  "Source": "Jon",
  "Target": "Dalla",
  "Weight": 6
  },
  {
  "Source": "Jon",
  "Target": "Eddison",
  "Weight": 4
  },
  {
  "Source": "Jon",
  "Target": "Gilly",
  "Weight": 9
  },
  {
  "Source": "Jon",
  "Target": "Grenn",
  "Weight": 25
  },
  {
  "Source": "Jon",
  "Target": "Janos",
  "Weight": 8
  },
  {
  "Source": "Jon",
  "Target": "Mance",
  "Weight": 69
  },
  {
  "Source": "Jon",
  "Target": "Meera",
  "Weight": 4
  },
  {
  "Source": "Jon",
  "Target": "Melisandre",
  "Weight": 7
  },
  {
  "Source": "Jon",
  "Target": "Orell",
  "Weight": 6
  },
  {
  "Source": "Jon",
  "Target": "Qhorin",
  "Weight": 31
  },
  {
  "Source": "Jon",
  "Target": "Rattleshirt",
  "Weight": 20
  },
  {
  "Source": "Jon",
  "Target": "Robert",
  "Weight": 5
  },
  {
  "Source": "Jon",
  "Target": "Samwell",
  "Weight": 52
  },
  {
  "Source": "Jon",
  "Target": "Stannis",
  "Weight": 9
  },
  {
  "Source": "Jon",
  "Target": "Styr",
  "Weight": 16
  },
  {
  "Source": "Jon",
  "Target": "Theon",
  "Weight": 8
  },
  {
  "Source": "Jon",
  "Target": "Val",
  "Weight": 12
  },
  {
  "Source": "Jon",
  "Target": "Ygritte",
  "Weight": 54
  },
  {
  "Source": "Jon Arryn",
  "Target": "Lysa",
  "Weight": 5
  },
  {
  "Source": "Jon Arryn",
  "Target": "Robert",
  "Weight": 6
  },
  {
  "Source": "Jorah",
  "Target": "Barristan",
  "Weight": 11
  },
  {
  "Source": "Jorah",
  "Target": "Belwas",
  "Weight": 13
  },
  {
  "Source": "Jorah",
  "Target": "Daario",
  "Weight": 7
  },
  {
  "Source": "Jorah",
  "Target": "Drogo",
  "Weight": 6
  },
  {
  "Source": "Kevan",
  "Target": "Lancel",
  "Weight": 7
  },
  {
  "Source": "Kevan",
  "Target": "Varys",
  "Weight": 5
  },
  {
  "Source": "Loras",
  "Target": "Margaery",
  "Weight": 9
  },
  {
  "Source": "Loras",
  "Target": "Olenna",
  "Weight": 5
  },
  {
  "Source": "Lothar",
  "Target": "Roslin",
  "Weight": 4
  },
  {
  "Source": "Luwin",
  "Target": "Nan",
  "Weight": 4
  },
  {
  "Source": "Lysa",
  "Target": "Cersei",
  "Weight": 4
  },
  {
  "Source": "Lysa",
  "Target": "Hoster",
  "Weight": 6
  },
  {
  "Source": "Lysa",
  "Target": "Marillion",
  "Weight": 10
  },
  {
  "Source": "Lysa",
  "Target": "Petyr",
  "Weight": 29
  },
  {
  "Source": "Lysa",
  "Target": "Robert Arryn",
  "Weight": 9
  },
  {
  "Source": "Lysa",
  "Target": "Tyrion",
  "Weight": 5
  },
  {
  "Source": "Lysa",
  "Target": "Tywin",
  "Weight": 4
  },
  {
  "Source": "Mance",
  "Target": "Craster",
  "Weight": 11
  },
  {
  "Source": "Mance",
  "Target": "Dalla",
  "Weight": 8
  },
  {
  "Source": "Mance",
  "Target": "Gilly",
  "Weight": 7
  },
  {
  "Source": "Mance",
  "Target": "Qhorin",
  "Weight": 10
  },
  {
  "Source": "Mance",
  "Target": "Rattleshirt",
  "Weight": 9
  },
  {
  "Source": "Mance",
  "Target": "Styr",
  "Weight": 7
  },
  {
  "Source": "Mance",
  "Target": "Val",
  "Weight": 8
  },
  {
  "Source": "Mance",
  "Target": "Ygritte",
  "Weight": 12
  },
  {
  "Source": "Meera",
  "Target": "Samwell",
  "Weight": 7
  },
  {
  "Source": "Melisandre",
  "Target": "Davos",
  "Weight": 30
  },
  {
  "Source": "Melisandre",
  "Target": "Samwell",
  "Weight": 5
  },
  {
  "Source": "Meryn",
  "Target": "Ilyn",
  "Weight": 5
  },
  {
  "Source": "Missandei",
  "Target": "Irri",
  "Weight": 4
  },
  {
  "Source": "Myrcella",
  "Target": "Tommen",
  "Weight": 5
  },
  {
  "Source": "Myrcella",
  "Target": "Tyrion",
  "Weight": 4
  },
  {
  "Source": "Oberyn",
  "Target": "Ellaria",
  "Weight": 6
  },
  {
  "Source": "Oberyn",
  "Target": "Mace",
  "Weight": 6
  },
  {
  "Source": "Podrick",
  "Target": "Margaery",
  "Weight": 4
  },
  {
  "Source": "Rattleshirt",
  "Target": "Qhorin",
  "Weight": 6
  },
  {
  "Source": "Renly",
  "Target": "Loras",
  "Weight": 8
  },
  {
  "Source": "Renly",
  "Target": "Margaery",
  "Weight": 7
  },
  {
  "Source": "Renly",
  "Target": "Varys",
  "Weight": 4
  },
  {
  "Source": "Rhaegar",
  "Target": "Barristan",
  "Weight": 5
  },
  {
  "Source": "Rhaegar",
  "Target": "Elia",
  "Weight": 7
  },
  {
  "Source": "Rhaegar",
  "Target": "Jorah",
  "Weight": 5
  },
  {
  "Source": "Rhaegar",
  "Target": "Robert",
  "Weight": 6
  },
  {
  "Source": "Rickard",
  "Target": "Brynden",
  "Weight": 4
  },
  {
  "Source": "Rickon",
  "Target": "Theon",
  "Weight": 8
  },
  {
  "Source": "Robb",
  "Target": "Arya",
  "Weight": 15
  },
  {
  "Source": "Robb",
  "Target": "Balon",
  "Weight": 6
  },
  {
  "Source": "Robb",
  "Target": "Bran",
  "Weight": 23
  },
  {
  "Source": "Robb",
  "Target": "Brienne",
  "Weight": 6
  },
  {
  "Source": "Robb",
  "Target": "Brynden",
  "Weight": 17
  },
  {
  "Source": "Robb",
  "Target": "Edmure",
  "Weight": 32
  },
  {
  "Source": "Robb",
  "Target": "Hodor",
  "Weight": 5
  },
  {
  "Source": "Robb",
  "Target": "Jaime",
  "Weight": 15
  },
  {
  "Source": "Robb",
  "Target": "Jeyne",
  "Weight": 18
  },
  {
  "Source": "Robb",
  "Target": "Joffrey",
  "Weight": 10
  },
  {
  "Source": "Robb",
  "Target": "Jon",
  "Weight": 14
  },
  {
  "Source": "Robb",
  "Target": "Lothar",
  "Weight": 10
  },
  {
  "Source": "Robb",
  "Target": "Petyr",
  "Weight": 5
  },
  {
  "Source": "Robb",
  "Target": "Ramsay",
  "Weight": 4
  },
  {
  "Source": "Robb",
  "Target": "Rickard",
  "Weight": 7
  },
  {
  "Source": "Robb",
  "Target": "Rickon",
  "Weight": 15
  },
  {
  "Source": "Robb",
  "Target": "Roose",
  "Weight": 4
  },
  {
  "Source": "Robb",
  "Target": "Sansa",
  "Weight": 15
  },
  {
  "Source": "Robb",
  "Target": "Stannis",
  "Weight": 4
  },
  {
  "Source": "Robb",
  "Target": "Theon",
  "Weight": 11
  },
  {
  "Source": "Robb",
  "Target": "Tyrion",
  "Weight": 12
  },
  {
  "Source": "Robb",
  "Target": "Tywin",
  "Weight": 12
  },
  {
  "Source": "Robb",
  "Target": "Walder",
  "Weight": 26
  },
  {
  "Source": "Robert",
  "Target": "Aemon",
  "Weight": 4
  },
  {
  "Source": "Robert",
  "Target": "Barristan",
  "Weight": 5
  },
  {
  "Source": "Robert",
  "Target": "Renly",
  "Weight": 4
  },
  {
  "Source": "Robert",
  "Target": "Stannis",
  "Weight": 5
  },
  {
  "Source": "Robert",
  "Target": "Thoros",
  "Weight": 4
  },
  {
  "Source": "Robert Arryn",
  "Target": "Marillion",
  "Weight": 4
  },
  {
  "Source": "Roose",
  "Target": "Brienne",
  "Weight": 4
  },
  {
  "Source": "Samwell",
  "Target": "Bowen",
  "Weight": 6
  },
  {
  "Source": "Samwell",
  "Target": "Craster",
  "Weight": 34
  },
  {
  "Source": "Samwell",
  "Target": "Eddison",
  "Weight": 12
  },
  {
  "Source": "Samwell",
  "Target": "Gilly",
  "Weight": 36
  },
  {
  "Source": "Samwell",
  "Target": "Grenn",
  "Weight": 43
  },
  {
  "Source": "Samwell",
  "Target": "Janos",
  "Weight": 6
  },
  {
  "Source": "Samwell",
  "Target": "Mance",
  "Weight": 10
  },
  {
  "Source": "Samwell",
  "Target": "Qhorin",
  "Weight": 5
  },
  {
  "Source": "Sandor",
  "Target": "Beric",
  "Weight": 15
  },
  {
  "Source": "Sandor",
  "Target": "Gendry",
  "Weight": 5
  },
  {
  "Source": "Sandor",
  "Target": "Ilyn",
  "Weight": 4
  },
  {
  "Source": "Sandor",
  "Target": "Meryn",
  "Weight": 4
  },
  {
  "Source": "Sandor",
  "Target": "Robert",
  "Weight": 6
  },
  {
  "Source": "Sandor",
  "Target": "Thoros",
  "Weight": 10
  },
  {
  "Source": "Sansa",
  "Target": "Arya",
  "Weight": 22
  },
  {
  "Source": "Sansa",
  "Target": "Bran",
  "Weight": 10
  },
  {
  "Source": "Sansa",
  "Target": "Brienne",
  "Weight": 5
  },
  {
  "Source": "Sansa",
  "Target": "Cersei",
  "Weight": 16
  },
  {
  "Source": "Sansa",
  "Target": "Jaime",
  "Weight": 10
  },
  {
  "Source": "Sansa",
  "Target": "Joffrey",
  "Weight": 35
  },
  {
  "Source": "Sansa",
  "Target": "Jon",
  "Weight": 4
  },
  {
  "Source": "Sansa",
  "Target": "Kevan",
  "Weight": 5
  },
  {
  "Source": "Sansa",
  "Target": "Loras",
  "Weight": 14
  },
  {
  "Source": "Sansa",
  "Target": "Lysa",
  "Weight": 28
  },
  {
  "Source": "Sansa",
  "Target": "Margaery",
  "Weight": 36
  },
  {
  "Source": "Sansa",
  "Target": "Marillion",
  "Weight": 9
  },
  {
  "Source": "Sansa",
  "Target": "Myrcella",
  "Weight": 4
  },
  {
  "Source": "Sansa",
  "Target": "Olenna",
  "Weight": 7
  },
  {
  "Source": "Sansa",
  "Target": "Petyr",
  "Weight": 28
  },
  {
  "Source": "Sansa",
  "Target": "Podrick",
  "Weight": 8
  },
  {
  "Source": "Sansa",
  "Target": "Renly",
  "Weight": 4
  },
  {
  "Source": "Sansa",
  "Target": "Rickon",
  "Weight": 7
  },
  {
  "Source": "Sansa",
  "Target": "Robert",
  "Weight": 5
  },
  {
  "Source": "Sansa",
  "Target": "Robert Arryn",
  "Weight": 6
  },
  {
  "Source": "Sansa",
  "Target": "Sandor",
  "Weight": 6
  },
  {
  "Source": "Sansa",
  "Target": "Shae",
  "Weight": 8
  },
  {
  "Source": "Sansa",
  "Target": "Tyrion",
  "Weight": 77
  },
  {
  "Source": "Shae",
  "Target": "Chataya",
  "Weight": 4
  },
  {
  "Source": "Shae",
  "Target": "Varys",
  "Weight": 8
  },
  {
  "Source": "Shireen",
  "Target": "Davos",
  "Weight": 5
  },
  {
  "Source": "Stannis",
  "Target": "Aemon",
  "Weight": 4
  },
  {
  "Source": "Stannis",
  "Target": "Balon",
  "Weight": 4
  },
  {
  "Source": "Stannis",
  "Target": "Davos",
  "Weight": 32
  },
  {
  "Source": "Stannis",
  "Target": "Melisandre",
  "Weight": 20
  },
  {
  "Source": "Stannis",
  "Target": "Renly",
  "Weight": 15
  },
  {
  "Source": "Stannis",
  "Target": "Samwell",
  "Weight": 13
  },
  {
  "Source": "Tommen",
  "Target": "Margaery",
  "Weight": 5
  },
  {
  "Source": "Tyrion",
  "Target": "Balon",
  "Weight": 4
  },
  {
  "Source": "Tyrion",
  "Target": "Bronn",
  "Weight": 31
  },
  {
  "Source": "Tyrion",
  "Target": "Chataya",
  "Weight": 5
  },
  {
  "Source": "Tyrion",
  "Target": "Doran",
  "Weight": 5
  },
  {
  "Source": "Tyrion",
  "Target": "Elia",
  "Weight": 5
  },
  {
  "Source": "Tyrion",
  "Target": "Ellaria",
  "Weight": 4
  },
  {
  "Source": "Tyrion",
  "Target": "Gregor",
  "Weight": 22
  },
  {
  "Source": "Tyrion",
  "Target": "Ilyn",
  "Weight": 5
  },
  {
  "Source": "Tyrion",
  "Target": "Janos",
  "Weight": 5
  },
  {
  "Source": "Tyrion",
  "Target": "Kevan",
  "Weight": 11
  },
  {
  "Source": "Tyrion",
  "Target": "Loras",
  "Weight": 6
  },
  {
  "Source": "Tyrion",
  "Target": "Mace",
  "Weight": 9
  },
  {
  "Source": "Tyrion",
  "Target": "Margaery",
  "Weight": 7
  },
  {
  "Source": "Tyrion",
  "Target": "Meryn",
  "Weight": 5
  },
  {
  "Source": "Tyrion",
  "Target": "Oberyn",
  "Weight": 25
  },
  {
  "Source": "Tyrion",
  "Target": "Petyr",
  "Weight": 12
  },
  {
  "Source": "Tyrion",
  "Target": "Podrick",
  "Weight": 28
  },
  {
  "Source": "Tyrion",
  "Target": "Pycelle",
  "Weight": 11
  },
  {
  "Source": "Tyrion",
  "Target": "Renly",
  "Weight": 6
  },
  {
  "Source": "Tyrion",
  "Target": "Robert",
  "Weight": 9
  },
  {
  "Source": "Tyrion",
  "Target": "Sandor",
  "Weight": 4
  },
  {
  "Source": "Tyrion",
  "Target": "Shae",
  "Weight": 21
  },
  {
  "Source": "Tyrion",
  "Target": "Stannis",
  "Weight": 6
  },
  {
  "Source": "Tyrion",
  "Target": "Varys",
  "Weight": 18
  },
  {
  "Source": "Tywin",
  "Target": "Balon",
  "Weight": 5
  },
  {
  "Source": "Tywin",
  "Target": "Brynden",
  "Weight": 4
  },
  {
  "Source": "Tywin",
  "Target": "Cersei",
  "Weight": 16
  },
  {
  "Source": "Tywin",
  "Target": "Gregor",
  "Weight": 7
  },
  {
  "Source": "Tywin",
  "Target": "Jaime",
  "Weight": 13
  },
  {
  "Source": "Tywin",
  "Target": "Joffrey",
  "Weight": 13
  },
  {
  "Source": "Tywin",
  "Target": "Kevan",
  "Weight": 14
  },
  {
  "Source": "Tywin",
  "Target": "Mace",
  "Weight": 5
  },
  {
  "Source": "Tywin",
  "Target": "Oberyn",
  "Weight": 6
  },
  {
  "Source": "Tywin",
  "Target": "Petyr",
  "Weight": 4
  },
  {
  "Source": "Tywin",
  "Target": "Podrick",
  "Weight": 5
  },
  {
  "Source": "Tywin",
  "Target": "Pycelle",
  "Weight": 5
  },
  {
  "Source": "Tywin",
  "Target": "Robert",
  "Weight": 11
  },
  {
  "Source": "Tywin",
  "Target": "Stannis",
  "Weight": 15
  },
  {
  "Source": "Tywin",
  "Target": "Tommen",
  "Weight": 4
  },
  {
  "Source": "Tywin",
  "Target": "Tyrion",
  "Weight": 39
  },
  {
  "Source": "Tywin",
  "Target": "Val",
  "Weight": 4
  },
  {
  "Source": "Tywin",
  "Target": "Varys",
  "Weight": 6
  },
  {
  "Source": "Tywin",
  "Target": "Walder",
  "Weight": 4
  },
  {
  "Source": "Val",
  "Target": "Dalla",
  "Weight": 7
  },
  {
  "Source": "Varys",
  "Target": "Pycelle",
  "Weight": 4
  },
  {
  "Source": "Viserys",
  "Target": "Rhaegar",
  "Weight": 7
  },
  {
  "Source": "Viserys",
  "Target": "Tyrion",
  "Weight": 4
  },
  {
  "Source": "Walder",
  "Target": "Lothar",
  "Weight": 12
  },
  {
  "Source": "Walder",
  "Target": "Petyr",
  "Weight": 6
  },
  {
  "Source": "Walder",
  "Target": "Roslin",
  "Weight": 6
  },
  {
  "Source": "Walton",
  "Target": "Jaime",
  "Weight": 10
  },
  {
  "Source": "Ygritte",
  "Target": "Qhorin",
  "Weight": 7
  },
  {
  "Source": "Ygritte",
  "Target": "Rattleshirt",
  "Weight": 9
  }]'


link_df = jsonlite::fromJSON(links)

node_df = data.frame(node = unique(c(link_df$Source, link_df$Target))) %>% 
  mutate(idx = row_number()-1)

link_df = link_df %>% 
  left_join(node_df %>% rename(source_idx = idx), by=c('Source' = 'node')) %>% 
  left_join(node_df %>% rename(target_idx = idx), by=c('Target' = 'node'))

D3_network_LM <- networkD3::forceNetwork(Links = link_df, Nodes = node_df, 
             Source = 'source_idx', Target = 'target_idx',
             NodeID = 'node', Group = 'node',
             opacityNoHover = TRUE,
             zoom = TRUE,
             fontSize = 15,
             opacity = 0.7)

D3_network_LM

saveNetwork(D3_network_LM, "network_1.html", selfcontained = TRUE)

