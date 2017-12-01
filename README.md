Welcome to Puzzle-Prolog
========================

### Introduction
I couldn't find an implementation for this Puzzle, so I decided to implement it by my own and chose Prolog to have some fun. I'm not an expert in this language. For instance, I had to think the correct implementation for the `consecutive()` predicate for several hours.

Please feel free to let me know if you don't like anything in this code, so we can work together in improving it. Hope this helps somehow.

### Top-level directory layout

    .
    ├── build                   # Instructions to build this package
    ├── docs                    # Documentation files about how this Puzzle works
    ├── src                     # Source files 
    ├── LICENSE
    └── README.md

### How to run this program
You need to install SWI Prolog.
This Prolog program is using clpfd library (http://www.swi-prolog.org/man/clpfd.html).

Once it's installed, you need to start the Prolog interpreter and load the main.pro file.
After that, just type in the SWI Prolog console: 
```
?- puzzle_solver.
```

### License
Even though the license specified in this repository is MIT, it's actually WTFPL (http://www.wtfpl.net/)
If you want to copy any code you find here, you don't need to tell me about it :)

