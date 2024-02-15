Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A3DC48BF1
	for <igt-dev@archiver.kernel.org>; Thu, 15 Feb 2024 10:27:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45F1910E5EF;
	Thu, 15 Feb 2024 10:27:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LBCCmyXL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD25110E43D
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 10:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707992853; x=1739528853;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding:sender;
 bh=vTEY8WQSDVlqA2wM3v7DznGNZ6DnBXLs2gVabV7zzhE=;
 b=LBCCmyXLKVP29dfnLWQoDmL0RKGeZf1a/AD5TUajDUfvgnY2vQdu9uA3
 Y/fK500L6BRb3bAMU4lzH/MqEXTfd7pTtB/g2dgSF1tohY0qHK5gufX58
 g/AezfVB2qk8i+ZyILghlSXJYUw4phNLdC974HOBjJPCKSctogOYFvYye
 jxPXHew8dcaL/UBpj2sy+5709E8c8w8wxHHjaDXJ5AKaDV/FYdPMMF7M4
 yl+i9cXFAANCJW9pa7fOX03ioXQxQQH3Hno++wWW+BbIOJts32N2QcVfZ
 H9c9ZoqtrDcGpjJ5w1B6vZ2fQTuPfM4dV233OlFSOW+jDYZGxaLjBJG0Y w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="2199373"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="2199373"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 02:27:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; d="scan'208";a="40981610"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 02:27:32 -0800
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.246.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 2ED62580E0C
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 02:27:31 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1raYxk-00000003JBa-3fCj for igt-dev@lists.freedesktop.org;
 Thu, 15 Feb 2024 11:27:28 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 11/17] scripts/code_cov_parse_info: add an internal JSON format
Date: Thu, 15 Feb 2024 11:27:20 +0100
Message-ID: <6fdd73b09aaeaa9a79c697ce3d12f6f907a0b94e.1707992666.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707992666.git.mchehab@kernel.org>
References: <cover.1707992666.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

In order to be able to join data from different JSON files, the
JSON format needs to be different than the standard gcov one,
as:

- it should contain test names;
- it should use hashes instead of arrays for functions and lines.

So, at the end of the day, it needs a different format version.
Add support for read/write on a new format.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/code_cov_parse_info | 222 +++++++++++++++++++++++++++++-------
 1 file changed, 179 insertions(+), 43 deletions(-)

diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
index 97c94a81004f..8180b9c1f82e 100644
--- a/scripts/code_cov_parse_info
+++ b/scripts/code_cov_parse_info
@@ -131,9 +131,9 @@ sub parse_json_gcov_v1($$)
 			# Store the record
 			for my $key (keys %$func_ref) {
 				if ($key eq "execution_count") {
-					$record{$source}{func}{$func}{$key} += $func_ref->{$key};
+					$record{files}{$source}{func}{$func}{$key} += $func_ref->{$key};
 				} else {
-					$record{$source}{func}{$func}{$key} = $func_ref->{$key};
+					$record{files}{$source}{func}{$func}{$key} = $func_ref->{$key};
 				}
 			}
 
@@ -177,9 +177,9 @@ sub parse_json_gcov_v1($$)
 				# Branches will be handled in separate
 				next if ($key eq "branches");
 				if ($key eq "count") {
-					$record{$source}{line}{$ln}{$key} += $line_ref->{$key};
+					$record{files}{$source}{line}{$ln}{$key} += $line_ref->{$key};
 				} else {
-					$record{$source}{line}{$ln}{$key} = $line_ref->{$key};
+					$record{files}{$source}{line}{$ln}{$key} = $line_ref->{$key};
 				}
 			}
 			$all_line{$source}{$ln} += $line_ref->{'count'};
@@ -198,17 +198,17 @@ sub parse_json_gcov_v1($$)
 
 				for my $key (keys %$branch_ref) {
 					if ($key eq "count") {
-						$record{$source}{line}{$ln}{branches}[$i]{$key} += $branch_ref->{$key};
+						$record{files}{$source}{line}{$ln}{branches}[$i]{$key} += $branch_ref->{$key};
 					} else {
-						$record{$source}{line}{$ln}{branches}[$i]{$key} = $branch_ref->{$key};
+						$record{files}{$source}{line}{$ln}{branches}[$i]{$key} = $branch_ref->{$key};
 					}
 				}
 
 				$all_branch{$source}{$where}{count} += $taken;
 				$i++;
 			}
