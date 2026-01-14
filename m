Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C19D31A14
	for <igt-dev@archiver.kernel.org>; Wed, 14 Jan 2026 06:59:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2446110E362;
	Wed, 14 Jan 2026 06:59:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZsAOn1aa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 563DE10E362
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jan 2026 06:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768373986; x=1799909986;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=LKWR92UcxTZ2XZ2LES6+KGbC1Aq5vB7mOIIOrDp2JYY=;
 b=ZsAOn1aa5ip9bqw7D7ArRKu90BOYRxEQSPdhhvd1Jpetu/QIcgqaXvKM
 9diFrNNHXS4dqrWEZ0gHdh7VKW5hCswlD2lwXXHH0wU54EwarG6IjbwXC
 LPiR1U62PeDmtUfaRhkWubdt4IJyCW+M9C/bjpMgReyXO17EyECLWOaTT
 k6e03ukptR70Gy9aukq6pKpi1koJUDkbKnF/b6NouT8TRdvirSuaIciOP
 Z1ctbt/KGHISUT8droa3Ktg7kILldHnr9Bss8nOxw0zrugP8MfihxSoH/
 eci7eMdmgvfl8vifvQoQ77oNo1wa3sONTAPQKWuepMTJsou6TEiZ+5aSk g==;
X-CSE-ConnectionGUID: K1wbyQWBR1qEv9lnXIrg3g==
X-CSE-MsgGUID: /ia/QkVNSlutZKJ0PFPGuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69647903"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="69647903"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 22:59:46 -0800
X-CSE-ConnectionGUID: v8zciysJSm+JuaJ3ibpTHw==
X-CSE-MsgGUID: YtAHLFeKQ2i55AiwY4W8jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="205159950"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by fmviesa010.fm.intel.com with ESMTP; 13 Jan 2026 22:59:44 -0800
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, igt-dev@lists.freedesktop.org,
 niranjana.vishwanathapura@intel.com, ramadevi.gandi@intel.com,
 dwarakanath.ramadeva@intel.com
Subject: [PATCH i-g-t 9/9] tests/intel/xe_exec_reset: Add multi-queue subtests
Date: Wed, 14 Jan 2026 12:29:25 +0530
Message-ID: <20260114065925.197958-10-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114065925.197958-1-priyanka.dandamudi@intel.com>
References: <20260114065925.197958-1-priyanka.dandamudi@intel.com>
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Add Multi-Queue basic subtests with gt reset, engine reset,
close fd, close-execqueues, cat-error.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 lib/xe/xe_legacy.c          |  26 +++++-
 tests/intel/xe_exec_reset.c | 162 +++++++++++++++++++++++++++++++++++-
 2 files changed, 183 insertions(+), 5 deletions(-)

diff --git a/lib/xe/xe_legacy.c b/lib/xe/xe_legacy.c
index 7880b7ff4..0b56fc72a 100644
--- a/lib/xe/xe_legacy.c
+++ b/lib/xe/xe_legacy.c
@@ -26,6 +26,8 @@
 #define GT_RESET			(0x1 << 0)
 #define MAX_N_EXECQUEUES		16
 #define ENGINE_RESET                    (0x1 << 21)
+#define MULTI_QUEUE                     (0x1 << 20)
+#define FAULT_ON_SECONDARY_QUEUE	(0x1 << 22)
 
 /**
  * xe_legacy_test_mode:
@@ -71,10 +73,17 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
 			xe_spin_nsec_to_ticks(fd, 0, THREE_SEC) : 0,
 	};
 	int i, b, hang_exec_queue = n_exec_queues / 2;
+	int fault_position = 0;
 	int extra_execs = (flags & LONG_SPIN_REUSE_QUEUE) ? n_exec_queues : 0;
 
 	igt_assert_lte(n_exec_queues, MAX_N_EXECQUEUES);
 
+	igt_assert_f(!(flags & FAULT_ON_SECONDARY_QUEUE) || (flags & MULTI_QUEUE),
+		     "FAULT_ON_SECONDARY_QUEUE requires MULTI_QUEUE to be set");
+
+	if ((flags & FAULT_ON_SECONDARY_QUEUE) && (flags & CAT_ERROR))
+		fault_position = 1; /* index that complies with index % n_exec_queues != 0 */
+
 	if (flags & COMPRESSION)
 		igt_require(intel_gen(intel_get_drm_devid(fd)) >= 20);
 
@@ -102,7 +111,20 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	data = xe_bo_map(fd, bo, bo_size);
 
 	for (i = 0; i < n_exec_queues; i++) {
-		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
+		if (flags & MULTI_QUEUE) {
+			struct drm_xe_ext_set_property multi_queue = {
+				.base.next_extension = 0,
+				.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
+				.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
+			};
+
+			uint64_t ext = to_user_pointer(&multi_queue);
+
+			multi_queue.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
+			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
+		} else {
+			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
+		}
 		syncobjs[i] = syncobj_create(fd, 0);
 	}
 
