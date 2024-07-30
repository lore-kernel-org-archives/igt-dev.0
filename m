Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD0E1C3DA7E
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 11:12:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9390110E4DA;
	Tue, 30 Jul 2024 11:12:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IHsSRupF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1E6D10E4DA
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 11:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722337970; x=1753873970;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ppSrE9cBnutfHbHe06P9UXrANtee19bObFnrzn/ikqo=;
 b=IHsSRupFGX4Ct/gav8OHh9pB8CXswjxtasp/5UX00gCyRlwfVVBK037G
 kEU7yAR3X5kw4v6r8YmvvUWp0i5SkGwLmikDPbfkhBIZNjsZUE7gBzYgi
 6vbZZdrmhUIG6F8CpQUg50dv1RKlcMkrE1dnLi1pjXfpN90NeSN3ArEmu
 biVTUhqAa8W4KxCwQdt/Add3BG7R+LixZqTVtehT1IkX+MhdcldaWm4cu
 E+TyA+chsoJXXIDJpWL7+uDLGE3fxkn0b6f+Gd/Pw/HecbvJ+PKRw8poq
 F84reQTJOPmx0dN4U2C7qW9IghqKxhGzn5yVRxOLc6en3Xg8S182T1GW8 A==;
X-CSE-ConnectionGUID: suHWRhmxRjyPJiXwFi/SDQ==
X-CSE-MsgGUID: V29TWOqbRpa+EqEq757C0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="20283135"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="20283135"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:12:50 -0700
X-CSE-ConnectionGUID: u0sEjy+kTH+9EF8/0/Z1jQ==
X-CSE-MsgGUID: pQYgYU7SQj+hE0E83faD2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="91806514"
Received: from suja-super-server.iind.intel.com ([10.227.90.143])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 04:12:48 -0700
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>
Subject: [PATCH i-g-t,
 v3] tests/intel: Add tests to run suspend without display
Date: Tue, 30 Jul 2024 17:05:08 +0530
Message-Id: <20240730113508.48777-1-sujaritha.sundaresan@intel.com>
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

Add tests to validate basic execution suspend/resume cycle
without display module to rule out display related issues
from the suspend/resume stack.

v2: Add normal reload cycle after running test (Anshuman)

v3: Rebase

Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/intel/xe_pm.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 8b115e2f6..03f742265 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -17,6 +17,7 @@
 
 #include "igt.h"
 #include "lib/igt_device.h"
+#include "lib/igt_kmod.h"
 #include "lib/igt_pm.h"
 #include "lib/igt_sysfs.h"
 #include "lib/igt_syncobj.h"
@@ -229,6 +230,10 @@ static void close_fw_handle(int sig)
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
@@ -681,6 +686,7 @@ igt_main
 	struct drm_xe_engine_class_instance *hwe;
 	device_t device;
 	uint32_t d3cold_allowed;
+	const char *opts;
 	int sysfs_fd;
 
 	const struct s_state {
@@ -757,6 +763,34 @@ igt_main
 					  NO_RPM, 0);
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
+				igt_assert_eq(igt_xe_driver_unload(), 0);
+
+				igt_kmsg(KMSG_INFO "Re-loading Xe without display\n");
+				igt_assert_eq(igt_xe_driver_load("enable_display=0"), 0);
+
+				test_exec(device, hwe, 1, 2, s->state,
+					  NO_RPM, 0);
+
+				igt_debug("Reload as normal\n");
+
+				igt_kmsg(KMSG_INFO "Unloading Xe\n");
+				igt_assert_eq(igt_xe_driver_unload(), 0);
+
+				igt_kmsg(KMSG_INFO "Re-loading Xe\n");
+				igt_assert_eq(igt_xe_driver_load(opts), 0);
+			}
+		}
+
 		for (const struct vm_op *op = vm_op; op->name; op++) {
 			igt_subtest_f("%s-vm-bind-%s", s->name, op->name) {
 				xe_for_each_engine(device.fd_xe, hwe)
-- 
2.34.1

