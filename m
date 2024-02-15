Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7687BC48BF4
	for <igt-dev@archiver.kernel.org>; Thu, 15 Feb 2024 10:27:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84F2C10E5FA;
	Thu, 15 Feb 2024 10:27:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gPwHXzCj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5194C10E57F
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 10:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707992852; x=1739528852;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding:sender;
 bh=/R56gUV1exYc6P6v9EgDADO08+HzCfl93unccT1Gss8=;
 b=gPwHXzCjIeHDUrrGpbpWH8hZjebWgeig8qYL/j8yF6u24E458bHkS7+n
 nvfpwWpHUme4WlPoaHJILvm9pSiCJohhG1cYFAknkShZ9fm3McJTsW8Oz
 mvsE/obG55Vgbgp9IW0heraGLg620ePYqd9kva7iV8ci2la9ZGeNguLO9
 myS1anrjGgh/fou1m085HB8aSJsCPfrWn/AIf9qfNCmm+hjrEBv58hBeI
 Dsf1nHQ8YQCe6TOya9bbrzo6FQN2/35dvFdr47yC3vkcDfmgQU9BZWCMz
 iW3gHH887j1XHhRcLGmxBWICW1NBsmNL9vx5M9pi340b2zrjCTf31R6Ar w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="5038594"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="5038594"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 02:27:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="3480344"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 02:27:31 -0800
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.246.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id C5A7F580DEF
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 02:27:30 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1raYxk-00000003JBD-3IfW for igt-dev@lists.freedesktop.org;
 Thu, 15 Feb 2024 11:27:28 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 05/17] scripts/code_cov_parse_info: add a tool to analyze
 branch coverage
Date: Thu, 15 Feb 2024 11:27:14 +0100
Message-ID: <01e104b16ff508affa4a018cecd034806f5030e1.1707992666.git.mchehab@kernel.org>
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

Branch coverage is trickier than functions. Add a tool that displays
the starting line that it is not being covered, together with up
to 10 context lines before.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/code_cov_parse_info | 86 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 85 insertions(+), 1 deletion(-)

diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
index f0fb5716a6ca..1be7fddf3f3e 100755
--- a/scripts/code_cov_parse_info
+++ b/scripts/code_cov_parse_info
@@ -879,6 +879,77 @@ sub generate_report($)
 	close OUT;
 }
 
+sub check_source_branches()
+{
+	foreach my $source (sort keys(%all_branch)) {
+		next if (!$used_source{$source});
+		next if (is_file_excluded($source));
+
+		my @lines;
+		foreach my $where (sort keys %{$all_branch{$source}}) {
+			my $taken = $all_branch{$source}{$where};
+			next if ($taken > 0);
+
+			next if !($where =~ m/^(-?\d+),(-?\d+),(-?\d+)/);
+
+			my ($ln, $block, $branch, $ctx_lines);
+			$ln = $1;
+			$block = $2;
+			$branch = $3;
+
+			if (!@lines) {
+				open IN, "$source" || die "File $source not found. Can't check branches\n";
+				@lines = <IN>;
+				close IN;
+			}
+
+			if ($ln >= $#lines) {
+				die "$source:$ln line is bigger than the number of lines at the file ($#lines lines)\n";
+				return;
+			}
+
+			my $func = $all_branch{$source}{$where}{func};
+			my $func_ln = $all_branch{$source}{$where}{func_ln};
+
+			print "Branch $source:$ln, ";
+			if ($func) {
+				if ($func_ln) {
+					print "func: $func, ";
+				} else {
+					print "func: $func:$func_ln, ";
+				}
+			}
+			print "block $block, branch $branch not taken:\n";
+
+			if ($func_ln) {
+				$ctx_lines = $ln - $func_ln;
+			} else {
+				$ctx_lines = 10;
+			}
+
+
+			# Search for up to $ctx_lines before the occurrence
+			my $context = "";
+			my $has_if;
+			$ln-- if ($ln > 0);
+			my $delim = "->";
+			for (my $if_ln = $ln; $if_ln >= 0 && (($ln - $if_ln) < $ctx_lines); $if_ln--) {
+				$context = "$if_ln$delim\t$lines[$if_ln]" . $context;
+				$delim = "";
+				if ($lines[$if_ln] =~ m/(\bif\b|#if)/) {
+					$has_if = 1;
+					last;
+				}
+			}
+			if ($has_if) {
+				print $context;
+			} else {
+				print "$ln->\t$lines[$ln]";
+			}
+		}
+	}
+}
+
 #
 # Argument handling
 #
@@ -896,6 +967,7 @@ my $show_lines;
 my $only_i915;
 my $only_xe;
 my $only_drm;
+my $check_branches;
 
 GetOptions(
 	"print-coverage|print_coverage|print|p" => \$print_used,
@@ -916,6 +988,7 @@ GetOptions(
 	"show-files|show_files" => \$show_files,
 	"show-lines|show_lines" => \$show_lines,
 	"report|r=s" => \$gen_report,
+	"check-branches" => \$check_branches,
 	"css-file|css|c=s" => \$css_file,
 	"title|t=s" => \$title,
 	"html-prolog|prolog=s" => \$html_prolog,
@@ -933,7 +1006,7 @@ if ($#ARGV < 0) {
 }
 
 # At least one action should be specified
-pod2usage(1) if (!$print_used && !$filter && !$stat && !$print_unused && !$gen_report);
+pod2usage(1) if (!$print_used && !$filter && !$stat && !$print_unused && !$gen_report && !$check_branches);
 
 pod2usage(1) if ($gen_report && ($print_used || $filter || $stat || $print_unused));
 
@@ -1024,6 +1097,11 @@ if ($gen_report) {
 
 gen_stats();
 
+
+if ($check_branches) {
+	check_source_branches();
+}
+
 die "Nothing counted. Wrong input files?" if (!$stats{"all_files"});
 
 print_code_coverage($print_used, $print_unused, $show_lines);
@@ -1294,6 +1372,12 @@ This option is automaticaly enabled when B<--func-filters> is used.
 Shows the list of files that were used to produce the code coverage
 results.
 
+=item B<--check-branches>
+
+Checks at the Linux Kernel source files what's the contents of the
+branches that weren't taken. The directory should match what's
+stored inside the info files.
+
 =item B<--verbose> or B<-v>
 
 Prints the name of each parsed file.
-- 
2.43.0

