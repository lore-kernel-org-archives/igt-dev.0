Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E67C5475B
	for <igt-dev@archiver.kernel.org>; Thu, 14 Mar 2024 10:40:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71A1810FA2F;
	Thu, 14 Mar 2024 10:40:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iyW6Jxqe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A20F10FA2F
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Mar 2024 10:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710412818; x=1741948818;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nB0S9JJXJ/Ld8SHAFIVH3JB6p83OrFNOq0I9/vv5F70=;
 b=iyW6Jxqe8lDYZnnyY/BFICPS2/hz2n2iHyYvRXFZ6G+iuEbgAxWfmF2c
 4lN1kUNSfRi4+qf/AecKxhEXJTFoBb7wHN4lc2bH9vfdaLuBaqR7OQ0zl
 OJrHSu1OVe/fgMgF1lqeDZlA4Z7GGJCKEVJP475PNIYpRiRfRF3osdexs
 iwyDOpGbDmAOvXTjqlI9rY+ylEML7zhwehrv7D8psRAa4Zgan1NvvQl4D
 LVSR6IjfuuPnAfkrNpP3sCj1G1vZtkpmcJH+3ixtM/KZ48gcRpBZPYC4u
 V1xDFaZXdL6DZwvtPKwCZq44U5aBjslG/AyNqUhOiKAkJN+yiw9FJvKAn A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="30661381"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="30661381"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 03:40:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; d="scan'208";a="16898179"
Received: from suja-super-server.iind.intel.com ([10.145.169.64])
 by orviesa003.jf.intel.com with ESMTP; 14 Mar 2024 03:40:17 -0700
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com,
 Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Subject: [i-g-t,v2] tests/intel: Add tests to run suspend without display
Date: Thu, 14 Mar 2024 16:28:12 +0530
Message-Id: <20240314105812.10194-1-sujaritha.sundaresan@intel.com>
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

v2: Add normal reload cycle after running test (Anshuman)

Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
---
 tests/intel/xe_pm.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index fcbed6249..f6ef5d124 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -16,6 +16,7 @@
 
 #include "igt.h"
 #include "lib/igt_device.h"
+#include "lib/igt_kmod.h"
 #include "lib/igt_pm.h"
 #include "lib/igt_sysfs.h"
 #include "lib/igt_syncobj.h"
@@ -246,6 +247,10 @@ static void close_fw_handle(int sig)
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
@@ -565,6 +570,7 @@ igt_main
 	struct drm_xe_engine_class_instance *hwe;
 	device_t device;
 	uint32_t d3cold_allowed;
+	const char *opts;
 	int sysfs_fd;
 
 	const struct s_state {
@@ -628,6 +634,34 @@ igt_main
 					  NO_RPM);
 		}
 
+		igt_subtest_f("%s-without-display", s->name) {
+
+			if (!drmModeGetResources(device.fd_xe))
+				return;
+
+			xe_for_each_engine(device.fd_xe, hwe) {
+
+				igt_debug("Reload w/o display\n");
+
+				igt_kmsg(KMSG_INFO "Unloading Xe\n");
+				igt_assert_eq(igt_xe_driver_unload(),0);
+
+				igt_kmsg(KMSG_INFO "Re-loading Xe without display\n");
+				igt_assert_eq(igt_xe_driver_load("enable_display=0"),0);
+
+				test_exec(device, hwe, 1, 2, s->state,
+					  NO_RPM);
+
+				igt_debug("Reload as normal\n");
+
+				igt_kmsg(KMSG_INFO "Unloading Xe\n");
+				igt_assert_eq(igt_xe_driver_unload(),0);
+
+				igt_kmsg(KMSG_INFO "Re-loading Xe\n");
+				igt_assert_eq(igt_xe_driver_load(opts),0);
+			}
+		}
+
 		for (const struct d_state *d = d_states; d->name; d++) {
 			igt_subtest_f("%s-%s-basic-exec", s->name, d->name) {
 				igt_assert(setup_d3(device, d->state));
-- 
2.25.1

