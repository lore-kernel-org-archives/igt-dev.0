Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40BF5C48BEB
	for <igt-dev@archiver.kernel.org>; Thu, 15 Feb 2024 10:27:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8A5710E57F;
	Thu, 15 Feb 2024 10:27:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jb8eo1sA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89C5B10E43D
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 10:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707992853; x=1739528853;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding:sender;
 bh=OVlakCY/tfRkA+pkq4hy4594lZzKD8eUZjQ5GqdXAv4=;
 b=Jb8eo1sAb/ft7ObuQ60FmdPV1A3EUxcPrg2ug1DOh7YVgne2aUTzUuH6
 ZbhOmMwixvrGfBdEV49SqLflmEXj/i1+tDbpohcEPoDme2oxFyDojdqHa
 IR5nQODQA3Q9mHaMzcGUpYqGbppKuYQ1A50nMdPb4npyRc8UnhKDpPrPw
 CmndWxPBU62EYSfEZS3c43d7wGhFK8ve8Inz7nKumoK7BJ5IGeN4ukpU3
 f3ll2v5p6jIq7JF2kLq6Kj1cymwzQ9J4uN/e2e4I7/XKpTj0bOnup9P6h
 80XBJ1EJqK2WT3lv4fwduJTQ+iT5mjlcq5g1sL1fU3rQ2xg/TAY7vy0q5 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="2199371"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="2199371"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 02:27:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; d="scan'208";a="40981608"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 02:27:32 -0800
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.246.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 256A2580F28
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 02:27:31 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1raYxk-00000003JBu-3xlZ for igt-dev@lists.freedesktop.org;
 Thu, 15 Feb 2024 11:27:28 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 16/17] scripts/code_cov_parse_info: fix files statistics
Date: Thu, 15 Feb 2024 11:27:25 +0100
Message-ID: <d1311547b770751f807709e2c41fea23584b87d6.1707992666.git.mchehab@kernel.org>
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

With fields rename at %record, the number of filtered files
is not reflecting what it was actually there. Also, the was_used
logic for json format was not parsing the same way as it used to
be with info format.

Fix those.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/code_cov_parse_info | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
index 3ce26e545aee..9d043a987f44 100755
--- a/scripts/code_cov_parse_info
+++ b/scripts/code_cov_parse_info
@@ -126,7 +126,6 @@ sub parse_json_gcov_v1($$)
 	my $file = shift;
 	my $json = shift;
 
-	my $was_used = 0;
 	my $has_func = 0;
 	my $ignore = 0;
 
@@ -149,6 +148,7 @@ sub parse_json_gcov_v1($$)
 	my %cached;
 	for my $file_ref (@{$json->{'files'}}) {
 		my $source = $file_ref->{'file'};
+		my $was_used = 0;
 
 		$files{$source} = 1;
 		next if is_file_excluded($source);
@@ -181,8 +181,6 @@ sub parse_json_gcov_v1($$)
 				$was_used = 1;
 			}
 		}
-		next if ($ignore_unused && !$was_used);
-		$used_source{$source} = 1;
 
 		# Parse lines and branches
 		for my $line_ref (@{$file_ref->{'lines'}}) {
@@ -267,6 +265,7 @@ sub parse_json_gcov_v1($$)
 				}
 
 				$all_branch{$source}{$where}{count} += $branch_ref->{'count'};
+				$was_used = 1 if ($branch_ref->{'count'} > 0);
 
 				$i++;
 			}
@@ -274,6 +273,8 @@ sub parse_json_gcov_v1($$)
 				@{$record{files}{$source}{line}{$ln}{branches}} = ();
 			}
 		}
+		next if ($ignore_unused && !$was_used);
+		$used_source{$source} = 1;
 	}
 
 	# As the record was changed, we need to use a different format name
@@ -285,7 +286,6 @@ sub parse_json_internal_format_v1($$)
 	my $file = shift;
 	my $json = shift;
 
-	my $was_used = 0;
 	my $has_func = 0;
 	my $ignore = 0;
 	my %cached;
@@ -305,6 +305,8 @@ sub parse_json_internal_format_v1($$)
 
 	for my $source (keys %{$json->{'files'}}) {
 		$files{$source} = 1;
+		my $was_used = 0;
+
 		next if is_file_excluded($source);
 
 		my $file_ref = \%{$json->{'files'}{$source}};
@@ -332,8 +334,6 @@ sub parse_json_internal_format_v1($$)
 				$was_used = 1;
 			}
 		}
-		next if ($ignore_unused && !$was_used);
-		$used_source{$source} = 1;
 
 		# Parse lines and branches
 		for my $ln (keys %{$file_ref->{line}}) {
@@ -400,12 +400,15 @@ sub parse_json_internal_format_v1($$)
 				}
 
 				$all_branch{$source}{$where}{count} += $taken;
+				$was_used = 1 if ($taken > 0);
 				$i++;
 			}
 			if (!defined($record{files}{$source}{line}{$ln}{branches})) {
 				@{$record{files}{$source}{line}{$ln}{branches}} = ();
 			}
 		}
+		next if ($ignore_unused && !$was_used);
+		$used_source{$source} = 1;
 	}
 }
 
@@ -876,7 +879,7 @@ sub gen_stats()
 
 	# per-file coverage stats
 	$stats{"all_files"} = scalar keys(%files);
-	$stats{"filtered_files"} = scalar keys(%record);
+	$stats{"filtered_files"} = scalar keys(%{$record{files}});
 	$stats{"used_files"} = scalar keys(%used_source);
 }
 
-- 
2.43.0

