# Folosim JDK 21 pentru a construi aplicația
FROM eclipse-temurin:21-jdk AS build

# Setăm directorul de lucru în container
WORKDIR /app

# Copiem toate fișierele din proiect în container
COPY . .

# Asigurăm că `gradlew` este executabil
RUN chmod +x /app/gradlew

# Verificăm că `gradlew` există și are permisiuni
RUN ls -l /app/gradlew

# Construim aplicația fără teste
RUN /app/gradlew clean build -x test
