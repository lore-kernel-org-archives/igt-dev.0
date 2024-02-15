Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 584F0C4829E
	for <igt-dev@archiver.kernel.org>; Thu, 15 Feb 2024 10:27:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4F2B10E57A;
	Thu, 15 Feb 2024 10:27:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bFrRNYNU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE59C10E57A
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 10:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707992852; x=1739528852;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding:sender;
 bh=hWvVSiFS0LKO+iv8phZ6cPH/xVzqgijdDVIiOo4GGFk=;
 b=bFrRNYNUnz7B7CY1V/f0wk9dXQr1hpOXzMIINzj/OHaWSFJO7w9giI7h
 zoqaLvO7VzNMPJ61heg3cAjyCO/9PwQ3KHAVxNLhID9swm4cEjygVpqIq
 Yw6aimXofbNjLabKruj7s3QR/6/mpKAW6N289g/rgjljm+Rcdd7UHy1K1
 nwC5lU5OwWJW6CMgRtJsL1Rn2r07VDO74uS66ThAwk3B2xs8llNVQ3eCH
 BjKaeItJV6DswbYTt02qkepuJbhed04HJioGD4enWnTNmvgGGVS7ws6Dk
 wvT8+W0SKL1YWAE2spitpOs7ytorIg9AYSnaJz2gJAh1WGf/HS0zdn1qY w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="2199366"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="2199366"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 02:27:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; d="scan'208";a="40981603"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 02:27:31 -0800
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.246.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id D4695580BE1
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 02:27:30 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1raYxk-00000003JBN-3To4 for igt-dev@lists.freedesktop.org;
 Thu, 15 Feb 2024 11:27:28 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 08/17] scripts/code_cov_parse_info: make parse_info_data more
 generic
Date: Thu, 15 Feb 2024 11:27:17 +0100
Message-ID: <5b697782da4b3510e2f18467b2dcba10dfd22ca4.1707992666.git.mchehab@kernel.org>
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

In preparation for adding support for JSON files, make the
function more generic.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/code_cov_parse_info | 67 +++++++++++++++++++------------------
 1 file changed, 34 insertions(+), 33 deletions(-)
 mode change 100755 => 100644 scripts/code_cov_parse_info

diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
old mode 100755
new mode 100644
index 56b27faee812..92091215d224
--- a/scripts/code_cov_parse_info
+++ b/scripts/code_cov_parse_info
@@ -98,6 +98,7 @@ sub parse_info_data($)
 			if ($1 ne $cur_test) {
 				$cur_test = $1;
 				$test_names{$cur_test} = 1;
+				$record{tests}{$cur_test} = 1;
 			}
 			$source = $before_sf;
 			$func = $before_sf;
@@ -158,7 +159,7 @@ sub parse_info_data($)
 
 			$skip_func = 0;
 
-			$record{$source}{$func}{fn} = $ln;
+			$record{$source}{func}{$func}{fn} = $ln;
 			$all_func{$func}{$source}->{ln} = $ln;
 			next;
 		}
@@ -186,7 +187,7 @@ sub parse_info_data($)
 			$skip_func = 0;
 			$was_used = 1;
 
-			$record{$source}{$func}{fnda} += $count;
+			$record{$source}{func}{$func}{fnda} += $count;
 			$used_func{$func}{$source}->{count} += $count;
 			next;
 		}
