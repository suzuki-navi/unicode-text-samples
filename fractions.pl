use utf8;
use Encode;

%data = ();

$data{"1/4"} = "\x{00BC}";
$data{"1/2"} = "\x{00BD}";
$data{"3/4"} = "\x{00BE}";
$data{"1/7"} = "\x{2150}";
$data{"1/9"} = "\x{2151}";
$data{"1/10"} = "\x{2152}";
$data{"1/3"} = "\x{2153}";
$data{"2/3"} = "\x{2154}";
$data{"1/5"} = "\x{2155}";
$data{"2/5"} = "\x{2156}";
$data{"3/5"} = "\x{2157}";
$data{"4/5"} = "\x{2158}";
$data{"1/6"} = "\x{2159}";
$data{"5/6"} = "\x{215A}";
$data{"1/8"} = "\x{215B}";
$data{"3/8"} = "\x{215C}";
$data{"5/8"} = "\x{215D}";
$data{"7/8"} = "\x{215E}";
$data{"1/"} = "\x{215F}";
$data{"0/3"} = "\x{2189}";

print "Use U+002F\n";
for ($denominator = 2; $denominator <= 12; $denominator++) {
    print "  ";
    for ($numerator = 0; $numerator <= $denominator; $numerator++) {
        $output = "$numerator\x{002F}$denominator";
        print Encode::encode('UTF-8', "$output ");
    }
    print "\n";
}

print "Use U+2044\n";
for ($denominator = 2; $denominator <= 12; $denominator++) {
    print "  ";
    for ($numerator = 0; $numerator <= $denominator; $numerator++) {
        $output = "$numerator\x{2044}$denominator";
        print Encode::encode('UTF-8', "$output ");
    }
    print "\n";
}

print "Use precomposed characters if they are available\n";
for ($denominator = 2; $denominator <= 12; $denominator++) {
    print "  ";
    for ($numerator = 0; $numerator <= $denominator; $numerator++) {
        $key = "$numerator/$denominator";
        if (exists($data{$key})) {
            $output = $data{$key};
        } else {
            $output = "$numerator\x{2044}$denominator";
        }
        print Encode::encode('UTF-8', "$output ");
    }
    print "\n";
}

