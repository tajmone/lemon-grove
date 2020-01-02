/*
** The author of this program disclaims copyright.
*/

%include {
#include <stdio.h>
#include <stdlib.h> /* malloc, free */
#include "calc.h"
}

%token_type {int}

%left PLUS MINUS.
%left DIVIDE TIMES.

%syntax_error {
    printf ("Syntax error!\n");
}

program ::= expr(A). {
    printf ("Result=%d\n", A);
}

expr(A) ::= expr(B) MINUS expr(C). {
    A = B - C;
}

expr(A) ::= expr(B) PLUS expr(C). {
    A = B + C;
}

expr(A) ::= expr(B) TIMES expr(C). {
    A = B * C;
}

expr(A) ::= expr(B) DIVIDE expr(C). {
    if (C != 0) {
        A = B / C;
    } else {
        printf ("A divide by zero detected\n");
    }
}

expr(A) ::= INTEGER(B). {
    A = B;
}

/* Local Variables: */
/* c-basic-offset: 4 */
/* tab-width: 4 */
/* indent-tabs-mode: t */
/* mode: lemon */
/* End: */
