Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BCBDC48BEF
	for <igt-dev@archiver.kernel.org>; Thu, 15 Feb 2024 10:27:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A843410E43D;
	Thu, 15 Feb 2024 10:27:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GSS9bUDP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B82E10E57A
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 10:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707992853; x=1739528853;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding:sender;
 bh=4PRsucAJi/Yud8AaqRSKkIMrjCSVDThqGfkGZwQWWPQ=;
 b=GSS9bUDPFyzV2MgSUO37lOukH4uqJorsQQyicNLdpX4az7H8J5K+DkkC
 mOSqJSDmkWGLrmaZVFkEAvC2nVzdhHKTwgOR6Rj6vT0Rq1ffvym9P3pKm
 o/8plaPtTB0ypgN1BDUvlJXCcMaYPE7myFx0iTadHz+ZGe0F+mq4KKdV9
 yJ7TtfPKgGbldU4yAeTOhq4s4YJ6WydrG9+nu1/ZDP6BeDXEYtjctBVBc
 OEFNsprV+i2GJ7zEbMj85IVEjYbTApftCbbumsse/xf2H1R4X0qegQC2Q
 KpqDRaAdyn3CTS70eMnnQ+FfrjHov0ESy29xlOTy8ixDPfobFpAlOR6Au w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="2199370"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="2199370"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 02:27:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; d="scan'208";a="40981607"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 02:27:31 -0800
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.246.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 0E491580F26
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 02:27:31 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1raYxk-00000003JBW-3bac for igt-dev@lists.freedesktop.org;
 Thu, 15 Feb 2024 11:27:28 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 10/17] scripts/code_cov_parse_info: add support for parsing
 JSON files
Date: Thu, 15 Feb 2024 11:27:19 +0100
Message-ID: <5ab1e24b06764cb5b17701b2ae7120511d7e7afe.1707992666.git.mchehab@kernel.org>
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

Currently, the tool supports only info files, provided by
lcov tool. While this works, the info output lacks support to
properly identify what function is related to branches and
lines. Such limitation doesn't exist with json. So, add
support for parsing it.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/code_cov_parse_info | 210 +++++++++++++++++++++++++++++++++---
 1 file changed, 197 insertions(+), 13 deletions(-)

diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
index 038440a9c3e3..97c94a81004f 100644
--- a/scripts/code_cov_parse_info
+++ b/scripts/code_cov_parse_info
@@ -28,6 +28,16 @@ my $verbose = 0;
 my $ignore_unused = 0;
 my $skip_func = 0;
 
