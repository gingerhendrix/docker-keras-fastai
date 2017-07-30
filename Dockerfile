FROM nvidia/cuda:8.0-cudnn5-devel

RUN apt-get update && apt-get install -y wget

RUN mkdir /tmp/downloads && \
    cd /tmp/downloads && \
    wget "https://repo.continuum.io/archive/Anaconda2-4.2.0-Linux-x86_64.sh" -O "Anaconda2-4.2.0-Linux-x86_64.sh" && \
    bash "Anaconda2-4.2.0-Linux-x86_64.sh" -b && \
    echo "export PATH=\"$HOME/anaconda2/bin:\$PATH\"" >> ~/.bashrc

ENV PATH /root/anaconda2/bin:$PATH

RUN conda install -y bcolz && conda upgrade -y --all
RUN pip install theano && pip install keras==1.2.2

ADD keras.json /root/.keras/keras.json
ADD theanorc /roo/.theanorc
# default password: keras
ENV PASSWD=""

WORKDIR /root

#TODO - move above
RUN apt-get update && apt-get install -y git

RUN git clone https://github.com/fastai/courses.git

EXPOSE 8888
CMD ["jupyter", "notebook", "--allow-root", "--no-browser", "--ip=*", "--NotebookApp.password=sha1:98b767162d34:8da1bc3c75a0f29145769edc977375a373407824"]
