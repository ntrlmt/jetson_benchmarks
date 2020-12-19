#!/bin/bash

python3 utils/download_models.py --all --csv_file_path /jetson_benchmarks/benchmark_csv/tx2-nano-benchmarks.csv --save_dir /jetson_benchmarks/models
python3 benchmark.py --all --csv_file_path /jetson_benchmarks/benchmark_csv/tx2-nano-benchmarks.csv \
                            --model_dir /jetson_benchmarks/models \
                            --jetson_devkit nano \
                            --gpu_freq 921600000 --power_mode 0 --precision fp16
exit