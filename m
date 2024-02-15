Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB11C48BF2
	for <igt-dev@archiver.kernel.org>; Thu, 15 Feb 2024 10:27:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CEA210E5F8;
	Thu, 15 Feb 2024 10:27:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n35aLgqp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B373510E43D
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 10:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707992852; x=1739528852;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding:sender;
 bh=C/+DpOyYGXs19/XAxzeBzk03h43UIjpfWaf13XQAAIA=;
 b=n35aLgqpjBmcoer/eBgRVUg1ZdQZDC9IwhwuS+mKo/+zzX1+LmdQ3wNF
 7FVC71HOWO3PjPNZgaC9iE1NMWhERYhv2XR6mthlpMffNyvwEeBuLl9Zk
 rG7juq18ohGfvT4vCbwGEwA9nss02cFY4N+k/Q/7j0I8xLdgF8K4Uysek
 0u4oRfeKbHM+oITHnejmFhw0TUIzeFMO6SZvUyetJNvY3vnHSXvZwAXBn
 9aawIlhA1UbvVoO+CPAIY54cVDZEpu/jLTnLsKAAeMe7lkHCpVGfvQBNw
 83EG9LCfwkQTl3/lPtf8+0UZxl5RGsO3HACTHBVf8lk9y1ILinltQscmA w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="2199365"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="2199365"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 02:27:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; d="scan'208";a="40981602"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 02:27:31 -0800
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.246.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id CF1FD580E0C
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 02:27:30 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1raYxk-00000003JBG-3MOG for igt-dev@lists.freedesktop.org;
 Thu, 15 Feb 2024 11:27:28 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 06/17] scripts/code_cov_parse_info: prepare $all_branch to get
 function data
Date: Thu, 15 Feb 2024 11:27:15 +0100
Message-ID: <f36c320f1be10d56a076464ed68fd4172c9e13aa.1707992666.git.mchehab@kernel.org>
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

Right now, we store only the branch counts. We also need to store
the functions that each branch belongs. So, add a new hash in
order to allow adding function data later on.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/code_cov_parse_info | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
index 1be7fddf3f3e..d28217cc196d 100755
--- a/scripts/code_cov_parse_info
+++ b/scripts/code_cov_parse_info
@@ -233,7 +233,7 @@ sub parse_info_data($)
 			$was_used = 1 if ($taken > 0);
 
 			$record{$source}{$func}{brda}{$where} += $taken;
-			$all_branch{$source}{"$where"} += $taken;
+			$all_branch{$source}{"$where"}{count} += $taken;
 			next;
 		}
 
@@ -448,7 +448,7 @@ sub gen_stats()
 
 		foreach my $where (keys(%{$all_branch{$source}})) {
 			$stats{"branch_count"}++;
-			$stats{"branch_reached"}++ if ($all_branch{$source}{$where} != 0);
+			$stats{"branch_reached"}++ if ($all_branch{$source}{$where}{count} != 0);
 		}
 	}
 
@@ -607,7 +607,7 @@ sub generate_report($)
 		}
 		foreach my $source (keys(%{$report{$f}{"all_branch"}})) {
 			foreach my $where (keys(%{$report{$f}{"all_branch"}{$source}})) {
-				$all_branch{$source}{"$where"} += $report{$f}{"all_branch"}{$source}{$where};
+				$all_branch{$source}{"$where"}{count} += $report{$f}{"all_branch"}{$source}{$where}{count};
 			}
 		}
 		for my $source(keys(%{$report{$f}{"files"}})) {
@@ -887,7 +887,7 @@ sub check_source_branches()
 
 		my @lines;
 		foreach my $where (sort keys %{$all_branch{$source}}) {
-			my $taken = $all_branch{$source}{$where};
+			my $taken = $all_branch{$source}{$where}{count};
 			next if ($taken > 0);
 
 			next if !($where =~ m/^(-?\d+),(-?\d+),(-?\d+)/);
-- 
2.43.0

