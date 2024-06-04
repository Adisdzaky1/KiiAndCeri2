FROM node:18

# Instalasi paket yang diperlukan
RUN apt-get update && \
    apt-get install -y \
    libpng-dev \
    zlib1g-dev \
    libcairo2-dev \
    libjpeg-dev \
    libgif-dev

# Atur direktori kerja
WORKDIR /usr/src/app

# Copy package.json dan package-lock.json
COPY package*.json ./

# Install dependencies node
RUN npm install

# Copy seluruh kode aplikasi
COPY . .

# Expose port aplikasi
EXPOSE 3000

# Command untuk menjalankan aplikasi
CMD ["node", "index.js"]