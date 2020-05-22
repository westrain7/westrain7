version: '3'
services:
  mongodb:
    image: mongo:4
    ports:
    - "27017:27017"
    restart: always
  backend:
    image: dbgurum/doc-kor:devbackend_v1
    ports:
    - "8887:8887"
    restart: always
    environment:
      PORT: "8887"
      GUESTBOOK_DB_ADDR: "mongodb:27017"
  frontend:
    image: dbgurum/doc-kor:devfrontend_v2
    ports:
    - "8888:8888"
    restart: always
    environment:
      PORT: "8888"
      GUESTBOOK_API_ADDR: "backend:8887"
