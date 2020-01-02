# Contributors' Guidelines

The goal of the Lemon Grove project is to provide a collection of Lemon forks, ports to other languages, examples and documentation — anything that Lemon newbies and veterans might wish to find in a single project.

The project is open to contributions and advice.
I'd rather keep an open ended structure and let the repository be shaped by community needs and contributions than to adapt a rigid model.

But here are some general guidelines for contributors.
Some project folders might contain specific guidelines on how their contents should be organized.

# Code Styles Conventions

In order to preserve code styles consistency across files of the same type, this repository adopts [EditorConfig] settings.
Most modern editors and IDEs support EditorConfig natively or via a plug-in, which means that your editor should automatically pick-up the settings from the [`.editorconfig`][.editorconfig] file in the project root, overriding any user specific settings in favour of the project requirements.

Every commit and pull request is validated on [Travis CI] against these [EditorConfig] settings, resulting in a build failure if any files don't comply to the code styles convention.

You can validate your files locally, before creating at pull request, by executing the [`validate.sh`][validate.sh] script, which is the same script used on [Travis CI]  (requires installing [EClint]).

Enforcing code styles consistency protects the project contents from mixed indentation styles and trailing white spaces, which can make commits diffs harder to read by adding numerous meaningless hunks due to whitespace differences.

# Licensing

All contributed assets _must_ contain an explicit license, or a license waiving in case of work released in the public domain.
Which also means that the author must be mentioned along with the license/unlicense terms.

Licenses do matter, and anyone who comes across assets from this project should readily understand what he/she might or might not do with them, and who to credit.

Besides adding a `LICENSE` file, adding to the source files header-comments about their author and the adopted license helps to preserve the usability of open source assets in the event that these files might start to circulate outside their original context, or get separated from their license file.

We've all experienced the frustrating situation of stumbling into great code that's hard to trace back its original author, and to determine its license terms.
A simple comment block can dispel such situations.

## A Note on Public Domain

Not all countries and jurisdictions recognize the public domain.
For this reason, it's always advisable to attach an explicit public domain license, like the [Unlicense] or [CC0], when intending to share your code and assets without restrictions.

For more details on the difficulties on making code public domain, see:

- https://creativecommons.org/share-your-work/public-domain/cc0/

By resorting to a public domain license, you are able to legally enforce the public domain status on your work, even in those countries which don't acknowledge public domain.

<!-----------------------------------------------------------------------------
                               REFERENCE LINKS
------------------------------------------------------------------------------>

[Unlicense]: https://unlicense.org/ "Visit Unlicense.org"

[CC0]: https://creativecommons.org/publicdomain/zero/1.0/deed.en "View CC0 1.0 Universal at Creative Commons website"

[EditorConfig]: https://editorconfig.org/ "Visit EditorConfig website"
[EClint]: https://www.npmjs.com/package/eclint "Visit EClint page at NPM"
[Travis CI]: https://travis-ci.com/ "Visit Travis CI website"
<!-- project files -->

[validate.sh]: ./validate.sh "View source script"
[.editorconfig]: ./.editorconfig "View EditorConfig settings file"

<!-- EOF -->
