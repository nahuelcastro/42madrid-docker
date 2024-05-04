
#!/bin/bash

IMAGE_NAME="42-ubuntu"
CONTAINER_NAME="42-ubuntu-container"

# Opción para reconstruir la imagen
if [ "$1" == "build" ]; then
    echo "Construyendo la imagen $IMAGE_NAME..."
    docker build -t $IMAGE_NAME .
fi

if [ "$1" == "rm" ]; then
    # Verificar si el contenedor ya existe y eliminarlo si es así
    if [ $(docker ps -a -f name=$CONTAINER_NAME | grep -w $CONTAINER_NAME | wc -l) -gt 0 ]; then
        echo "Eliminando el contenedor existente..."
        docker rm -f $CONTAINER_NAME
    fi
fi

# Ejecutar el contenedor
echo "Ejecutando $CONTAINER_NAME..."
docker run -it --name $CONTAINER_NAME \
    -v /home/nahuel/Documents/42_projects:/workspace \
    -v ~/.ssh:/root/.ssh \
    -v ~/.gitconfig:/root/.gitconfig \
    $IMAGE_NAME

echo "Contenedor $CONTAINER_NAME en ejecución."