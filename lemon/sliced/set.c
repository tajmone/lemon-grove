/*
** Set manipulation routines for the LEMON parser generator.
*/

static int size = 0;

/* Set the set size */
void SetSize(int n)
{
  size = n+1;
}

/* Allocate a new set */
char *SetNew(void){
  char *s;
  s = (char*)calloc( size, 1);
  if( s==0 ){
    memory_error();
  }
  return s;
}

/* Deallocate a set */
void SetFree(char *s)
{
  free(s);
}

/* Add a new element to the set.  Return TRUE if the element was added
** and FALSE if it was already there. */
int SetAdd(char *s, int e)
{
  int rv;
  assert( e>=0 && e<size );
  rv = s[e];
  s[e] = 1;
  return !rv;
}

/* Add every element of s2 to s1.  Return TRUE if s1 changes. */
int SetUnion(char *s1, char *s2)
{
  int i, progress;
  progress = 0;
  for(i=0; i<size; i++){
    if( s2[i]==0 ) continue;
    if( s1[i]==0 ){
      progress = 1;
      s1[i] = 1;
    }
  }
  return progress;
}
