Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FCC0D767FE
	for <igt-dev@archiver.kernel.org>; Fri, 19 Dec 2025 12:02:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 472DE10EF80;
	Fri, 19 Dec 2025 12:02:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G/orXPsW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7F0B10EF78
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Dec 2025 12:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766145725; x=1797681725;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=w7ZH4Adoc7pjL8EXc+Wp0UOEIwQx0d+SdRtBHTuBZWM=;
 b=G/orXPsW58uITxAGmJq5EUVhTdVo06nC+wOtIHu6uaUuci1BYEB1uaXo
 W/QTg6zuRvELGupmkwAdodiY+Fk2OYAQDH79bJ7CH87DKUrNM+mzWfwXa
 pT3evDFhEU/+p7EWXvmLNfinYfcYChOFdp5er5wQQXp+Tuv5SHPwFD0S4
 Bw3Nm7hfy9w/ZnY1Jp3hW5KKKBH1WTHaN3uMJXQUdJZvkjKiJHRHgO9Ad
 e+JM4VHDY/aC5PhvVqIRSeTmSePGRSsTkQufZvSkZT8rXUqrcK4GSBnYx
 uAoUoa1spWmLRQ2h7AWPfxRdFP6ilX3K4shwAvi9JAcoVIBsjxeVau/D1 A==;
X-CSE-ConnectionGUID: rQhDWKDcSqCYKPjfwS6e3Q==
X-CSE-MsgGUID: fboTLTiDQsa1gpPKt7HK6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="79473872"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="79473872"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 04:02:05 -0800
X-CSE-ConnectionGUID: 3/l9CKUDQqWYmfTire1Q3Q==
X-CSE-MsgGUID: 5zCr+nRCQQ62o5Eb78lprw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; d="scan'208";a="203746984"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by fmviesa004.fm.intel.com with ESMTP; 19 Dec 2025 04:02:03 -0800
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, niranjana.vishwanathapura@intel.com,
 igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 5/7] tests/intel/xe_exec_reset: Add multi queue subtests
Date: Fri, 19 Dec 2025 17:31:52 +0530
Message-ID: <20251219120154.695287-6-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219120154.695287-1-priyanka.dandamudi@intel.com>
References: <20251219120154.695287-1-priyanka.dandamudi@intel.com>
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

Add multi queue subtests with gt reset, engine reset,
close fd, close-execqueues, cat-error.

Signed-off-by: Apoorva Singh <apoorva.singh@intel.com>
Signed-off-by: Fei Yang <fei.yang@intel.com>
Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Signed-off-by: Daniel Charles <daniel.charles@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/xe/xe_legacy.c          |  38 +++++--
 tests/intel/xe_exec_reset.c | 197 ++++++++++++++++++++++++++++++++++--
 2 files changed, 222 insertions(+), 13 deletions(-)

diff --git a/lib/xe/xe_legacy.c b/lib/xe/xe_legacy.c
index 084445305..6572617fd 100644
--- a/lib/xe/xe_legacy.c
+++ b/lib/xe/xe_legacy.c
@@ -26,6 +26,10 @@
 #define GT_RESET			(0x1 << 0)
 #define MAX_N_EXECQUEUES		16
 
+#define MULTI_QUEUE                     (0x1 << 20)
+#define ENGINE_RESET                    (0x1 << 21)
+#define FAULT_ON_SECONDARY_QUEUE	(0x1 << 22)
+
 /**
  * xe_legacy_test_mode:
  * @fd: file descriptor
@@ -69,11 +73,18 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
 		.ctx_ticks = flags & LONG_SPIN ?
 			xe_spin_nsec_to_ticks(fd, 0, THREE_SEC) : 0,
 	};
-	int i, b;
+	int i, b, hang_exec_queue = n_exec_queues / 2;
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
 
@@ -101,7 +112,20 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
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
 
@@ -123,7 +147,7 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	}
 
 	for (i = 0; i < n_execs; i++) {
-		u64 base_addr = (!use_capture_mode && (flags & CAT_ERROR) && !i)
+		u64 base_addr = (!use_capture_mode && (flags & CAT_ERROR) && i == fault_position)
 			? (addr + bo_size * 128) : addr;
 		u64 batch_offset = (char *)&data[i].batch - (char *)data;
 		u64 batch_addr = base_addr + batch_offset;
@@ -133,7 +157,8 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
 		u64 exec_addr;
 		int e = i % n_exec_queues;
 
-		if (!i || flags & CANCEL ||
+		if ((flags & ENGINE_RESET && e == hang_exec_queue) ||
+		    !i || flags & CANCEL ||
 		    (flags & LONG_SPIN && i < n_exec_queues)) {
 			spin_opts.addr = base_addr + spin_offset;
 			xe_spin_init(&data[i].spin, &spin_opts);
@@ -157,7 +182,7 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
 		exec.exec_queue_id = exec_queues[e];
 		exec.address = exec_addr;
 
-		if (e != i)
+		if (e != i && !(flags & ENGINE_RESET))
 			syncobj_reset(fd, &syncobjs[e], 1);
 
 		xe_exec(fd, &exec);
@@ -224,7 +249,8 @@ xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
 
-	if (!use_capture_mode && !(flags & (GT_RESET | CANCEL | COMPRESSION))) {
+	if (!use_capture_mode &&
+	    !(flags & (GT_RESET | ENGINE_RESET | CAT_ERROR | CANCEL | COMPRESSION))) {
 		for (i = flags & LONG_SPIN ? n_exec_queues : 1;
 		     i < n_execs + extra_execs; i++)
 			igt_assert_eq(data[i].data, 0xc0ffee);
diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 7aaee31dd..fe496a538 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -125,6 +125,10 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci,
 #define SYSTEM				(0x1 << 12)
 #define COMPRESSION			(0x1 << 13)
 
+#define MULTI_QUEUE			(0x1 << 20)
+#define ENGINE_RESET			(0x1 << 21)
+#define FAULT_ON_SECONDARY_QUEUE	(0x1 << 22)
+
 /**
  * SUBTEST: %s-cat-error
  * Description: Test %arg[1] cat error
@@ -355,6 +359,68 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
  * Description: Test compute mode close exec_queues close fd
  */
 
