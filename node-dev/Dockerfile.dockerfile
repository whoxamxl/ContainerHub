FROM node:latest

#meta
LABEL auther="whoxamxl"
LABEL version="1.0.0"
LABEL description="for node dev env"

ENV USER default-user
ENV PASSWORD admin
ENV WDIR /home/${USER}

#Timezone
#ENV TZ=Asia/Tokyo

#Port number
EXPOSE 80

RUN apt-get update && apt-get install sudo -y

#npm update
RUN npm install -g npm@latest

#ENTRYPOINT
#ENTRYPOINT ["npm", "run" , "dev"]

#add USER usermode
RUN useradd -m ${USER}
#add USER sudo
RUN gpasswd -a ${USER} sudo
#set PW
RUN echo ${USER}:${PASSWORD} | chpasswd
#change usermode
USER ${USER}

#change working dir to USER dir
WORKDIR ${WDIR}

#install Next.js for global
#RUN npm install -g next react react-dom

#install Express.js for global
#RUN npm install express --save



#docker image build --force-rm -t node-dev .

#docker image build --force-rm -t node-dev -f <filepath/[filename, "."]>

#docker run -it -p 3000:80 --mount type=bind,src=<folderpath>,dst=/home/default-user/mnt-volume/app --name dev-server <image-path> /bin/bash
