
nvidia-docker image with Anaconda, Keras and Jupyter Notebook for following [fast.ai's deep learning mooc](http://course.fast.ai/)

## Usage

Use the [prebuilt image on docker hub](https://hub.docker.com/r/gingerhendrix/keras-fastai/)

```
nvidia-docker run -p 8888:8888 gingerhendrix/keras-fastai
```

Access Jupyter Notebook at your docker host at port 8888 eg. http://localhost:8888 (password: keras)


### With docker-machine on Amazon EC2 or Azure

Follow the instructions on the nvidia docker wiki - [Amazon EC2](https://github.com/NVIDIA/nvidia-docker/wiki/Deploy-on-Amazon-EC2)/[Azure](https://github.com/NVIDIA/nvidia-docker/wiki/Deploy-on-Azure)


## Container contents

* CUDA 8.0 and CUDNN5
* Anaconda2 4.2.0 (Python 2.7 + numpy etc)
* theano
* keras

