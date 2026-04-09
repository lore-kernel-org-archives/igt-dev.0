Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B20F6F364B6
	for <igt-dev@archiver.kernel.org>; Thu,  9 Apr 2026 20:37:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6546E10E052;
	Thu,  9 Apr 2026 20:37:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ikMjMZ8x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D0BF10E052
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Apr 2026 20:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775767025; x=1807303025;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zFSHEmeEy6wHVPKtzohZ0siljgtEVEYrt+NJXUm3bjI=;
 b=ikMjMZ8xWBuW44dnMsLZLY42xfd9pZo4GQOFPtXebTzW/ewDmE2tT5Pj
 YfQTa0rnqwyoOW59Ulb7QrKUnq3A9AAeCwZ0Eg3jjK6TpKuz+mzt+Jxi8
 7pYDT64ybOMH5Q6uauX97cogtgH9a7bDyglaTRGX7WRgGAhMzBJxErD40
 rvDbnI90cfWBnN8E16ymZCRQt/sTsohlRltZIGHqEquT6f061uEbeF83P
 S6Z0st9595+yoj/IQdAdrouToTZX7l0dM5eA834jSXJwwBBAjdn5GjzcQ
 SyzN7uAlM3UoQkhCRPOkhjpiHnQjVfjqBa8lO0HXrUAv88TPUSyjco+tk A==;
X-CSE-ConnectionGUID: 2BVyzun4RnqxCwi11djjjg==
X-CSE-MsgGUID: IVQWY9+2QOSotBZR82ajdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="87858521"
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; d="scan'208";a="87858521"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 13:37:04 -0700
X-CSE-ConnectionGUID: 9lfp0+14SsiGYYy0zh4pCg==
X-CSE-MsgGUID: wCYj5R1fR5uUxtxgAezmpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,170,1770624000"; d="scan'208";a="232950742"
Received: from dut4344arlh.fm.intel.com ([10.105.10.107])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 13:37:05 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: niranjana.vishwanathapura@intel.com, igt-dev@lists.freedesktop.org,
 Apoorva Singh <apoorva.singh@intel.com>, Fei Yang <fei.yang@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Priyanka Dandamudi <priyanka.dandamudi@intel.com>,
 Daniel Charles <daniel.charles@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH i-g-t 3/3] tests/intel/xe_exec_reset: Add multi queue subtests
Date: Thu,  9 Apr 2026 20:37:01 +0000
Message-ID: <20260409203702.4350-4-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409203702.4350-1-stuart.summers@intel.com>
References: <20260409203702.4350-1-stuart.summers@intel.com>
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

From: Apoorva Singh <apoorva.singh@intel.com>

Extend the existing test cases in tests/intel/xe_exec_reset.c
to include testing of reset flows for both primary queue
and secondary queues.

Engine resets without CAT faults are triggered via the *-cancel
cases. These don't include the CANCEL flag as this causes a spinner
on each queue which isn't adding any extra coverage for multi queue
over non multi queue.

Since the *-cancel cases are currently implemented only for the
legacy cases, do the same for multi queue.

New MULTI_QUEUE and SECONDARY_QUEUE flags are added to cover
the general multi queue cases and the cases where we are triggering
engine resets and/or cat faults on secondary queues specifically.

Note for multi queue it is interesting to test these secondary
queue reset scenarios since these are communicated to the driver
from GuC via the primary queue and after this, the entire queue
group is torn down. The test cases here are to ensure nothing
breaks when we hit a scenario like this.

Signed-off-by: Apoorva Singh <apoorva.singh@intel.com>
Signed-off-by: Fei Yang <fei.yang@intel.com>
Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Signed-off-by: Daniel Charles <daniel.charles@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 lib/xe/xe_legacy.c          |  71 ++++++++++--
 tests/intel/xe_exec_reset.c | 222 ++++++++++++++++++++++++++++++++++--
 2 files changed, 274 insertions(+), 19 deletions(-)