-			if (!defined($record{$source}{line}{$ln}{branches})) {
-				@{$record{$source}{line}{$ln}{branches}} = ();
+			if (!defined($record{files}{$source}{line}{$ln}{branches})) {
+				@{$record{files}{$source}{line}{$ln}{branches}} = ();
 			}
 		}
 	}
@@ -217,6 +217,121 @@ sub parse_json_gcov_v1($$)
 	$record{format_version} = "parse_info v1.0";
 }
 
+sub parse_json_internal_format_v1($$)
+{
+	my $file = shift;
+	my $json = shift;
+
+	my $was_used = 0;
+	my $has_func = 0;
+	my $ignore = 0;
+
+	# Store the common JSON data into the record
+	for my $key (keys %$json) {
+		next if ($key eq "files");
+		next if ($key eq "functions");
+		next if ($key eq "lines");
+		# Store any extra data
+		$record{$key} = $json->{$key};
+	}
+
+	for my $test (keys %{$json->{'tests'}}) {
+		$test_names{$test} = 1;
+	}
+
+	for my $source (keys %{$json->{'files'}}) {
+		$files{$source} = 1;
+		next if is_file_excluded($source);
+
+		my $file_ref = \%{$json->{'files'}{$source}};
+
+		# Parse functions
+		for my $func (keys %{$file_ref->{func}}) {
+			next if is_function_excluded($func);
+
+			my $func_ref = \%{$file_ref->{func}{$func}};
+
+			# Store the record
+			for my $key (keys %$func_ref) {
+				if ($key eq "execution_count") {
+					$record{files}{$source}{func}{$func}{$key} += $func_ref->{$key};
+				} else {
+					$record{files}{$source}{func}{$func}{$key} = $func_ref->{$key};
+				}
+			}
+
+			$all_func{$func}{$source}->{ln} = $func_ref->{'start_line'};
+			$all_func{$func}{$source}->{end_ln} = $func_ref->{'end_line'};
+
+			if ($func_ref->{'execution_count'} > 0) {
+				$used_func{$func}{$source}->{count} += $func_ref->{'execution_count'};
+				$was_used = 1;
+			}
+		}
+		next if ($ignore_unused && !$was_used);
+		$used_source{$source} = 1;
+
+		# Parse lines and branches
+		for my $ln (keys %{$file_ref->{line}}) {
+			my $line_ref = \%{$file_ref->{line}{$ln}};
+			my $func = $line_ref->{'function_name'};
+			if (!$func) {
+				# Ignore DA/BRDA that aren't associated with
+				# functions. Those are present on header files
+				# (maybe defines?)
+				next if (@func_include_regexes);
+
+				# Otherwise place them in separate
+				$func = $before_sf;
+			} else {
+				next if is_function_excluded($func);
+			}
+
+			# Store the record
+			for my $key (keys %$line_ref) {
+				next if ($key eq "line_number");
+
+				# Branches will be handled in separate
+				next if ($key eq "branches");
+				if ($key eq "count") {
+					$record{files}{$source}{line}{$ln}{$key} += $line_ref->{$key};
+				} else {
+					$record{files}{$source}{line}{$ln}{$key} = $line_ref->{$key};
+				}
+			}
+			$all_line{$source}{$ln} += $line_ref->{'count'};
+
+			my $i = 0;
+			for my $branch_ref (@{$line_ref->{'branches'}}) {
+				my $taken = $branch_ref->{'count'};
+				my $where = sprintf "%d,%d,%d", $ln, 0, $i;
+
+				# Negative gcov results are possible, as
+				# reported at:
+				# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=67937
+				# Lcov ignores those. So, let's do the same
+				# here.
+				$branch_ref->{'count'} = 0 if ($branch_ref->{'count'} < 0);
+
+				for my $key (keys %$branch_ref) {
+					next if (!$record{files}{$source}{line}{$ln}{branches});
+					if ($key eq "count") {
+						$record{files}{$source}{line}{$ln}{branches}[$i]{$key} += $branch_ref->{$key};
+					} else {
+						$record{files}{$source}{line}{$ln}{branches}[$i]{$key} = $branch_ref->{$key};
+					}
+				}
+
+				$all_branch{$source}{$where}{count} += $taken;
+				$i++;
+			}
+			if (!defined($record{files}{$source}{line}{$ln}{branches})) {
+				@{$record{files}{$source}{line}{$ln}{branches}} = ();
+			}
+		}
+	}
+}
+
 sub read_json($)
 {
 	my $file = shift;
@@ -238,6 +353,8 @@ sub read_json($)
 		}
 		if ($json->{'format_version'} eq '1') {
 			parse_json_gcov_v1($file, $json);
+		} elsif ($json->{'format_version'} eq 'parse_info v1.0') {
+			parse_json_internal_format_v1($file, $json);
 		} else {
 			if ($json->{'format_version'}) {
 				die "Can't parse JSON version %d on file $file\n", $json->{'format_version'};
@@ -331,7 +448,7 @@ sub read_info($)
 
 			$skip_func = 0;
 
-			$record{$source}{func}{$func}{start_line} = $ln;
+			$record{files}{$source}{func}{$func}{start_line} = $ln;
 			$all_func{$func}{$source}->{ln} = $ln;
 			next;
 		}
@@ -359,7 +476,7 @@ sub read_info($)
 			$skip_func = 0;
 			$was_used = 1;
 
-			$record{$source}{func}{$func}{fnda} += $count;
+			$record{files}{$source}{func}{$func}{execution_count} += $count;
 			$used_func{$func}{$source}->{count} += $count;
 			next;
 		}
