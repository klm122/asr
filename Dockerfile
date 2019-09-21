FROM wav2letter/wav2letter:cpu-base-latest

RUN mkdir ~/wav2letter
COPY . ~/wav2letter

# ==================================================================
# flashlight https://github.com/facebookresearch/flashlight.git
# ------------------------------------------------------------------
RUN export MKLROOT=/opt/intel/mkl && \
    cd /root && git clone --recursive https://github.com/facebookresearch/flashlight.git && \
    cd flashlight && mkdir -p build && cd build && \
    cmake .. -DCMAKE_BUILD_TYPE=Release -DFLASHLIGHT_BACKEND=CPU && \
    make -j8 && make install && \
# ==================================================================
# wav2letter with CPU backend
# ------------------------------------------------------------------
    export KENLM_ROOT_DIR=/root/kenlm && \
    cd ~/wav2letter && mkdir -p build && \
    cd build && cmake .. -DCMAKE_BUILD_TYPE=Release -DW2L_LIBRARIES_USE_CUDA=OFF && \
    make -j8
