Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD498C48BEB
	for <igt-dev@archiver.kernel.org>; Thu, 22 Feb 2024 06:49:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C7B810E869;
	Thu, 22 Feb 2024 06:49:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P6wzqYXR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 781E410E869
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Feb 2024 06:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708584585; x=1740120585;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bxOBdyM7KxMG3huczXkR3Rk0UG4KE9tIKAjIIYkQy4E=;
 b=P6wzqYXRXXAZvg0fJV9UdRwLyjJKchQU03plx+CjDFPvl3g4v9O+zy9D
 6pPTPkzZJbQArxJFjs0j/7qk/7oL/gKXghX8Xgza4dN1xv26nYhXUyBPw
 gNDLmUQtJe+u98PqRc9hr6XI0OrChat8IGDZCxf/gwXNMtW4i9Wd3EQ9K
 x1/2IuRT1wibZf2sOBdTwQneeLGfKvSGS4pR9OV7iudF4oCFi4FIcdSXu
 fB1+R7HIGgHTpJRO8pNDQifopOqgI0XTUtP7q5G6cxiKDiYnmp5o4I8vq
 YA46mXZ+cFejNs7OfcGug3zUbcDEpVMNBOjZOhAY+I6RnV+onln702ys1 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="2705846"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="2705846"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 22:49:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="936794875"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; d="scan'208";a="936794875"
Received: from suja-super-server.iind.intel.com ([10.145.169.64])
 by fmsmga001.fm.intel.com with ESMTP; 21 Feb 2024 22:49:42 -0800
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com,
 Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Subject: [i-g-t] tests/intel: Add tests to run suspend without display
Date: Thu, 22 Feb 2024 12:36:35 +0530
Message-Id: <20240222070635.878953-1-sujaritha.sundaresan@intel.com>
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

Add tests to validate basic execution suspend/resume cycle
without display module to rule out display related issues
from the suspend/resume stack.

Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
---
 tests/intel/xe_pm.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index a0045da0b..e94835f0d 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -16,6 +16,7 @@
 
 #include "igt.h"
 #include "lib/igt_device.h"
+#include "lib/igt_kmod.h"
 #include "lib/igt_pm.h"
 #include "lib/igt_sysfs.h"
 #include "lib/igt_syncobj.h"
@@ -236,6 +237,10 @@ static void close_fw_handle(int sig)
  * Description: suspend/autoresume on %arg[1] state and exec after RPM
  * Functionality: pm - %arg[1]
  *
+ * SUBTEST: %s-without-display
+ * Description: suspend/autoresume on %arg[1] state without display
+ * Functionality: pm - %arg[1]
+ *
  * arg[1]:
  *
  * @s2idle:	s2idle
@@ -618,6 +623,23 @@ igt_main
 					  NO_RPM);
 		}
 
+		igt_subtest_f("%s-without-display", s->name) {
+
+			if (!drmModeGetResources(device.fd_xe))
+				return;
+
+			xe_for_each_engine(device.fd_xe, hwe) {
+				igt_kmsg(KMSG_INFO "Unloading Xe\n");
+				igt_assert_eq(igt_xe_driver_unload(),0);
+
+				igt_kmsg(KMSG_INFO "Re-loading Xe without display\n");
+				igt_assert_eq(igt_xe_driver_load("enable_display=0"),0);
+
+				test_exec(device, hwe, 1, 2, s->state,
+					  NO_RPM);
+			}
+		}
+
 		for (const struct d_state *d = d_states; d->name; d++) {
 			igt_subtest_f("%s-%s-basic-exec", s->name, d->name) {
 				igt_assert(setup_d3(device, d->state));
-- 
2.25.1

