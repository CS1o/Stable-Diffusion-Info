@echo off
echo Launching ComfyUI...
echo.

call venv\Scripts\activate

REM Speed improvement flags
set FLASH_ATTENTION_TRITON_AMD_ENABLE=TRUE
set TORCH_ROCM_AOTRITON_ENABLE_EXPERIMENTAL=1

REM Launch args
python main.py --auto-launch --use-pytorch-cross-attention --disable-smart-memory --bf16-vae

