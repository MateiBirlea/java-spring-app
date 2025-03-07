# Folosim JDK 21 pentru a construi aplicația
FROM eclipse-temurin:21-jdk AS build

# Setăm directorul de lucru în container
WORKDIR /app

# Copiem toate fișierele din proiect în container
COPY . .

# Asigurăm că `gradlew` este executabil
RUN chmod +x gradlew

# Setăm JDK-ul pentru Gradle (evită problemele cu toolchains)
ENV JAVA_HOME=/opt/java/openjdk
RUN echo "org.gradle.java.home=$JAVA_HOME" >> gradle.properties

# Construim aplicația fără teste și cu stacktrace (pentru debugging)
RUN ./gradlew clean build -x test --stacktrace

# Stadiul de runtime - folosim doar JRE 21 pentru a reduce dimensiunea imaginii
FROM eclipse-temurin:21-jre AS runtime

# Setăm directorul de lucru în container
WORKDIR /app

# Copiem doar fișierul .jar generat
COPY --from=build /app/build/libs/*.jar app.jar

# Expunem portul pe care rulează Spring Boot (modifică dacă e necesar)
EXPOSE 8080

# Pornim aplicația
CMD ["java", "-jar", "/app/app.jar"]
