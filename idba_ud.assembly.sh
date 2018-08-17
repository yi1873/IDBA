#!/bin/bash
# Author: xiang_zhi_@126.com
#Usage: bash idba_ud.assembly.sh -s sample -x < pair1 > -p < pair2 > -o < out path > <options>

while getopts "s:p:x:o:m:i:e:t:" opt;
do
        case $opt in
                s) sample=$OPTARG;;    # sample name
                x) pair1=$OPTARG;;
                p) pair2=$OPTARG;;
	        o) out_path=$OPTARG;;  # out path
                m) maxkmer=$OPTARG;;   # default: 100
                i) minkmer=$OPTARG;;   # default: 20
                e) step=$OPTARG;;      # default: 20
                t) cpu=$OPTARG;;

esac
done

mkdir -p $out_path/$sample
zcat $pair1 > $out_path/$sample/$sample\_1.fq
zcat $pair2 > $out_path/$sample/$sample\_2.fq
/idba/bin/fq2fa --merge --filter $out_path/$sample/$sample\_1.fq $out_path/$sample/$sample\_2.fq $out_path/$sample/$sample.reads.fa
/idba/bin/idba_ud -r $out_path/$sample/$sample.reads.fa -o $out_path/$sample --pre_correction --maxk $maxkmer --mink $minkmer --step $step --num_threads $cpu
