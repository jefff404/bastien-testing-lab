# Étape 1 : Build
FROM node:20-alpine AS builder

WORKDIR /app

# Copier uniquement les fichiers nécessaires pour installer les dépendances
COPY package.json package-lock.json* ./

# Installer les dépendances
RUN npm ci

# Copier le reste des fichiers
COPY . .

# Build l'application
RUN npm run build

# Étape 2 : Exécution
FROM node:20-alpine AS runner

WORKDIR /app

ENV NODE_ENV=production
ENV HOST=0.0.0.0

# Copier uniquement les fichiers nécessaires
COPY --from=builder /app/.output ./.output
COPY --from=builder /app/package.json ./package.json

# Installer uniquement les dépendances de production
RUN npm ci --omit=dev

EXPOSE 3000

CMD ["node", ".output/server/index.mjs"]
