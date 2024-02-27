Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB4C5C5478C
	for <igt-dev@archiver.kernel.org>; Tue, 27 Feb 2024 09:23:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7182389F63;
	Tue, 27 Feb 2024 09:23:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DCJEhKCt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21BCD10F2E3
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Feb 2024 09:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709025817; x=1740561817;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OEH4jxZOutGilgDvcb3C6YyYdCGJOreH3O8E2M9rdDA=;
 b=DCJEhKCtFISZ20gNO8w2Q6+oOmAXygKXDEY2mzhNnUE7EvKpAK2wMIPj
 bYKsJDxyoWP5Ly7RoW98hK3BHleysZQo9xOz5G/ubKvOA1UZQeS7dvp+4
 o1jAdAbG7DeYX6ZTLBWgG52ABb+FUnv5P+HB3lSIPKiUrtJok3nt79/tb
 jjly2ZwjG1M7+2V9KRU07wgMjxAd7Dm8DmJTU5gMO0Bh277Xtbl97M+i6
 CkzZ/P4ew4V7DxXJ2/y3c5bHWagXc8u9HIbVOpVZh+i5pAuNjHSuGLxdt
 h81baVGivRwN1Mo1W2Zjo5kZvo+7xMmXhf7SgFwR7TU9M5CjpSxzrA+Cz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3201192"
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="3201192"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 01:23:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="7326223"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 01:23:35 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 aravind.iddamsetty@intel.com, badal.nilawar@intel.com,
 sujaritha.sundaresan@intel.com
Subject: [PATCH i-g-t 1/2] tests/intel/xe_gt_freq: re-introduce exec tests of
 xe_gt_freq
Date: Tue, 27 Feb 2024 15:03:36 +0530
Message-Id: <20240227093337.1151505-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20240227093337.1151505-1-riana.tauro@intel.com>
References: <20240227093337.1151505-1-riana.tauro@intel.com>
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

The tests freq_range_exec, freq_fixed_exec were removed due
to a design flaw which caused failure in tests. The workload execution
finished earlier before the frequency validation when gt was set to
run at a higher frequency.

These tests are being reintroduced with a spinner based approach
in this patch to avoid such failures.

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/intel/xe_gt_freq.c | 106 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 105 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
index bf63e4298..f0de341cb 100644
--- a/tests/intel/xe_gt_freq.c
+++ b/tests/intel/xe_gt_freq.c
@@ -17,6 +17,7 @@
 
 #include "xe_drm.h"
 #include "xe/xe_ioctl.h"
+#include "xe/xe_spin.h"
 #include "xe/xe_query.h"
 #include "xe/xe_util.h"
 
@@ -153,6 +154,9 @@ static void test_freq_basic_api(int fd, int gt_id)
 /**
  * SUBTEST: freq_fixed_idle
  * Description: Test fixed frequency request with exec_queue in idle state
+ *
+ * SUBTEST: freq_fixed_exec
+ * Description: Test fixed frequency request when spinner is run
  */
 
 static void test_freq_fixed(int fd, int gt_id, bool gt_idle)
@@ -217,8 +221,10 @@ static void test_freq_fixed(int fd, int gt_id, bool gt_idle)
 /**
  * SUBTEST: freq_range_idle
  * Description: Test range frequency request with exec_queue in idle state
+ *
+ * SUBTEST: freq_range_exec
+ * Description: Test range frequency request when spinner is run
  */
-
 static void test_freq_range(int fd, int gt_id, bool gt_idle)
 {
 	uint32_t rpn = get_freq(fd, gt_id, "rpn");
@@ -319,10 +325,88 @@ static void test_reset(int fd, int gt_id, int cycles)
 	}
 }
 
+static void test_spin(int fd, struct drm_xe_engine_class_instance *eci, bool fixed)
+{
+	struct drm_xe_sync sync[2] = {
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
+	};
+	struct drm_xe_exec exec = {
+		.num_batch_buffer = 1,
+		.num_syncs = 2,
+		.syncs = to_user_pointer(sync),
+	};
+	uint64_t addr = 0x1a0000;
+	struct xe_spin_opts spin_opts = {
+		.addr = addr,
+		.preempt = false
+	};
+	struct xe_spin *spin;
+	uint32_t exec_queue;
+	uint32_t syncobj;
+	size_t bo_size;
+	uint32_t bo;
+	uint32_t vm;
+
+	vm = xe_vm_create(fd, 0, 0);
+	bo_size = sizeof(*spin);
+	bo_size = xe_bb_size(fd, bo_size);
+
+	bo = xe_bo_create(fd, vm, bo_size,
+			  vram_if_possible(fd, eci->gt_id), 0);
+	spin = xe_bo_map(fd, bo, bo_size);
+
+	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
+	syncobj = syncobj_create(fd, 0);
+
+	sync[0].handle = syncobj_create(fd, 0);
+	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
+
+	xe_spin_init(spin, &spin_opts);
+
+	sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
+	sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
+	sync[1].handle = syncobj;
+
+	exec.exec_queue_id = exec_queue;
+	exec.address = addr;
+	xe_exec(fd, &exec);
+
+	xe_spin_wait_started(spin);
+	usleep(50000);
+	igt_assert(!syncobj_wait(fd, &syncobj, 1, 1, 0, NULL));
+
+	igt_info("Running on GT %d Engine %s:%d\n", eci->gt_id,
+		 xe_engine_class_string(eci->engine_class), eci->engine_instance);
+
+	if (fixed)
+		test_freq_fixed(fd, eci->gt_id, false);
+	else
+		test_freq_range(fd, eci->gt_id, false);
+
+	xe_spin_end(spin);
+
+	igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+
+	sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
+	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
+	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
+
+	syncobj_destroy(fd, sync[0].handle);
+	syncobj_destroy(fd, syncobj);
+	xe_exec_queue_destroy(fd, exec_queue);
+
+	munmap(spin, bo_size);
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
+}
+
 igt_main
 {
 	int fd;
 	int gt;
+	struct drm_xe_engine_class_instance *hwe;
 	uint32_t stash_min;
 	uint32_t stash_max;
 
@@ -352,6 +436,16 @@ igt_main
 		}
 	}
 
+	igt_subtest("freq_fixed_exec") {
+		xe_for_each_gt(fd, gt) {
+			xe_for_each_engine(fd, hwe) {
+				if (hwe->gt_id != gt)
+					continue;
+				test_spin(fd, hwe, true);
+			}
+		}
+	}
+
 	igt_subtest("freq_range_idle") {
 		xe_for_each_gt(fd, gt) {
 			igt_require_f(igt_wait(xe_is_gt_in_c6(fd, gt), 1000, 10),
@@ -360,6 +454,16 @@ igt_main
 		}
 	}
 
+	igt_subtest("freq_range_exec") {
+		xe_for_each_gt(fd, gt) {
+			xe_for_each_engine(fd, hwe) {
+				if (hwe->gt_id != gt)
+					continue;
+				test_spin(fd, hwe, false);
+			}
+		}
+	}
+
 	igt_subtest("freq_low_max") {
 		xe_for_each_gt(fd, gt) {
 			test_freq_low_max(fd, gt);
-- 
2.40.0