+my $has_json_support = eval {
+	require Cpanel::JSON::XS;
+	Cpanel::JSON::XS->import(qw(decode_json));
+	1;
+};
+
+if (!$has_json_support) {
+	print "Warning: System doesn't have Cpanel::JSON::XS. Can't use gcov directly.\n";
+}
+
 sub is_function_excluded($)
 {
 	return 0 if (!@func_include_regexes && !@func_exclude_regexes);
@@ -76,7 +86,169 @@ sub is_file_excluded($)
 # Use something that comes before any real function
 my $before_sf = "!!!!";
 
-sub parse_info_data($)
+sub parse_json_gcov_v1($$)
+{
+	my $file = shift;
+	my $json = shift;
+
+	my $was_used = 0;
+	my $has_func = 0;
+	my $ignore = 0;
+
+	my $cur_test = $file;
+	$cur_test =~ s#^.*/##;
+	$cur_test =~ s#\.json$##;
+	$test_names{$cur_test} = 1;
+
+	# Store the common JSON data into the record
+	for my $key (keys %$json) {
+		next if ($key eq "files");
+		next if ($key eq "functions");
+		next if ($key eq "lines");
+		# Store any extra data
+		$record{$key} = $json->{$key};
+	}
+	# Store test name at the record
+	$record{tests}{$cur_test} = 1;
+
+	for my $file_ref (@{$json->{'files'}}) {
+		my $source = $file_ref->{'file'};
+
+		$files{$source} = 1;
+		next if is_file_excluded($source);
+
+		# Parse functions
+		for my $func_ref (@{$file_ref->{'functions'}}) {
+			my $func = $func_ref->{'name'};
+
+			next if is_function_excluded($func);
+
+			# Negative gcov results are possible, as reported at:
+			# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=67937
+			# Lcov ignores those. So, let's do the same here.
+			$func_ref->{'execution_count'} = 0 if ($func_ref->{'execution_count'} < 0);
+
+			# Store the record
+			for my $key (keys %$func_ref) {
+				if ($key eq "execution_count") {
+					$record{$source}{func}{$func}{$key} += $func_ref->{$key};
+				} else {
+					$record{$source}{func}{$func}{$key} = $func_ref->{$key};
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
+		for my $line_ref (@{$file_ref->{'lines'}}) {
+			my $ln = $line_ref->{'line_number'};
+
+			# Negative gcov results are possible, as reported at:
+			# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=67937
+			# Lcov ignores those. So, let's do the same here.
+			$line_ref->{'count'} = 0 if ($line_ref->{'count'} < 0);
+
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
+					$record{$source}{line}{$ln}{$key} += $line_ref->{$key};
+				} else {
+					$record{$source}{line}{$ln}{$key} = $line_ref->{$key};
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
+					if ($key eq "count") {
+						$record{$source}{line}{$ln}{branches}[$i]{$key} += $branch_ref->{$key};
+					} else {
+						$record{$source}{line}{$ln}{branches}[$i]{$key} = $branch_ref->{$key};
+					}
+				}
+
+				$all_branch{$source}{$where}{count} += $taken;
+				$i++;
+			}
+			if (!defined($record{$source}{line}{$ln}{branches})) {
+				@{$record{$source}{line}{$ln}{branches}} = ();
+			}
+		}
+	}
+
+	# As the record was changed, we need to use a different format name
+	$record{format_version} = "parse_info v1.0";
+}
+
+sub read_json($)
+{
+	my $file = shift;
+
+	if (!$has_json_support) {
+		die "Can't parse json as system doesn't have Cpanel::JSON::XS.\n";
+	}
+
+	# Read JSON data
+	open IN, $file or die "can't open $file";
+	while (<IN>) {
+		my $json = eval {
+			Cpanel::JSON::XS::decode_json($_)
+		};
+
+		if (!$json) {
+			printf "Failed to parse file $file, line $.\n";
+			next;
+		}
+		if ($json->{'format_version'} eq '1') {
+			parse_json_gcov_v1($file, $json);
+		} else {
+			if ($json->{'format_version'}) {
+				die "Can't parse JSON version %d on file $file\n", $json->{'format_version'};
+			}
+			die "Unknown JSON format on file $file\n";
+		}
+	}
+	close IN;
+}
+
+sub read_info($)
 {
 	my $file = shift;
 	my $was_used = 0;
@@ -159,7 +331,7 @@ sub parse_info_data($)
 
 			$skip_func = 0;
 
-			$record{$source}{func}{$func}{fn} = $ln;
+			$record{$source}{func}{$func}{start_line} = $ln;
 			$all_func{$func}{$source}->{ln} = $ln;
 			next;
 		}
@@ -256,23 +428,23 @@ sub parse_info_data($)
 
 			$was_used = 1 if ($count > 0);
 
-			$record{$source}{func}{$func}{da}{$ln} += $count;
+			$record{$source}{line}{$ln}{count} += $count;
+			if (!defined($record{$source}{line}{$ln}{branches})) {
+				@{$record{$source}{line}{$ln}{branches}} = ();
+			}
+
 			$all_line{$source}{$ln} += $count;
+
 			next;
 		}
 
 		# LF:<number of instrumented lines>
 		if (m/^LF:(-?\d+)/) {
-			$record{$source}{func}{$func}{lf} = $1;
 			next;
 		}
 
 		# LH:<number of lines with a non-zero execution count>
 		if (m/^LH:(-?\d+)/) {
-			my $hits = $1;
-			if (!defined($record{$source}{func}{$func}{lh}) || $record{$source}{func}{$func}{lh} < $hits) {
-				$record{$source}{func}{$func}{lh} = $hits;
-			}
 			next;
 		}
 
@@ -319,21 +491,29 @@ sub write_filtered_file($)
 			$filtered .= "SF:$source\n";
 		}
 
-		foreach my $func(sort keys %{ $record{$source} }) {
+		foreach my $func(sort keys %{ $record{$source}{func} }) {
 			if ($func ne $before_sf) {
 				my $fn;
 				my $fnda;
 
-				if (defined($record{$source}{func}{$func}{fn})) {
-					$filtered .= "FN:" . $record{$source}{func}{$func}{fn} . ",$func\n";
+				if (defined($record{$source}{func}{$func}{start_line})) {
+					$filtered .= "FN:" . $record{$source}{func}{$func}{start_line} . ",$func\n";
 				}
 				if (defined($record{$source}{func}{$func}{fnda})) {
 					$filtered .= "FNDA:" . $record{$source}{func}{$func}{fnda} . ",$func\n";
 				}
 
 			}
+		}
+
+		foreach my $ln(sort { $a <=> $b } keys %{ $record{$source}{line} }) {
+			$filtered .= "DA:$ln," . $record{$source}{line}{$ln}{count} . "\n";
+
+			my $i = 0;
+			for ($i = 0, $i < scalar(@{$record{$source}{line}{$ln}{branches}}), $i++) {
+				my $taken = $record{$source}{line}{$ln}{branches}[$i]{count};
 				$taken = "-" if (!$taken);
-				$filtered .= "BRDA:$where,$taken\n";
+				$filtered .= "BRDA:$ln,0,$i,$taken\n";
 			}
 		}
 
@@ -1042,7 +1222,11 @@ if ($ignore_unused) {
 }
 
 foreach my $f (@ARGV) {
-	parse_info_data($f);
+	if ($f =~ /.json$/) {
+		read_json($f);
+	} else {
+		read_info($f);
+	}
 
 	if ($gen_report) {
 		$f =~ s,.*/,,;
-- 
2.43.0

