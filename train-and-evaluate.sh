NAME=yolov7

TRAIN_DATA=/data/training_data/data.yaml
BENCHMARK_DATA=/data/sam_benchmark_copy.yaml

CONFIG=cfg/training/yolov7-tiny-sam.yaml
HYPER_PARAMETERS=data/hyp.scratch.tiny.sam.yaml
WEIGHTS=./yolov7-tiny.pt
EPOCHS=150

TIME=$(date -u +%Y-%m-%dT%H-%M)
NAME=$NAME_$TIME
python train.py --workers 8 --device 0 --batch-size 8 \
	  --data $TRAIN_DATA \
	  --img 320 320 \
	  --cfg $CONFIG \
	  --weights $WEIGHTS \
	  --name $NAME \
	  --hyp $HYPER_PARAMETERS \
	  --epochs $EPOCHS


mkdir /tmp/results
cp runs/train/$NAME/weights/best.pt /tmp/results/yolov7.pt
python test.py --data $BENCHMARK_DATA \
  --img 320 \
  --batch 8 \
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
cp train.py /tmp/results/

tar czf $NAME.tar.gz --directory=/tmp/results/ .
rm -rf /tmp/results
