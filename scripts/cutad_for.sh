#!/bin/bash
cd FC20150701_1_BC20.fq
ADAP=AGATCGGAA
exec &> cutadapt.log
for i in *.fq;
	do
		cutadapt -a $ADAP -o $i.fastq $i
	done

