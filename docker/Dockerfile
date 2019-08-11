FROM ubuntu:xenial

MAINTAINER Carlos Gemmell

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update 
RUN apt-get upgrade -y

# install essentials
RUN apt-get install -y vim software-properties-common git openjdk-8-jdk-headless 
RUN apt-get install -y g++ zlib1g-dev build-essential parallel wget zlibc zlib1g

# install python packages
RUN add-apt-repository -y ppa:deadsnakes/ppa
RUN apt-get update -y
RUN apt-get install -y python3 python3-pip
# RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.7 2
RUN apt-get install -y unzip
RUN python3 -m pip install --upgrade pip
RUN pip3 install tensorflow==2.0.0-beta1 matplotlib jupyter jupyter_contrib_nbextensions setuptools flask colored
RUN jupyter contrib nbextension install --user
RUN jupyter nbextension enable splitcell/splitcell

# install indri
WORKDIR /usr/local/src
RUN wget https://downloads.sourceforge.net/project/lemur/lemur/indri-5.14/indri-5.14.tar.gz -O indri-5.14.tar.gz
RUN tar xzvf indri-5.14.tar.gz
WORKDIR /usr/local/src/indri-5.14
RUN ./configure CXX="g++ -D_GLIBCXX_USE_CXX11_ABI=0"
RUN make
RUN make install
WORKDIR /usr/local/src
RUN wget https://storage.googleapis.com/miscellaneous_carlos_gemmell/indri-5.14-compiled.zip
# RUN apt-get install -y unzip
RUN unzip -o indri-5.14-compiled.zip 

# install pyndri
RUN pip3 install pyndri

WORKDIR /my_shared
RUN echo "YOUR INSTANCE IS READY :)"

# on startup run init script
ENTRYPOINT /bin/bash --login -c "/my_shared/docker/init.sh" && /bin/bash