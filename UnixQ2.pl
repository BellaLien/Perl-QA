#!/usr/bin/perl -w
# 連蔚瑄 s1042701
my $string = $ARGV[0]; 

if ($string eq reverse $string) { # 使用 reverse 將字串翻轉比對確認字串是否為回文
    print "Palindrome\n";
} else {
    print "Not palindrome\n";
}