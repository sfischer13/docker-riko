# *riko* Docker Image

Docker image for the [riko](https://github.com/nerevu/riko) stream processing engine.

## Credits

**Please read `riko`'s [license terms](https://github.com/nerevu/riko/blob/master/LICENSE) before using this Dockerfile.**

## Documentation

`riko` is well documented:

- [FAQ](https://github.com/nerevu/riko/blob/master/docs/FAQ.rst)
- [COOKBOOK](https://github.com/nerevu/riko/blob/master/docs/COOKBOOK.rst)
- [Tutorial](https://nbviewer.jupyter.org/github/aemreunal/riko-tutorial/blob/master/Tutorial.ipynb)
- [examples](https://nbviewer.jupyter.org/github/nerevu/riko/blob/master/examples/usage.ipynb)

## Usage

### Building

In order to build the image, you have to clone the repository.

``` shell
git clone https://github.com/sfischer13/docker-riko
cd docker-riko
```

Then, build the Docker image.
If you need additional Python packages for running your pipes, you should add them to `requirements.txt` before building the image.

``` shell
make build
```

### Running

Before you can use `riko`, you have to build the image as described above.

Pipeline files must be made accessible by using Docker [bind mounts](https://docs.docker.com/storage/bind-mounts/).

#### Testing an example pipeline

Run `demo.py` from [examples](https://github.com/nerevu/riko/tree/master/examples):

``` shell
docker run --rm -i \
sfischer13/riko:latest \
demo
```

#### Using current directory

This will start the container and mount the current directory into the container.
The pipeline definition, `mypipe.py`, has to be in this directory.

``` shell
docker run --rm -i \
--mount type=bind,source="$PWD",target=/home/docker/ \
sfischer13/riko:latest \
mypipe.py
```

You could also use the full path to `mypipe.py`:

``` shell
docker run --rm -i \
--mount type=bind,source="$PWD",target=/home/docker/ \
sfischer13/riko:latest \
/home/docker/mypipe.py
```


#### Miscellaneous commands

For an overview of the container files, run the following command:

``` shell
docker run --rm -i sfischer13/riko:latest --help
```

Open a shell within the container:

``` shell
docker run --rm -i -t sfischer13/riko:latest -- bash
```
