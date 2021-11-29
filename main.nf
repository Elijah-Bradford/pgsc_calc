#!/usr/bin/env nextflow
/*
========================================================================================
    nf-core/pgscalc
========================================================================================
    Github : https://github.com/nf-core/pgscalc
    Website: https://nf-co.re/pgscalc
    Slack  : https://nfcore.slack.com/channels/pgscalc
----------------------------------------------------------------------------------------
*/

nextflow.enable.dsl = 2

/*
========================================================================================
    GENOME PARAMETER VALUES
========================================================================================
*/


/*
========================================================================================
    VALIDATE & PRINT PARAMETER SUMMARY
========================================================================================
*/

WorkflowMain.initialise(workflow, params, log)

/*
========================================================================================
    NAMED WORKFLOW FOR PIPELINE
========================================================================================
*/

include { PGSCALC } from './workflows/pgscalc'

//
// WORKFLOW: Run main nf-core/pgscalc analysis pipeline
//
workflow PGSC_CALC {
    PGSCALC ()
}

/*
========================================================================================
    RUN ALL WORKFLOWS
========================================================================================
*/

//
// WORKFLOW: Execute a single named workflow for the pipeline
// See: https://github.com/nf-core/rnaseq/issues/619
//
workflow {
    PGSC_CALC ()
}

/*
========================================================================================
    THE END
========================================================================================
*/
