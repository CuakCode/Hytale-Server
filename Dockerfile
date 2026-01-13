# Imagen ligera de Alpine con Java 25
FROM docker.io/eclipse-temurin:25-jre-alpine
# Dependencias para compatibilidad
RUN apk add --no-cache gcompat libstdc++

# 1. Carpeta de la aplicación (Binarios y Assets estáticos)
WORKDIR /app
COPY Server/HytaleServer.jar .
COPY Server/HytaleServer.aot .
COPY Server/Licenses ./Licenses
# Copiamos el archivo pesado de assets al interior de la imagen
COPY Assets.zip .

# 2. Carpeta de datos (Donde se crearán los mundos y logs)
WORKDIR /data

# Exponer el puerto UDP para QUIC
EXPOSE 5520/udp

ENV RAM_MAX="4G"

# Ejecución: apuntamos a los assets que ahora están dentro de /app
ENTRYPOINT ["sh", "-c", "java -Xmx${RAM_MAX} -XX:AOTCache=/app/HytaleServer.aot -jar /app/HytaleServer.jar --assets /app/Assets.zip --bind 0.0.0.0:5520"]
