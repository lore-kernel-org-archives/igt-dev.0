Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B98E10F232
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Apr 2022 12:25:11 +0000 (UTC)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
	Petri Latvala <petri.latvala@intel.com>
Date: Thu, 14 Apr 2022 14:24:52 +0200
Message-Id: <897bd0c0722bdef753f6dd278428678c623c7230.1649939026.git.mchehab@kernel.org>
In-Reply-To: <cover.1649939026.git.mchehab@kernel.org>
References: <cover.1649939026.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 02/12] scripts/code_cov_parse_info: add a tool
 to parse code coverage info files
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Ch Sai Gowtham <sai.gowtham.ch@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

The code coverage info files provide useful information about what
functions were called and how many times. It can also contain data that
it is not useful for the code coverage, like calls to non-DRM related
Kernel APIs.

Add a tool that helps filtering out non-DRM files and prints what
functions were called.

Both the stats, prints and output files are affected by the filters:

$ code_cov_parse_info --stat total.info
  lines......: 40.8% (71989 of 176442 lines)
  functions..: 50.2% (5975 of 11909 functions)
  branches...: 28.7% (35006 of 121893 branches)
Source files: 744

$ code_cov_parse_info total.info --stat --only-drm
  lines......: 40.3% (70244 of 174170 lines)
  functions..: 50.8% (5835 of 11491 functions)
  branches...: 28.4% (33096 of 116707 branches)
Ignored......: non-drm headers.
Source files.: 78.36% (583 of 744 total)

$ code_cov_parse_info total.info --stat --only-drm --ignore-unused -o o.info
  lines......: 47.9% (70244 of 146752 lines)
  functions..: 50.8% (5835 of 11491 functions)
  branches...: 32.8% (33096 of 100900 branches)
Ignored......: non-drm headers and source files where none of its code ran.
Source files.: 58.87% (438 of 744 total), 75.13% (438 of 583 filtered)

$ code_cov_parse_info --stat o.info
  lines......: 47.9% (70244 of 146752 lines)
  functions..: 59.8% (5835 of 9763 functions)
  branches...: 32.8% (33096 of 100900 branches)
Source files: 438

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v3 00/12] at: https://lore.kernel.org/all/cover.1649939026.git.mchehab@kernel.org/

 scripts/code_cov_parse_info | 775 ++++++++++++++++++++++++++++++++++++
 1 file changed, 775 insertions(+)
 create mode 100755 scripts/code_cov_parse_info

diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
new file mode 100755
index 000000000000..604812b41580
--- /dev/null
+++ b/scripts/code_cov_parse_info
@@ -0,0 +1,775 @@
+#!/usr/bin/perl
+# SPDX-License-Identifier: MIT
+use strict;
+use warnings;
+use Getopt::Long;
+BEGIN { $Pod::Usage::Formatter = 'Pod::Text::Termcap'; }
+use Pod::Usage;
+use Pod::Man;
+
+my $prefix = qr ".*?(linux)\w*/";
+
+my %used_func;
+my %all_func;
+my %all_branch;
+my %all_line;
+my %used_source;
+my %record;
+my %files;
+my @func_regexes;
+my @src_regexes;
+my $testname = "";
+
+my $verbose = 0;
+my $ignore_unused = 0;
+my $only_i915 = 0;
+my $only_drm = 0;
+my $skip_func = 0;
+
+sub is_function_excluded($)
+{
+	return 0 if (!@func_regexes);
+
+	my $func = shift;
+
+	foreach my $r (@func_regexes) {
+		return 0 if ($func =~ m/$r/);
+	}
+
+	return 1;
+}
+
+sub filter_file($)
+{
+	my $s = shift;
+
+	if ($only_drm) {
+		# Please keep --only-drm doc updated with any changes her
+		if ($s =~ m/\.h$/) {
+			if ($s =~ m/trace/ || !($s =~ m/drm/)) {
+				return 1;
+			}
+		}
+	}
+
+	if ($only_i915) {
+		# Please keep --only-i915 doc updated with any changes here
+		if ($s =~ m/selftest/) {
+			return 1;
+		}
+
+		# Please keep --only-i915 doc updated with any changes here
+		if (!($s =~ m#drm/i915/# || $s =~ m#drm/ttm# || $s =~ m#drm/vgem#)) {
+			return 1;
+		}
+	}
+
+	return 0 if (!@src_regexes);
+
+	my $func = shift;
+
+	foreach my $r (@src_regexes) {
+		return 0 if ($s =~ m/$r/);
+	}
+
+	return 1;
+}
+
+# Use something that comes before any real function
+my $before_sf = "!!!!";
+
+sub parse_info_data($)
+{
+	my $file = shift;
+	my $was_used = 0;
+	my $has_func = 0;
+	my $ignore = 0;
+	my $source = $before_sf;
+	my $func = $before_sf;
+	my $cur_test = "";
+
+	# First step: parse data
+
+	print "reading $file...\n" if ($verbose);
+	open IN, $file or die "can't open $file";
+	# For details on .info file format, see "man geninfo"
+	# http://ltp.sourceforge.net/coverage/lcov/geninfo.1.php
+	while (<IN>) {
+		# TN:<test name>
+		if (m/^TN:(.*)/) {
+			if ($1 ne $cur_test) {
+				$cur_test = $1;
+				if (!$testname) {
+					$testname = $cur_test;
+				} else {
+					$testname = "Code_coverage_tests";
+				}
+			}
+			$source = $before_sf;
+			$func = $before_sf;
+			next;
+		}
+
+		# SF:<absolute path to the source file>
+		if (m/^[SK]F:(.*)/) {
+			$source = $1;
+
+			$was_used = 0;
+			$has_func = 0;
+			$func = $before_sf;
+			$files{$source} = 1;
+
+			# Just ignore files explictly set as such
+			$ignore = filter_file($source);
+			next;
+		}
+
+		# End of record
+		if (m/^end_of_record/) {
+			if (!$source) {
+				print "bad end_of_record field at $file, line $. Ignoring...\n";
+				next;
+			}
+
+			my $s = $source;
+
+			$source = $before_sf;
+			$func = $before_sf;
+
+			next if ($ignore);
+			next if ($ignore_unused && !$was_used);
+
+			# Mark that the source was not ignored
+			$used_source{$s} = 1;
+			next;
+		}
+
+		next if ($ignore);
+
+		# Function coverage
+
+		# FN:<line number of function start>,<function name>
+		if (m/^FN:(-?\d+),(.*)/) {
+			my $ln = $1;
+
+			$func = $2;
+			$has_func = 1;
+
+			if (is_function_excluded($func)) {
+				$skip_func = 1;
+				next;
+			}
+
+			$skip_func = 0;
+
+			$record{$source}{$func}{fn} = $ln;
+			$all_func{$func}{$source}->{ln} = $ln;
+			next;
+		}
+
+		# Parse functions that were actually used
+		# FNDA:<execution count>,<function name>
+		if (m/^FNDA:(-?\d+),(.*)/) {
+			my $count = $1;
+
+			# Negative gcov results are possible, as reported at:
+			# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=67937
+			# Lcov ignores those. So, let's do the same here.
+			next if ($count <= 0);
+
+			$func = $2;
+			$has_func = 1;
+
+			if (is_function_excluded($func)) {
+				$skip_func = 1;
+				next;
+			}
+
+			$skip_func = 0;
+			$was_used = 1;
+
+			$record{$source}{$func}{fnda} += $count;
+			$used_func{$func}{$source}->{count} += $count;
+			next;
+		}
+
+		# Ignore data from skipped functions
+		next if ($skip_func);
+
+		# Ignore DA/BRDA that aren't associated with functions
+		# Those are present on header files (maybe defines?)
+		next if (@func_regexes && !$has_func);
+
+		# FNF:<number of functions found>
+		if (m/^FNF:(-?\d+)/) {
+			$record{$source}{$func}{fnf} = $1;
+			next;
+		}
+		# FNH:<number of function hit>
+		if (m/^FNH:(-?\d+)/) {
+			my $hits = $1;
+			if ($record{$source}{$func}{fnh} < $hits) {
+				$record{$source}{$func}{fnh} = $hits;
+			}
+			next;
+		}
+
+		# Branch coverage
+
+		# BRDA:<line number>,<block number>,<branch number>,<taken>
+		if (m/^BRDA:(-?\d+),(-?\d+),(-?\d+),(.*)/) {
+			my $ln = $1;
+			my $block = $2;
+			my $branch = $3;
+			my $taken = $4;
+
+			my $where = "$ln,$block,$branch";
+
+			$taken = 0 if ($taken eq '-');
+
+			# Negative gcov results are possible, as reported at:
+			# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=67937
+			# Lcov ignores those. So, let's do the same here.
+			$taken = 0 if ($taken < 0);
+
+			$was_used = 1 if ($taken > 0);
+
+			$record{$source}{$func}{brda}{$where} += $taken;
+			$all_branch{$source}{"$where"} += $taken;
+			next;
+		}
+
+		# BRF:<number of branches found>
+		if (m/^BRF:(-?\d+)/) {
+			$record{$source}{brf} = $1;
+			next;
+		}
+		# BRH:<number of branches hit>
+		if (m/^BRH:(-?\d+)/) {
+			my $hits = $1;
+			if ($record{$source}{$func}{brh} < $hits) {
+				$record{$source}{$func}{brh} = $hits;
+			}
+			next;
+		}
+
+		# Line coverage
+
+		# DA:<line number>,<execution count>[,<checksum>]
+		if (m/^DA:(-?\d+),(-?\d+)(,.*)?/) {
+			my $ln = $1;
+			my $count = $2;
+
+			# Negative gcov results are possible, as reported at:
+			# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=67937
+			# Lcov ignores those. So, let's do the same here.
+			$count = 0 if ($count < 0);
+
+			$was_used = 1 if ($count > 0);
+
+			$record{$source}{$func}{da}{$ln} += $count;
+			$all_line{$source}{"$ln"} += $count;
+			next;
+		}
+
+		# LF:<number of instrumented lines>
+		if (m/^LF:(-?\d+)/) {
+			$record{$source}{$func}{lf} = $1;
+			next;
+		}
+
+		# LH:<number of lines with a non-zero execution count>
+		if (m/^LH:(-?\d+)/) {
+			my $hits = $1;
+			if ($record{$source}{$func}{lh} < $hits) {
+				$record{$source}{$func}{lh} = $hits;
+			}
+			next;
+		}
+
+		printf("Warning: invalid line: $_");
+	}
+
+	close IN or die;
+}
+
+sub write_filtered_file($)
+{
+	my $filter = shift;
+
+	# Generates filtered data
+	my $filtered = "TN:$testname\n";
+
+	foreach my $source(sort keys %record) {
+		next if (!$used_source{$source});
+
+		if ($source ne $before_sf) {
+			$filtered .= "SF:$source\n";
+		}
+
+		foreach my $func(sort keys %{ $record{$source} }) {
+			if ($func ne $before_sf) {
+				my $fn;
+				my $fnda;
+
+				if (defined($record{$source}{$func}{fn})) {
+					$filtered .= "FN:" . $record{$source}{$func}{fn} . ",$func\n";
+				}
+				if (defined($record{$source}{$func}{fnda})) {
+					$filtered .= "FNDA:" . $record{$source}{$func}{fnda} . ",$func\n";
+				}
+				if ($record{$source}{fnf}) {
+					$filtered .= "FNF:". $record{$source}{$func}{fnf} ."\n";
+				}
+				if ($record{$source}{fnh}) {
+					$filtered .= "FNH:". $record{$source}{$func}{fnh} ."\n";
+				}
+			}
+
+			foreach my $ln(sort keys %{ $record{$source}{$func}{da} }) {
+				$filtered .= "DA:$ln," . $record{$source}{$func}{da}{$ln} . "\n";
+			}
+			foreach my $where(sort keys %{ $record{$source}{$func}{brda} }) {
+				my $taken = $record{$source}{$func}{brda}{$where};
+				$taken = "-" if (!$taken);
+				$filtered .= "BRDA:$where,$taken\n";
+			}
+			if ($record{$source}{$func}{brf}) {
+				$filtered .= "BRF:". $record{$source}{$func}{brf} ."\n";
+			}
+			if ($record{$source}{$func}{brh}) {
+				$filtered .= "BRH:". $record{$source}{$func}{brh} ."\n";
+			}
+			if ($record{$source}{$func}{lf}) {
+				$filtered .= "LF:". $record{$source}{$func}{lf} ."\n";
+			}
+			if ($record{$source}{$func}{lh}) {
+				$filtered .= "LH:". $record{$source}{$func}{lh} ."\n";
+			}
+		}
+
+		$filtered .= "end_of_record\n";
+	}
+	open OUT, ">$filter" or die "Can't open $filter";
+	print OUT $filtered or die "Failed to write to $filter";
+	close OUT or die "Failed to close to $filter";
+}
+
+sub print_code_coverage($$$)
+{
+	my $print_used = shift;
+	my $print_unused = shift;
+	my $show_lines = shift;
+
+	return if (!$print_used && !$print_unused);
+
+	if ($testname ne "") {
+		$testname =~ s/(.*)_on_(\w+)$/$1 on $2/;
+		print "TEST: $testname\n";
+	}
+	my $prev_file = "";
+
+	foreach my $func (sort keys(%all_func)) {
+		my @keys = sort keys(%{$all_func{$func}});
+		foreach my $file (@keys) {
+			my $count = 0;
+			my $name;
+
+			if ($used_func{$func}) {
+				if ($used_func{$func}->{$file}) {
+					$count = $used_func{$func}->{$file}->{count};
+				}
+			}
+
+			if ($show_lines) {
+				$file =~ s,$prefix,linux/,;
+				$name = "$func() from $file:" . $all_func{$func}{$file}->{ln};
+			} elsif (scalar @keys > 1) {
+				$file =~ s,$prefix,linux/,;
+				$name = "$func() from $file:";
+			} else {
+				$name = "$func():";
+			}
+			if ($print_unused) {
+				if (!$count) {
+					print "$name unused\n";
+				} elsif ($print_used) {
+					print "$name executed $count times\n";
+				}
+			} elsif ($count) {
+				print "$name executed $count times\n";
+			}
+		}
+	}
+}
+
+sub print_summary()
+{
+	# Output per-line coverage statistics
+	my $line_count = 0;
+	my $line_reached = 0;
+
+	foreach my $source (keys(%all_line)) {
+		next if (!$used_source{$source});
+
+		foreach my $where (keys(%{$all_line{$source}})) {
+			$line_count++;
+			$line_reached++ if ($all_line{$source}{$where} != 0);
+		}
+	}
+	if ($line_count) {
+		my $percent = 100. * $line_reached / $line_count;
+		printf "  lines......: %.1f%% (%d of %d lines)\n",
+			$percent, $line_reached, $line_count;
+	} else {
+		print "No line coverage data.\n";
+	}
+
+	# Output per-function coverage statistics
+	my $func_count = 0;
+	my $func_used = 0;
+
+	foreach my $func (keys(%all_func)) {
+		foreach my $file (keys(%{$all_func{$func}})) {
+			$func_count++;
+			if ($used_func{$func}) {
+				if ($used_func{$func}->{$file}) {
+					$func_used++;
+				}
+			}
+		}
+	}
+
+	if ($func_count) {
+		my $percent = 100. * $func_used / $func_count;
+		printf "  functions..: %.1f%% (%d of %d functions)\n",
+			$percent, $func_used, $func_count;
+	} else {
+		print "No functions reported. Wrong filters?\n";
+		return;
+	}
+
+	# Output per-branch coverage statistics
+	my $branch_count = 0;
+	my $branch_reached = 0;
+
+	foreach my $source (keys(%all_branch)) {
+		next if (!$used_source{$source});
+
+		foreach my $where (keys(%{$all_branch{$source}})) {
+			$branch_count++;
+			$branch_reached++ if ($all_branch{$source}{$where} != 0);
+		}
+	}
+	if ($branch_count) {
+		my $percent = 100. * $branch_reached / $branch_count;
+		printf "  branches...: %.1f%% (%d of %d branches)\n",
+			$percent, $branch_reached, $branch_count;
+	} else {
+		print "No branch coverage data.\n";
+	}
+}
+
+#
+# Argument handling
+#
+
+my $print_used;
+my $print_unused;
+my $stat;
+my $filter;
+my $help;
+my $man;
+my $func_filters;
+my $src_filters;
+my $show_files;
+my $show_lines;
+
+GetOptions(
+	"print-coverage|print_coverage|print|p" => \$print_used,
+	"print-unused|u" => \$print_unused,
+	"stat|statistics" => \$stat,
+	"output|o=s" => \$filter,
+	"verbose|v" => \$verbose,
+	"ignore-unused|ignore_unused" => \$ignore_unused,
+	"only-i915|only_i915" => \$only_i915,
+	"only-drm|only_drm" => \$only_drm,
+	"func-filters|f=s" => \$func_filters,
+	"source-filters|S=s" => \$src_filters,
+	"show-files|show_files" => \$show_files,
+	"show-lines|show_lines" => \$show_lines,
+	"help" => \$help,
+	"man" => \$man,
+) or pod2usage(2);
+
+pod2usage(-verbose => 2) if $man;
+pod2usage(1) if $help;
+
+if ($#ARGV < 0) {
+	print "$0: no input files\n";
+	pod2usage(1);
+}
+
+# At least one action should be specified
+pod2usage(1) if (!$print_used && !$filter && !$stat && !$print_unused);
+
+my $filter_str = "";
+my $has_filter;
+
+if ($func_filters) {
+	open IN, $func_filters || die "Can't open $func_filters";
+	while (<IN>) {
+		s/^\s+//;
+		s/\s+$//;
+		next if (m/^#/ || m/^$/);
+		push @func_regexes, qr /$_/;
+	}
+	close IN;
+}
+
+if ($src_filters) {
+	open IN, $src_filters || die "Can't open $src_filters";
+	while (<IN>) {
+		s/^\s+//;
+		s/\s+$//;
+		next if (m/^#/ || m/^$/);
+		push @src_regexes, qr /$_/;
+	}
+	close IN;
+}
+
+$ignore_unused = 1 if (@func_regexes);
+
+if ($only_i915) {
+	$filter_str = " non-i915 files";
+	$has_filter = 1;
+}
+
+if ($only_drm) {
+	$filter_str .= "," if ($filter_str ne "");
+	$filter_str .= " non-drm headers";
+	$has_filter = 1;
+}
+
+if (@func_regexes) {
+	$filter_str .= "," if ($filter_str ne "");
+	$filter_str .= " unmatched functions";
+	foreach my $r (@func_regexes) {
+		$filter_str .= " m/$r/";
+	}
+
+	$has_filter = 1;
+}
+
+if (@src_regexes) {
+	$filter_str .= "," if ($filter_str ne "");
+	$filter_str .= " unmatched source files";
+	foreach my $r (@src_regexes) {
+		$filter_str .= " m/$r/";
+	}
+	$has_filter = 1;
+}
+
+if ($ignore_unused) {
+	$filter_str .= "," if ($filter_str ne "");
+	$filter_str .= " source files where none of its code ran";
+	$has_filter = 1;
+}
+
+foreach my $f (@ARGV) {
+	parse_info_data($f);
+}
+
+print_code_coverage($print_used, $print_unused, $show_lines);
+
+print_summary() if ($stat);
+
+my $all_files = scalar keys(%files);
+
+die "Nothing counted. Wrong input files?" if (!$all_files);
+
+if ($has_filter) {
+	my $all_files = scalar keys(%files);
+	my $filtered_files = scalar keys(%record);
+	my $used_files = scalar keys(%used_source);
+
+	my $percent = 100. * $used_files / $all_files;
+
+	$filter_str =~ s/(.*),/$1 and/;
+	printf "Ignored......:%s.\n", $filter_str;
+	printf "Source files.: %.2f%% (%d of %d total)",
+		$percent, $used_files, $all_files;
+
+	if ($used_files != $filtered_files) {
+		my $percent_filtered = 100. * $used_files / $filtered_files;
+
+		printf ", %.2f%% (%d of %d filtered)",
+			$percent_filtered, $used_files, $filtered_files;
+	}
+	print "\n";
+} else {
+	printf "Source files: %d\n", scalar keys(%files) if($stat);
+}
+
+if ($show_files) {
+	for my $f(sort keys %used_source) {
+		print "\t$f\n";
+	}
+}
+
+if ($filter) {
+	write_filtered_file($filter);
+}
+
+__END__
+
+=head1 NAME
+
+Parses lcov data from .info files.
+
+=head1 SYNOPSIS
+
+code_cov_parse_info <options> [input file(s)]
+
+At least one of the options B<--stat>, B<--print> and/or B<--output>
+should be used.
+
+=head1 OPTIONS
+
+=over 8
+
+=item B<--stat> or B<--statistics>
+
+Prints code coverage statistics.
+
+It displays function, line, branch and file coverage percentage.
+
+It also reports when one or more of the filtering parameters are used.
+
+The statistics report is affected by the applied filters.
+
+=item B<--print-coverage> or B<--print_coverage> or B<--print> or B<-p>
+
+Prints the functions that were executed in runtime and how many times
+they were reached.
+
+The function coverage report is affected by the applied filters.
+
+=item B<--print-unused> or B<-u>
+
+Prints the functions that were never reached.
+
+The function coverage report is affected by the applied filters.
+
+
+=item B<--show-lines> or B<--show_lines>
+
+When printing per-function code coverage data, always output the source
+file and the line number where the function is defined.
+
+=item B<--output> B<[output file]> or B<-o> B<[output file]>
+
+Produce an output file merging all input files.
+
+The generated output file is affected by the applied filters.
+
+=item B<--only-drm> or B<--only_drm>
+
+Filters out includes outside the DRM subsystem, plus trace files.
+E. g. it will exclude *.h files that match the following regular expressions:
+
+	- .*trace.*\.h$
+
+And *.h files that don't match:
+
+	- drm
+
+=item B<--only-i915> or B<--only_i915>
+
+Filters out C files and headers outside drm core and drm/i915.
+
+E. g. code coverage results will include only the files that that match
+the following regular expressions:
+
+	- drm/i915/
+	- drm/ttm
+	- drm/vgem
+
+Excluding files that match:
+
+	- selftest
+
+=item B<--func-filters>  B<[filter's file]> or B<-f>  B<[filter's file]>
+
+Take into account only the code coverage for the functions that match
+the regular expressions contained at the B<[filter's file]>.
+
+When this filter is used, B<--ignore-unused> will be automaticaly enabled,
+as the final goal is to report per-function usage, and not per-file.
+
+=item B<--source-filters>  B<[filter's file]> or B<-S>  B<[filter's file]>
+
+Takes into account only the code coverage for the source files that match
+the regular expressions contained at the B<[filter's file]>.
+
+=item B<--ignore-unused> or B<--ignore_unused>
+
+Filters out unused C files and headers from the code coverage results.
+
+Sometimes, it is desired to ignore files where none of the functions on it
+were tested.
+
+The rationale is that such files may contain platform-specific drivers
+and code that will never be used, so, placing them will just bloat the
+report and decrease the code coverage statistics.
+
+This option is automaticaly enabled when B<--func-filters> is used.
+
+=back
+
+=item B<--show-files> or B<--show_files>
+
+Shows the list of files that were used to produce the code coverage
+results.
+
+=item B<--verbose> or B<-v>
+
+Prints the name of each parsed file.
+
+=item B<--help>
+
+Print a brief help message and exits.
+
+=item B<--man>
+
+Prints the manual page and exits.
+
+=back
+
+=head1 BUGS
+
+Report bugs to Mauro Carvalho Chehab <mauro.chehab@intel.com>
+
+=head1 COPYRIGHT
+
+Copyright (c) 2022 Intel Corporation
+
+Permission is hereby granted, free of charge, to any person obtaining a
+copy of this software and associated documentation files (the "Software"),
+to deal in the Software without restriction, including without limitation
+the rights to use, copy, modify, merge, publish, distribute, sublicense,
+and/or sell copies of the Software, and to permit persons to whom the
+Software is furnished to do so, subject to the following conditions:
+
+The above copyright notice and this permission notice (including the next
+paragraph) shall be included in all copies or substantial portions of the
+Software.
+
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
+THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
+IN THE SOFTWARE.
+=cut
-- 
2.35.1
