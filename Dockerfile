# Utiliser l'image Docker officielle d'OpenJDK 17
FROM openjdk:17-jdk-slim

# Définir le répertoire de travail dans le conteneur
WORKDIR /minecraft

# Télécharger le fichier server.jar depuis Google Drive
RUN curl -L -o server.jar "https://drive.google.com/uc?export=download&id=10tWKEawWQ9Ynyq3HJIiAkMqP_DIxGewa"

# Copier le fichier eula.txt dans le conteneur (assurez-vous que ce fichier accepte l'EULA de Minecraft)
COPY eula.txt .

# Exposer le port par défaut de Minecraft
EXPOSE 25565

# Lancer le serveur Minecraft
CMD ["java", "-Xmx2G", "-Xms2G", "-jar", "server.jar", "nogui"]
