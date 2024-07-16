
# cuddly-poetry-python ✨

Guide to set up a Poetry-managed Python project that runs locally (macOS) and in a dev container (GH Codespaces).

## Prerequisites 📌

- [Poetry (version 1.8.3)](https://python-poetry.org/docs/)
- [Python 3.12.4](https://www.python.org/downloads/release/python-3124/#:~:text=Python%203.12%20is%20the%20newest,documentation%20changes%20since%203.12.3.)
- [Visual Studio Code (version 1.91)](https://code.visualstudio.com/updates/v1_91)
- [macOS Sonoma 14.5](https://developer.apple.com/documentation/macos-release-notes/macos-14_5-release-notes) (locally)
- [GH Codespaces](https://docs.github.com/en/codespaces/overview) (dev containter)

## Getting started 👣

Poetry will manage the project dependencies and allow any version of a Python Interpreter to run your program that satisfied the constraint listed in the [pyproject.toml](pyproject.toml). But it doesn't install any Python Interpreter by itself, this must be provided by the system where you run your Python project on.

### Local development on macOS 💻

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

### Remote development in a dev container using GH Codespaces 📦

You can create a codespace on your repository and then afterwards customise it by changing the configuration file `cpp/.devcontainer/devcontainer.json` (or `cpp/.devcontainer.json`) which gets created by GitHub with the creation of a codespace if not exist before. The `devcontainer.json` is the primary file to determine what environment including tools, frameworks etc. should be created for your codespace.

In this guide, the `devcontainer.json` file is created and modified locally in VSCode first, before a codespace is created based on it to get started with GH Codespaces.

Open the `Command Palette...` in VSCode, search for and click on **Dev Containers: Add Dev Container Configuration Files...** to create the `devcontainer.json` file in the root of your project.

Follow the instructions in the dialog and after the [devcontainer.json](.devcontainer/devcontainer.json) file has been created for your project, open it and modify it so that it ends up having following content:

- `Poetry (version 1.8.3)` as feature to add to the dev container when that gets created
- `postCreateCommand`: 
    - use the Python Interpreter installed with the dev container image and the Python module [venv](https://docs.python.org/3/library/venv.html) to create a separate virtual environment e.g. `.venv` for the project
    - upgrade the `pip` tooling to the latest version
    - read the `pyproject.toml` file from the current project, resolve the dependencies, and install them in the activated virtual environment `.venv` of the project
- *optionally you can define extensions or workspace settings that you would like VSCode to have when the dev container gets created*

This [devcontainer.json](.devcontainer/devcontainer.json) file is now used by GH Codespaces to create a dev container. When you modify this file, make sure to **rebuild** the container to have the changes reflected in your dev container.

## Sources 📝

- https://python-poetry.org/docs/basic-usage/#setting-a-python-version
- https://stackoverflow.com/questions/44397215/run-python-module-by-just-typing-folder-name
- https://bossagyu.com/en/blog/004-paython-setup/
- https://matplotlib.org/stable/users/explain/quick_start.html
- https://docs.github.com/en/enterprise-cloud@latest/codespaces/setting-up-your-project-for-codespaces/adding-a-dev-container-configuration/setting-up-your-python-project-for-codespaces
- https://containers.dev/features
- https://containers.dev/supporting#product-specific-properties
- https://docs.github.com/en/enterprise-cloud@latest/codespaces/developing-in-a-codespace/rebuilding-the-container-in-a-codespace#about-rebuilding-a-container
- https://containers.dev/implementors/json_reference/
- https://docs.github.com/en/codespaces/setting-up-your-project-for-codespaces/adding-a-dev-container-configuration/introduction-to-dev-containers#devcontainerjson
- https://docs.github.com/en/codespaces/developing-in-a-codespace/creating-a-codespace-for-a-repository