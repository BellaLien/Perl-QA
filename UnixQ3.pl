#!/usr/bin/perl -w
# 連蔚瑄 s1042701
@list = quicksort(19, 23, 10, -10, 0, -30, 51);

foreach my $variable (@list) 
{
  print "$variable ";
}
print "\n";

sub quicksort {

  my @SortedList = @_;  # predefined list variable
  if($#SortedList < 1){ # SortedList的大小 < 1 則 return @SortedList
    return @SortedList;
  }

  my $PivotNum = pop(@SortedList); # pop @SortedList的最後一個數當 PivotNum 
  my @smaller; # < 中間值
  my @bigger;  # > 中間值

  foreach my $variable (@SortedList) {
    if ($variable < $PivotNum){ # 所有在pivot左邊的數，都比 PivotNum 還小
      push(@smaller, $variable);
    } else {
      push(@bigger, $variable); # 所有在pivot右邊的數，都比 PivotNum 還大
    }
  }

  # PivotNum 的左右邊當作新的 array，「分別」重複上述步驟 (選pivot、調整數列)，直到不用排序
  return quicksort(@smaller), $PivotNum, quicksort(@bigger); 
}

