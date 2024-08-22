Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD9D6C5320E
	for <igt-dev@archiver.kernel.org>; Thu, 22 Aug 2024 08:57:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DE7810E7FD;
	Thu, 22 Aug 2024 08:57:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oFyOZYTJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D452410E7FD
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Aug 2024 08:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724317068; x=1755853068;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=MaqCPGrtrNHDM9PWWj58UUjfj8ioACF2/2L/RpPIW5k=;
 b=oFyOZYTJl2zswfi4Xur3nJCdn5cQjf6wMeu6Afja3wVs6upUCn8Dcpt/
 5vupIUmouTjWnUY2Uk/bEmZDgpruCGowK7yhmbusRvbJSF67dp0eGexZw
 UC06E/5wTl1QSAZ8BTJmgGtYbZiACR5fk3Ie5RqfWvdE+rBSo5gZUvT8S
 7OzilRd7ZNZjXlc8haTkBtgZYqv5QG2LcJtIoa06Oggdep2Ui3lT45/Ek
 AHjmilkiiosXHC4ug53SpYeDjT39KYT4mKHUNAnYZ9KwqC90qksdHSkbR
 vlj6BMxMC5I/6PlH2E+lFY3gBTHSTQ2TKT57cd5lhQetkxMYbEikBGJZ/ g==;
X-CSE-ConnectionGUID: qyeTAXh5Q6KF2l5eIH2cSw==
X-CSE-MsgGUID: 3zvgd/ylRbGn9ZuYvNVJzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="33871026"
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; d="scan'208";a="33871026"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 01:57:47 -0700
X-CSE-ConnectionGUID: H5cR6FUHR2mheAfr6RrT6Q==
X-CSE-MsgGUID: UW87AT1PQ06M397BREueKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; d="scan'208";a="61910086"
Received: from suja-super-server.iind.intel.com ([10.190.238.52])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 01:57:44 -0700
From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, anshuman.gupta@intel.com,
 katarzyna.piecielska@intel.com,
 Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 "Katarzyna Piecielska Katarzyna . piecielska @ intel . com"
 <Katarzyna.piecielska@intel.com>
Subject: [PATCH i-g-t,
 v4] tests/intel/xe_pm: Add tests for suspend without display
Date: Thu, 22 Aug 2024 14:50:58 +0530
Message-Id: <20240822092058.26784-1-sujaritha.sundaresan@intel.com>
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

v4: Change commit name/header (Kamil)

Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Acked-by: Katarzyna Piecielska Katarzyna.piecielska@intel.com<Katarzyna.piecielska@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/intel/xe_pm.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index eee89428c..1623a56c7 100644
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

