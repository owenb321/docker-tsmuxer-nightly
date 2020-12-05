# tsMuxeR Nightly

Docker image for the nightly build of tsMuxeR.

Uses [jlesage/baseimage-gui](https://hub.docker.com/r/jlesage/baseimage-gui) for the base gui/vnc handling.

### Usage:
```
docker run -d \
    --name=tsmuxer \
    -p 5800:5800 \
    -v /docker/appdata/tsmuxer:/config:rw \
    -v $HOME:/storage:rw \
    owenb321/tsmuxer-nightly
```

The GUI will be available at `http://your-host-ip:5800`
More details on settings available in the [jlesage/baseimage-gui](https://hub.docker.com/r/jlesage/baseimage-gui) overview.