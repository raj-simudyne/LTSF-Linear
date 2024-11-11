
if [ ! -d "./logs" ]; then
    mkdir ./logs
fi

if [ ! -d "./logs/predictions" ]; then
    mkdir ./logs/predictions
fi

seq_len=104
model_name=DLinear
for pred_len in 24
do
python -u run_longExp.py \
  --is_training 0 \
  --do_predict \
  --root_path ./dataset/ \
  --data_path exchange_rate.csv \
  --model_id Exchange_$seq_len'_'$pred_len \
  --model $model_name \
  --data custom \
  --features M \
  --freq d \
  --seq_len $seq_len \
  --pred_len $pred_len \
  --enc_in 8 \
  --des 'Exp'
done

seq_len=104
model_name=NLinear
for pred_len in 24
do
python -u run_longExp.py \
  --is_training 0 \
  --do_predict \
  --root_path ./dataset/ \
  --data_path exchange_rate.csv \
  --model_id Exchange_$seq_len'_'$pred_len \
  --model $model_name \
  --data custom \
  --features M \
  --freq d \
  --seq_len $seq_len \
  --pred_len $pred_len \
  --enc_in 8 \
  --des 'Exp'
done

seq_len=104
model_name=Linear
for pred_len in 24
do
python -u run_longExp.py \
  --is_training 0 \
  --do_predict \
  --root_path ./dataset/ \
  --data_path exchange_rate.csv \
  --model_id Exchange_$seq_len'_'$pred_len \
  --model $model_name \
  --data custom \
  --features M \
  --freq d \
  --seq_len $seq_len \
  --pred_len $pred_len \
  --enc_in 8 \
  --des 'Exp'
done