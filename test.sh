python /yolov7/test.py --data /data/sam_benchmark_reduced_colorless.yaml --img 224 --batch 32 --conf 0.001 --iou 0.65 --device 0 \
	--weights /tmp/best.pt --name yolov7_colorless_benchmark --save-json

