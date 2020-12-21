ARG JETPACK_VERSION=4.4
FROM nvcr.io/nvidia/l4t-ml:r32.${JETPACK_VERSION}-py3


RUN apt update && \ 
    apt install -y sudo && \ 
    apt install -y unzip
COPY . /jetson_benchmarks
WORKDIR /jetson_benchmarks

ARG JETSON_MODEL=tx2-nano
RUN mkdir models && sh install_requirements.sh && \
    python3 utils/download_models.py --all --csv_file_path /jetson_benchmarks/benchmark_csv/${JETSON_MODEL}-benchmarks.csv --save_dir /jetson_benchmarks/models
