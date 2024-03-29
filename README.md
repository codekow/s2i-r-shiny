# R Shiny (RShiny) s2i image

[R](https://en.wikipedia.org/wiki/R_(programming_language)) is a programming language for statistical computing and graphics. Created by statisticians and is used among data miners, bioinformaticians and statisticians for data analysis and developing statistical software. Users have created packages to augment the functions of the R language.

The official [R](https://en.wikipedia.org/wiki/R_(programming_language)) software environment is an open-source [free software](https://en.wikipedia.org/wiki/Free_software) environment within the GNU package, available under the [GNU General Public License](https://en.wikipedia.org/wiki/GNU_General_Public_License). It is written primarily in C, Fortran, and R itself.

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
- `setup.R` - Can be used to run `R` to setup your application (optional: example installs `rmarkdown`)
- `.s2i/assemble` - Standard s2i assemble override (optional)
- `.s2i/run` -  Standard s2i run override (optional)

### Build w/ `setup.R`

```
oc new-app s2i-r-shiny~https://github.com/codekow/s2i-r-shiny.git \
    --context-dir=example/app \
    --name=shiny-test \
    --labels examples=shiny \
    --strategy=source

oc expose svc/shiny-test \
  --labels examples=shiny \
  --port 8080 \
  --overrides='{"spec":{"tls":{"termination":"edge"}}}'
```

### Build from GitHub

```
oc new-app s2i-r-shiny~https://github.com/rstudio/shiny-examples \
    --context-dir=001-hello \
    --name=shiny-hello \
    --labels examples=shiny \
    --strategy=source

oc expose svc/shiny-hello \
  --labels examples=shiny \
  --port 8080 \
  --overrides='{"spec":{"tls":{"termination":"edge"}}}'
```

## Build all examples

```
scripts/examples.sh
```

## Clean Up

```
oc delete all -l example=shiny
```

## Links

- [R Docker - Rocker 2](https://github.com/rocker-org/rocker-versioned2)
- [R Shiny - examples](https://github.com/rstudio/shiny-examples)

### Misc links

- [R Packages Info](https://cran.rstudio.com/bin/linux/redhat)
- [s2i for R Shiny - example](https://examples.openshift.pub/build/s2i-r-shiny)
- https://cran.r-project.org/web/packages/available_packages_by_name.html
- https://github.com/DFEAGILEDEVOPS/s2i-rshiny
- https://stackoverflow.com/questions/65110578/run-shiny-applications-on-openshift-online-using-custom-images
- https://www.r-bloggers.com/2011/11/permanently-setting-the-cran-repository/
- https://github.com/analythium/covidapp-shiny
- https://www.r-bloggers.com/2020/01/an-efficient-way-to-install-and-load-r-packages
