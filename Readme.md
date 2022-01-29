# LoFASM Tools Docker configuration

## Installation
To install simply navigate to the installation directory and run

``` sh
docker build -t lofasmtools .
```

## Run Docker Instance
To start the Docker instance and make use of the bundled tools on 
locally hosted data you will need to mount the local directory containing 
your dataset at runtime. 

``` sh
docker run -it -v </path/to/data/directory>:/root/data lofasmtools 
```

The above command will drop you in a bash shell. The following working Python3
tools are already in the path:
* `explorebbx2d`: plot _BBX_ files (_.bbx_ or _.bbx.gz_ formats)

The following Python3 tools are in the path but need to be fixed in the Docker installation:
* `lofasm_plot.py`: plot and animate filterbank files stored in the old _.lofasm_ (or _.lofasm.gz_) format
* `loco2bx.py`: convert _.lofasm_ and _.lofasm.gz_ files into BBX format (saved as _.bbx.gz_ files)

The following C/C++ tools are compiled and test working but not in the path:
* `lofasm2bbx`: convert _.lofasm_ and _.lofasm.gz_ files into BBX format. 
  - located at: /root/repos/lofasmio2/build/src/lofasm2bbx/lofasm2bbx
