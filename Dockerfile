# Étape 1 : Build
FROM node:20-alpine AS builder

WORKDIR /app

COPY . .

RUN npm run dev
RUN npm run build

# Étape 2 : Exécution
FROM node:20-alpine AS runner

WORKDIR /app

ENV NODE_ENV=production

COPY --from=builder /app/.output ./.output
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package.json ./package.json

EXPOSE 3000

CMD ["node", ".output/server/index.mjs"]
