DATA=/data/sam.yaml

python train.py --workers 8 --device 0 --batch-size 32 --data $DATA --img 224 224 --cfg cfg/training/yolov7-tiny-sam.yaml --weights ./yolov7-tiny.pt --name yolov7 --hyp data/hyp.scratch.p5.yaml
