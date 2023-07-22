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
pip install flake8 autopep8 isort black mypy bandit pipreqs radon pylint pytest coverage safety pycodestyle pydocstyle
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

echo "${MAGENTA}Counting lines of code...${NORMAL}"
cloc $DIR

echo "${GREEN}All done!${NORMAL}"