process BCFTOOLS {
    tag "${params.version}"

    conda "${ DynamicContainers.findLatest('bcftools', params.version, 'conda') }"
    container "${ DynamicContainers.findLatest('bcftools', params.version, workflow.containerEngine) }"

    output:
    stdout

    script:
    """
    bcftools --version
    """
}