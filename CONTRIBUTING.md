# Contributing

## Local setup for pre-commit hooks

- [pre-commit](https://pre-commit.com/#install)
- [helm-docs](https://github.com/norwoodj/helm-docs#installation)

To test hooks before commiting, you can run `pre-commit run -a`.

## Commit guidelines

To generate changelog, Pull Requests and Commits must have semantic and must follow conventional specs below:

- `feat()!:` for breaking changes (major release)
- `feat():` for new features (minor release)
- `fix():` for bug fixes (patch release)
- `docs():` for documentation and examples (no release)
- `refactor():` for code refactoring (no release)
- `test():` for tests (no release)
- `ci():` for CI purpose (no release)
- `chore():` for chores stuff (no release)

The `chore` prefix skipped during changelog generation. It can be used for `chore: update changelog` commit message by example.


## Documentation

Helm-docs generates the README file from the `README.md.gotmpl`- so any changes you want to make need to go in there as it will override the actual `README.md` with each run.
