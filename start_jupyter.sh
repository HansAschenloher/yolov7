#!/bin/bash
jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser --MappingKernelManager.cull_idle_timeout=18000 --NotebookApp.allow_origin='*' --NotebookApp.token='' --NotebookApp.password=''
