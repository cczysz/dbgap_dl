# Processing sra downloads

The `prefetch` utility downloads `.sra` files into the dbGaP project directory.

After downloading, the SRA Toolkit provides other tools to convert this format into bioinformatics formats, including fast(q/a) and SAM.

## Background

Two files are downloaded for each sample: an `sra` file and `sra.vbdcache` file. Example:

```
-rw-r--r-- 1 cczysz cczysz 3172424864 Oct  5  2014 SRR1090791.sra
-rw-rw-r-- 1 cczysz cczysz  144198176 Aug 30 18:56 SRR1090791.sra.vdbcache
```

While a file is downloading, a `.lock` file exists.

`-rw-rw-r-- 1 cczysz cczysz          0 Aug 30 19:18 SRR1490246.sra.vdbcache.lock`

The file name of these files can be given as an argument to the file conversion utilities:

`./fastq-dump SRR1090791`

## Suggested Workflow

Get all SRR* ids in the current directory and group into groups of 8.

For each group of 8, test to make sure none of the ids are being downloaded by checking for `.lock` file.

Extract each file into two gzipped fastq files (paired-end):

`fastq-dump -I --split-files --gzip <SRR>`

This outputs two files named `<SRR>.fastq.1.gz` #check
