#!/usr/bin/env nextflow
nextflow.enable.dsl=2 

process WAIT {
    input:
        val x
    
    output:
        stdout
    
    container 'docker.io/debian:stable-20230411-slim'
    
    script:
    """
    ${params.command}
    """
}

workflow {
    Channel.of(params.time) | WAIT | view
}