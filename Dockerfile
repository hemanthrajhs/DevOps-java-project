FROM java
WORKDIR /app 
COPY ./target/*.jar /app.jar
CMD [ "java" "-jar" "*.jar" ]