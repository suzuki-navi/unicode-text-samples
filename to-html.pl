use utf8;
use Encode;

print <<END_OF_HTML;
<!DOCTYPE html>
<html>
<body>
<div style="white-space:pre-wrap;">
END_OF_HTML

while (my $line = <STDIN>){
  print $line;
}

print <<END_OF_HTML;
</div>
</body>
</html>
END_OF_HTML

