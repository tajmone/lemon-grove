# Calculator 2

> Contributed by [Serghei Iakovlev], public domain.

A bit more complex calculator than in our [`previous example`](../calc/). To compile the program do the following:

```sh
$ make
```

Then, to run the example issue the following command:

```sh
./calc2
```


This version of our calculator is more interesting example. The main difference is definition the token type as a structure. This token type is defined in `token.h` file using the following 4 lines:

``` c
typedef struct Token {
    const char *op;
    int value;
    unsigned n;
} Token;
```

Defining a structure for the token type is the most common practice to provide flexibility in semantic action, or the piece of code on the right of the production rule. Here is an example:

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

This structure supports both a value and a count.  You could add many more values, if you wanted.


<!-----------------------------------------------------------------------------
                               REFERENCE LINKS
------------------------------------------------------------------------------>

[Serghei Iakovlev]: https://github.com/sergeyklay "View Serghei Iakovlev's GitHub profile"
