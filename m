Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA92BF3D332
	for <igt-dev@archiver.kernel.org>; Thu,  5 Mar 2026 16:54:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7863910E102;
	Thu,  5 Mar 2026 16:54:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a/fwFcsj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3583110E102
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Mar 2026 16:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772729670; x=1804265670;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2HIg62uCtUZZO0J0MAw+4P8X4Lcw4nHyW/QmtjhPHUs=;
 b=a/fwFcsjgIHBSQF6xXo8/9Tkp9+3kD9tl9/0nxSx7EqIXXQPvtZfZxjM
 N0AOEtZfm2yVif5ahpqJirGo56uOkO01wCV0OxFVizitfX1vlExTi9/Af
 t+eHoLivg8vc7KycLXN3PL66DsW28Zlgsvp4h92WylPa9sBhkEN80vH2p
 mgd35iPqir8fOpfM9pzGoMhpJtWRFWiIyBMVPqjplmzSRpfQGu0DQBZv2
 R7/MkId7s9AY66aRlKf6sAUiCzIgcN2woqetJn16aJdK4AgXfmpSXL9RR
 gbPrQuZE7k96bivUT7bTVvV11dolYhc4W4BmpHRCJQE6BI7VN5T0Tp8OT Q==;
X-CSE-ConnectionGUID: FwwSRSjPST6XO4Qj1aX/gw==
X-CSE-MsgGUID: BYR28ZahQ7SGKqMm+ZN61g==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73739755"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="73739755"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 08:54:28 -0800
X-CSE-ConnectionGUID: 0bdppTGbTPq8Gjlxx/SCoQ==
X-CSE-MsgGUID: U+cXUM/pSdSYamGS8qIQAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; d="scan'208";a="217004375"
Received: from dut7069bmgfrd.fm.intel.com (HELO DUT7069BMGFRD..) ([10.1.84.99])
 by fmviesa008.fm.intel.com with ESMTP; 05 Mar 2026 08:54:27 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, nishit.sharma@intel.com,
 thomas.hellstrom@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_svm_usrptr_madvise: Unify batch buffer
 address and sync
Date: Thu,  5 Mar 2026 16:54:27 +0000
Message-ID: <20260305165427.65184-1-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.48.1
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

From: Nishit Sharma <nishit.sharma@intel.com>

This patch refactors the SVM userptr copy test and batch buffer setup to
support both Ponte Vecchio (PVC) and BMG platforms.
The following changes were made:

Batch buffer address assignment is now conditional based on
platform requirements. Synchronization logic for batch execution is unified
into helper functions, which select the appropriate sync address and value
depending on the hardware. Changes were required because different
platforms have distinct requirements for how batch buffers and
synchronization are managed.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_svm_usrptr_madvise.c | 74 +++++++++++++++++++++--------
 1 file changed, 53 insertions(+), 21 deletions(-)

diff --git a/tests/intel/xe_svm_usrptr_madvise.c b/tests/intel/xe_svm_usrptr_madvise.c
index bfa5864e4..f54bd3f8a 100644
--- a/tests/intel/xe_svm_usrptr_madvise.c
+++ b/tests/intel/xe_svm_usrptr_madvise.c
@@ -91,14 +91,16 @@ setup_sync(struct drm_xe_sync *sync, uint64_t **sync_addr,
 	**sync_addr = 0;
 }
 
