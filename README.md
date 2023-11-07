# nf-dynamic-containers
A script to dynamically fetch conda packages/containers from bioconda/biocontainers for nextflow pipelines

This is a pretty barebones implementation that can be improved a lot if there is interest for it (maybe even make it a plugin, who knows :wink:)

WARNING: This script currently only works when you have an internet connection. I could look into adding offline support if there is interest in this.
WARNING: This script currently only works with `conda`, `docker` and `singularity` containers.

## Usage
Simply copy/paste the [lib/DynamicContainers.groovy](lib/DynamicContainers.groovy) in the `lib/` folder of your pipeline and add the following code to your process definition:

```groovy
conda "${ DynamicContainers.findLatest('<tool_name>', '<version>', 'conda') }"
container "${ DynamicContainers.findLatest('<tool_name>', <version>', workflow.containerEngine) }"
```

WARNING: This won't work in a config file since the `lib/` scripts are only accessible in the `*.nf` files.

## Test

To test this script, you can run the following command:

```bash
nextflow run nvnieuwk/nf-dynamic-containers -r main -profile <conda/docker/singularity>
```

By changing the `--version` parameter you can change the `bcftools` version in this example.

