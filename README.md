# 42madrid-docker
Docker lab for 42 Madrid Ubuntu # 42 Madrid Docker Environment

This Docker image provides a development environment tailored for students at 42 Madrid. It includes a fully configured Ubuntu system with a suite of development tools essential for projects and assignments.

## Features

- Based on Ubuntu:latest.
- Development tools such as Git, SSH, Vim, NeoVim, Clang, Valgrind, GDB, and LLDB.
- Python environment with Norminette and c-formatter-42 installed.
- Oh My Zsh with a pre-configured `.zshrc`.
- Custom `.vimrc` and standard 42 header files setup.

## Building the Image

To build this image, clone the repository and use the provided Dockerfile:

```bash
git clone https://github.com/yourusername/42madrid-docker.git
cd 42madrid-docker
docker build -t 42madrid-docker .
```

## Running the Container
After building the image, run it with the following command:
*The .ssh and .git lines are optional*
```bash
docker run -it --name 42madrid-container \
    -v /home/your_projects_path:/workspace \
    -v ~/.ssh:/root/.ssh \
    -v ~/.gitconfig:/root/.gitconfig \
    42madrid-docker
```

## Inside the Container
- The default shell is zsh.
- Your 42 projects directory from your host machine is mounted to /workspace in the container, allowing you to work directly on your projects.
- The host's .ssh and .gitconfig are used, ensuring seamless Git operations.

## Contributing
Feel free to fork the repository, make your changes, and submit a pull request if you have improvements to the Docker environment.

