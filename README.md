# cuddly-poetry-python

Guide to set up a Poetry-managed Python project that runs locally (macOS) and in a dev container (GH Codespaces).

## Prerequisites

- [Poetry (version 1.8.3)](https://python-poetry.org/docs/)
- [Python 3.12.4](https://www.python.org/downloads/release/python-3124/#:~:text=Python%203.12%20is%20the%20newest,documentation%20changes%20since%203.12.3.)
- [Visual Studio Code (version 1.91)](https://code.visualstudio.com/updates/v1_91)
- [macOS Sonoma 14.5](https://developer.apple.com/documentation/macos-release-notes/macos-14_5-release-notes) (locally)
- [GH Codespaces](https://docs.github.com/en/codespaces/overview) (dev containter)

## Getting started

Poetry will manage the project dependencies and allow any version of a Python Interpreter to run your program that satisfied the constraint listed in the [pyproject.toml](pyproject.toml). But it doesn't install any Python Interpreter by itself, this must be provided by the system where you run your Python project on.

### Local development on macOS

On **macOS** we can use e.g. [pyenv](https://github.com/pyenv/pyenv) as Python Interpreter Version Manager to access the correct Python Interpreter version and then use the Python module [venv](https://docs.python.org/3/library/venv.html) to create a separate virtual environment e.g. `.venv` for the project.

Create an empty project e.g. `cpp` in *Visual Studio Code (VSCode)* and either use the integrated terminal of VSCode or the one on macOS to set up the local dev environment with pyenv and venv.

```console
foo@bar:~$ cd <to-your-project-cpp>
cpp:~$ pyenv local 3.12.4
cpp:~$ python -m venv .venv
cpp:~$ source .venv/bin/activate

```

Proceed with initialise the project to use Poetry for dependency management and specify dependencies e.g. [matplotlib](https://matplotlib.org/stable/) for your project. Latter can be done separately from initialisation as well and later at any time. 

```console
(.venv)cpp:~$ poetry init
(.venv)cpp:~$ poetry add matplotlib
```

## Sources

- https://python-poetry.org/docs/basic-usage/#setting-a-python-version
- https://stackoverflow.com/questions/44397215/run-python-module-by-just-typing-folder-name
- https://bossagyu.com/en/blog/004-paython-setup/
- https://matplotlib.org/stable/users/explain/quick_start.html