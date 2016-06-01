FROM ubuntu:latest
RUN apt-get update
RUN apt-get install git
RUN git clone https://github.com/torch/distro.git ~/torch --recursive
RUN cd ~/torch
RUN apt-get install sudo
RUN bash install-deps
RUN ./install.sh
RUN source ~/.bashrc
RUN apt-get install libprotobuf-dev protobuf-compiler
RUN luarocks install loadcaffe
RUN cd ~/
RUN sh models/download_models.sh
RUN th neural_style.lua -style_image ./examples/inputs/golden_gate.jpg -content_image ./examples/inputs/brad_pitt.jpg -num_iterations 100 -gpu -1