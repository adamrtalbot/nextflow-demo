#!/usr/bin/env nextflow
nextflow.enable.dsl=2 

process WAIT {
    input:
        val x
    
    output:
        stdout
    
    script:
    """
    ${params.command}
    """
}

workflow {
    Channel.of(params.time) | WAIT | view
}