+/**
+ * SUBTEST: multi-queue-cat-error
+ * Mega feature: MultiQ
+ * Sub-category: MultiQ tests
+ * Description: Test cat error with multi_queue
+ *
+ * SUBTEST: multi-queue-cat-error-on-secondary
+ * Mega feature: MultiQ
+ * Sub-category: MultiQ tests
+ * Description: Test cat error on secondary queue with multi_queue
+ *
+ * SUBTEST: multi-queue-gt-reset
+ * Mega feature: MultiQ
+ * Sub-category: MultiQ tests
+ * Description: Test GT reset with multi_queue
+ *
+ * SUBTEST: multi-queue-engine-reset
+ * Mega feature: MultiQ
+ * Sub-category: MultiQ tests
+ * Description: Test engine reset with multi_queue
+ *
+ * SUBTEST: multi-queue-close-fd
+ * Mega feature: MultiQ
+ * Sub-category: MultiQ tests
+ * Description: Test close fd with multi_queue
+ *
+ * SUBTEST: multi-queue-close-execqueues
+ * Mega feature: MultiQ
+ * Sub-category: MultiQ tests
+ * Description: Test close execqueues with multi_queue
+ *
+ * SUBTEST: cm-multi-queue-cat-error
+ * Mega feature: MultiQ
+ * Sub-category: MultiQ tests
+ * Description: Test compute mode cat error with multi_queue
+ *
+ * SUBTEST: cm-multi-queue-cat-error-on-secondary
+ * Mega feature: MultiQ
+ * Sub-category: MultiQ tests
+ * Description: Test compute mode cat error with multi_queue
+ *
+ * SUBTEST: cm-multi-queue-gt-reset
+ * Mega feature: MultiQ
+ * Sub-category: MultiQ tests
+ * Description: Test compute mode GT reset with multi_queue
+ *
+ * SUBTEST: cm-multi-queue-engine-reset
+ * Mega feature: MultiQ
+ * Sub-category: MultiQ tests
+ * Description: Test compute mode engine reset with multi_queue
+ *
+ * SUBTEST: cm-multi-queue-close-fd
+ * Mega feature: MultiQ
+ * Sub-category: MultiQ tests
+ * Description: Test compute mode close fd with multi_queue
+ *
+ * SUBTEST: cm-multi-queue-close-execqueues
+ * Mega feature: MultiQ
+ * Sub-category: MultiQ tests
+ * Description: Test compute mode close execqueues with multi_queue
+ */
+
 static void
 test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 		  int n_exec_queues, int n_execs, unsigned int flags)
@@ -383,10 +449,17 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 		uint32_t data;
 	} *data;
 	struct xe_spin_opts spin_opts = { .preempt = flags & PREEMPT };
-	int i, b;
+	int i, b, hang_exec_queue = n_exec_queues / 2;
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
 
@@ -401,7 +474,20 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
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
@@ -411,7 +497,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	data[0].vm_sync = 0;
 
 	for (i = 0; i < n_execs; i++) {
-		uint64_t base_addr = flags & CAT_ERROR && !i ?
+		uint64_t base_addr = flags & CAT_ERROR && i == fault_position ?
 			addr + bo_size * 128 : addr;
 		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
 		uint64_t batch_addr = base_addr + batch_offset;
@@ -421,7 +507,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 		uint64_t exec_addr;
 		int e = i % n_exec_queues;
 
-		if (!i || flags & CANCEL) {
+		if ((flags & ENGINE_RESET && e == hang_exec_queue) || !i || flags & CANCEL) {
 			spin_opts.addr = base_addr + spin_offset;
 			xe_spin_init(&data[i].spin, &spin_opts);
 			exec_addr = spin_opts.addr;
@@ -466,8 +552,14 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 		int err;
 
 		err = __xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
-				       exec_queues[i % n_exec_queues], &timeout);
-		if (flags & GT_RESET || flags & CAT_ERROR)
+				exec_queues[i % n_exec_queues], &timeout);
+		if (flags & FAULT_ON_SECONDARY_QUEUE) {
+			/* exec may result on -ETIME for fault on secondary queue */
+			igt_assert(err == -ETIME || err == -EIO || !err);
+			if (err == -ETIME)
+			 /* no need to continue checking once -ETIME happened*/
+				break;
+		} else if (flags & GT_RESET || flags & CAT_ERROR)
 			/* exec races with reset: may return -EIO or complete */
 			igt_assert(err == -EIO || !err);
 		else
@@ -478,7 +570,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
 	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, 3 * NSEC_PER_SEC);
 
-	if (!(flags & (GT_RESET | CANCEL))) {
+	if (!(flags & (GT_RESET | CANCEL | ENGINE_RESET | CAT_ERROR))) {
 		for (i = 1; i < n_execs; i++)
 			igt_assert_eq(data[i].data, 0xc0ffee);
 	}
@@ -979,6 +1071,97 @@ int igt_main()
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

