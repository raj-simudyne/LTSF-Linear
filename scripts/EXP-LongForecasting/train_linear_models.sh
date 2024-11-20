
if [ ! -d "./logs" ]; then
    mkdir ./logs
fi

if [ ! -d "./logs/linear_training" ]; then
    mkdir ./logs/linear_training
fi

seq_len=96
model_name=DLinear
for pred_len in 96 192 336 720
do
python -u run_longExp.py \
  --is_training 1 \
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
  --des 'Exp' \
  --itr 1 --batch_size 8  --learning_rate 0.0005 >logs/linear_training/$model_name'_'Exchange_$seq_len'_'$pred_len.log 
done

seq_len=96
model_name=NLinear
for pred_len in 96 192 336 720
do
python -u run_longExp.py \
  --is_training 1 \
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
  --des 'Exp' \
  --itr 1 --batch_size 8 --learning_rate 0.0005 >logs/linear_training/$model_name'_'Exchange_$seq_len'_'$pred_len.log 
done