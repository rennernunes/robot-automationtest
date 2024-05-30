FROM python:3.8-slim-buster

ENV TZ=America/Sao_Paulo

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y wget unzip curl  # Instala o curl

RUN wget -q -O /tmp/google-chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i /tmp/google-chrome.deb || apt-get -f install -y
RUN rm /tmp/google-chrome.deb

RUN apt install -y default-jdk

RUN CHROMEDRIVER_VERSION="119.0.6045.105" && \
    wget -q "https://edgedl.me.gvt1.com/edgedl/chrome/chrome-for-testing/${CHROMEDRIVER_VERSION}/linux64/chromedriver-linux64.zip" -O /tmp/chromedriver.zip && \
    unzip /tmp/chromedriver.zip -d /usr/local/bin/ && \
    rm /tmp/chromedriver.zip && \
    mv /usr/local/bin/chromedriver-linux64/chromedriver /usr/local/bin/chromedriver

# Instala o webdrivermanager
RUN curl -Lo /usr/local/bin/webdrivermanager https://github.com/bonigarcia/webdrivermanager/releases/download/webdrivermanager-5.6.1/webdrivermanager-5.6.1-fat.jar

# # Define um alias para o comando do webdrivermanager
RUN echo 'alias webdrivermanager="java -jar /usr/local/bin/webdrivermanager"' >> ~/.bashrc

ENV PATH="/usr/local/bin:${PATH}"

RUN pip install robotframework
RUN pip install selenium==4.9.1
RUN pip install robotframework-seleniumlibrary==6.0.0
