#!/usr/bin/perl -w
# 連蔚瑄 s1042701
open(DAT,"census.txt") || die "Could not open the file";
my @line;
my @newArray;

$i = 0;
while(<DAT>){
    @line = split(/\t/,$_); # County name, population, water area, land area 

    $newArray[$i][0] = $line[0]; # County name
    $newArray[$i][1] = ($line[1]/$line[3]); # population per square mile of land
    $newArray[$i][2] = ($line[2]/($line[2]+$line[3])); # percentage of the county that is water.

    print "$newArray[$i][0]\t$newArray[$i][1]\t$newArray[$i][2]\n"; 
    $i++;
}

print "--------------------------------------- \n";

$HPDtmp = $newArray[0][1]; # 設row0為初始值
$LPDtmp = $newArray[0][1]; # 設row0為初始值
$HPWtmp = $newArray[0][2]; # 設row0為初始值
$LPWtmp = $newArray[0][2]; # 設row0為初始值

# position
$HPD = 0; # Highest population density
$LPD = 0; # Lowest population density
$HPW = 0; # Highest percentage of water
$LPW = 0; # Lowest percentage of water

for ($ii=1; $ii < $i; $ii++){

	# population density
	if ($newArray[$ii][1] > $HPDtmp){ # 若目前的值 > 暫存值，則將位置記錄下來
		$HPD = $ii;					
		$HPDtmp = $newArray[$ii][1];
	}elsif ($newArray[$ii][1] < $LPDtmp){ # 若目前的值 < 暫存值，則將位置記錄下來
		$LPD = $ii;
		$LPDtmp = $newArray[$ii][1];
	}

	# percentage of water
	if ($newArray[$ii][2] > $HPWtmp){
		$HPW = $ii;
		$HPWtmp = $newArray[$ii][2];
	}elsif ($newArray[$ii][2] < $LPWtmp){
		$LPW = $ii;
		$LPWtmp = $newArray[$ii][2];
	}
 }

print "Highest population density: $newArray[$HPD][0]\n";
print "Lowest population density: $newArray[$LPD][0]\n";
print "Highest percentage of water: $newArray[$HPW][0]\n";
print "Lowest percentage of water: $newArray[$LPW][0]\n";
