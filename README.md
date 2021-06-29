Security Protocol Analysis Tool
=============================
Prerequisites: Docker
Installation: docker-compose up
SPA Interface: http://localhost:3001

Or add the following service into your docker-compose file (in case you need integration with other services):

    spa:
        restart: always 
        build: .
        container_name: spa
        image: registry.sphinx-repo.intracom-telecom.com/sphinx-project/real-time-cyber-risk-assessment/spa
        image: spa
        ports:
            - 3001:3001
        expose:
            - 3001
        # user: root
        # priviledged: true
        # networks:
        #    - frontend
        working_dir: /tamarin-prover
        entrypoint: /bin/bash
        command: -c "/home/tamarin/.local/bin/tamarin-prover interactive . -i=*4"


Manual
------

The manual is available as PDF or HTML at https://tamarin-prover.github.io/manual/index.html

Experimental improved graph output
----------------------------------

You can use our experimental improved graph output which may be
helpful for very large graphs that can be created for complicated
protocols. To enable this feature read the instructions about
[improved graphs](/misc/cleandot/README.md).

Spthy code editors
------------------

The project contains support for spthy syntax highlighting and support
in the [etc](/etc/) directory. This includes support for [Sublime Text](/etc/SUBLIME_TEXT.md), [VIM](/etc/spthy.vim) and [Notepad++](/etc/notepad_plus_plus_spthy.xml).


Example Protocol Models
-----------------------

All example protocol models are found in the directory

    ./examples/

All models that we consider stable
are part of every installation of the Tamarin prover. See
`tamarin-prover.cabal` for the list of installed protocols. We use the
following sub-directories to organize the models.

~~~~
accountability/ case studies for our 'Automated Verification of Accountability in Security Protocols' paper.
csf12/         the AKE case studies from our CSF'12 paper.
classic/       classic security protocols like the ones from
               [SPORE](http://www.lsv.ens-cachan.fr/Software/spore/table.html)
loops/         experiments for testing loop-invariants and protocols with
               non-monotonic state
related_work/  examples from related work on protocols with loops or
               non-monotonic state
experiments/   all other experiments
ake/           more AKE examples including ID-based and tripartite group KE
               protocols based on bilinear pairing
features/      (small) models that demonstrate a given feature
ccs15/	       the observational equivalence case studies from our CCS'15 paper
csf-18/        the XOR case studies from the CSF'18 paper
~~~~

Feel free to add more sub-directories and describe them here.

In general, we try use descriptive names for files containing the models. We
also document all our findings as comments in the protocol model.  Moreover,
we use the following header in all files to make their context more explicit.

~~~~
/*
   Protocol:    Example
   Modeler:     Simon Meier, Benedikt Schmidt
   Date:        January 2012

   Status:      working

   Description of protocol.

*/
~~~~
