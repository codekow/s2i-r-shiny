# R Shiny (RShiny) s2i image

[Source-to-Image s2i](https://docs.openshift.com/container-platform/3.6/architecture/core_concepts/builds_and_image_streams.html#source-build) is a framework that takes application source code as an input and produces a new image that runs the assembled application as output. Openshift builds can be triggered if either the code changes or the s2i builder image is updated.

## OpenShift Examples

### Create Builder Image

```sh
oc new-build \
  https://github.com/codekow/s2i-r-shiny.git \
  --name s2i-r-shiny \
  --context-dir container

oc logs bc/s2i-r-shiny \
  --follow  
```

### Build New App

You can look in [example/app](example/app) of this repo to create an example app.

File List:

- `app.R` or `server.R` - This is your primary application (required)
- `setup.R` - Can be used to run `R` to setup your application (optional: example installs `tm`)
- `.s2i/assemble` - Standard s2i assemble override (optional)
- `.s2i/run` -  Standard s2i run override (optional)

```
# example
oc new-app s2i-r-shiny~https://github.com/codekow/s2i-r-shiny.git \
    --context-dir=example/app \
    --name=shiny-test \
    --strategy=source

oc expose svc/shiny-test \
  --port 8080 \
  --overrides='{"spec":{"tls":{"termination":"edge"}}}'
```

```
# github
oc new-app s2i-r-shiny~https://github.com/rstudio/shiny-examples \
    --context-dir=001-hello \
    --name=shiny-hello \
    --strategy=source

oc expose svc/shiny-hello \
  --port 8080 \
  --overrides='{"spec":{"tls":{"termination":"edge"}}}'
```

## Clean Up

```sh
oc delete all -l app=shiny-hello
oc delete all -l app=shiny-test
```

## Links

- [R Packages Info](https://cran.rstudio.com/bin/linux/redhat)
- [s2i for R shiny](https://examples.openshift.pub/build/s2i-r-shiny/)
- [R Docker - Rocker 2](https://github.com/rocker-org/rocker-versioned2)
- https://github.com/DFEAGILEDEVOPS/s2i-rshiny
- https://stackoverflow.com/questions/65110578/run-shiny-applications-on-openshift-online-using-custom-images
- https://www.r-bloggers.com/2011/11/permanently-setting-the-cran-repository/
- https://github.com/rstudio/shiny-examples/
- https://github.com/analythium/covidapp-shiny
