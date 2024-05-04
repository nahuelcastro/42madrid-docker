FROM ubuntu:latest

# Evitar preguntas al usar apt-get
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade && apt-get install  -y \
    git \
    curl \
    ssh \
    vim \
    neovim \
    build-essential \
    python3-pip \
    python3-venv \
    zsh \
    clang \
    valgrind \
    gdb \
    lldb \
    strace

# Actualizar pip y setuptools
RUN python3 -m pip install --upgrade pip setuptools

# Instalar Norminette
RUN python3 -m pip install norminette c-formatter-42

# francinette / paco
RUN bash -c "$(curl -fsSL https://raw.github.com/xicodomingues/francinette/master/bin/install.sh)"

# Instalar Oh My Zsh
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || true

# Configurar zsh como el shell predeterminado
SHELL ["/bin/zsh", "-c"]

# Agregar configuración a .vimrc
RUN echo "set number" >> /root/.vimrc

# 42 Stdheader
ENV USER=matcastr MAIL=matcastr@student.42.fr
RUN mkdir -p ~/.vim/plugin
RUN git clone https://github.com/42Paris/42header.git 42header
RUN cp 42header/plugin/stdheader.vim ~/.vim/plugin/
RUN echo "USER=matcastr" >> ~/.zshrc
RUN echo "export USER" >> ~/.zshrc
RUN echo "MAIL="$matcastr@student.42.fr"" >> ~/.zshrc
RUN echo "export MAIL" >> ~/.zshrc
RUN echo "alias francinette=/root/francinette/tester.sh" >> ~/.zshrc
RUN echo "alias paco=/root/francinette/tester.sh" >> ~/.zshrc

ENV USER=matcastr MAIL=matcastr@student.42.fr
RUN zsh

# Configurar espacio de trabajo
WORKDIR /workspace

# minimize image size
RUN rm -rf /var/lib/apt/lists/*

# Este CMD es opcional, ajusta según la necesidad de ejecutar algo por defecto
CMD ["zsh"]