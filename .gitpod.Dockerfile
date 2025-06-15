FROM gitpod/workspace-full

USER root

RUN apt-get update && apt-get install -y wget unzip curl gnupg2 ca-certificates \
  && curl -sSL https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor -o /usr/share/keyrings/google-chrome.gpg \
  && echo "deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list \
  && apt-get update && apt-get install -y google-chrome-stable \
  && LATEST=$(curl -sSL https://chromedriver.storage.googleapis.com/LATEST_RELEASE) \
  && wget -O /tmp/chromedriver.zip https://chromedriver.storage.googleapis.com/${LATEST}/chromedriver_linux64.zip \
  && unzip /tmp/chromedriver.zip -d /usr/local/bin/ \
  && chmod +x /usr/local/bin/chromedriver \
  && rm /tmp/chromedriver.zip

USER gitpod
