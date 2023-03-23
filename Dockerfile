FROM node:16.13.2

WORKDIR /usr/src/app

#의존성 설치를 위해 package.json, yarn.lock 복사 
COPY package.json ./
COPY yarn.lock ./

#env setting -> 각자의 NOTION_PAGE_ID로
ENV NOTION_PAGE_ID 1e8328955e0c4b0bb297b43183df42d1

#의존성 설치
RUN yarn

COPY . .

#next.js application build
RUN yarn build

#container port setting 
EXPOSE 8000

#appplication execute
CMD ["yarn", "start"]