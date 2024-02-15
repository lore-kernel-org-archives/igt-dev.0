Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB70C48BF0
	for <igt-dev@archiver.kernel.org>; Thu, 15 Feb 2024 10:27:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B170410E5A9;
	Thu, 15 Feb 2024 10:27:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jYYdcqOX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DACE10E43D
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 10:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707992852; x=1739528852;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding:sender;
 bh=p1NZ0cx/wZ+XVDc3qtuanDHkl5KdyPnfjlxfslv4V9E=;
 b=jYYdcqOXstbTqleNGU56GD46CfjS7PFRV+0bfsqZ/ovuLuu00XJVCAYL
 gntddIQlKnKUdJbnFiYm+Hje42B8bS3Wrc+fxzZxx23PZzP+egIDl11nW
 lchylkD74+BiT+iVeRe7maQ9ZOJbQjG4F/gh6UWl47O2Q3MceXq46YuvH
 17JPiDHRO/42hSRMHBnbCcmJ+1xFwZ82zR0uPRVMVAa9+A3SSCDP6V3bC
 0ltCo/T3oKNObtgL8cxh9AEPVqGwdouBYyZST1VuSVrP6VmHSBzikhjrY
 ralYrXL4luCGwEA0toI0/7qr5CbOTFQBkHf/D2HQlCinq55wP7NZe9o0H w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="2199369"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="2199369"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 02:27:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; d="scan'208";a="40981606"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 02:27:31 -0800
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.246.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 07BFA580F25
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 02:27:31 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1raYxk-00000003JBS-3Xg4 for igt-dev@lists.freedesktop.org;
 Thu, 15 Feb 2024 11:27:28 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 09/17] scripts/code_cov_parse_info: stop recording/writing too
 old fields
Date: Thu, 15 Feb 2024 11:27:18 +0100
Message-ID: <ee96b3366066e1e00ae7b55466f822b3bd98ca13.1707992666.git.mchehab@kernel.org>
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

As we'll be using json as basis, drop support for the fields that:

- aren't used at the reports;
- aren't even present when lcov parses gcc json format.

Such fields are only handled on lcov for very old gcc versions.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/code_cov_parse_info | 33 ---------------------------------
 1 file changed, 33 deletions(-)

diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
index 92091215d224..038440a9c3e3 100644
--- a/scripts/code_cov_parse_info
+++ b/scripts/code_cov_parse_info
@@ -201,15 +201,10 @@ sub parse_info_data($)
 
 		# FNF:<number of functions found>
 		if (m/^FNF:(-?\d+)/) {
-			$record{$source}{func}{$func}{fnf} = $1;
 			next;
 		}
 		# FNH:<number of function hit>
 		if (m/^FNH:(-?\d+)/) {
-			my $hits = $1;
-			if (!defined($record{$source}{func}{$func}{fnh}) || $record{$source}{func}{$func}{fnh} < $hits) {
-				$record{$source}{func}{$func}{fnh} = $hits;
-			}
 			next;
 		}
 
@@ -240,15 +235,10 @@ sub parse_info_data($)
 
 		# BRF:<number of branches found>
 		if (m/^BRF:(-?\d+)/) {
-			$record{$source}{func}{$func}{brf} = $1;
 			next;
 		}
 		# BRH:<number of branches hit>
 		if (m/^BRH:(-?\d+)/) {
-			my $hits = $1;
-			if (!defined($record{$source}{func}{$func}{brh}) || $record{$source}{func}{$func}{brh} < $hits) {
-				$record{$source}{func}{$func}{brh} = $hits;
-			}
 			next;
 		}
 
@@ -340,34 +330,11 @@ sub write_filtered_file($)
 				if (defined($record{$source}{func}{$func}{fnda})) {
 					$filtered .= "FNDA:" . $record{$source}{func}{$func}{fnda} . ",$func\n";
 				}
-				if ($record{$source}{fnf}) {
-					$filtered .= "FNF:". $record{$source}{func}{$func}{fnf} ."\n";
-				}
-				if ($record{$source}{fnh}) {
-					$filtered .= "FNH:". $record{$source}{func}{$func}{fnh} ."\n";
-				}
-			}
 
-			foreach my $ln(sort { $a <=> $b } keys %{ $record{$source}{func}{$func}{da} }) {
-				$filtered .= "DA:$ln," . $record{$source}{func}{$func}{da}{$ln} . "\n";
 			}
-			foreach my $where(sort sort_where keys %{ $record{$source}{func}{$func}{brda} }) {
-				my $taken = $record{$source}{func}{$func}{brda}{$where};
 				$taken = "-" if (!$taken);
 				$filtered .= "BRDA:$where,$taken\n";
 			}
-			if ($record{$source}{func}{$func}{brf}) {
-				$filtered .= "BRF:". $record{$source}{func}{$func}{brf} ."\n";
-			}
-			if ($record{$source}{func}{$func}{brh}) {
-				$filtered .= "BRH:". $record{$source}{func}{$func}{brh} ."\n";
-			}
-			if ($record{$source}{func}{$func}{lf}) {
-				$filtered .= "LF:". $record{$source}{func}{$func}{lf} ."\n";
-			}
-			if ($record{$source}{func}{$func}{lh}) {
-				$filtered .= "LH:". $record{$source}{func}{$func}{lh} ."\n";
-			}
 		}
 
 		$filtered .= "end_of_record\n";
-- 
2.43.0

