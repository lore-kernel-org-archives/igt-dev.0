Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05EFECD1297
	for <igt-dev@archiver.kernel.org>; Wed, 10 Apr 2024 01:21:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E90A113049;
	Wed, 10 Apr 2024 01:21:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fALOx6Fy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A355113049
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2024 01:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712712082; x=1744248082;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lZ360vegXICrA0wv3aqSOTn2bf0hr577vYCsyJkKFZI=;
 b=fALOx6FyFkh2QgoDfJV6DPEBn6+Ro/RPKwMB+BXSAKjXaYPiPWJJL8T+
 UHM+H7oLloKw3+0+uNwvv2GPUbO2CRcr5+x1OwnoElwhCuY8VebEz6mGP
 LrBl0IIdiv6FZhDvxAe/07VXW66bh5lfqt3h2i6esdLukVAHkgpLXs/j6
 L8NcrZDao9AacqTBvFn+bF0/4cATsE28a4BKb7AbIrO1zFugDtwXOaUE+
 nJ7c71eOfSOV6WKHWosL1ek19LGY//oD7EIqmqkaYE2sSv3Kv8u62PCBn
 OC/om7HOhfRozgLvByVQHbZKQ5hYfScp7fsqOLFkyOLwR2M8jyN3k3FXP A==;
X-CSE-ConnectionGUID: TL5aWTl/SSm5MiQr9tYVsw==
X-CSE-MsgGUID: JE2XQ1C3RvWg4AE/da+6Gw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="19441810"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="19441810"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 18:21:22 -0700
X-CSE-ConnectionGUID: UOjUsQ1XQUiL4GPonj/A4g==
X-CSE-MsgGUID: Mq9ev+VOTquAtCK9kGmg5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20499062"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 18:21:21 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH v2] tests/intel/xe_vm: Always have at least 2 pages bound in
 hammer sections
Date: Tue,  9 Apr 2024 18:21:48 -0700
Message-Id: <20240410012148.409170-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

If the prefetch buffer is 2k or larger the hammer sections will prefetch
the next page, if the page is unbound a fault will occur. Account for
larger prefetchs by always having at least 2 pages bound for the hammer
thread.

v2:
 - Missed table entry

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/intel/xe_vm.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index bd4973cc38..9f9f61b7ef 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -1843,12 +1843,12 @@ igt_main
 		{ "all", 4, 2, 0, 4, 0 },
 		{ "one-partial", 4, 1, 1, 2, 0 },
 		{ "either-side-partial", 4, 2, 1, 2, 0 },
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
@@ -1857,7 +1857,7 @@ igt_main
 		{ "front", 4, 2, 1, 3, 0 },
 		{ "many-all", 4 * 8, 2 * 8, 0 * 8, 4 * 8, 0 },
 		{ "many-either-side-partial", 4 * 8, 2 * 8, 1, 4 * 8 - 2, 0 },
-		{ "many-either-side-partial-hammer", 4 * 8, 2 * 8, 1, 4 * 8 - 2,
+		{ "many-either-side-partial-hammer", 4 * 8, 2 * 8, 2, 4 * 8 - 4,
 			MAP_FLAG_HAMMER_FIRST_PAGE },
 		{ "many-either-side-full", 4 * 8, 4 * 8, 1 * 8, 2 * 8, 0 },
 		{ "many-end", 4 * 8, 4, 0 * 8, 3 * 8 + 2, 0 },
@@ -1902,12 +1902,12 @@ igt_main
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
@@ -1915,7 +1915,7 @@ igt_main
 		{ "front", 4, 2, 1, 3, 0 },
 		{ "many-all", 4 * 8, 2 * 8, 0 * 8, 4 * 8, 0 },
 		{ "many-either-side-partial", 4 * 8, 2 * 8, 1, 4 * 8 - 2, 0 },
-		{ "many-either-side-partial-hammer", 4 * 8, 2 * 8, 1, 4 * 8 - 2,
+		{ "many-either-side-partial-hammer", 4 * 8, 2 * 8, 2, 4 * 8 - 4,
 			MAP_FLAG_HAMMER_FIRST_PAGE },
 		{ "userptr-all", 4, 2, 0, 4, MAP_FLAG_USERPTR },
 		{ "userptr-one-partial", 4, 1, 1, 2, MAP_FLAG_USERPTR },
-- 
2.34.1

