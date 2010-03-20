#! /usr/bin/env perl
$name = $ARGV[0];
$name =~ s/^bench-(.*)\.txt$/$1/;

%count = ();
%sum = ();
$s = 0;
while(<>) {
    if(/^(user|sys)\s+(\d+)m([0-9.]+)s/) {
        $s += ($2 * 60 + $3);
    }
    if (/^sys/) {
        $sum{$1} += $s;
        $count{$1} += 1;
        if (!$min{$1} || $s < $min{$1}) {
            $min{$1} = $s;
        }
        if (!$max{$1} || $s < $max{$1}) {
            $max{$1} = $s;
        }
        $s = 0;
    }
}

foreach $k (keys(%sum)) {
    $avg = $sum{$k}/$count{$k};
    $dev1 = abs($avg - $min{$k});
    $dev2 = abs($avg - $max{$k});
    $dev = ($dev1 > $dev2 ? $dev1 : $dev2);
    printf("%10s: %6.1f ±%.1f\n", $name, $avg, $dev);
}