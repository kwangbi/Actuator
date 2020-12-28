FROM openjdk:11-jre-slim AS builder # ���̽� �̹��� + �̹��� ��Ī
COPY gradlew . # gradlew ����
COPY gradle gradle # gradle ����
COPY build.gradle . # build.gradle ����
COPY settings.gradle . # settings.gradle ����
COPY src src # �� ���ø����̼� �ҽ� ����
RUN chmod +x ./gradlew # gradlew ������� �ο�
RUN ./gradlew bootJar # gradlew�� ����Ͽ� ���� ������ jar ���� ����

FROM openjdk:11-jre-slim # ���̽� �̹���
COPY --from=builder build/libs/*.jar app.jar # builder �̹������� build/libs/*.jar ������ app.jar�� ����

EXPOSE 8080 # �����̳� Port ����
ENTRYPOINT ["java","-jar","/app.jar"] # jar ���� ����