#!/usr/bin/env bash
set -e

# `iopaint` 실행 (백그라운드)
echo "🔹 iopaint 실행 중..."

# mateai-paint 실행 (포트 8060)
nohup pipenv run python3 iopaint start --model Sanster/PowerPaint-V1-stable-diffusion-inpainting --device=cuda --port=8060 --host=0.0.0.0 --enable-remove-bg > mateai-paint.log 2>&1 &

# mateai-inpaint 실행 (포트 8070)
nohup pipenv run python3 iopaint start --model=lama --device=cuda --port=8070 --host=0.0.0.0 --enable-remove-bg > mateai-inpaint.log 2>&1 &