+#define BATCH_VA_BASE 0x5000000
 static void
 gpu_batch_init(int fd, uint32_t vm, uint64_t src_addr,
 	       uint64_t dst_addr, uint64_t copy_size,
-	       uint32_t *bo, uint64_t *addr)
+	       uint32_t *bo, uint64_t *addr, void **batch_map)
 {
 	uint32_t width = copy_size / 256;
 	uint32_t height = 1;
-	uint32_t batch_bo_size = BATCH_SIZE(fd);
+	uint64_t alignment = xe_get_default_alignment(fd);
+	uint32_t batch_bo_size = ALIGN(BATCH_SIZE(fd), alignment);
 	uint32_t batch_bo;
 	uint64_t batch_addr;
 	void *batch;
@@ -127,40 +129,69 @@ gpu_batch_init(int fd, uint32_t vm, uint64_t src_addr,
 	cmd[i++] = MI_BATCH_BUFFER_END;
 	cmd[i++] = MI_BATCH_BUFFER_END;
 
-	batch_addr = to_user_pointer(batch);
+	if (IS_PONTEVECCHIO(dev_id))
+		batch_addr = BATCH_VA_BASE;
+	else
+		batch_addr = to_user_pointer(batch);
 
 	/* Punch a gap in the SVM map where we map the batch_bo */
 	xe_vm_bind_lr_sync(fd, vm, batch_bo, 0, batch_addr, batch_bo_size, 0);
 	*bo = batch_bo;
 	*addr = batch_addr;
+	*batch_map = batch;
 }
 
 static void
 gpu_copy_batch_create(int fd, uint32_t vm, uint32_t exec_queue,
 		      uint64_t src_addr, uint64_t dst_addr,
-		      uint32_t *batch_bo, uint64_t *batch_addr)
+		      uint32_t *batch_bo, uint64_t *batch_addr, void **batch_map)
+{
+	gpu_batch_init(fd, vm, src_addr, dst_addr, SZ_16K, batch_bo, batch_addr, batch_map);
+}
+
+static void
+xe_sync_exec(int fd, uint32_t exec_queue, uint64_t *batch_addr,
+	     struct drm_xe_sync *sync, void *sync_addr_ptr,
+	     uint64_t sync_addr_val, bool is_pvc)
+{
+	sync->addr = sync_addr_val;
+	sync->timeline_value = EXEC_SYNC_VAL;
+	WRITE_ONCE(*(uint64_t *)sync_addr_ptr, 0);
+	xe_exec_sync(fd, exec_queue, *batch_addr, sync, 1);
+	if (READ_ONCE(*(uint64_t *)sync_addr_ptr) != EXEC_SYNC_VAL)
+		xe_wait_ufence(fd, (uint64_t *)sync_addr_ptr, EXEC_SYNC_VAL,
+			       exec_queue, NSEC_PER_SEC * 10);
+}
+
+static void
+xe_sync_setup(int fd, uint32_t exec_queue, uint64_t *batch_addr,
+	      void *batch_map, struct drm_xe_sync *sync, bool is_pvc)
 {
-	gpu_batch_init(fd, vm, src_addr, dst_addr, SZ_4K, batch_bo, batch_addr);
+	if (is_pvc) {
+		uint64_t *sync_addr_cpu = (uint64_t *)((char *)batch_map + SZ_4K);
+
+		xe_sync_exec(fd, exec_queue, batch_addr, sync, sync_addr_cpu,
+			     *batch_addr + SZ_4K, true);
+	} else {
+		uint64_t *sync_addr = (uint64_t *)((char *)from_user_pointer(*batch_addr) + SZ_4K);
+
+		xe_sync_exec(fd, exec_queue, batch_addr, sync, sync_addr,
+			     to_user_pointer((uint64_t *)sync_addr), false);
+	}
 }
 
 static void
 gpu_exec_sync(int fd, uint32_t vm, uint32_t exec_queue,
-	      uint64_t *batch_addr)
+	      uint64_t *batch_addr, void *batch_map)
 {
 	struct drm_xe_sync sync = {};
 	uint64_t *sync_addr;
+	uint16_t dev_id = intel_get_drm_devid(fd);
 
 	setup_sync(&sync, &sync_addr, BIND_SYNC_VAL);
 
-	sync_addr = (uint64_t *)((char *)from_user_pointer(*batch_addr) + SZ_4K);
-	sync.addr = to_user_pointer((uint64_t *)sync_addr);
-	sync.timeline_value = EXEC_SYNC_VAL;
-	WRITE_ONCE(*sync_addr, 0);
-
-	xe_exec_sync(fd, exec_queue, *batch_addr, &sync, 1);
-	if (READ_ONCE(*sync_addr) != EXEC_SYNC_VAL)
-		xe_wait_ufence(fd, (uint64_t *)sync_addr, EXEC_SYNC_VAL, exec_queue,
-			       NSEC_PER_SEC * 10);
+	xe_sync_setup(fd, exec_queue, batch_addr, batch_map, &sync,
+		      IS_PONTEVECCHIO(dev_id));
 }
 
 static void test_svm_userptr_copy(int fd)
@@ -169,6 +200,7 @@ static void test_svm_userptr_copy(int fd)
 	uint8_t *svm_ptr, *userptr_ptr, *bo_map;
 	uint32_t bo, batch_bo;
 	uint64_t bo_gpu_va, userptr_gpu_va, batch_addr;
+	void *batch_map;
 
 	struct drm_xe_engine_class_instance eci = { .engine_class = DRM_XE_ENGINE_CLASS_COPY };
 	uint32_t vm, exec_queue;
@@ -202,17 +234,17 @@ static void test_svm_userptr_copy(int fd)
 		      DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE, 0, 0);
 
 	gpu_copy_batch_create(fd, vm, exec_queue, to_user_pointer(svm_ptr),
-			      to_user_pointer(userptr_ptr), &batch_bo, &batch_addr);
-	gpu_exec_sync(fd, vm, exec_queue, &batch_addr);
+			      to_user_pointer(userptr_ptr), &batch_bo, &batch_addr, &batch_map);
+	gpu_exec_sync(fd, vm, exec_queue, &batch_addr, batch_map);
 
 	gpu_copy_batch_create(fd, vm, exec_queue, userptr_gpu_va, bo_gpu_va,
-			      &batch_bo, &batch_addr);
-	gpu_exec_sync(fd, vm, exec_queue, &batch_addr);
+			      &batch_bo, &batch_addr, &batch_map);
+	gpu_exec_sync(fd, vm, exec_queue, &batch_addr, batch_map);
 
-	igt_assert(memcmp(svm_ptr, userptr_ptr, SZ_4K) == 0);
+	igt_assert(memcmp(svm_ptr, userptr_ptr, 64) == 0);
 
 	bo_map = xe_bo_map(fd, bo, size);
-	igt_assert(memcmp(bo_map, svm_ptr, SZ_4K) == 0);
+	igt_assert(memcmp(bo_map, svm_ptr, 64) == 0);
 
 	xe_vm_bind_lr_sync(fd, vm, 0, 0, batch_addr, BATCH_SIZE(fd),
 			   DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR);
-- 
2.48.1

