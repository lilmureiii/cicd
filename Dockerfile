FROM node:20-alpine

WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile
COPY . .
RUN chmod +x ./scripts/wait-for-it.sh
EXPOSE 3000
CMD ["./scripts/wait-for-it.sh", "database:3306", "--", "yarn", "start"]
