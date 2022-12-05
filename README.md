# Variant Calling

This project shows how to analyse Next-Generation Sequencing (NGS) data, specifically by genotyping-by-sequence (GBS) for Genome-Wide Association Studies (GWAS). The scripts below will follow a process starting from a FASTQ file to a VCF file showing all the single nucleotide polymorphisms (SNPs) for each chromosome in a genome. 

1. Demultiplexing 

The raw data produced from NGS comes in a single FASTQ file. The first step in the NGS analysis is to demultiplex the single FASTQ file into individual files based on the barcodes used in NGS. The script is __sabre.sh__. The requirements for the script to run are: the path for the output NGS FASTQ file, the barcode file, as well as installing the tool sabre and its path. The reference for installing Sabre can be found from the following link: https://github.com/najoshi/sabre. The result of running the script will produce individual FASTQ files for every barcode used.

2. Trimming 

Often, the components necessary for sequencing are still attached to the sequence data. In this case, the barcodes and adaptors are still connected to the raw data sequences. It is crucial to remove these as they are not part of the genomic sequence of the organism sequenced. This can be done by using the __cutad_for.sh__ script. The requirements for this script are the path of the individual FASTQ files. This script results in the format .fa.fastq files. An alternative script is __cutad_parallel.sh__ which completes the same task as the prior script, the only difference is that is works in parallels instead of loops for each file.

3. Mapping 

After demultiplexing and cleaning/trimming, the sequences are now ready to be aligned against a reference genome. The step in the process uses the __mapping.sh__ script. qng BWA installed. The result from running this script is that the file format changes to a SAM format (.fq.sam).

4.  Variant Calling Part 1

The final step in this GBS analysis is to execute the variant calling. The first part is to convert the SAM format to the BAM format. In this part, it requires the installation of SAMtools. This is completed using the __sam2bam.sh__ script. This script sorts the BAM files, then indexes them,and finally lists them with their respective path. The result of this multistep script is a bamlist. 

5. Variant Calling Part 2

The final part uses the bamlist created from the previous step and aligns with the reference genome to call all the variants present using SAMtools. The result is creates a file in the bcf format. The second function in the script __samt_var.sh__ uses BCFtools to convert the .bcf into a .vcf format. Both the path for the bamlist and the reference must be edited in the script, as well BCFtools must be installed for the script to run. The final end result is the variants.vcf file which gives information the chromosome and the position the SNPs occur, the quality, and the differences to the reference genome. 
