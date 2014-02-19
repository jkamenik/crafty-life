Introduction
============

Plays a preprogramed game of life.

Game of life
============

Conway's Game of Life is defined [here](http://en.wikipedia.org/wiki/Conway's_Game_of_Life).

The rules are:

1. Any live cell with fewer then two live neighbors dies
1. Any live cell with two or three live neighbors lives on
1. Any live cell with more then three live neighbors dies
1. Any dead cell with exactly three live neighbors lives

Each cell's new value is calculated entirely using the previous generation's state.  This is important because the cell's state is based entirely on neighbor cells.

Run
===

Use coffeescript to compile and watch the JS

    coffee -bcw .

Open the index.html in a browser.
