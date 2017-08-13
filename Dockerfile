FROM nvidia/cuda:8.0-cudnn5-devel

ARG PYTHON=3
ARG ANACONDA=4.4.0
ARG KERAS=2.0.6

RUN apt-get update && apt-get install -y wget git unzip p7zip-full

RUN mkdir /tmp/downloads && \
    cd /tmp/downloads && \
    wget "https://repo.continuum.io/archive/Anaconda${PYTHON}-${ANACONDA}-Linux-x86_64.sh" -O "Anaconda${PYTHON}-${ANACONDA}-Linux-x86_64.sh" && \
    bash "Anaconda${PYTHON}-${ANACONDA}-Linux-x86_64.sh" -b && \
    echo "export PATH=\"$HOME/anaconda${PYTHON}/bin:\$PATH\"" >> ~/.bashrc

ENV PATH /root/anaconda${PYTHON}/bin:$PATH

RUN conda install -y bcolz && conda upgrade -y --all
RUN pip install theano && pip install keras==${KERAS}

ADD keras.json /root/.keras/keras.json
ADD theanorc /roo/.theanorc
# default password: keras
# ENV PASSWD=""

WORKDIR /root

EXPOSE 8888
CMD ["jupyter", "notebook", "--allow-root", "--no-browser", "--ip=*", "--NotebookApp.password=sha1:98b767162d34:8da1bc3c75a0f29145769edc977375a373407824"]
