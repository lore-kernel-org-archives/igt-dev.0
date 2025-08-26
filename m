Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BACE8CA0FF7
	for <igt-dev@archiver.kernel.org>; Tue, 26 Aug 2025 20:18:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFEB510E38D;
	Tue, 26 Aug 2025 20:18:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e3XxG5KC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D82010E132
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Aug 2025 20:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756239513; x=1787775513;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iob4MAGuwPZch8CvSHPLsf/x/fI/TBXhfnndwLxNDeI=;
 b=e3XxG5KCvBsCAyBXfxMTJ9znpKyUARVGXiEBitF9q3SQ0vzVH2tEU+wz
 E0tcblJ/Fm8J2JLKJsAad6cT8fAp4Df18yYRPGrnR3hgCTsYjiaPJNAqr
 xlJU7zIn8U9ARSiaAZPasygEr/kloKu04TGG556V81QgkqCFwtWav90D0
 TxLBm0zYdiXXmRGLCCARmw4Da9O+qCYKv+4CNZO1k51CSrZGaonjiil2+
 7s5/eWQfuix3LtkyKIhaIskfvAHkTwVed5p9plWi/7X7YIs49QZYRKfrg
 6JYlEoFISy4FbIbCYvCL3s4ZH88R+/id0m1W1+S+7srrMc9/gdpxZ16Vh A==;
X-CSE-ConnectionGUID: JR8z8sb0R/qj1T86dFulAA==
X-CSE-MsgGUID: AbU/XV5QS3CbskN3odq0mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="46068141"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="46068141"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 13:18:32 -0700
X-CSE-ConnectionGUID: 3IU/7jASRWmxGfIwJ8FVxw==
X-CSE-MsgGUID: G6UV+ygdS12kNPZoPkkJ3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="168907875"
Received: from dut4086lnl.fm.intel.com ([10.105.10.138])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 13:18:32 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 john.c.harrison@intel.com, matthew.brost@intel.com
Subject: [PATCH v2 2/4] tests/intel/xe_vm: Use fault injection interface for
 error injection test
Date: Tue, 26 Aug 2025 20:18:27 +0000
Message-ID: <20250826201829.190241-8-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250826201829.190241-6-jonathan.cavitt@intel.com>
References: <20250826201829.190241-6-jonathan.cavitt@intel.com>
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

The test xe_vm@bind-array-conflict-error-inject currently uses a
separate error injection mechanism that isn't unified with the existing
error injection framework.  This separate error injection framework is
disabled when CONFIG_DRM_XE_DEBUG is not set, which violates the
guarantee CONFIG_DRM_XE_DEBUG has no functional impact.  Modify the test
to use the fault injection framework that the other xe_fault_injection
tests use.

v2: Allow error injection into xe_pt_update_ops_prepare and
xe_pt_update_ops_run as a part of the bind-array-conflict-error-inject
test.  Additionally, update the name of the test to denote which
function is being error injected (Brost, Harrison)

Suggested-by: John Harrison <john.c.harrison@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Matthew Brost <matthew.d.brost@intel.com>
---
 tests/intel/xe_vm.c | 46 +++++++++++++++++++++++++++++++++------------
 1 file changed, 34 insertions(+), 12 deletions(-)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 7a37bfe052..6bef25851e 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -16,6 +16,7 @@
 #include "lib/intel_reg.h"
 #include "xe_drm.h"
 
+#include "xe/xe_fault_injection.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 #include "xe/xe_spin.h"
@@ -1038,14 +1039,18 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
  * Description: Test binding with conflicting address
  * Test category: functionality test
  *
- * SUBTEST: bind-array-conflict-error-inject
- * Functionality: bind exec_queues and page table updates error paths
+ * SUBTEST: bind-array-conflict-error-inject-%s
+ * Functionality: bind exec_queues and page table updates error paths by injecting into %arg[1]
  * Description: Test bind array with conflicting address plus error injection
  * Test category: functionality test
+ *
+ * arg[1].values: vm_bind_ioctl_ops_lock_and_prep
+ * arg[1].values: xe_pt_update_ops_prepare
+ * arg[1].values: xe_pt_update_ops_run
  */
 static void
 test_bind_array_conflict(int fd, struct drm_xe_engine_class_instance *eci,
-			 bool no_array, bool error_inject)
+			 bool no_array, const char error_inject[])
 {
 	uint32_t vm;
 	uint64_t addr = 0x1a00000;
@@ -1178,13 +1183,12 @@ test_bind_array_conflict(int fd, struct drm_xe_engine_class_instance *eci,
 
 		if (error_inject) {
 			sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
-			bind_ops[BIND_ARRAY_CONFLICT_NUM_BINDS - 1].flags |=
-				0x1 << 31;
+			injection_list_add(error_inject);
+			injection_set_retval(error_inject, -ENOSPC);
 			xe_vm_bind_array_err(fd, vm, 0, bind_ops,
 					     BIND_ARRAY_CONFLICT_NUM_BINDS,
 					     sync, 1, ENOSPC);
-			bind_ops[BIND_ARRAY_CONFLICT_NUM_BINDS - 1].flags &=
-				~(0x1 << 31);
+			injection_list_remove(error_inject);
 
 			/* Verify existing mappings still works */
 			i = 1;
@@ -2573,6 +2577,12 @@ igt_main
                 { }
         };
 
+	const char *error_inject_list[] = {
+		"vm_bind_ioctl_ops_lock_and_prep",
+		"xe_pt_update_ops_prepare",
+		"xe_pt_update_ops_run",
+	};
+
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
 
@@ -2667,15 +2677,27 @@ igt_main
 
 	igt_subtest("bind-array-conflict")
 		xe_for_each_engine(fd, hwe)
-			test_bind_array_conflict(fd, hwe, false, false);
+			test_bind_array_conflict(fd, hwe, false, NULL);
 
 	igt_subtest("bind-no-array-conflict")
 		xe_for_each_engine(fd, hwe)
-			test_bind_array_conflict(fd, hwe, true, false);
+			test_bind_array_conflict(fd, hwe, true, NULL);
 
-	igt_subtest("bind-array-conflict-error-inject")
-		xe_for_each_engine(fd, hwe)
-			test_bind_array_conflict(fd, hwe, false, true);
+	igt_subtest_group {
+		igt_fixture {
+			igt_require(fail_function_injection_enabled());
+			injection_setup_fault(&default_fault_params);
+			injection_exit_handler();
+		}
+
+		for (int i = 0; i < ARRAY_SIZE(error_inject_list); i++) {
+			const char *func_name = error_inject_list[i];
+			igt_subtest_f("bind-array-conflict-error-inject-%s", func_name) {
+				xe_for_each_engine(fd, hwe)
+					test_bind_array_conflict(fd, hwe, false, func_name);
+			}
+		}
+	}
 
 	igt_subtest("bind-array-flag-invalid")
 		test_bind_flag_invalid(fd, 16);
-- 
2.43.0

