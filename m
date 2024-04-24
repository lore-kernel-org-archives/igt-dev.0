Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60618C4345F
	for <igt-dev@archiver.kernel.org>; Wed, 24 Apr 2024 21:42:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F16113E0E;
	Wed, 24 Apr 2024 21:42:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D1YUDHRp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 176DF113E0E
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Apr 2024 21:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713994943; x=1745530943;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MFggBwJUDoB6zQ2Y+qnCpthtqoVuHorTgAlrGElO0j8=;
 b=D1YUDHRp+I2SNQK0ts48WsHl59BeSkkkCaRZpNPLI36TDQzJF7d/BC2O
 JpBQ1ZR2wkYUAdF+b6cYnO9/hDY+NdYHrvrPbE4kYF0RRXNesDd2iESrg
 idjZ5okSyMPt2JK7vToJNVU3xmP7yJwa025SxLNWJiXoPmIhezDdcZ3JJ
 sWTS2NBXFxq+dIIf7wQg+pSPT7croDdnDmpRv9eltKWgwdRLUEwB5EQPY
 eAtdbovIrCuCIrcXhbfqCYzlKWqrX/ncxaTlD86EnbKYXj9EjAwgfzp6f
 xb6c+DGQanKEf7W2U6Oq+F+GhZ2/ivR5MF8FZrA+WA7s+Tte2zbW4DUbO g==;
X-CSE-ConnectionGUID: L4TZF/wTR22FHi+x5kXOaA==
X-CSE-MsgGUID: JT/GR21uQMCi4k4YVWRfyw==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9523794"
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; 
   d="scan'208";a="9523794"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 14:42:22 -0700
X-CSE-ConnectionGUID: yNw/0PPZR2uzZDYS3zhzTw==
X-CSE-MsgGUID: Qu719mMXRR+XRWElcqCP6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; d="scan'208";a="24891305"
Received: from jrandhaw-desk.jf.intel.com ([10.24.12.119])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 14:42:22 -0700
From: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
To: 
Cc: igt-dev@lists.freedesktop.org, jonathan.cavitt@intel.com,
 matthew.brost@intel.com, Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Subject: [PATCH i-g-t,
 v2] tests/intel/xe_vm: Always have at least 2 pages bound in mmap
 hammer sections
Date: Wed, 24 Apr 2024 14:42:20 -0700
Message-ID: <f64507be1d789da9c6a22ece15e88d0f7d4a147c.1713994566.git.jagmeet.randhawa@intel.com>
X-Mailer: git-send-email 2.25.1
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
Message-ID: <20240424214220.N_i1p7TScy9PLrOwx3TKmnsQgxe-rjSyOFA-j3ewUvc@z>

Fixes: ee0a9c8e30f6 ("tests/intel/xe_vm: Always
have at least 2 pages bound in munmap hammer sections")

This patch extends the recent improvements made
to the munmap hammer sections by applying a similar
fix to the mmap hammer sections.

If the prefetch buffer is 2k or larger the munmap hammer sections will
prefetch the next page, if the page is unbound a fault will occur.
Account for larger prefetchs by always having at least 2 pages bound for
the hammer thread.

Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
---
 tests/intel/xe_vm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index de2b1a813..9872df832 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -1913,12 +1913,12 @@ igt_main
 		{ "one-partial", 4, 1, 1, 2, 0 },
 		{ "either-side-partial", 4, 2, 1, 2, 0 },
 		{ "either-side-full", 4, 4, 1, 2, 0 },
-		{ "either-side-partial-hammer", 4, 2, 1, 2,
+		{ "either-side-partial-hammer", 6, 2, 2, 2,
 			MAP_FLAG_HAMMER_FIRST_PAGE },
-		{ "either-side-partial-split-page-hammer", 4, 2, 1, 2,
+		{ "either-side-partial-split-page-hammer", 6, 2, 2, 2,
 			MAP_FLAG_HAMMER_FIRST_PAGE |
 			MAP_FLAG_LARGE_PAGE },
-		{ "either-side-partial-large-page-hammer", 4, 2, 1, 2,
+		{ "either-side-partial-large-page-hammer", 6, 2, 2, 2,
 			MAP_FLAG_HAMMER_FIRST_PAGE |
 			MAP_FLAG_LARGE_PAGE |
 			MAP_FLAG_LARGE_PAGE_NO_SPLIT },
@@ -1926,7 +1926,7 @@ igt_main
 		{ "front", 4, 2, 1, 3, 0 },
 		{ "many-all", 4 * 8, 2 * 8, 0 * 8, 4 * 8, 0 },
 		{ "many-either-side-partial", 4 * 8, 2 * 8, 1, 4 * 8 - 2, 0 },
-		{ "many-either-side-partial-hammer", 4 * 8, 2 * 8, 1, 4 * 8 - 2,
+		{ "many-either-side-partial-hammer", 4 * 8, 2 * 8, 2, 4 * 8 - 4,
 			MAP_FLAG_HAMMER_FIRST_PAGE },
 		{ "userptr-all", 4, 2, 0, 4, MAP_FLAG_USERPTR },
 		{ "userptr-one-partial", 4, 1, 1, 2, MAP_FLAG_USERPTR },
-- 
2.25.1

