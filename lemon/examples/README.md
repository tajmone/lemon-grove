# Lemon Examples

In this directory tree you'll find some user-contributed examples on using Lemon. All examples herein rely on the Lemon version from the [parent folder].

## Calculator

- [`/calc/`](./calc)

A very simple calculator example, contributed by [Serghei Iakovlev], public domain.

- [`/calc2/`](./calc2)

A bit more complex calculator example, contributed by [Serghei Iakovlev], public domain.

# Contributing Guidelines

Feel free to contribute your own examples. Each example should be in its own folder, to keep the repository well structured.

All examples in this directory tree must compile against the Lemon version provided in the [parent folder]. To allow automation of the build & test process, each example folder should contain a `Makefile` with following targets:

- `all`
- `test`
- `clean`

For a practical example, see [`calc/Makefile`](./calc/Makefile).

Please, state clearly the license terms of your contributed examples (or the lack thereof), and provide at least a brief description of what the example does.

See also [`../../CONTRIBUTING.md`](../../CONTRIBUTING.md)


<!-----------------------------------------------------------------------------
                               REFERENCE LINKS
------------------------------------------------------------------------------>

[parent folder]: ../

<!-- project files -->

[CONTRIBUTING]: ../../CONTRIBUTING.md " Read the contributors' guidelines"

<!-- people -->

[Serghei Iakovlev]: https://github.com/sergeyklay "View Serghei Iakovlev's GitHub profile"

<!-- EOF -->
