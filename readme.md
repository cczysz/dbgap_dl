# dbGaP download and decryption of GTEx data

## Download and set up SRA Toolkit

```
wget -O ~/sratoolkit.current-centos_linux64 ftp://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/current/sratoolkit.current-centos_linux64.tar.gz
tar xvf sratoolkit.current-centos_linux64.tar.gz
```

Ensure you have the repository key (\*.ngc) downloaded to the server.

## VDB Config

Run the vdb-config setup

```
./sratoolkit.current-centos_linux64/bin/vdb-config -i
```

This will start a curses GUI.

### Recommended Settings

Make sure 1 and 2 are checked

4: Navigate to key. First, navigate to the directory, then hit tab and select the file.

5: If necessary, change the download directory (to /data, maybe)

After importing the key, you can change the repo directory.

This directory can be separate from the actual download directory, but the decrypt command is run from this one.

## Download and set-up Aspera

```
wget http://download.asperasoft.com/download/sw/connect/3.6.2/aspera-connect-3.6.2.117442-linux-64.tar.gz
tar xvf aspera-connect-3.6.2.117442-linux-64.tar.gz
./aspera-connect-3.6.2.117442-linux-64.sh
```

This installs the binaries to `~/.aspera/connect/bin` and the ssh keys to `~/.aspera/connect/etc`.

## Run ascp to download files

Copy the entire string from the email to a file and run the `parse_dl_file.sh` script.

```
echo "$string" > dl_string.txt
sh parse_dl_file.sh dl_string.txt
```

This downloads the files to a directory in `/data` named after the download ID.

## Descrypt the downloaded files

Navigate to the dbGaP project directory, not the downloaded files directory.

Run the vdb-decrypt script from the project directory, passing the location of the downloaded files.

`/path/to/vdb-decrypt /data/$dl_id`

This decrypts the files within the download directory.