@@ -428,9 +545,9 @@ sub read_info($)
 
 			$was_used = 1 if ($count > 0);
 
-			$record{$source}{line}{$ln}{count} += $count;
-			if (!defined($record{$source}{line}{$ln}{branches})) {
-				@{$record{$source}{line}{$ln}{branches}} = ();
+			$record{files}{$source}{line}{$ln}{count} += $count;
+			if (!defined($record{files}{$source}{line}{$ln}{branches})) {
+				@{$record{files}{$source}{line}{$ln}{branches}} = ();
 			}
 
 			$all_line{$source}{$ln} += $count;
@@ -469,59 +586,74 @@ sub sort_where($$)
 	return $a[2] <=> $b[2];
 }
 
-sub write_filtered_file($)
+sub write_json_file($)
 {
-	my $filter = shift;
+	my $fname = shift;
 
-	my $filtered = "";
+	if (!$has_json_support) {
+		die "Can't parse json as system doesn't have Cpanel::JSON::XS.\n";
+	}
+
+	my $data = eval {
+		Cpanel::JSON::XS::encode_json(\%record)
+	};
+
+	open OUT, ">$fname" or die "Can't open $fname";
+	print OUT $data or die "Failed to write to $fname";
+	close OUT or die "Failed to close to $fname";
+}
+
+sub write_info_file($)
+{
+	my $fname = shift;
+	my $data = "";
 
 	if ($title eq "") {
 		foreach my $testname(sort keys %test_names) {
-			$filtered .= "TN:$testname\n";
+			$data .= "TN:$testname\n";
 		}
 	} else {
-		$filtered .= "TN:$title\n";
+		$data .= "TN:$title\n";
 	}
 
-	# Generates filtered data
-	foreach my $source(sort keys %record) {
+	# Fills $data with the contents to be stored at the file
+	foreach my $source(sort keys %{$record{files}}) {
 		next if (!$used_source{$source});
 
 		if ($source ne $before_sf) {
-			$filtered .= "SF:$source\n";
+			$data .= "SF:$source\n";
 		}
 
-		foreach my $func(sort keys %{ $record{$source}{func} }) {
+		foreach my $func(sort keys %{ $record{files}{$source}{func} }) {
 			if ($func ne $before_sf) {
 				my $fn;
 				my $fnda;
 
-				if (defined($record{$source}{func}{$func}{start_line})) {
-					$filtered .= "FN:" . $record{$source}{func}{$func}{start_line} . ",$func\n";
+				if (defined($record{files}{$source}{func}{$func}{start_line})) {
+					$data .= "FN:" . $record{files}{$source}{func}{$func}{start_line} . ",$func\n";
 				}
-				if (defined($record{$source}{func}{$func}{fnda})) {
-					$filtered .= "FNDA:" . $record{$source}{func}{$func}{fnda} . ",$func\n";
+				if (defined($record{files}{$source}{func}{$func}{execution_count})) {
+					$data .= "FNDA:" . $record{files}{$source}{func}{$func}{execution_count} . ",$func\n";
 				}
 
 			}
 		}
 
-		foreach my $ln(sort { $a <=> $b } keys %{ $record{$source}{line} }) {
-			$filtered .= "DA:$ln," . $record{$source}{line}{$ln}{count} . "\n";
-
-			my $i = 0;
-			for ($i = 0, $i < scalar(@{$record{$source}{line}{$ln}{branches}}), $i++) {
-				my $taken = $record{$source}{line}{$ln}{branches}[$i]{count};
+		foreach my $ln(sort { $a <=> $b } keys %{ $record{files}{$source}{line} }) {
+			$data .= "DA:$ln," . $record{files}{$source}{line}{$ln}{count} . "\n";
+			next if (!$record{files}{$source}{line}{$ln}{branches});
+			for (my $i = 0; $i < scalar @{$record{files}{$source}{line}{$ln}{branches}}; $i++) {
+				my $taken = $record{files}{$source}{line}{$ln}{branches}[$i]{count};
 				$taken = "-" if (!$taken);
-				$filtered .= "BRDA:$ln,0,$i,$taken\n";
+				$data .= "BRDA:$ln,0,$i,$taken\n";
 			}
 		}
 
-		$filtered .= "end_of_record\n";
+		$data .= "end_of_record\n";
 	}
-	open OUT, ">$filter" or die "Can't open $filter";
-	print OUT $filtered or die "Failed to write to $filter";
-	close OUT or die "Failed to close to $filter";
+	open OUT, ">$fname" or die "Can't open $fname";
+	print OUT $data or die "Failed to write to $fname";
+	close OUT or die "Failed to close to $fname";
 }
 
 sub print_code_coverage($$$)
@@ -1120,7 +1252,7 @@ sub check_source_branches()
 my $print_used;
 my $print_unused;
 my $stat;
-my $filter;
+my $output_file;
 my $help;
 my $man;
 my $func_filters;
@@ -1136,7 +1268,7 @@ GetOptions(
 	"print-coverage|print_coverage|print|p" => \$print_used,
 	"print-unused|u" => \$print_unused,
 	"stat|statistics" => \$stat,
-	"output|o=s" => \$filter,
+	"output|o=s" => \$output_file,
 	"verbose|v" => \$verbose,
 	"ignore-unused|ignore_unused" => \$ignore_unused,
 	"only-i915|only_i915" => \$only_i915,
@@ -1169,9 +1301,9 @@ if ($#ARGV < 0) {
 }
 
 # At least one action should be specified
-pod2usage(1) if (!$print_used && !$filter && !$stat && !$print_unused && !$gen_report && !$check_branches);
+pod2usage(1) if (!$print_used && !$output_file && !$stat && !$print_unused && !$gen_report && !$check_branches);
 
-pod2usage(1) if ($gen_report && ($print_used || $filter || $stat || $print_unused));
+pod2usage(1) if ($gen_report && ($print_used || $output_file || $stat || $print_unused));
 
 my $filter_str = "";
 my $has_filter;
@@ -1302,8 +1434,12 @@ if ($show_files) {
 	}
 }
 
-if ($filter) {
-	write_filtered_file($filter);
+if ($output_file) {
+	if ($output_file =~ /.json$/) {
+		write_json_file($output_file);
+	} else {
+		write_info_file($output_file);
+	}
 }
 
 __END__
-- 
2.43.0

