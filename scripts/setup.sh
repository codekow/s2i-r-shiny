#!/bin/sh

GIT_REPO=https://github.com/rstudio/shiny-examples

# list of examples from 
LIST="001-hello
002-text
003-reactivity
004-mpg
005-sliders
006-tabsets
007-widgets
008-html
009-upload
010-download
011-timer
012-datatables
013-selectize
014-onflushed
015-layout-navbar
015-layout-sidebar
016-knitr-pdf
017-select-vs-selectize
018-datatable-options
019-mathjax
020-knit-html
021-selectize-plot
022-unicode-chinese
023-optgroup-server
024-optgroup-selectize
025-loop-ui
026-shiny-inline
027-absolutely-positioned-panels
028-actionbutton-demo
030-basic-datatable
032-client-data-and-query-string
033-conditionalpanel-demo
034-current-time
035-custom-input-bindings
036-custom-input-control
037-date-and-date-range
039-download-file
040-dynamic-clustering
041-dynamic-ui
047-image-output
048-including-html-text-and-markdown-files
049-isolate-demo
050-kmeans-example
051-movie-explorer
052-navbar-example
053-navlistpanel-example
054-nvd3-line-chart-output
055-observer-demo
057-plot-plus-three-columns
059-reactive-poll-and-file-reader
060-retirement-simulation
061-server-to-client-custom-messages
062-submitbutton-demo
063-superzip-example
064-telephones-by-region
065-update-input-demo
066-upload-file
067-vertical-layout
068-widget-action-button
069-widget-check-group
070-widget-checkbox
071-widget-date
072-widget-date-range
073-widget-file
074-widget-numeric
075-widget-radio
076-widget-select
077-widget-slider
078-widget-slider-range
079-widget-submit
080-widget-text
081-widgets-gallery
082-word-cloud
083-front-page
084-single-file
085-progress
086-bus-dashboard
087-crandash
088-action-pattern1
089-action-pattern2
090-action-pattern3
091-action-pattern4
092-action-pattern5
093-plot-interaction-basic
094-image-interaction-basic
095-plot-interaction-advanced
096-plot-interaction-article-1
097-plot-interaction-article-2
098-plot-interaction-article-3
099-plot-interaction-article-4
100-plot-interaction-article-5
101-plot-interaction-article-6
102-plot-interaction-article-7
103-plot-interaction-article-8
104-plot-interaction-select
105-plot-interaction-zoom
106-plot-interaction-exclude
107-events
108-module-output
109-render-table
110-error-sanitization
111-insert-ui
112-generate-report
113-bookmarking-url
114-modal-dialog
115-bookmarking-updatequerystring
116-notifications
117-shinythemes
118-highcharter-births
119-namespaced-conditionalpanel-demo
120-goog-index
121-async-timer
122-async-outputs
123-async-renderprint
124-async-download
125-async-req
126-async-ticks
127-async-flush
128-plot-dim-error
129-async-perf
130-output-null
131-renderplot-args
132-async-events
133-async-hold-inputs
134-async-hold-timers
135-bookmark-uioutput
136-plot-cache
137-plot-cache-key
138-icon-fontawesome
139-plot-brush-scaling
140-selectize-inputs
141-radiant
142-reactive-timer
143-async-plot-caching
144-colors
145-dt-replacedata
146-ames-explorer
147-websocket
148-addresourcepath-deleted
149-onRender
150-networkD3-sankey
151-reactr-input
152-set-reactivevalue
153-connection-header
154-index-html-server-r
155-index-html-app-r
156-subapps"

# LIST="079-widget-submit"

deploy_all_examples(){
  for i in $(echo $LIST) ; do
    CONTEXT_DIR=$i;
    NAME=$(echo $i | cut -d'-' -f2-)

    echo "Deploying: ${NAME}"

    oc new-app s2i-r-shiny~"${GIT_REPO}" \
      --context-dir="${CONTEXT_DIR}" \
      --name="shiny-${NAME}" \
      --strategy=source

    oc expose svc/"${NAME}" \
      --port 8080 \
      --overrides='{"spec":{"tls":{"termination":"edge"}}}'

  done;
}

deploy_all_examples
