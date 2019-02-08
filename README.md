# gba_lib_func_sig
Game Boy Advance Library Function Signature for Reverse Engineering

## Files Overview
This repository contains the following files:
* ```.pat``` - patterns extracted from library (text)
* ```.sig``` - compressed [FLIRT](https://www.hex-rays.com/products/ida/tech/flirt.shtml) signatures for IDA Pro and Radare2
* ```.yar``` - [YARA](https://virustotal.github.io/yara/) signatures for [RetDec Stacofin](https://retdec.com/static/publications/retdec-slides-recon-2018.pdf)
* ```.zig``` - [Zignatures](http://radare.today/posts/zignatures/) for Radare2 (deprecated)

## Make Signatures
1. Install [Flair](https://www.hex-rays.com/products/ida/support/download.shtml) and add executable file path to environment variable.
1. Put binary libraries to make signature (.a, .o)
1. ```$ make```

## Use Signatures
Read the manual of IDA Pro / Radare2 / RetDec.

## Library Infomation

|Library|Date|CRC32|
|---|---|---|
|libagbsyscall_2|2000/6/23|AD15CD0D|
|libisagbprn_2|1999/12/13|AD62B917|
|libagbbackup_3|2001/3/13|0D642AD0|
|libagbir_3|2001/3/15|907734B8|
|libagbsyscall_3|2000/12/9|E1C5F3E5|
|libisagbprn_3|2000/11/22|ED0F9A48|
|mks4agbLib_1.05|2001/2/17|E7512BCB|
|m4aLibOD1_1.05|2001/2/17|A6A210E0|
|m4aLibUSC|2001/2/17|5ECE90C6|
|libagbbackup_4|2002/11/15|645FE7ED|
|libagbir_4|2001/3/29|9D7165D1|
|libisagbprn_4|2002/11/14|105CE3DB|
|mks4agbLib_1.06a|2001/5/17|CA84F0BD|
|m4aLibOD1_1.06a|2001/5/17|D644BBB2|
|m4aLibUSC_1.06a|2001/9/12|8EECB2E5|
|libc|2000/5/13|6BF3B3EE|
|libgcc|2000/5/13|417E96AC|
|libc_agbcc|2019/2/8|E7E52AD5|
|libgcc_agbcc|2019/2/8|A0EA9223|
