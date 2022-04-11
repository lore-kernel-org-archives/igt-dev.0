Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D057510E633
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Apr 2022 13:15:27 +0000 (UTC)
Message-ID: <669eb789-0e93-9585-15a0-f9fb0cf0fcd3@intel.com>
Date: Mon, 11 Apr 2022 15:15:19 +0200
Content-Language: en-US
References: <20220404062642.378928-1-mauro.chehab@linux.intel.com>
 <20220404062642.378928-13-mauro.chehab@linux.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
In-Reply-To: <20220404062642.378928-13-mauro.chehab@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 12/12] code_cov_parse_info: add support for
 generating html reports
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>, igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
Cc: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>



On 04.04.2022 08:26, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
>
> While lcov has already its own report generator, it is interesting
> to be able to deal with multiple files exposing each input in
> separate.
>
> So, add new command line parameters to allow it to generate html
> reports. Also add some command lines to setup html title, add a
> css file and include a prolog/epilog at the html body.
>
> The title option can also be useful to rename the titles when
> merging multiple info files.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>   scripts/code_cov_parse_info | 438 +++++++++++++++++++++++++++++++-----
>   1 file changed, 386 insertions(+), 52 deletions(-)
>
> diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
> index 9624dc33468d..faa585ae5b18 100755
> --- a/scripts/code_cov_parse_info
> +++ b/scripts/code_cov_parse_info
> @@ -9,6 +9,8 @@ use Pod::Man;
>   
>   my $prefix = qr ".*?(linux)\w*/";
>   
> +my $title = "";
> +
>   my %used_func;
>   my %all_func;
>   my %all_branch;
> @@ -307,8 +309,12 @@ sub write_filtered_file($)
>   
>   	my $filtered = "";
>   
> -	foreach my $testname(sort keys %test_names) {
> -		$filtered .= "TN:$testname\n";
> +	if ($title eq "") {
> +		foreach my $testname(sort keys %test_names) {
> +			$filtered .= "TN:$testname\n";
> +		}
> +	} else {
> +		$filtered .= "TN:$title\n";
>   	}
>   
>   	# Generates filtered data
> @@ -416,71 +422,331 @@ sub print_code_coverage($$$)
>   	}
>   }
>   
> -sub print_summary()
> +my %stats;
> +
> +sub gen_stats()
>   {
> -	# Output per-line coverage statistics
> -	my $line_count = 0;
> -	my $line_reached = 0;
> +	# per-line coverage statistics
> +	$stats{"line_count"} = 0;
> +	$stats{"line_reached"} = 0;
>   
>   	foreach my $source (keys(%all_line)) {
>   		next if (!$used_source{$source});
>   
>   		foreach my $where (keys(%{$all_line{$source}})) {
> -			$line_count++;
> -			$line_reached++ if ($all_line{$source}{$where} != 0);
> +			$stats{"line_count"}++;
> +			$stats{"line_reached"}++ if ($all_line{$source}{$where} != 0);
>   		}
>   	}
> -	if ($line_count) {
> -		my $percent = 100. * $line_reached / $line_count;
> -		printf "  lines......: %.1f%% (%d of %d lines)\n",
> -			$percent, $line_reached, $line_count;
> -	} else {
> -		print "No line coverage data.\n";
> -	}
>   
> -	# Output per-function coverage statistics
> -	my $func_count = 0;
> -	my $func_used = 0;
> +	# per-function coverage statistics
> +	$stats{"func_count"} = 0;
> +	$stats{"func_used"} = 0;
>   
>   	foreach my $func (keys(%all_func)) {
>   		foreach my $file (keys(%{$all_func{$func}})) {
> -			$func_count++;
> +			$stats{"func_count"}++;
>   			if ($used_func{$func}) {
>   				if ($used_func{$func}->{$file}) {
> -					$func_used++;
> +					$stats{"func_used"}++;
>   				}
>   			}
>   		}
>   	}
>   
> -	if ($func_count) {
> -		my $percent = 100. * $func_used / $func_count;
> +	# per-branch coverage statistics
> +	$stats{"branch_count"} = 0;
> +	$stats{"branch_reached"} = 0;
> +
> +	foreach my $source (keys(%all_branch)) {
> +		next if (!$used_source{$source});
> +
> +		foreach my $where (keys(%{$all_branch{$source}})) {
> +			$stats{"branch_count"}++;
> +			$stats{"branch_reached"}++ if ($all_branch{$source}{$where} != 0);
> +		}
> +	}
> +
> +	# per-file coverage stats
> +	$stats{"all_files"} = scalar keys(%files);
> +	$stats{"filtered_files"} = scalar keys(%record);
> +	$stats{"used_files"} = scalar keys(%used_source);
> +}
> +
> +sub print_summary()
> +{
> +	if ($stats{"line_count"}) {
> +		my $percent = 100. * $stats{"line_reached"} / $stats{"line_count"};
> +		printf "  lines......: %.1f%% (%d of %d lines)\n",
> +			$percent, $stats{"line_reached"}, $stats{"line_count"};
> +	} else {
> +		print "No line coverage data.\n";
> +	}
> +
> +	if ($stats{"func_count"}) {
> +		my $percent = 100. * $stats{"func_used"} / $stats{"func_count"};
>   		printf "  functions..: %.1f%% (%d of %d functions)\n",
> -			$percent, $func_used, $func_count;
> +			$percent, $stats{"func_used"}, $stats{"func_count"};
>   	} else {
>   		print "No functions reported. Wrong filters?\n";
>   		return;
>   	}
>   
> -	# Output per-branch coverage statistics
> -	my $branch_count = 0;
> -	my $branch_reached = 0;
> +	if ($stats{"branch_count"}) {
> +		my $percent = 100. * $stats{"branch_reached"} / $stats{"branch_count"};
> +		printf "  branches...: %.1f%% (%d of %d branches)\n",
> +			$percent, $stats{"branch_reached"}, $stats{"branch_count"};
> +	} else {
> +		print "No branch coverage data.\n";
> +	}
> +}
>   
> -	foreach my $source (keys(%all_branch)) {
> -		next if (!$used_source{$source});
> +my $gen_report;
> +my $css_file;
> +my $html_prolog;
> +my $html_epilog;
> +my %report;
>   
> -		foreach my $where (keys(%{$all_branch{$source}})) {
> -			$branch_count++;
> -			$branch_reached++ if ($all_branch{$source}{$where} != 0);
> +sub generate_report()
> +{
> +	my $percent;
> +	my $prolog = "";
> +	my $epilog = "";
> +	my @info_files = sort(keys %report);
> +
> +	$title = "Code coverage results" if ($title eq "");
> +
> +	if ($html_prolog) {
> +		open IN, $html_prolog or die "Can't open prolog file";
> +		$prolog .= $_ while (<IN>);
> +		close IN;
> +	}
> +
> +	if ($html_prolog) {

$html_epilog



> +		open IN, $html_epilog or die "Can't open epilog file";
> +		$epilog .= $_ while (<IN>);
> +		close IN;
> +	}
> +
> +	# Re-generate the hashes used to report stats in order to procuce the
> +	# Total results
> +
> +	%used_func = ();
> +	%all_func = ();
> +	%all_branch = ();
> +	%all_line = ();
> +	%used_source = ();
> +	%files = ();
> +	%test_names = ();
> +
> +	foreach my $f (@info_files) {
> +		foreach my $source (keys(%{$report{$f}{"all_line"}})) {
> +			$used_source{$source} = 1 if ($report{$f}{"used_source"});
> +			foreach my $where (keys(%{$report{$f}{"all_line"}{$source}})) {
> +				$all_line{$source}{$where} += $report{$f}{"all_line"}{$source}{$where};
> +			}
> +		}
> +		foreach my $func (keys(%{$report{$f}{"all_func"}})) {
> +			foreach my $file (keys(%{$report{$f}{"all_func"}{$func}})) {
> +				$all_func{$func}{$file}->{ln} = $report{$f}{"all_func"}{$func}{$file}->{ln};
> +				$used_func{$func}->{$file} = 1 if ($report{$f}{"used_func"}{$func}->{$file});
> +			}
> +		}
> +		foreach my $source (keys(%{$report{$f}{"all_branch"}})) {
> +			foreach my $where (keys(%{$report{$f}{"all_branch"}{$source}})) {
> +				$all_branch{$source}{"$where"} += $report{$f}{"all_branch"}{$source}{$where};
> +			}
> +		}
> +		for my $source(keys(%{$report{$f}{"files"}})) {
> +			$files{$source} = 1;
> +			$used_source{$source} = 1 if ($report{$f}{"used_source"}{$source});
> +		}
> +		for my $test(keys(%{$report{$f}{"test_names"}})) {
> +			$test_names{$test} = 1;
>   		}
>   	}
> -	if ($branch_count) {
> -		my $percent = 100. * $branch_reached / $branch_count;
> -		printf "  branches...: %.1f%% (%d of %d branches)\n",
> -			$percent, $branch_reached, $branch_count;
> +	gen_stats();
> +
> +	# Colors for the html output
> +
> +	my $red    = "style=\"background-color:#ffb3b3\"";
> +	my $yellow = "style=\"background-color:#ffffb3\"";
> +	my $green  = "style=\"background-color:#d9ffd9\"";
> +
> +	# Open report file
> +
> +	open OUT, ">$gen_report" or die "Can't open $gen_report";
> +
> +	print OUT "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">\n";
> +
> +	print OUT "<html lang=\"en\">\n\n";
> +	print OUT "<head>\n";
> +	print OUT "  <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n";
> +	print OUT "  <title>$title</title>\n";
> +	print OUT "  <link rel=\"stylesheet\" type=\"text/css\" href=\"$css_file\">\n" if ($css_file);
> +	print OUT "</head>\n\n<body>\n$prolog";
> +
> +	print OUT "  <h1>$title</h1>\n";
> +
> +	print OUT "  <h2>Summary</h2>\n";
> +	# Generates a table containing the code coverage statistics per input
> +
> +	print OUT "<table width=\"100%\" border=1 cellspacing=0 cellpadding=0>\n  <tr>\n";
> +	print OUT "    <th></th>\n";
> +	foreach my $f (@info_files) {
> +		print OUT "    <th>$f</th>\n";
> +	}
> +	print OUT "    <th>TOTAL</th>\n";
> +	print OUT "    <th>Total count</th>\n";
> +	print OUT "  </tr><tr>\n";
> +
> +	print OUT "    <td><b>Functions</b></td>\n";
> +	foreach my $f (@info_files) {
> +		my %st = %{$report{$f}{"stats"}};
> +		if ($st{"func_count"}) {
> +			$percent = 100. * $st{"func_used"} / $st{"func_count"};
> +
> +			printf OUT "    <td>%.1f%%</td>\n", $percent;
> +		} else {
> +			print OUT "    <td>N. A.</td>\n";
> +		}
> +	}
> +	if ($stats{"func_count"}) {
> +		$percent = 100. * $stats{"func_used"} / $stats{"func_count"};
> +
> +		printf OUT "    <td>%.1f%%</td>\n", $percent;
>   	} else {
> -		print "No branch coverage data.\n";
> +		print OUT "    <td>N. A.</td>\n";
> +	}
> +	print OUT "  <td>" . $stats{"func_count"} . "</td>";
> +	print OUT "  </tr><tr>\n";
> +
> +	print OUT "    <td><b>Branches</b></td>\n";
> +	foreach my $f (@info_files) {
> +		my %st = %{$report{$f}{"stats"}};
> +		if ($st{"branch_count"}) {
> +			$percent = 100. * $st{"branch_reached"} / $st{"branch_count"};
> +
> +			printf OUT "    <td>%.1f%%</td>\n", $percent;
> +		} else {
> +			print OUT "    <td>N. A.</td>\n";
> +		}
> +	}
> +	if ($stats{"branch_count"}) {
> +		$percent = 100. * $stats{"branch_reached"} / $stats{"branch_count"};
> +
> +		printf OUT "    <td>%.1f%%</td>\n", $percent;
> +	} else {
> +		print OUT "    <td>N. A.</td>\n";
> +	}
> +	print OUT "  <td>" . $stats{"branch_count"} . "</td>";
> +	print OUT "  </tr><tr>\n";
> +
> +	print OUT "    <td><b>Lines</b></td>\n";
> +	foreach my $f (@info_files) {
> +		my %st = %{$report{$f}{"stats"}};
> +
> +		if ($st{"line_count"}) {
> +			$percent = 100. * $st{"line_reached"} / $st{"line_count"};
> +
> +			printf OUT "    <td>%.1f%%</td>\n", $percent;
> +		} else {
> +			print OUT "    <td>N. A.</td>\n";
> +		}
> +	}
> +	if ($stats{"line_count"}) {
> +		$percent = 100. * $stats{"line_reached"} / $stats{"line_count"};
> +
> +		printf OUT "    <td>%.1f%%</td>\n", $percent;
> +	} else {
> +		print OUT "    <td>N. A.</td>\n";
> +	}
> +	print OUT "  <td>" . $stats{"line_count"} . "</td>";
> +
> +	# If there are more than one tests per file, report them
> +	my $total = scalar(keys %test_names);
> +	if ($total > 1) {
> +		print OUT "  </tr><tr>\n";
> +		print OUT "    <td><b>Number of tests</b></td>\n";
> +		foreach my $f (@info_files) {
> +			my $count = scalar(keys %{$report{$f}{"test_names"}});
> +
> +			if ($count == 0) {
> +				print OUT "    <td $red>$count</td>\n";
> +			} elsif ($count < $total) {
> +				print OUT "    <td $yellow>$count</td>\n";
> +			} else {
> +				print OUT "    <td $green>$count</td>\n";
> +			}
> +		}
> +		print OUT "    <td $green\>$total</td>\n";
> +
> +	}
> +	print OUT "  </tr>\n</table><p/>\n\n";
> +
> +	if ($total > 1) {
> +		print OUT "<h2>Tests coverage</h2>\n";
> +
> +		print OUT "<table width=\"100%\" border=1 cellspacing=0 cellpadding=0>\n  <tr>\n";
> +		print OUT "    <th>Test name</th>\n";
> +		foreach my $f (@info_files) {
> +			print OUT "    <th>$f</th>\n";
> +		}
> +
> +		foreach my $t (sort keys(%test_names)) {
> +			print OUT "  </tr><tr>\n";
> +			printf OUT "    <td>%s</td>\n", $t;
> +			foreach my $f (@info_files) {
> +				if (%{$report{$f}{"test_names"}}{$t}) {
> +					print OUT "    <td $green>YES</td>\n";
> +				} else {
> +					print OUT "    <td $red>NO</td>\n";
> +				}
> +			}
> +		}
> +		print OUT "</tr></table>\n";
>   	}
> +
> +
> +	# Generates a table containing per-function detailed data
> +
> +	print OUT "<h2>Functions coverage</h2>\n";
> +	print OUT "<table width=\"100%\" border=1 cellspacing=0 cellpadding=0>\n  <tr>\n";
> +	print OUT "    <th>Function</th>\n";
> +	print OUT "    <th>Used?</th>\n";
> +	foreach my $f (@info_files) {
> +		print OUT "    <th>$f</th>\n";
> +	}
> +	print OUT "    <th>File</th>\n";
> +
> +	foreach my $func (sort keys(%all_func)) {
> +		my @keys = sort keys(%{$all_func{$func}});
> +		foreach my $file (@keys) {
> +			print OUT "  </tr><tr>\n";
> +			print OUT "    <td>$func</td>\n";
> +			if ($used_func{$func}->{$file}) {
> +				print OUT "    <td $green>YES</td>\n";
> +			} else {
> +				print OUT "    <td $red>NO</td>\n";
> +			}
> +			foreach my $f (@info_files) {
> +				if ($report{$f}{"used_func"}{$func}->{$file}) {
> +					print OUT "    <td $green>YES</td>\n";
> +				} else {
> +					print OUT "    <td $red>NO</td>\n";
> +				}
> +			}
> +			$file =~ s,$prefix,linux/,;
> +			print OUT "    <td>$file</td>\n";
> +		}
> +	}
> +	print OUT "</tr></table>\n";
> +
> +	print OUT "$epilog</body>\n";
> +
> +	# Close the file and exit
> +
> +	close OUT;
>   }
>   
>   #
> @@ -515,6 +781,11 @@ GetOptions(
>   	"exclude-source=s" => \$src_exclude,
>   	"show-files|show_files" => \$show_files,
>   	"show-lines|show_lines" => \$show_lines,
> +	"report|r=s" => \$gen_report,
> +	"css-file|css|c=s" => \$css_file,
> +	"title|t=s" => \$title,
> +	"html-prolog|prolog=s" => \$html_prolog,
> +	"html-epilog|epilog=s" => \$html_epilog,
>   	"help" => \$help,
>   	"man" => \$man,
>   ) or pod2usage(2);
> @@ -528,7 +799,9 @@ if ($#ARGV < 0) {
>   }
>   
>   # At least one action should be specified
> -pod2usage(1) if (!$print_used && !$filter && !$stat && !$print_unused);
> +pod2usage(1) if (!$print_used && !$filter && !$stat && !$print_unused && !$gen_report);
> +
> +pod2usage(1) if ($gen_report && ($print_used || $filter || $stat || $print_unused));
>   
>   my $filter_str = "";
>   my $has_filter;
> @@ -617,39 +890,67 @@ if ($ignore_unused) {
>   
>   foreach my $f (@ARGV) {
>   	parse_info_data($f);
> +
> +	if ($gen_report) {
> +		$f =~ s,.*/,,;
> +		$f =~ s/\.info$//;
> +
> +		gen_stats();
> +
> +		$report{$f}{"stats"} = { %stats };
> +		$report{$f}{"all_func"} = { %all_func };
> +		$report{$f}{"used_func"} = { %used_func };
> +		$report{$f}{"all_branch"} = { %all_branch };
> +		$report{$f}{"all_line"} = { %all_line };
> +		$report{$f}{"used_source"} = { %used_source };
> +		$report{$f}{"files"} = { %files };
> +		$report{$f}{"test_names"} = { %test_names };
> +
> +		%used_func = ();
> +		%all_func = ();
> +		%all_branch = ();
> +		%all_line = ();
> +		%used_source = ();
> +		%files = ();
> +		%test_names = ();
> +	}
>   }
>   
> -print_code_coverage($print_used, $print_unused, $show_lines);
> +if ($gen_report) {
> +	generate_report();
> +	exit 0;
> +}
>   
> -print_summary() if ($stat);
> +gen_stats();
>   
> -my $all_files = scalar keys(%files);
> +die "Nothing counted. Wrong input files?" if (!$stats{"all_files"});
>   
> -die "Nothing counted. Wrong input files?" if (!$all_files);
> +print_code_coverage($print_used, $print_unused, $show_lines);
>   
> -if ($has_filter) {
> -	my $all_files = scalar keys(%files);
> -	my $filtered_files = scalar keys(%record);
> -	my $used_files = scalar keys(%used_source);
> +print_summary() if ($stat);
>   
> -	my $percent = 100. * $used_files / $all_files;
> +if ($has_filter) {
> +	my $percent = 100. * $stats{"used_files"} / $stats{"all_files"};
>   
>   	$filter_str =~ s/(.*),/$1 and/;
>   	printf "Ignored......:%s.\n", $filter_str;
>   	printf "Source files.: %.2f%% (%d of %d total)",
> -		$percent, $used_files, $all_files;
> +		$percent, $stats{"used_files"}, $stats{"all_files"};
>   
> -	if ($used_files != $filtered_files) {
> -		my $percent_filtered = 100. * $used_files / $filtered_files;
> +	if ($stats{"used_files"} != $stats{"filtered_files"}) {
> +		my $percent_filtered = 100. * $stats{"used_files"} / $stats{"filtered_files"};
>   
>   		printf ", %.2f%% (%d of %d filtered)",
> -			$percent_filtered, $used_files, $filtered_files;
> +			$percent_filtered, $stats{"used_files"}, $stats{"filtered_files"};
>   	}
>   	print "\n";
>   } else {
>   	printf "Source files: %d\n", scalar keys(%files) if($stat);
>   }
>   
> +my $ntests=scalar(%test_names);
> +printf "Number of tests: %d\n", $ntests if ($ntests > 1);
> +
>   if ($show_files) {
>   	for my $f(sort keys %used_source) {
>   		print "\t$f\n";
> @@ -670,8 +971,10 @@ Parses lcov data from .info files.
>   
>   code_cov_parse_info <options> [input file(s)]
>   
> -At least one of the options B<--stat>, B<--print> and/or B<--output>
> -should be used.
> +At least one of the output options should be used, e g.
> +B<--stat>, B<--print>, B<--print-unused>, B<--report> and/or B<--output>.
> +
> +Also, B<--report> can't be used together with other output options.
>   
>   =head1 OPTIONS
>   
> @@ -700,6 +1003,37 @@ Prints the functions that were never reached.
>   
>   The function coverage report is affected by the applied filters.
>   
> +=item B<--report>  B<[output file]> or B<-r>  B<[output file]>
> +
> +Generates an html report containing per-test and total statistics.
> +
> +The function coverage report is affected by the applied filters.
> +
> +=item B<--css-file> B<[css file]> or B<--css> B<[css file]> or B<-c> B<[css file]
> +
> +Adds an optional css file to the html report.
> +Used only with B<--report>.
> +
> +=item B<--title> B<[title] or B<-t> B<[title]
> +
> +If used with B<--report>, it defines the title for the for the html report.
> +
> +If used with B<--output>, it replaces the test names with the title. This
> +is useful when merging reports from multiple tests into a summarized file.
> +If not used, the B<[output file]> will contain all test names on its
> +beginning.
> +
> +Used with B<--report> AND B<--output>.
> +
> +=item B<--html-prolog> B<[html file] or B<--prolog> B<[html file]
> +
> +Adds a prolog at the beginning of the body of the html report.
> +Used only with B<--report>.
> +
> +=item B<--html-epilog>  B<[html file] or B<--epilog>  B<[html file]
> +
> +Adds an epilog before the end of the body of the html report.
> +Used only with B<--report>.

Lots of code, I have always mixed feelings about code generating html. 
It's maintainability is quite difficult.
I am not UI/presentation expert, so it is hard to decide, but if there 
are no better options (XML/XSLT, perl frameworks to generate reports, 
....), lets try it.

Regards
Andrzej


>   
>   =item B<--show-lines> or B<--show_lines>
>   
