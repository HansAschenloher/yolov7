#!/bin/bash
jupyter notebook --port=8888 --no-browser --ip=0.0.0.0 --MappingKernelManager.cull_idle_timeout=18000
