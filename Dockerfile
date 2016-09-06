FROM node:0.10.38-slim

ADD . /app
WORKDIR /app
RUN npm install
RUN apt-get update
RUN apt-get install -y vim
RUN useradd -d /home/term -m -s /bin/bash term
USER term
# RUN echo 'term:term' | chpasswd

EXPOSE 3000

ENTRYPOINT ["node"]
CMD ["app.js", "-p", "3000", "--sshhost", "shell1.doc.ic.ac.uk"]