diff --git a/lib/xe/xe_legacy.c b/lib/xe/xe_legacy.c
index 3371a91ac..f9bd5bcb6 100644
--- a/lib/xe/xe_legacy.c
+++ b/lib/xe/xe_legacy.c
@@ -13,6 +13,8 @@
 
 /* Batch buffer element count, in number of dwords(u32) */
 #define BATCH_DW_COUNT			16
+#define SECONDARY_QUEUE			(0x1 << 15)
+#define MULTI_QUEUE			(0x1 << 14)
 #define COMPRESSION			(0x1 << 13)
 #define SYSTEM				(0x1 << 12)
 #define LONG_SPIN_REUSE_QUEUE		(0x1 << 11)
@@ -70,10 +72,14 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
 			xe_spin_nsec_to_ticks(fd, 0, THREE_SEC) : 0,
 	};
 	int i, b;
+	int hang_position = flags & SECONDARY_QUEUE ? 1 : 0;
 	int extra_execs = (flags & LONG_SPIN_REUSE_QUEUE) ? n_exec_queues : 0;
 
 	igt_assert_lte(n_exec_queues, MAX_N_EXECQUEUES);
 
+	igt_assert_f(!(flags & SECONDARY_QUEUE) || (flags & MULTI_QUEUE),
+		     "SECONDARY_QUEUE requires MULTI_QUEUE to be set");
+
 	if (flags & COMPRESSION)
 		igt_require(intel_gen(intel_get_drm_devid(fd)) >= 20);
 
@@ -101,7 +107,20 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
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
 
@@ -123,17 +142,22 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	}
 
 	for (i = 0; i < n_execs; i++) {
-		u64 base_addr = (!use_capture_mode && (flags & CAT_ERROR) && !i)
-			? (addr + bo_size * 128) : addr;
+		u64 base_addr = (!use_capture_mode && flags & CAT_ERROR &&
+				 i == hang_position) ?
+				(addr + bo_size * 128) : addr;
 		u64 batch_offset = (char *)&data[i].batch - (char *)data;
 		u64 batch_addr = base_addr + batch_offset;
 		u64 spin_offset = (char *)&data[i].spin - (char *)data;
 		u64 sdi_offset = (char *)&data[i].data - (char *)data;
 		u64 sdi_addr = base_addr + sdi_offset;
 		u64 exec_addr;
-		int e = i % n_exec_queues;
+		int err, e = i % n_exec_queues;
 
-		if (!i || flags & CANCEL ||
+		/*
+		 * For cat fault on a secondary queue the fault will
+		 * be on the spinner.
+		 */
+		if (i == hang_position || flags & CANCEL ||
 		    (flags & LONG_SPIN && i < n_exec_queues)) {
 			spin_opts.addr = base_addr + spin_offset;
 			xe_spin_init(&data[i].spin, &spin_opts);
@@ -160,10 +184,17 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
 		if (e != i)
 			syncobj_reset(fd, &syncobjs[e], 1);
 
-		xe_exec(fd, &exec);
+		/*
+		 * Secondary queues are reset when the primary queue
+		 * is reset. The submission can race here and it is
+		 * expected for those to fail submission if the primary
+		 * reset has already happened.
+		 */
+		err = __xe_exec(fd, &exec);
+		igt_assert(!err || ((flags & MULTI_QUEUE) && err == -ECANCELED));
 
-		if (!i && !(flags & CAT_ERROR) && !use_capture_mode &&
-		    !(flags & COMPRESSION))
+		if (i == hang_position && !(flags & CAT_ERROR) &&
+		    !use_capture_mode && !(flags & COMPRESSION))
 			xe_spin_wait_started(&data[i].spin);
 	}
 
@@ -186,7 +217,21 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
 		 * Expectation here is that on reset, submissions will
 		 * still satisfy the syncobj_wait.
 		 */
-		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0, NULL));
+		int err = syncobj_wait_err(fd, &syncobjs[i], 1, INT64_MAX, 0);
+
+		/*
+		 * Currently any time GuC resets a queue which is part of a
+		 * multi queue queue group submitted by the KMD, the KMD
+		 * will tear down the entire group. This means we don't know
+		 * whether a particular queue submitted prior to the hanging
+		 * queue will complete or not. So we have to check all possible
+		 * return values here.
+		 *
+		 * In the event we get an -ECANCELED at the exec above and the
+		 * syncobj was not installed, we expect this to return -EINVAL
+		 * here instead.
+		 */
+		igt_assert(!err || ((flags & MULTI_QUEUE) && err == -EINVAL));
 	}
 
 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
