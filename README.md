Gymbro Server

# Docs 
- Prisma: https://www.prisma.io/docs/getting-started
- Open-api: https://swagger.io/specification/

## quicksheet
### prisma ( helps to handle with databases)

npm i prisma -D (interface para automatizar tarefas no terminal)
npm i @prisma/client (de fato o que vamos usar)
npm i prisma-erd-generator
npx prisma init --datasource-provider SQLite (podendo ser outras databases)
npx prisma migrate dev (cria uma migration -> mecanismo de versionamento de tabela... como o git)
npx prisma studio (abre uma interface web para vermos as tabelas)
npm i prisma-erd-generator @mermaid-js/mermaid-cli -D ( geração de diagramas. Nesse caso o ERD)
npx prisma generate ( gera o diagrama em si )