DATA=/data/sam.yaml

python train.py --workers 8 --device 0 --batch-size 1 --data $DATA --img 320 320 --cfg cfg/training/yolov7-tiny-sam-gelu.yaml --weights ./yolov7-tiny.pt --name yolov7-all-224 --hyp data/hyp.scratch.tiny.sam.yaml --epochs 100

#python train.py --workers 2 --device 0 --batch-size 8 --data $DATA --img 320 320 --cfg cfg/training/yolov7-tiny-sam-gelu.yaml --weights ./yolov7-tiny.pt --name yolov7-all-320 --hyp data/hyp.scratch.tiny.sam.yaml --epochs 100

#python train.py --workers 8 --device 0 --batch-size 32 --data $DATA --img 428 428 --cfg cfg/training/yolov7-tiny-sam-gelu.yaml --weights ./yolov7-tiny.pt --name yolov7-all-428 --hyp data/hyp.scratch.tiny.sam.yaml

#python train.py --workers 8 --device 0 --batch-size 32 --data $DATA --img 640 640 --cfg cfg/training/yolov7-tiny-sam-gelu.yaml --weights ./yolov7-tiny.pt --name yolov7-all-640 --hyp data/hyp.scratch.tiny.sam.yaml