@@ -232,7 +277,13 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	if (!use_capture_mode && !(flags & (GT_RESET | CANCEL | COMPRESSION))) {
 		for (i = flags & LONG_SPIN ? n_exec_queues : 0;
 		     i < n_execs + extra_execs; i++) {
-			if (!i)
+			/*
+			 * For multi-queue there is no guarantee which
+			 * queue will be scheduled first as they are all
+			 * submitted at the same priority in this test.
+			 * So we can't guarantee any data integrity here.
+			 */
+			if (i == hang_position || flags & MULTI_QUEUE)
 				continue;
 
 			igt_assert_eq(data[i].data, 0xc0ffee);
diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 6b71d9144..ea50567c0 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -112,7 +112,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci,
 #define MAX_N_EXECQUEUES	16
 #define GT_RESET			(0x1 << 0)
 #define CLOSE_FD			(0x1 << 1)
-#define CLOSE_EXEC_QUEUES	(0x1 << 2)
+#define CLOSE_EXEC_QUEUES		(0x1 << 2)
 #define VIRTUAL				(0x1 << 3)
 #define PARALLEL			(0x1 << 4)
 #define CAT_ERROR			(0x1 << 5)
@@ -124,6 +124,8 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci,
 #define LONG_SPIN_REUSE_QUEUE		(0x1 << 11)
 #define SYSTEM				(0x1 << 12)
 #define COMPRESSION			(0x1 << 13)
+#define MULTI_QUEUE			(0x1 << 14)
+#define SECONDARY_QUEUE			(0x1 << 15)
 
 /**
  * SUBTEST: %s-cat-error
@@ -353,6 +355,57 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
  *
  * SUBTEST: cm-close-execqueues-close-fd
  * Description: Test compute mode close exec_queues close fd
+ *
+ * SUBTEST: multi-queue-cat-error
+ * Sub-category: MultiQ tests
+ * Description: Test cat error with multi_queue
+ *
+ * SUBTEST: multi-queue-cat-error-on-secondary
+ * Sub-category: MultiQ tests
+ * Description: Test cat error with multi_queue
+ *              on a secondary queue
+ *
+ * SUBTEST: multi-queue-gt-reset
+ * Sub-category: MultiQ tests
+ * Description: Test GT reset with multi_queue
+ *
+ * SUBTEST: multi-queue-cancel
+ * Sub-category: MultiQ tests
+ * Description: Test engine reset with multi_queue
+ *
+ * SUBTEST: multi-queue-cancel-on-secondary
+ * Sub-category: MultiQ tests
+ * Description: Test engine reset with multi_queue
+ *              on a secondary queue
+ *
+ * SUBTEST: multi-queue-close-fd
+ * Sub-category: MultiQ tests
+ * Description: Test close fd with multi_queue
+ *
+ * SUBTEST: multi-queue-close-execqueues
+ * Sub-category: MultiQ tests
+ * Description: Test close execqueues with multi_queue
+ *
+ * SUBTEST: cm-multi-queue-cat-error
+ * Sub-category: MultiQ tests
+ * Description: Test compute mode cat error with multi_queue
+ *
+ * SUBTEST: cm-multi-queue-cat-error-on-secondary
+ * Sub-category: MultiQ tests
+ * Description: Test compute mode cat error with multi_queue
+ *              on a secondary queue
+ *
+ * SUBTEST: cm-multi-queue-gt-reset
+ * Sub-category: MultiQ tests
+ * Description: Test compute mode GT reset with multi_queue
+ *
+ * SUBTEST: cm-multi-queue-close-fd
+ * Sub-category: MultiQ tests
+ * Description: Test compute mode close fd with multi_queue
+ *
+ * SUBTEST: cm-multi-queue-close-execqueues
+ * Sub-category: MultiQ tests
+ * Description: Test compute mode close execqueues with multi_queue
  */
 
 static void
@@ -384,9 +437,14 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	} *data;
 	struct xe_spin_opts spin_opts = { .preempt = flags & PREEMPT };
 	int i, b;
+	int hang_position = flags & SECONDARY_QUEUE ? 1 : 0;
 
 	igt_assert_lte(n_exec_queues, MAX_N_EXECQUEUES);
 
+	igt_assert_f(!(flags & SECONDARY_QUEUE) ||
+		     ((flags & MULTI_QUEUE) && (flags & CAT_ERROR)),
+		     "SECONDARY_QUEUE requires MULTI_QUEUE and CAT_ERROR to be set");
+
 	if (flags & CLOSE_FD)
 		fd = drm_open_driver(DRIVER_XE);
 
@@ -401,7 +459,20 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
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
@@ -411,17 +482,21 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	data[0].vm_sync = 0;
 
 	for (i = 0; i < n_execs; i++) {
-		uint64_t base_addr = flags & CAT_ERROR && !i ?
-			addr + bo_size * 128 : addr;
+		uint64_t base_addr = (flags & CAT_ERROR && i == hang_position) ?
+				     (addr + bo_size * 128) : addr;
 		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
 		uint64_t batch_addr = base_addr + batch_offset;
 		uint64_t spin_offset = (char *)&data[i].spin - (char *)data;
 		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
 		uint64_t sdi_addr = base_addr + sdi_offset;
 		uint64_t exec_addr;
-		int e = i % n_exec_queues;
+		int err, e = i % n_exec_queues;
 
-		if (!i || flags & CANCEL) {
+		/*
+		 * For cat fault on a secondary queue the fault will
+		 * be on the spinner.
+		 */
+		if (i == hang_position || flags & CANCEL) {
 			spin_opts.addr = base_addr + spin_offset;
 			xe_spin_init(&data[i].spin, &spin_opts);
 			exec_addr = spin_opts.addr;
@@ -442,7 +517,18 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 
 		exec.exec_queue_id = exec_queues[e];
 		exec.address = exec_addr;
-		xe_exec(fd, &exec);
+
+		/*
+		 * Secondary queues are reset when the primary queue
+		 * is reset. The submission can race here and it is
+		 * expected for those to fail submission if the primary
+		 * reset has already happened.
+		 */
+		err = __xe_exec(fd, &exec);
+		igt_assert(!err || ((flags & MULTI_QUEUE) && err == -ECANCELED));
+
+		if (i == hang_position && !(flags & CAT_ERROR))
+			xe_spin_wait_started(&data[i].spin);
 	}
 
 	if (flags & GT_RESET) {
@@ -467,8 +553,18 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 
 		err = __xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
 				       exec_queues[i % n_exec_queues], &timeout);
-		if (!i) {
+		if (i == hang_position) {
 			igt_assert(err == -ETIME || err == -EIO);
+		} else if (flags & MULTI_QUEUE) {
+			/*
+			 * Currently any time GuC resets a queue submitted
+			 * by the KMD, the KMD will tear down the entire
+			 * queue group. This means we don't know whether
+			 * a particular queue submitted prior to the hanging
+			 * queue will complete or not. So we have to check
+			 * all possible return values here.
+			 */
+			igt_assert(err == -ETIME || err == -EIO || !err);
 		} else if (flags & GT_RESET || flags & CAT_ERROR) {
 			/* exec races with reset: may return -EIO or complete */
 			igt_assert(err == -EIO || !err);
@@ -483,7 +579,13 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 
 	if (!(flags & (GT_RESET | CANCEL))) {
 		for (i = 0; i < n_execs; i++) {
-			if (!i)
+			/*
+			 * For multi-queue there is no guarantee which
+			 * queue will be scheduled first as they are all
+			 * submitted at the same priority in this test.
+			 * So we can't guarantee any data integrity here.
+			 */
+			if (i == hang_position || flags & MULTI_QUEUE)
 				continue;
 
 			igt_assert_eq(data[i].data, 0xc0ffee);
@@ -986,6 +1088,108 @@ int igt_main()
 		xe_for_each_gt(fd, gt)
 			gt_mocs_reset(fd, gt);
 
+	igt_subtest("multi-queue-cat-error") {
+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		xe_for_each_multi_queue_engine(fd, hwe)
+			xe_legacy_test_mode(fd, hwe, 16, 16,
+					    CAT_ERROR | MULTI_QUEUE,
+					    LEGACY_MODE_ADDR,
+					    false);
+	}
+
+	igt_subtest("multi-queue-cat-error-on-secondary") {
+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		xe_for_each_multi_queue_engine(fd, hwe)
+			xe_legacy_test_mode(fd, hwe, 16, 16,
+					    CAT_ERROR | MULTI_QUEUE |
+					    SECONDARY_QUEUE,
+					    LEGACY_MODE_ADDR,
+					    false);
+	}
+
+	igt_subtest("multi-queue-gt-reset") {
+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		xe_for_each_multi_queue_engine(fd, hwe)
+			xe_legacy_test_mode(fd, hwe, 16, 16,
+					    GT_RESET | MULTI_QUEUE,
+					    LEGACY_MODE_ADDR,
+					    false);
+	}
+
+	igt_subtest("multi-queue-cancel") {
+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		xe_for_each_multi_queue_engine(fd, hwe)
+			xe_legacy_test_mode(fd, hwe, 16, 16,
+					    MULTI_QUEUE,
+					    LEGACY_MODE_ADDR,
+					    false);
+	}
+
+	igt_subtest("multi-queue-cancel-on-secondary") {
+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		xe_for_each_multi_queue_engine(fd, hwe)
+			xe_legacy_test_mode(fd, hwe, 16, 16,
+					    MULTI_QUEUE | SECONDARY_QUEUE,
+					    LEGACY_MODE_ADDR,
+					    false);
+	}
+
+	igt_subtest("multi-queue-close-fd") {
+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		xe_for_each_multi_queue_engine(fd, hwe)
+			xe_legacy_test_mode(-1, hwe, 16, 256,
+					    CLOSE_FD | MULTI_QUEUE,
+					    LEGACY_MODE_ADDR,
+					    false);
+	}
+
+	igt_subtest("multi-queue-close-execqueues") {
+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		xe_for_each_multi_queue_engine(fd, hwe)
+			xe_legacy_test_mode(-1, hwe, 16, 256,
+					    CLOSE_EXEC_QUEUES | CLOSE_FD |
+					    MULTI_QUEUE,
+					    LEGACY_MODE_ADDR,
+					    false);
+	}
+
+	igt_subtest("cm-multi-queue-cat-error") {
+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		xe_for_each_multi_queue_engine(fd, hwe)
+			test_compute_mode(fd, hwe, 16, 16,
+					  CAT_ERROR | MULTI_QUEUE);
+	}
+
+	igt_subtest("cm-multi-queue-cat-error-on-secondary") {
+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		xe_for_each_multi_queue_engine(fd, hwe)
+			test_compute_mode(fd, hwe, 16, 16,
+					  CAT_ERROR | MULTI_QUEUE |
+					  SECONDARY_QUEUE);
+	}
+
+	igt_subtest("cm-multi-queue-gt-reset") {
+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		xe_for_each_multi_queue_engine(fd, hwe)
+			test_compute_mode(fd, hwe, 16, 16,
+					  GT_RESET | MULTI_QUEUE);
+	}
+
+	igt_subtest("cm-multi-queue-close-fd") {
+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		xe_for_each_multi_queue_engine(fd, hwe)
+			test_compute_mode(-1, hwe, 16, 256,
+					  CLOSE_FD | MULTI_QUEUE);
+	}
+
+	igt_subtest("cm-multi-queue-close-execqueues") {
+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >= IP_VER(35, 0));
+		xe_for_each_multi_queue_engine(fd, hwe)
+			test_compute_mode(-1, hwe, 16, 256,
+					  CLOSE_EXEC_QUEUES | CLOSE_FD |
+					  MULTI_QUEUE);
+	}
+
 	igt_fixture()
 		drm_close_driver(fd);
 }
-- 
2.43.0

