# Define a imagem base, Node.js 18 no Alpine Linux
FROM node:18-alpine 

# Criação de diretórios e configuração de permissões
RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

# Define o diretório de trabalho no contêiner
WORKDIR /home/node/app

# Copia os arquivos de dependências do Node.js
COPY package*.json ./
# Instala as dependências
RUN npm install

# Copia todo o código-fonte para o contêiner
COPY --chown=node:node . .
# Expõe a porta 3000
EXPOSE 3000
# Comando padrão para iniciar o aplicativo
CMD [ "node", "app.js" ]

