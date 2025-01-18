# Utiliser l'image Docker officielle d'OpenJDK 17
FROM openjdk:17-jdk-slim

# Mettre à jour les paquets et installer curl (si besoin pour d'autres actions)
RUN apt-get update && apt-get install -y curl

# Définir le répertoire de travail dans le conteneur
WORKDIR /minecraft

# Copier le fichier server.jar depuis GitHub dans le conteneur
COPY server.jar .

# Copier le fichier eula.txt pour accepter l'EULA de Minecraft
COPY eula.txt .

# Exposer le port par défaut de Minecraft (25565)
EXPOSE 25565

# Lancer le serveur Minecraft avec 2 Go de RAM
CMD ["java", "-Xmx2G", "-Xms2G", "-jar", "server.jar", "nogui"]
