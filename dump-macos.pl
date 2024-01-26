#!/usr/local/bin/perl

use strict;
use DBI;

use strict;
use warnings;
# use Data::UUID;
# my $uuid = Data::UUID->new;


my $DBname = "$ENV{'HOME'}/Library/KeyboardServices/TextReplacements.db";
my $mdb = DBI->connect("dbi:SQLite:dbname=$DBname","","") or die("db errr $!\n");

if (0) {

my $sql = $mdb->prepare(" SELECT ZPHRASE, ZSHORTCUT, ZTIMESTAMP FROM ZTEXTREPLACEMENTENTRY ");
$sql->execute or die("db error $sql->errstr");

while (my $abb =  $sql->fetchrow_hashref ) {
     print "$abb->{ZPHRASE}\t$abb->{ZSHORTCUT}\t$abb->{ZTIMESTAMP}\n";
}

} else {
my $sql = $mdb->prepare(" SELECT ZPHRASE, ZSHORTCUT FROM ZTEXTREPLACEMENTENTRY ");
$sql->execute or die("db error $sql->errstr");

while (my $abb =  $sql->fetchrow_hashref ) {
     print "$abb->{ZPHRASE}\t$abb->{ZSHORTCUT}\n";
}
}

