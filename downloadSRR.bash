#不能提交pbs作业，在登陆界面跑

cd /data01/wangyf/project2

conda activate sratoolkit

prefetch SRR26304028 && fasterq-dump --threads 10 --split-3 ./1.SRRdata/SRR8380186/SRR8380186.sra -O ./SRR8380186
gzip SRR8380186_1.fastq && gzip SRR8380186_2.fastq
