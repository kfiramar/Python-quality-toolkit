# 🚀 Project Title: Code Quality Automation

A powerful 💪 bash script to automate the process of maintaining code quality in Python projects.

## 🗂️ Table of Contents
- [Description](#-description)
- [Installation](#-installation)
- [Usage](#-usage)
- [Tests](#-tests)
- [Built With](#-built-with)
- [Contributing](#-contributing)
- [License](#-license)
- [Acknowledgments](#-acknowledgments)

## 📚 Description

This project provides a bash script that automates various tasks related to maintaining code quality in Python projects. Whether you're an individual developer or part of a larger team, this tool offers a flexible solution to keep your Python code clean, efficient, and secure.

The script performs the following actions:

1. Installs necessary Python packages for linting, formatting, and complexity analysis.
2. Runs linters and formatters including flake8, pylint, pycodestyle, pydocstyle, autopep8, isort, and black on the Python project.
3. Performs type checking with mypy.
4. Scans the Python code for security vulnerabilities with Bandit.
5. Analyzes the complexity of the Python code with Radon.
6. Runs tests on the Python project with pytest.
7. Checks code coverage of the tests.
8. Checks for known security vulnerabilities in the installed dependencies with Safety.
9. Generates a requirements file with pipreqs.
10. Creates a `.gitignore` and optionally a `.dockerignore` file.
11. Counts the lines of code in the Python project with cloc.

## 🚀 Installation

📥 To install and set up the project, follow these steps:

1. Clone the repository: `git clone https://github.com/username/project.git`.
2. Navigate to the project directory: `cd project`.
3. Ensure you have all the necessary Python packages installed. They're listed in the `requirements.txt` file. You can install them using pip: `pip install -r requirements.txt`.

## 🛠️ Usage

You can run the script using the bash command in the terminal: `bash code_quality.sh`. Remember to replace the `DIR` variable in the script with the path to your Python project directory. The `REQUIREMENTS` variable should point to the location where you want to generate the requirements file.

## 🧪 Tests

The script uses `pytest` to run the tests in your Python project. Make sure you write comprehensive tests to ensure the correctness of your code.

## 🛠️ Built With

- Python
- Bash
- And a range of Python libraries and tools including flake8, autopep8, isort, black, mypy, bandit, pipreqs, radon, pylint, pytest, coverage, safety, pycodestyle, pydocstyle, and cloc.

## 👥 Contributing

Contributions are welcome. Here's how you can contribute:

1. Fork the project.
2. Create your feature branch: `git checkout -b my-new-feature`.
3. Commit your changes: `git commit -am 'Add some feature'`.
4. Push to the branch: `git push origin my-new-feature`.
5. Submit a pull request.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

## 🙏 Acknowledgments

- Hat tip to anyone whose code was used
- Inspiration
- etc
