#!/usr/local/bin/perl

use strict;
use DBI;

use strict;
use warnings;
use Data::UUID;
use Time::HiRes qw(gettimeofday);

my $uuid = Data::UUID->new;

my $DBname = "$ENV{'HOME'}/Library/KeyboardServices/TextReplacements.db";
my $mdb = DBI->connect("dbi:SQLite:dbname=$DBname","","") or die("db errr $!\n");
my $time = unixDate2mac(gettimeofday);

if (1) {
    my $sql = $mdb->prepare("
        DELETE FROM ZTEXTREPLACEMENTENTRY;
    ");
    $sql->execute or die("db error $sql->errstr");
}

while(<>) {
     chop;
    if (/(.*)\t(.*)/) {
        my $unique_name = $uuid->create_str;
        my $word = $2;
        my $abrev = $1;
    my $sql = $mdb->prepare("
INSERT INTO ZTEXTREPLACEMENTENTRY (Z_PK, Z_ENT, Z_OPT, ZNEEDSSAVETOCLOUD, ZWASDELETED, ZTIMESTAMP, 
ZPHRASE, ZSHORTCUT, ZUNIQUENAME, ZREMOTERECORDINFO)
VALUES (NULL, 0, 1, 1, 0, '$time', '$abrev', '$word', '$unique_name', NULL);
        ");

    $sql->execute or die("db error $sql->errstr");
   }
}


sub unixDate2mac {
    my $unix = gettimeofday;
    return $unix - 978307200 ;
}


