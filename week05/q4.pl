#!/usr/bin/perl/
#Question 4: Design a data model for a database of mRNA expression levels. It should be fully normalized

use strict;
use warnings;

use DBIx::DataModel - compatibility => 1.0;
use DBIx::DataModel -> Schema ('My::Schema');

My::Schema-> Table(qw/Gene_Name G_Name gene_id/)
          -> Table (qw/Organism Org_Name org_id/)
          -> Table (qw/Gene_seq G_Seq seq_id/)
          -> Table (qw/Tissue_type T_type type_id/)
          -> Table (qw/Exp_level E_Level lev_id/)
          -> Table (qw/start_codon S_codon start_id/)
          -> Table (qw/Stop_codon Sp_codon stop_id/)
exit();

