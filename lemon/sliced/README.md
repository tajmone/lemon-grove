# De-Amalgamated Lemon Sources

This folder contains the same Lemon version of the parent folder, but the "`lemon.c`" file has been split into separate modules, to simplify studying and editing its code.
The "`lempar.c`" file is left untouched (it's not an amalgamated source), and you can build Lemon by compiling "`lemon.c`", as usual.

The [de-amalgamated] source files in this folder were derived from:

- SQLite [`tool/lemon.c`][us lemon.c], check-in [2da0eea0]  (2019-06-03)
- SQLite [`tool/lempar.c`][us lempar.c], check-in [9e664585]  (2019-07-16)


-----

**Table of Contents**

<!-- MarkdownTOC autolink="true" bracket="round" autoanchor="false" lowercase="only_ascii" uri_encoding="true" levels="1,2,3" -->

- [Introduction](#introduction)
- [DIY Slicing](#diy-slicing)
- [External Links](#external-links)
- [Changelog](#changelog)

<!-- /MarkdownTOC -->

-----

# Introduction

The Lemon source file `lemon.c`, like most tools from the [SQLite] project, was created by merging multiple C sources into a single file via a technique called ["amalgamation"], in order to reduce the number of file dependencies and improve performance (5-10% speed gain).
Except that today only the single source file of Lemon survives in the SQLite project — and code maintainance and updates are done directly in the amalgamated single source file.

I wanted to include in the Lemon Grove project a version of the Lemon source split into modules, to simplify studying its code and working on derivative versions and ports.
Reversing the amalgamation is not a hard task in itself, for the amalgamator adds some comment lines indicating the name of the original file from which the code was taken:

```c
void Configlist_reset(void);

/********* From the file "error.h" ***************************************/
void ErrorMsg(const char *, int,const char *, ...);

/****** From the file "option.h" ******************************************/
enum option_type { OPT_FLAG=1,  OPT_INT,  OPT_DBL,  OPT_STR,
         OPT_FFLAG, OPT_FINT, OPT_FDBL, OPT_FSTR};
```

So, splitting the "`lemon.c`" file manually is neither a huge nor hard task.
But keeping the split sources always up to date with the latest upstream sources from the [SQLite repository]  (which are updated quite often) is another matter altogether, and definitely a daunting task.

Therefore, I've created __[Lemon Slicer]__, a small tool to automate the de-amalgamation process, so that whenever I update the Lemon sources in the parent folder I can update with a single click their de-amalgamated counterparts in this folder.

Besides automating the task of splitting "`lemon.c`" into its original modules, Lemon Slicer also injects at the end of the left-over contents of the "`lemon.c`" file all the required `#include` directives to ensure that the split contents are loaded back in the correct order, so that the Lemon parser remains buildable by compiling "`lemon.c`".

# DIY Slicing

If you need to de-amalgamated the Lemon sources in this project yourself, it can be easily done on Windows OS x64 with the following steps.

To download (or update) the __Lemon Slicer__ de-amalgamator tool, open the CMD in the parent folder and type:

```
curl -LJO https://github.com/tajmone/lemon-slicer/raw/master/lemon-slicer.exe
```

You'll then find in the parent `lemon/` folder the `lemon-slicer.exe` executable tool.
Just invoke it from the CMD (or double click on it) and in a few seconds it will update/recreate the de-amalgamated contents in `lemon/sliced/`.

If you're working on Linux, macOS or 32-bits Windows, you'll need to obtain a precompiled binary of Lemon Slicer matching your OS.
Lemon Slicer is a cross-platform tool, so visit its repository for more info on how to obtain or compile it:

- https://github.com/tajmone/lemon-slicer

Of course, you can use Lemon Slicer to de-amalgamate any version of Lemon outside this project, as long as you execute it in a folder containing the "`lemon.c`" and "`lempar.c`" files (and on the condition that "`lemon.c`" still contains the original comment lines created by the SQLite amalgamator).

# External Links

- [Lemon Slicer] — GitHub repository.
- [The SQLite Amalgamation] — for more info about amalgamation.

# Changelog

The following changelog lists which versions of the Lemon sources were used to create the de-amalgamated files found in this folder — where "upstream" refers to the [SQLite] project hosting the original Lemon sources.


- **2019-08-13**
    + `lemon.c` from upstream check-in [2da0eea0]  (2019-06-03)
    + `lempar.c` from upstream check-in [9e664585]  (2019-07-16)

<!-----------------------------------------------------------------------------
                               REFERENCE LINKS
------------------------------------------------------------------------------>

[de-amalgamated]: https://www.sqlite.org/amalgamation.html "Learn about amalgamation in the SQLite project"
["amalgamation"]: https://www.sqlite.org/amalgamation.html "Learn about amalgamation in the SQLite project"
[Lemon Slicer]: https://github.com/tajmone/lemon-slicer "Visit the Lemon Slicer repository on GitHub"

<!-- SQLite -->

[SQLite]: http://www.sqlite.org/ "Visit SQLite website"
[SQLite repository]: https://sqlite.org/src/doc/trunk/README.md "Visit the SQLite source repository"
[The SQLite Amalgamation]: https://www.sqlite.org/amalgamation.html "Learn about amalgamation in the SQLite project"

<!-- upstream sources & check-ins -->

[us lemon.c]: https://www.sqlite.org/src/file/tool/lemon.c "View upstream source file"
[2da0eea0]: https://www.sqlite.org/src/info/2da0eea02d128c37 "View upstream check-in"


[us lempar.c]: https://www.sqlite.org/src/file/tool/lempar.c "View upstream source file"
[9e664585]: https://www.sqlite.org/src/info/9e66458592d40fbd "View upstream check-in"

<!-- EOF -->