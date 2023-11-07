include { BCFTOOLS } from "./bcftools.nf"

workflow {
    BCFTOOLS().view()
}