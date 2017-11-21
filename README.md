# mpf

This is a image for the Mission Pinball Framework. 
 Containers allow us to just run (and skip installation steps.) 
 They can also be platform agnostic.

> [github.com/missionpinball](https://github.com/missionpinball/)


## Quickstart: Buildah
```console
$ sudo dnf install -y buildah
$ git clone https://github.com/shrmpy/mpf $HOME/mpf
$ cd $HOME/mpf
$ sudo buildah bud -t mpf .
$ sudo buildah from mpf
$ sudo buildah run mpf-working-container --tty 
```

Then from your vnc client, connect to port 5900 with "secret"
```console
$ vncviewer localhost:5900
```

You will see the desktop from the DWM window manager. Use alt-p stterm 
to launch a terminal. At this point, you can run an example by following the
 [Demo Man steps](http://docs.missionpinball.org/en/latest/example_games/demo_man.html)


## Quickstart: Docker
```console
$ git clone https://github.com/shrmpy/mpf $HOME/mpf
$ cd $HOME/mpf
$ docker build -t mpf .
$ docker run -it --rm mpf
```




## Credits
More on the Buildah OCI tool can be found at
 [Project Atomic](https://github.com/projectatomic/buildah/)

Mission Pinball Framework are by
 [The Mission Pinball Framework team](https://missionpinball.org/about.html)
 [(LICENSE)](https://github.com/missionpinball/mpf/blob/dev/LICENSE.md)
