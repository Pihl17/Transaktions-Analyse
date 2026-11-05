# Transaktions-Analyse

Baseret på opgave fra Specialisterne.

Python scriptet `GenInputData.py` generer en liste af fiktive banke og fiktive transaktioner som så bliver analyseret af et cobol program.

# Getting Started

## Påkræver

- GnuCobol - [Windows installer kan hentes her](https://superbol.eu/developers/windows/)

- Python 3.14 eller højer

## Generaring af input data

Åben comand prompt terminalen og naviger til mappen. \
Inde i mappen, kør python scripted:
```
python GenInputData.py
```

## Byg og kør programmet

Programmet kan bygges gennem comand promt terminalen.
Naviger til mappen og kør følgende komando:
```
cobbuild.bat -x Generer-kontoudskrift.cob -o Build.exe -lcob
```
Derefter kan programmet køres gennem terminalen ved at kalde:
```
Build.exe
```

Programmet kan også bygges og køres gennem `Run Build Task` kommandoen inde i Visual Studio Code (genvejs-tasten er `Ctrl + Shift + B`).
