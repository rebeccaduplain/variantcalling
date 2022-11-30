#!/bin/bash

DATA=/home/rebecca/BVG_7003/variantcalling/scripts/FC20150701_1.fq.gz
BARCODE=/home/rebecca/BVG_7003/variantcalling/scripts/FC20150701_1.txt
TOOL=/home/rebecca/sabre/sabre

exec &> sabre.log

$TOOL se -f $DATA -b $BARCODE -u unk.fastq
