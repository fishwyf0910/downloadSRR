#提交pbs作业报错，可在登陆节点跑

cd /data01/wangyf/project2

conda activate sratoolkit

prefetch SRR26304028 && fasterq-dump --threads 10 --split-3 ./1.SRRdata/SRR8380186/SRR8380186.sra -O ./SRR8380186
prefetch --option-file download.list --max-size 50G  # && fasterq-dump --threads 10 --split-3 ./1.SRRdata/SRR8380186/SRR8380186.sra -O ./SRR8380186
gzip SRR8380186_1.fastq && gzip SRR8380186_2.fastq


# 如果没有拆成两个文件，可尝试以下方法
fasterq-dump --threads $cpu --split-spot $filename -O $filename
seqkit split -p 2 --out-file $i/split --threads 30 $i/$i.fastq


'''
--split-spot: 将双端测序分为两份,但是都放在同一个文件中
--split-files: 将双端测序分为两份,放在不同的文件,但是对于一方有而一方没有的reads直接丢弃
--split-3 : 将双端测序分为两份,放在不同的文件,但是对于一方有而一方没有的reads会单独放在一个文件夹里

'''