@@ -200,14 +201,14 @@ sub parse_info_data($)
 
 		# FNF:<number of functions found>
 		if (m/^FNF:(-?\d+)/) {
-			$record{$source}{$func}{fnf} = $1;
+			$record{$source}{func}{$func}{fnf} = $1;
 			next;
 		}
 		# FNH:<number of function hit>
 		if (m/^FNH:(-?\d+)/) {
 			my $hits = $1;
-			if (!defined($record{$source}{$func}{fnh}) || $record{$source}{$func}{fnh} < $hits) {
-				$record{$source}{$func}{fnh} = $hits;
+			if (!defined($record{$source}{func}{$func}{fnh}) || $record{$source}{func}{$func}{fnh} < $hits) {
+				$record{$source}{func}{$func}{fnh} = $hits;
 			}
 			next;
 		}
@@ -232,21 +233,21 @@ sub parse_info_data($)
 
 			$was_used = 1 if ($taken > 0);
 
-			$record{$source}{$func}{brda}{$where} += $taken;
-			$all_branch{$source}{"$where"}{count} += $taken;
+			$record{files}{$source}{line}{$ln}{branches}[$branch]{count} += $taken;
+			$all_branch{$source}{$where}{count} += $taken;
 			next;
 		}
 
 		# BRF:<number of branches found>
 		if (m/^BRF:(-?\d+)/) {
-			$record{$source}{$func}{brf} = $1;
+			$record{$source}{func}{$func}{brf} = $1;
 			next;
 		}
 		# BRH:<number of branches hit>
 		if (m/^BRH:(-?\d+)/) {
 			my $hits = $1;
-			if (!defined($record{$source}{$func}{brh}) || $record{$source}{$func}{brh} < $hits) {
-				$record{$source}{$func}{brh} = $hits;
+			if (!defined($record{$source}{func}{$func}{brh}) || $record{$source}{func}{$func}{brh} < $hits) {
+				$record{$source}{func}{$func}{brh} = $hits;
 			}
 			next;
 		}
@@ -265,22 +266,22 @@ sub parse_info_data($)
 
 			$was_used = 1 if ($count > 0);
 
-			$record{$source}{$func}{da}{$ln} += $count;
-			$all_line{$source}{"$ln"} += $count;
+			$record{$source}{func}{$func}{da}{$ln} += $count;
+			$all_line{$source}{$ln} += $count;
 			next;
 		}
 
 		# LF:<number of instrumented lines>
 		if (m/^LF:(-?\d+)/) {
-			$record{$source}{$func}{lf} = $1;
+			$record{$source}{func}{$func}{lf} = $1;
 			next;
 		}
 
 		# LH:<number of lines with a non-zero execution count>
 		if (m/^LH:(-?\d+)/) {
 			my $hits = $1;
-			if (!defined($record{$source}{$func}{lh}) || $record{$source}{$func}{lh} < $hits) {
-				$record{$source}{$func}{lh} = $hits;
+			if (!defined($record{$source}{func}{$func}{lh}) || $record{$source}{func}{$func}{lh} < $hits) {
+				$record{$source}{func}{$func}{lh} = $hits;
 			}
 			next;
 		}
@@ -333,39 +334,39 @@ sub write_filtered_file($)
 				my $fn;
 				my $fnda;
 
-				if (defined($record{$source}{$func}{fn})) {
-					$filtered .= "FN:" . $record{$source}{$func}{fn} . ",$func\n";
+				if (defined($record{$source}{func}{$func}{fn})) {
+					$filtered .= "FN:" . $record{$source}{func}{$func}{fn} . ",$func\n";
 				}
-				if (defined($record{$source}{$func}{fnda})) {
-					$filtered .= "FNDA:" . $record{$source}{$func}{fnda} . ",$func\n";
+				if (defined($record{$source}{func}{$func}{fnda})) {
+					$filtered .= "FNDA:" . $record{$source}{func}{$func}{fnda} . ",$func\n";
 				}
 				if ($record{$source}{fnf}) {
-					$filtered .= "FNF:". $record{$source}{$func}{fnf} ."\n";
+					$filtered .= "FNF:". $record{$source}{func}{$func}{fnf} ."\n";
 				}
 				if ($record{$source}{fnh}) {
-					$filtered .= "FNH:". $record{$source}{$func}{fnh} ."\n";
+					$filtered .= "FNH:". $record{$source}{func}{$func}{fnh} ."\n";
 				}
 			}
 
-			foreach my $ln(sort { $a <=> $b } keys %{ $record{$source}{$func}{da} }) {
-				$filtered .= "DA:$ln," . $record{$source}{$func}{da}{$ln} . "\n";
+			foreach my $ln(sort { $a <=> $b } keys %{ $record{$source}{func}{$func}{da} }) {
+				$filtered .= "DA:$ln," . $record{$source}{func}{$func}{da}{$ln} . "\n";
 			}
-			foreach my $where(sort sort_where keys %{ $record{$source}{$func}{brda} }) {
-				my $taken = $record{$source}{$func}{brda}{$where};
+			foreach my $where(sort sort_where keys %{ $record{$source}{func}{$func}{brda} }) {
+				my $taken = $record{$source}{func}{$func}{brda}{$where};
 				$taken = "-" if (!$taken);
 				$filtered .= "BRDA:$where,$taken\n";
 			}
-			if ($record{$source}{$func}{brf}) {
-				$filtered .= "BRF:". $record{$source}{$func}{brf} ."\n";
+			if ($record{$source}{func}{$func}{brf}) {
+				$filtered .= "BRF:". $record{$source}{func}{$func}{brf} ."\n";
 			}
-			if ($record{$source}{$func}{brh}) {
-				$filtered .= "BRH:". $record{$source}{$func}{brh} ."\n";
+			if ($record{$source}{func}{$func}{brh}) {
+				$filtered .= "BRH:". $record{$source}{func}{$func}{brh} ."\n";
 			}
-			if ($record{$source}{$func}{lf}) {
-				$filtered .= "LF:". $record{$source}{$func}{lf} ."\n";
+			if ($record{$source}{func}{$func}{lf}) {
+				$filtered .= "LF:". $record{$source}{func}{$func}{lf} ."\n";
 			}
-			if ($record{$source}{$func}{lh}) {
-				$filtered .= "LH:". $record{$source}{$func}{lh} ."\n";
+			if ($record{$source}{func}{$func}{lh}) {
+				$filtered .= "LH:". $record{$source}{func}{$func}{lh} ."\n";
 			}
 		}
 
-- 
2.43.0

