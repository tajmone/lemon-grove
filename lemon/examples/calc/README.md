# Calculator

> Contributed by [Serghei Iakovlev], public domain.

This is a very simple calculator. To compile the program do the following:

```sh
$ make
```

Then, to run the example issue the following command:

```sh
./calc
```

Let's explain what is actually happening: Take a look at the file `main.c`, then, take a look at `calc.c`. The `main.c` file is appended to the raw form of `calc.c` in the `Makefile`. lemon does not create a complete program - only the necessary subroutines. So it is necessary to build in the main part of a program.

If you make your own changes to this example program, you should make the changes to `calc.y` or `main.c`. `calc.c` and `calc.h` are auto-generated files, and they will be over-written every time lemon is run.

Disecting `main.c`: These are the  essential functions that must be called. Note, this is a stripped down simple version with no error checking or tokenizer. The tokens are hardwired in so we can see exactly how lemon operates.

```c
void* pParser = ParseAlloc (malloc);
```

The next 4 lines parse the command  `15 DIVIDE 5`.

```c
Parse (pParser, INTEGER, 15);
Parse (pParser, DIVIDE, 0);
Parse (pParser, INTEGER, 5);
Parse (pParser, 0, 0);
```

`INTEGER` and `DIVIDE` are assigned values in the generated file `cacl.h` to be the following;
```c
#define PLUS    1
#define MINUS   2
#define DIVIDE  3
#define TIMES   4
#define INTEGER 5
```

Again, this is a generated file, so if any additions are made to this file, they'll be over-written when re-running lemon.


<!-----------------------------------------------------------------------------
                               REFERENCE LINKS
------------------------------------------------------------------------------>

[Serghei Iakovlev]: https://github.com/sergeyklay "View Serghei Iakovlev's GitHub profile"

