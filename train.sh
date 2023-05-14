DATA=/data/sam-colorless.yaml
TIME=$(date -u +%Y-%m-%dT%H-%M)

python train.py --workers 8 --device 0 --batch-size 32 --data $DATA --img 224 224 \
	--cfg cfg/training/yolov7-tiny-sam-lora.yaml \
	--weights ./yolov7-tiny.pt \
	--name yolov7-$TIME \
	--hyp data/hyp.scratch.tiny.sam.yaml \
	--epochs 100 --lora
