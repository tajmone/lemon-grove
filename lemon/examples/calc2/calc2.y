/*
** The author of this program disclaims copyright.
*/

%include {
#include <stdio.h>
#include <stdlib.h> /* malloc, free */
#include "token.h"
#include "calc2.h"
}

%token_type {Token}
%default_type {Token}

%type expr {Token}
%type NUM {Token}

%left PLUS MINUS.
%left DIVIDE TIMES.

%syntax_error {
    printf ("Parse error\n");
    exit(1);
}

%parse_accept {
    printf("Parsing complete\n\n");
}

program ::= expr(A). {
    printf ("Token.value: %d\nToken.n: %d\n",
            A.value, A.n);
}

expr(A) ::= expr(B) MINUS expr(C). {
    A.value = B.value - C.value;
    A.n = B.n+1 + C.n+1;
}

expr(A) ::= expr(B) PLUS expr(C). {
    A.value = B.value + C.value;
    A.n = B.n+1 + C.n+1;
}

expr(A) ::= expr(B) TIMES expr(C). {
    A.value = B.value * C.value;
    A.n = B.n+1 + C.n+1;
}

expr(A) ::= expr(B) DIVIDE expr(C). {
    if (C.value != 0) {
        A.value = B.value / C.value;
        A.n = B.n+1 + C.n+1;
    } else {
        printf ("A divide by zero detected\n");
    }
}

expr(A) ::= NUM(B). {
    A.value = B.value;
    A.n = B.n+1;
}

/* Local Variables: */
/* c-basic-offset: 4 */
/* tab-width: 4 */
/* indent-tabs-mode: t */
/* mode: lemon */
/* End: */
