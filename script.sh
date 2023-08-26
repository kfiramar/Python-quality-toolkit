#!/bin/bash

# path to your python project directory
DIR="$PWD/src"

# path to your requirements file (outside of the project directory)
REQUIREMENTS="$PWD/requirements.txt"

# define colors
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
NORMAL=$(tput sgr0)

echo "${GREEN}Installing linting, formatting, and complexity analysis libraries...${NORMAL}"
pip install flake8 autopep8 isort black mypy bandit pipreqs radon pylint pytest coverage safety pycodestyle pydocstyle cloc
echo "--------------------------------------------------------------------------------"

echo "${CYAN}Running flake8...${NORMAL}"
flake8 $DIR
echo "--------------------------------------------------------------------------------"

echo "${CYAN}Running pylint...${NORMAL}"
pylint $DIR
echo "--------------------------------------------------------------------------------"

echo "${YELLOW}Running pycodestyle...${NORMAL}"
pycodestyle $DIR
echo "--------------------------------------------------------------------------------"

echo "${YELLOW}Running pydocstyle...${NORMAL}"
pydocstyle $DIR
echo "--------------------------------------------------------------------------------"

echo "${MAGENTA}Running autopep8...${NORMAL}"
find $DIR -name '*.py' -exec autopep8 --in-place --aggressive --aggressive {} \;
echo "--------------------------------------------------------------------------------"

echo "${MAGENTA}Sorting imports with isort...${NORMAL}"
find $DIR -name '*.py' -exec isort {} \;
echo "--------------------------------------------------------------------------------"

echo "${BLUE}Running Black...${NORMAL}"
find $DIR -name '*.py' -exec black {} \;
echo "--------------------------------------------------------------------------------"

echo "${RED}Running Mypy...${NORMAL}"
mypy $DIR
echo "--------------------------------------------------------------------------------"

echo "${RED}Running Bandit...${NORMAL}"
bandit -r $DIR
echo "--------------------------------------------------------------------------------"

echo "${BLUE}Analyzing code complexity with Radon...${NORMAL}"
radon cc $DIR
echo "--------------------------------------------------------------------------------"

echo "${GREEN}Running pytest...${NORMAL}"
pytest $DIR
echo "--------------------------------------------------------------------------------"

echo "${GREEN}Checking code coverage...${NORMAL}"
coverage run --source $DIR -m pytest
coverage report
echo "--------------------------------------------------------------------------------"

echo "${RED}Checking for known security vulnerabilities in dependencies...${NORMAL}"
safety check
echo "--------------------------------------------------------------------------------"

echo "${BLUE}Generating requirements file...${NORMAL}"
pipreqs $DIR --force
echo "--------------------------------------------------------------------------------"

echo "${CYAN}Moving requirements file outside of project directory...${NORMAL}"
mv $DIR/requirements.txt $REQUIREMENTS
echo "--------------------------------------------------------------------------------"

echo "${MAGENTA}Creating .gitignore...${NORMAL}"
echo -e "venv/\n*.pyc\n__pycache__/\n.DS_Store\n.vscode/\n**/*.env\npycache/\nsettings/\n**/*.log\n*.sqlite\n*.sql\n*.csv\n*.xlsx\n*.xls\n.pytest_cache/\nhtmlcov/\n*.cover\n.hypothesis/\n.mypy_cache/\n*.prof\n.ipynb_checkpoints/\n.vs/\n.history/\nMANIFEST\nnode_modules/\nnpm-debug.log\n.sass-cache/\n*.pyre\n.coverage\n.idea\n.idea/*\n**/node_modules/**\n**/vendor/**\nkeys.ini\n**__pycache__**\n*/logs/*\nTODO.txt\n.VSCodeCounter*\ntest.py\n*.pyc*\n.vscode\n*test*\nresult.json\nbuild*\n*monkey*\n*keys.env*\n*egg*\ndist*\nlinting_script.sh" > $PWD/.gitignore
echo "--------------------------------------------------------------------------------"

if [ -f "$PWD/Dockerfile" ]; then
    echo "${MAGENTA}Creating .dockerignore...${NORMAL}"
    echo -e "venv/\n*.pyc\n__pycache__/\n.DS_Store\n.vscode/\n**/*.env\npycache/\nsettings/\n**/*.log\n*.sqlite\n*.sql\n*.csv\n*.xlsx\n*.xls\n.pytest_cache/\nhtmlcov/\n*.cover\n.hypothesis/\n.mypy_cache/\n*.prof\n.ipynb_checkpoints/\n.vs/\n.history/\nMANIFEST\nnode_modules/\nnpm-debug.log\n.sass-cache/\n*.pyre\n.coverage\nlinting_script.sh" > $PWD/.dockerignore
    echo "--------------------------------------------------------------------------------"
fi

echo "${MAGENTA}Counting lines of code...${NORMAL}"
cloc $DIR

echo "${GREEN}All done!${NORMAL}"
