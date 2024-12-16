Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B1CBE77186
	for <igt-dev@archiver.kernel.org>; Mon, 16 Dec 2024 13:12:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0F3010E63F;
	Mon, 16 Dec 2024 13:12:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LF+S3aBK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A4310E63F
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Dec 2024 13:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734354728; x=1765890728;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E4A3q1Oa4yQb3SS3z5I70kysXdWp1THZ+xk1MZN8dUA=;
 b=LF+S3aBKLilPvjHfa/UAKi0T7SYrPFtXFDoQOJ3QfJgIzqaIqVgexvxW
 mStYg1jFhxCXF67plDl87z+mzfVHMrtCdU5gbW752jUh/DPH/aodS0xR3
 F3svZd9IaWMXuzxuLIZB52uOVgFXlz9EiUQ0c31cFuEIxiKzWft2hU/5k
 5VA3ENG+yf0oUI5iKSOGVndv0K5pg0n/hrWu0UGkjjIwrAD2R3Gal+L9d
 Qzeh6/4DJYLRriUOcbcG+OlqTOu/xBV53uCw/u8CnSclDyJjL9YZcCzlz
 ZyGwONpzHLbe5mqgGWWgADc4UxH559v6oEv1XP968vjJ4u+unsyY5aJBM g==;
X-CSE-ConnectionGUID: 6r6mXNuiRwmtADOVEgDlZg==
X-CSE-MsgGUID: dghRn8s4Su2B39xhZQ2btQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34616787"
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; d="scan'208";a="34616787"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 05:12:07 -0800
X-CSE-ConnectionGUID: LZdk2tM3SkCGbEpfQEsM3A==
X-CSE-MsgGUID: i2lRKs+cR2iY7On9Yiccrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; d="scan'208";a="127997717"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO dgrzegor-mobl2..)
 ([10.245.245.5])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 05:12:06 -0800
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH i-g-t 2/2] tests/xe_eudebug: Use library helper to enable
 ccs_mode
Date: Mon, 16 Dec 2024 14:11:37 +0100
Message-Id: <20241216131137.50945-2-dominik.grzegorzek@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241216131137.50945-1-dominik.grzegorzek@intel.com>
References: <20241216131137.50945-1-dominik.grzegorzek@intel.com>
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

igt_require call within ccs_mode_all_enginesi() when
condition was not met left fd variable uninitialized, what
caused xe_eudebug_enable in the cleanup fixure to fail like below:

Test assertion failure function enable_getset, file ../lib/xe/xe_eudebug.c:1795:
(xe_eudebug:23606) xe/xe_eudebug-CRITICAL: Failed assertion: fstat(fd, &st) == 0
(xe_eudebug:23606) xe/xe_eudebug-CRITICAL: Last errno: 9, Bad file descriptor
(xe_eudebug:23606) xe/xe_eudebug-CRITICAL: error: -1 != 0
Stack trace:
  #0 ../lib/igt_core.c:2051 __igt_fail_assert()
  #1 ../lib/xe/xe_eudebug.c:1851 xe_eudebug_enable()
  #2 ../tests/intel/xe_eudebug.c:2870 __igt_unique____real_main2757()
  #3 ../tests/intel/xe_eudebug.c:2757 main()
  #4 ../sysdeps/nptl/libc_start_call_main.h:58 __libc_start_call_main()
  #5 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()

Fix that by using xe_sysfs_enable_css_mode library function which opens
drm fd before calling igt_require. As here, move the check outside the
fixture to simplify code.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 tests/intel/xe_eudebug.c | 38 ++++----------------------------------
 1 file changed, 4 insertions(+), 34 deletions(-)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 22b0da658..c566d0980 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -26,6 +26,7 @@
 #include "xe/xe_eudebug.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
+#include "xe/xe_util.h"
 
 /**
  * SUBTEST: sysfs-toggle
@@ -2729,31 +2730,6 @@ static void test_basic_exec_queues_enable(int fd)
 	xe_vm_destroy(fd, vm_non_lr);
 }
 
-static void ccs_mode_all_engines(int num_gt)
-{
-	int fd, gt, gt_fd, num_slices, ccs_mode;
-	int num_gts_with_ccs_mode = 0;
-
-	for (gt = 0; gt < num_gt; gt++) {
-		fd = drm_open_driver(DRIVER_XE);
-		gt_fd = xe_sysfs_gt_open(fd, gt);
-		close(fd);
-
-		if (igt_sysfs_scanf(gt_fd, "num_cslices", "%u", &num_slices) <= 0)
-			continue;
-
-		num_gts_with_ccs_mode++;
-
-		igt_assert(igt_sysfs_printf(gt_fd, "ccs_mode", "%u", num_slices) > 0);
-		igt_assert(igt_sysfs_scanf(gt_fd, "ccs_mode", "%u", &ccs_mode) > 0);
-		igt_assert(num_slices == ccs_mode);
-		close(gt_fd);
-	}
-
-	errno = 0;
-	igt_require(num_gts_with_ccs_mode > 0);
-}
-
 igt_main
 {
 	bool was_enabled;
@@ -2856,15 +2832,9 @@ igt_main
 	igt_subtest("discovery-empty-clients")
 		test_empty_discovery(fd, DISCOVERY_DESTROY_RESOURCES, 16);
 
-	igt_subtest_group {
-		igt_fixture {
-			drm_close_driver(fd);
-			ccs_mode_all_engines(gt_count);
-			fd = drm_open_driver(DRIVER_XE);
-		}
-
-		igt_subtest("exec-queue-placements")
-			test_basic_sessions(fd, EXEC_QUEUES_PLACEMENTS, 1, true);
+	igt_subtest("exec-queue-placements") {
+		xe_sysfs_enable_ccs_mode(&fd);
+		test_basic_sessions(fd, EXEC_QUEUES_PLACEMENTS, 1, true);
 	}
 
 	igt_fixture {
-- 
2.34.1