@@ -124,7 +146,7 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	}
 
 	for (i = 0; i < n_execs; i++) {
-		u64 base_addr = (!use_capture_mode && (flags & CAT_ERROR) && !i)
+		u64 base_addr = (!use_capture_mode && (flags & CAT_ERROR) && i == fault_position)
 			? (addr + bo_size * 128) : addr;
 		u64 batch_offset = (char *)&data[i].batch - (char *)data;
 		u64 batch_addr = base_addr + batch_offset;
diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index acf9be80b..28072ee2c 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -125,6 +125,8 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci,
 #define SYSTEM				(0x1 << 12)
 #define COMPRESSION			(0x1 << 13)
 #define ENGINE_RESET                    (0x1 << 21)
+#define MULTI_QUEUE			(0x1 << 20)
+#define FAULT_ON_SECONDARY_QUEUE	(0x1 << 22)
 
 /**
  * SUBTEST: %s-cat-error
@@ -362,6 +364,44 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
  * Description: Test compute mode close exec_queues close fd
  */
 
+/**
+ * SUBTEST: multi-queue-cat-error
+ * Description: Test cat error with multi_queue
+ *
+ * SUBTEST: multi-queue-cat-error-on-secondary
+ * Description: Test cat error on secondary queue with multi_queue
+ *
+ * SUBTEST: multi-queue-gt-reset
+ * Description: Test GT reset with multi_queue
+ *
+ * SUBTEST: multi-queue-engine-reset
+ * Description: Test engine reset with multi_queue
+ *
+ * SUBTEST: multi-queue-close-fd
+ * Description: Test close fd with multi_queue
+ *
+ * SUBTEST: multi-queue-close-execqueues
+ * Description: Test close execqueues with multi_queue
+ *
+ * SUBTEST: cm-multi-queue-cat-error
+ * Description: Test compute mode cat error with multi_queue
+ *
+ * SUBTEST: cm-multi-queue-cat-error-on-secondary
+ * Description: Test compute mode cat error with multi_queue
+ *
+ * SUBTEST: cm-multi-queue-gt-reset
+ * Description: Test compute mode GT reset with multi_queue
+ *
+ * SUBTEST: cm-multi-queue-engine-reset
+ * Description: Test compute mode engine reset with multi_queue
+ *
+ * SUBTEST: cm-multi-queue-close-fd
+ * Description: Test compute mode close fd with multi_queue
+ *
+ * SUBTEST: cm-multi-queue-close-execqueues
+ * Description: Test compute mode close execqueues with multi_queue
+ */
+
 static void
 test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 		  int n_exec_queues, int n_execs, unsigned int flags)
@@ -391,9 +431,16 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	} *data;
 	struct xe_spin_opts spin_opts = { .preempt = flags & PREEMPT };
 	int i, b, hang_exec_queue = n_exec_queues / 2;
+	int fault_position = 0;
 
 	igt_assert_lte(n_exec_queues, MAX_N_EXECQUEUES);
 
+	igt_assert_f(!(flags & FAULT_ON_SECONDARY_QUEUE) || (flags & MULTI_QUEUE),
+		     "FAULT_ON_SECONDARY_QUEUE requires MULTI_QUEUE to be set");
+
+	if ((flags & FAULT_ON_SECONDARY_QUEUE) && (flags & CAT_ERROR))
+		fault_position = 1; /* index that complies with index % n_exec_queues != 0 */
+
 	if (flags & CLOSE_FD)
 		fd = drm_open_driver(DRIVER_XE);
 
@@ -408,7 +455,20 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	memset(data, 0, bo_size);
 
 	for (i = 0; i < n_exec_queues; i++) {
-		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
+		if (flags & MULTI_QUEUE) {
+			struct drm_xe_ext_set_property multi_queue = {
+				.base.next_extension = 0,
+				.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
+				.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
+			};
+
+			uint64_t ext = to_user_pointer(&multi_queue);
+
+			multi_queue.value = i ? exec_queues[0] : DRM_XE_MULTI_GROUP_CREATE;
+			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
+		} else {
+			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
+		}
 	};
 
 	sync[0].addr = to_user_pointer(&data[0].vm_sync);
@@ -418,7 +478,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	data[0].vm_sync = 0;
 
 	for (i = 0; i < n_execs; i++) {
-		uint64_t base_addr = flags & CAT_ERROR && !i ?
+		uint64_t base_addr = flags & CAT_ERROR && i == fault_position ?
 			addr + bo_size * 128 : addr;
 		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
 		uint64_t batch_addr = base_addr + batch_offset;
@@ -474,7 +534,13 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 
 		err = __xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
 				       exec_queues[i % n_exec_queues], &timeout);
