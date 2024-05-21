# edc_docker

## Usage

### 1. HuggingFaceからモデルを取得する場合

HuggingFaceのアカウントを作成、トークンを作成する。

### 2. Docker実行

ホスト側のターミナルで以下実行。
```
git clone https://github.com/iuill/edc_docker.git
cd ./edc_docker
docker build -t edc_docker .
docker run -it --gpus all --name edc_docker edc_docker
```

コンテナ内で以下コマンドを入力し、Tokenを登録。
```
huggingface-cli login
```

### 3. 実行

README.mdを参考に実行する。  
https://github.com/clear-nus/edc/blob/main/README.md

{oie_llm}や{dataset}は適宜置き換える。

実行サンプル
```
python run.py \
    --oie_llm mistralai/Mistral-7B-Instruct-v0.2 \
    --oie_few_shot_example_file_path ./few_shot_examples/webnlg/oie_few_shot_examples.txt \
    --sd_llm gpt-3.5-turbo \
    --sd_few_shot_example_file_path ./few_shot_examples/webnlg/sd_few_shot_examples.txt \
    --sc_llm gpt-3.5-turbo \
    --input_text_file_path ./datasets/webnlg.txt \
    --enrich_schema \
    --output_dir ./output/webnlg_self_canonicalization
```
