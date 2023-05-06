NAME=yolov7

TRAIN_DATA=/data/sam-colorless.yaml
BENCHMARK_DATA=/data/sam_benchmark_reduced_colorless.yaml

CONFIG=cfg/training/yolov7-tiny-sam-colorless.yaml
HYPER_PARAMETERS=data/hyp.scratch.tiny.sam.yaml
WEIGHTS=./yolov7-tiny.pt
EPOCHS=100

TIME=$(date -u +%Y-%m-%dT%H-%M)
NAME=$NAME_$TIME
python train.py --workers 8 --device 0 --batch-size 32 \
	  --data $TRAIN_DATA \
	  --img 224 224 \
	  --cfg $CONFIG \
	  --weights $WEIGHTS \
	  --name $NAME \
	  --hyp $HYPER_PARAMETERS \
	  --epochs $EPOCHS


mkdir /tmp/results
cp runs/train/$NAME/weights/best.pt /tmp/results/yolov7.pt
python test.py --data $BENCHMARK_DATA \
  --img 224 \
  --batch 32 \
  --conf 0.001 \
  --iou 0.65 \
  --device 0 \
  --weights /tmp/results/yolov7.pt \
  --save-json \
  --name $NAME > /tmp/results/benchmark.log

cp -r runs/test/$NAME /tmp/results/benchmark
cp $HYPER_PARAMETERS /tmp/results/
cp $TRAIN_DATA /tmp/results/
cp $BENCHMARK_DATA /tmp/results/

tar czf $NAME.tar.gz --directory=/tmp/results/ .
rm -rf /tmp/results