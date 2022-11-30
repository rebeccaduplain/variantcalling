#!/bin/bash


DATA=/home/rebecca/BVG_7003/variantcalling/scripts/bamlist
REF=/home/rebecca/BVG_7003/variantcalling/scripts/Gmax_275_v2.0.fa
OUT=variantcalling
CPU=4

mkdir results1
cd results1

exec &> samt_var.log

samtools mpileup -g -f $REF -b $DATA > variants.bcf

	if [ $? -ne 0 ]
                        then
                                printf "There is a problem at the samtools_mpileup step"
                                exit 1
                fi


bcftools call -mv variants.bcf > variants.vcf

	if [ $? -ne 0 ]
                        then
                                printf "There is a problem at the bcf2vcf step"
                                exit 1
                fi
