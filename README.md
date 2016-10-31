# Data + Docker = Disconbobulating?

This repo contains setup and demo scripts for Steph Locke's **Data + Docker = Disconbobulating?** talk. Please feel free to fork it, play with it, and hopefully improve it! Pull Requests are welcome :)

## Setup
In the [`setup/`](./setup/) folder, code amended from an [earlier gist](https://gist.github.com/stephlocke/a02d7b8be42604e5b6bbd19d689ab28f) is used to perform setup on Azure. This is a preference not a requirement.

The [sample setup](./setup/sample-execution.sh) shows how you can pass a subscription ID and the name of a config file to the [docker machine setup](./setup/azure-docker-machine.sh). Obviously the sample doesn't work because it has dummy values in it! You'll need to amend with your own values.

You may need to perform a device authentication step, which is pretty simple.
![](./readme/executionprocess1.jpg)

Once completed, you may need to make the new machine the active docker-machine
```
eval $("C:\Program Files\Docker Toolbox\docker-machine.exe" env datadocker)
```

## Cleanup
The nice thing about using Azure and seperate docker-machine is how easy it is to trash it after you're done.

```
docker-machine rm datadocker
```