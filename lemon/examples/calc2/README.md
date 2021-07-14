# Calculator 2

A slightly more complex calculator version than the one provided in our [previous example](../calc/).

Contributed by [Serghei Iakovlev], public domain.

-----

**Table of Contents**

<!-- MarkdownTOC autolink="true" bracket="round" autoanchor="false" lowercase="only_ascii" uri_encoding="true" levels="1,2,3,4" -->

- [Project Files](#project-files)
- [About](#about)
- [Building Instructions](#building-instructions)

<!-- /MarkdownTOC -->

-----

# Project Files

- [`calc2.y`][calc2.y] — Lemon template for the calculator.
- [`main.c`][main.c] — custom `main()` code, appended to generated `calc.c` source by Make.
- [`token.h`][token.h] — defines token type as a structure.

# About

This version of our calculator is more interesting example.
The main difference is the definition of the token type as a structure.
This token type is defined in `token.h`, using the following 4 lines:

``` c
typedef struct Token {
    const char *op;
    int value;
    unsigned n;
} Token;
```

Defining a structure for the token type is the most common practice to provide flexibility in semantic action, or the piece of code on the right of the production rule.
Here is an example:

``` c
expr(A) ::= expr(B) MINUS expr(C). {
    A.value = B.value - C.value;
    A.n = B.n+1 + C.n+1;
}
```

The `%token_type` is defined in `calc2.y`:

``` c
%token_type {Token}
```

This structure supports both a value and a count.
You could add many more values, if you wanted to.

# Building Instructions

To compile the program, type the following in the terminal:

```sh
$ make
```

> **MAKE NOTE** — Requires GNU Make version 4.

<!-- sep -->

> **WINDOWS NOTE** — The above command must be typed in Bash, it won't work in CMD or PowerShell terminals (use the Bash that ships with Git for Windows).

<!-- sep -->

> **MINGW NOTE** — If you're using MinGW to compile, instead of `make` type:
>
> ```sh
> $ mingw32-make
> ```

If everything worked as expected, you'll find the following new files in this folder:

- `calc2.h` — Lemon-generated header file.
- `calc2.c` — Lemon-generated parser code.
- `calc2`/`calc2.exe` — the executable calculator example.
- `calc2.out` — Lemon-generated info on parser states, symbols and rules.

Then, to run the example issue the following command:

```sh
$ ./calc2
```

<!-----------------------------------------------------------------------------
                               REFERENCE LINKS
------------------------------------------------------------------------------>

[Serghei Iakovlev]: https://github.com/sergeyklay "View Serghei Iakovlev's GitHub profile"

<!-- project files -->

[main.c]: ./main.c "View source file"
[token.h]: ./token.h "View source file"
[calc2.y]: ./calc2.y "View source file"


<!-- EOF -->
