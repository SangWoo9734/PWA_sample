# Node 이미지를 사용
FROM node:14

# 작업 디렉토리 설정
WORKDIR /app

# package.json과 package-lock.json을 복사
COPY package*.json ./

# 의존성 설치
RUN npm install

# 나머지 애플리케이션 코드를 복사
COPY . .

# 애플리케이션을 빌드
RUN npm run build

# `serve` 패키지 설치
RUN npm install -g serve

# 컨테이너가 시작될 때 실행할 명령어 설정
CMD ["serve", "-s", "build"]

# 포트 5000 노출
EXPOSE 3000