-		if (flags & GT_RESET || flags & CAT_ERROR || flags & ENGINE_RESET)
+		if (flags & FAULT_ON_SECONDARY_QUEUE) {
+			/* exec may result on -ETIME for fault on secondary queue */
+			igt_assert(err == -ETIME || err == -EIO || !err);
+			if (err == -ETIME)
+			 /* no need to continue checking once -ETIME happened*/
+				break;
+		} else if (flags & GT_RESET || flags & CAT_ERROR || flags & ENGINE_RESET)
 			/* exec races with reset: may return -EIO or complete */
 			igt_assert(err == -EIO || !err);
 		else
@@ -995,6 +1061,96 @@ int igt_main()
 		xe_for_each_gt(fd, gt)
 			gt_mocs_reset(fd, gt);
 
+	igt_subtest("multi-queue-cat-error") {
+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		xe_for_each_multi_queue_engine(fd, hwe)
+			xe_legacy_test_mode(fd, hwe, 16, 256, CAT_ERROR |
+					    MULTI_QUEUE, LEGACY_MODE_ADDR,
+					    false);
+	}
+
+	igt_subtest("multi-queue-cat-error-on-secondary") {
+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		xe_for_each_multi_queue_engine(fd, hwe)
+			xe_legacy_test_mode(fd, hwe, 16, 256, CAT_ERROR |
+					    MULTI_QUEUE | FAULT_ON_SECONDARY_QUEUE, LEGACY_MODE_ADDR,
+					    false);
+	}
+
+	igt_subtest("multi-queue-gt-reset") {
+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		xe_for_each_multi_queue_engine(fd, hwe)
+			xe_legacy_test_mode(fd, hwe, 16, 256, GT_RESET |
+					    MULTI_QUEUE, LEGACY_MODE_ADDR,
+					    false);
+	}
+
+	igt_subtest("multi-queue-engine-reset") {
+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		xe_for_each_multi_queue_engine(fd, hwe)
+			xe_legacy_test_mode(fd, hwe, 16, 256, ENGINE_RESET |
+					    MULTI_QUEUE, LEGACY_MODE_ADDR,
+					    false);
+	}
+
+	igt_subtest("multi-queue-close-fd") {
+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		xe_for_each_multi_queue_engine(fd, hwe)
+			xe_legacy_test_mode(-1, hwe, 16, 256, CLOSE_FD |
+					    MULTI_QUEUE, LEGACY_MODE_ADDR,
+					    false);
+	}
+
+	igt_subtest("multi-queue-close-execqueues") {
+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		xe_for_each_multi_queue_engine(fd, hwe)
+			xe_legacy_test_mode(-1, hwe, 16, 256, CLOSE_EXEC_QUEUES | CLOSE_FD |
+					    MULTI_QUEUE, LEGACY_MODE_ADDR,
+					    false);
+	}
+
+	igt_subtest("cm-multi-queue-cat-error") {
+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		xe_for_each_multi_queue_engine(fd, hwe)
+			test_compute_mode(fd, hwe, 16, 256, CAT_ERROR |
+					  MULTI_QUEUE);
+	}
+
+	igt_subtest("cm-multi-queue-cat-error-on-secondary") {
+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		xe_for_each_multi_queue_engine(fd, hwe)
+			test_compute_mode(fd, hwe, 16, 256, CAT_ERROR |
+					  MULTI_QUEUE | FAULT_ON_SECONDARY_QUEUE);
+	}
+
+	igt_subtest("cm-multi-queue-gt-reset") {
+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		xe_for_each_multi_queue_engine(fd, hwe)
+			test_compute_mode(fd, hwe, 16, 256, GT_RESET |
+					  MULTI_QUEUE);
+	}
+
+	igt_subtest("cm-multi-queue-engine-reset") {
+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		xe_for_each_multi_queue_engine(fd, hwe)
+			test_compute_mode(fd, hwe, 16, 256, ENGINE_RESET |
+					  MULTI_QUEUE);
+	}
+
+	igt_subtest("cm-multi-queue-close-fd") {
+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		xe_for_each_multi_queue_engine(fd, hwe)
+			test_compute_mode(-1, hwe, 16, 256, CLOSE_FD |
+					  MULTI_QUEUE);
+	}
+
+	igt_subtest("cm-multi-queue-close-execqueues") {
+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		xe_for_each_multi_queue_engine(fd, hwe)
+			test_compute_mode(-1, hwe, 16, 256, CLOSE_EXEC_QUEUES | CLOSE_FD |
+					  MULTI_QUEUE);
+	}
+
 	igt_fixture()
 		drm_close_driver(fd);
 }
-- 
2.43.0

