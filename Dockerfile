FROM node:lts-buster

RUN apt-get update && \
  apt-get install -y \
    ffmpeg \
    imagemagick \
    webp \
    build-essential \
    libcairo2-dev \
    libpango1.0-dev \
    libjpeg-dev \
    libgif-dev \
    librsvg2-dev \
    libvips-dev \
    python3 \
    make \
    g++ && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

COPY package.json package-lock.json* ./

RUN npm install && npm install -g qrcode-terminal pm2

COPY . .

EXPOSE 5000

CMD ["npm", "start"]
