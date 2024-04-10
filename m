Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B316ACD128A
	for <igt-dev@archiver.kernel.org>; Wed, 10 Apr 2024 01:15:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 224A6113065;
	Wed, 10 Apr 2024 01:15:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OkJTJERX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E18010F44D
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2024 01:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712711727; x=1744247727;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xhd6rjtXlCaGS8eDECQoY03paW+erM+j6w8yF9hlzZU=;
 b=OkJTJERX8nv3JailBNPCwKKiCcyUaNc5HEx0+6NFmcUfpsUWLp17VDuq
 +uy6eHUdEKV2HHzQiPafNHLwABgOAC/O1MjqudIG2cD+AT4NvYWUyUM9J
 qHFm/hX+lO1hc8j7JgLTF1rrRB8lDxgQbgs9hgobsSgJSMbYXyy2vdolO
 WuJmYpCjCjn2bu1NV73Q+M4lRXqGEW93cXaE4kCelCuJzv6Tj83TVeJ/O
 0Grt6H9j1jaVxW7RobHOgK8vPHU851YAtIxWdfYNdswDEhp5CewcKgM+6
 fZkzvLrpTS5UEG3qiRAiSUCN1T0kLFwmsC+dsaBj033E6O7H4u/Jg+4Xq Q==;
X-CSE-ConnectionGUID: d73cXxUsQDuBIyrSFlJZkw==
X-CSE-MsgGUID: L4a3Sy2KQ2WyC/tJ2c1pBA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="7914918"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="7914918"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 18:15:26 -0700
X-CSE-ConnectionGUID: XjxO/PxoRRe2dKO/TZExog==
X-CSE-MsgGUID: c3xuwe1VRiSQwibCvaznCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="25153952"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 18:15:24 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] tests/intel/xe_vm: Always have at least 2 pages bound in
 hammer sections
Date: Tue,  9 Apr 2024 18:15:42 -0700
Message-Id: <20240410011542.409087-1-matthew.brost@intel.com>
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

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/intel/xe_vm.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index bd4973cc38..53acc650dc 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -1845,10 +1845,10 @@ igt_main
 		{ "either-side-partial", 4, 2, 1, 2, 0 },
 		{ "either-side-partial-hammer", 4, 2, 1, 2,
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

