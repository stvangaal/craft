# Python Environments for Jupyter Notebooks

Some CRAFT workflows – particularly the LLM Extractor method – use Jupyter notebooks that depend on Python libraries like `anthropic`. This page explains how to install those libraries cleanly using a virtual environment (venv) and connect it to Jupyter.

## Why not just `pip install`?

You can install Python packages system-wide with `pip install anthropic`. It works. The problem is that it eventually stops working. Different projects need different versions of the same library, macOS updates can break your system Python, and debugging version conflicts is not a good use of a clinician-researcher's time.

A virtual environment is a self-contained Python installation in a folder. Libraries you install inside it stay there. Your system Python stays clean. If something breaks, you delete the folder and start over.

## Setup

These instructions assume macOS or Linux. If you are on Windows, run everything inside WSL2 (see the main [README](../README.md) prerequisites).

### 1. Create the virtual environment

Open Terminal and run:

```bash
python3 -m venv ~/venvs/craft
```

This creates a folder at `~/venvs/craft` containing a dedicated Python interpreter and an empty package directory. You can put it anywhere and name it anything – `~/venvs/craft` is just a convention.

### 2. Activate it

```bash
source ~/venvs/craft/bin/activate
```

Your terminal prompt will change to show `(craft)` at the beginning. While activated, `pip install` targets this environment only.

### 3. Install your dependencies

```bash
pip install anthropic jupyter ipykernel
```

This installs the Anthropic SDK, Jupyter, and the kernel package needed for the next step. If a CRAFT notebook requires additional libraries, install them here too.

### 4. Register the environment as a Jupyter kernel

```bash
python -m ipykernel install --user --name=craft --display-name "CRAFT (venv)"
```

This tells Jupyter that a kernel called "CRAFT (venv)" exists and points it to the Python interpreter inside `~/venvs/craft`. This is the critical step – without it, Jupyter has no way to find the libraries you just installed.

### 5. Select the kernel in your notebook

Open your notebook in Jupyter, JupyterLab, or VS Code. In the kernel picker (top right in most interfaces), select **CRAFT (venv)**. The notebook will now use the venv's Python and have access to all the packages you installed.

## Day-to-day use

You do **not** need to activate the venv every time you open a notebook. The kernel registration points directly to the venv's Python interpreter, so Jupyter finds it automatically.

You **do** need to activate the venv when you want to install or update packages:

```bash
source ~/venvs/craft/bin/activate
pip install <new-package>
```

Then restart the kernel in your notebook to pick up the changes.

## Troubleshooting

**`python3: command not found`** – You need Python 3 installed. On macOS, install it with `brew install python` or download from [python.org](https://www.python.org/downloads/). On Ubuntu/Debian: `sudo apt install python3 python3-venv`.

**Notebook can't find `anthropic` even after installing it** – You probably installed the package in a different environment than the kernel your notebook is using. Check which kernel is selected (top right of the notebook interface). It should say "CRAFT (venv)", not "Python 3" or something else.

**`No module named venv`** – Some Linux distributions ship a minimal Python without venv. Install it with `sudo apt install python3-venv`.

## Cleaning up

If you want to start fresh, deactivate and delete the folder:

```bash
deactivate
rm -rf ~/venvs/craft
```

Then remove the kernel registration:

```bash
jupyter kernelspec uninstall craft
```

## Further reading

- [Python venv documentation](https://docs.python.org/3/library/venv.html) – the official reference
- [IPython kernels for Jupyter](https://ipython.readthedocs.io/en/stable/install/kernel_install.html) – how kernel registration works under the hood
