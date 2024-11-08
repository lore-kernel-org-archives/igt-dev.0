Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B98FD4337A
	for <igt-dev@archiver.kernel.org>; Fri,  8 Nov 2024 01:07:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFBB410E909;
	Fri,  8 Nov 2024 01:07:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LF4+IIA8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A59610E324
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Nov 2024 01:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731028045; x=1762564045;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=apPBWJtnzNVxgGYP+z8L8et01WP7xoUrxVu0+SHsneI=;
 b=LF4+IIA8BbZWolv5ycV7seuap2QHlyEKvxMHpm/nbzGJ6YWjE4aV4+05
 yx4pMrmREcT0cUPN4cHLY28XZQt3uWr8+0jwGylZ57UXaH9gEUKKUfy2p
 cdI1vtBx2IrC/2OT6gjMeoKtPA2Ono1npaInz7PlE1r9tJe/UEyl/P7PD
 Nis75br3LwfpTwRpesyLpx5sQBX4bXR66zKTpCwzpSb5T5TC+kdWcHcnG
 BzdAymmvdbFeo3EaYkoB8m1qvzREhqan6toi2wd85mUsrE7Tjhy2pRm/n
 FMapy5yrlrhtUF9lnwb8mNe36qjeQ/bzBBfLc0rva/52HkTPGOouaTvNC g==;
X-CSE-ConnectionGUID: Bdt4D0X4SwGQb8X9xZa5JA==
X-CSE-MsgGUID: k6QAEEF1RfidZ5wQj1Co0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="31009602"
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; d="scan'208";a="31009602"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 17:07:25 -0800
X-CSE-ConnectionGUID: iNPncp2zTLikfyRWomUe+Q==
X-CSE-MsgGUID: uehIMVsOThGADGZrVIzqkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; d="scan'208";a="116191492"
Received: from fyang16-desk.jf.intel.com ([10.165.21.214])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 17:07:23 -0800
From: fei.yang@intel.com
To: igt-dev@lists.freedesktop.org
Cc: Fei Yang <fei.yang@intel.com>
Subject: [i-g-t, v2,
 1/4] tests/intel/xe_exec_fault_mode: separate exec_sync and batch
 buffer
Date: Thu,  7 Nov 2024 17:10:38 -0800
Message-Id: <20241108011041.2257553-2-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241108011041.2257553-1-fei.yang@intel.com>
References: <20241108011041.2257553-1-fei.yang@intel.com>
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

From: Fei Yang <fei.yang@intel.com>

In INVALIDATE cases the test purposely remap the data buffer to a
different physical location in the midle of execution to exercise the
page fault handling flow. After the remapping we lose access to the old
physical location, and that would cause a problem for comparing ufence
value at the end of the execution. To fix this the exec_sync data needs
to be separated from the batch buffer for instructions, and during the
execution we don't remap the exec_sync data.

v2: Separate only exec_sync. Keep data field together with the batch
    buffer (Matt Roper)

Signed-off-by: Fei Yang <fei.yang@intel.com>
---
 tests/intel/xe_exec_fault_mode.c | 66 ++++++++++++++++++++++++--------
 1 file changed, 50 insertions(+), 16 deletions(-)

diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index d416c773b..ae40e099b 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -116,6 +116,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 {
 	uint32_t vm;
 	uint64_t addr = 0x1a0000;
+	uint64_t sync_addr = 0x101a0000;
 #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
 	struct drm_xe_sync sync[1] = {
 		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
@@ -128,15 +129,15 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	};
 	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
 	uint32_t bind_exec_queues[MAX_N_EXEC_QUEUES];
-	size_t bo_size;
+	size_t bo_size, sync_size;
 	uint32_t bo = 0;
 	struct {
 		uint32_t batch[16];
 		uint64_t pad;
 		uint64_t vm_sync;
-		uint64_t exec_sync;
 		uint32_t data;
 	} *data;
+	uint64_t *exec_sync;
 	int i, j, b;
 	int map_fd = -1;
 
@@ -151,6 +152,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 				  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = xe_bb_size(fd, bo_size);
+	sync_size = sizeof(*exec_sync) * n_execs;
+	sync_size = xe_bb_size(fd, sync_size);
 
 	if (flags & USERPTR) {
 #define	MAP_ADDRESS	0x00007fadeadbe000
@@ -178,6 +181,12 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	}
 	memset(data, 0, bo_size);
 
+#define EXEC_SYNC_ADDRESS	0x00007fbdeadbe000
+	exec_sync = mmap((void *)EXEC_SYNC_ADDRESS, sync_size, PROT_READ | PROT_WRITE,
+			MAP_SHARED | MAP_FIXED | MAP_ANONYMOUS, -1, 0);
+	igt_assert(exec_sync != MAP_FAILED);
+	memset(exec_sync, 0, sync_size);
+
 	for (i = 0; i < n_exec_queues; i++) {
 		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
 		if (flags & BIND_EXEC_QUEUE)
@@ -212,6 +221,13 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		       bind_exec_queues[0], NSEC_PER_SEC);
 	data[0].vm_sync = 0;
 
+	xe_vm_bind_userptr_async(fd, vm, bind_exec_queues[0],
+				 to_user_pointer(exec_sync), sync_addr,
+				 sync_size, sync, 1);
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
+			bind_exec_queues[0], NSEC_PER_SEC);
+	data[0].vm_sync = 0;
+
 	if (flags & PREFETCH) {
 		/* Should move to system memory */
 		xe_vm_prefetch_async(fd, vm, bind_exec_queues[0], 0, addr,
@@ -239,14 +255,14 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		data[i].batch[b++] = MI_BATCH_BUFFER_END;
 		igt_assert(b <= ARRAY_SIZE(data[i].batch));
 
-		sync[0].addr = addr + (char *)&data[i].exec_sync - (char *)data;
+		sync[0].addr = sync_addr + (char *)&exec_sync[i] - (char *)exec_sync;
 
 		exec.exec_queue_id = exec_queues[e];
 		exec.address = batch_addr;
 		xe_exec(fd, &exec);
 
 		if (flags & REBIND && i + 1 != n_execs) {
-			xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
+			xe_wait_ufence(fd, &exec_sync[i], USER_FENCE_VALUE,
 				       exec_queues[e], NSEC_PER_SEC);
 			xe_vm_unbind_async(fd, vm, bind_exec_queues[e], 0,
 					   addr, bo_size, NULL, 0);
@@ -275,7 +291,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 				 * physical memory on next mmap call triggering
 				 * an invalidate.
 				 */
-				xe_wait_ufence(fd, &data[i].exec_sync,
+				xe_wait_ufence(fd, &exec_sync[i],
 					       USER_FENCE_VALUE, exec_queues[e],
 					       NSEC_PER_SEC);
 				igt_assert_eq(data[i].data, 0xc0ffee);
@@ -311,48 +327,66 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		 * submission here. For RACE cases we need to wait for all submissions
 		 * to complete because the GuC scheduling can be out of order, the
 		 * completion of the last submission doesn't mean all submission are
-		 * completed.
+		 * completed. For REBIND cases we only need to wait for the last
+		 * submission.
 		 */
-		j = (flags & INVALIDATE && !(flags & RACE)) ? n_execs - 1 : 0;
+		j = ((flags & INVALIDATE && !(flags & RACE)) ||
+		     (flags & REBIND)) ? n_execs - 1 : 0;
 
 		for (i = j; i < n_execs; i++) {
 			int64_t timeout = NSEC_PER_SEC;
 
 			if (flags & INVALID_VA && !(flags & ENABLE_SCRATCH))
-				igt_assert_eq(__xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
+				igt_assert_eq(__xe_wait_ufence(fd, &exec_sync[i], USER_FENCE_VALUE,
 							       exec_queues[i % n_exec_queues], &timeout), -EIO);
 			else
-				igt_assert_eq(__xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
+				igt_assert_eq(__xe_wait_ufence(fd, &exec_sync[i], USER_FENCE_VALUE,
 							       exec_queues[i % n_exec_queues], &timeout), 0);
 		}
 	}
-	sync[0].addr = to_user_pointer(&data[0].vm_sync);
-	xe_vm_unbind_async(fd, vm, bind_exec_queues[0], 0, addr, bo_size,
-			   sync, 1);
-	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
-		       bind_exec_queues[0], NSEC_PER_SEC);
 
 	if (flags & INVALID_FAULT) {
 		for (i = 0; i < n_execs; i++) {
 			int ret;
 			int64_t timeout = NSEC_PER_SEC;
 
-			ret = __xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
+			ret = __xe_wait_ufence(fd, &exec_sync[i], USER_FENCE_VALUE,
 					       exec_queues[i % n_exec_queues], &timeout);
 			igt_assert(ret == -EIO || ret == 0);
 		}
 	} else if (!(flags & INVALID_VA)) {
+		/*
+		 * For INVALIDATE && RACE cases, due the the remmap in the
+		 * middle of the execution, we lose access to some of the
+		 * 0xc0ffee written to the old location, so check only for
+		 * the second half of the submissions.
+		 */
+		if (flags & INVALIDATE && flags & RACE)
+			j = n_execs / 2 + 1;
 		for (i = j; i < n_execs; i++)
 			igt_assert_eq(data[i].data, 0xc0ffee);
-
 	}
 
+	sync[0].addr = to_user_pointer(&data[0].vm_sync);
+	data[0].vm_sync = 0;
+	xe_vm_unbind_async(fd, vm, bind_exec_queues[0], 0, sync_addr, sync_size,
+			   sync, 1);
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
+		       bind_exec_queues[0], NSEC_PER_SEC);
+	data[0].vm_sync = 0;
+	xe_vm_unbind_async(fd, vm, bind_exec_queues[0], 0, addr, bo_size,
+			   sync, 1);
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
+		       bind_exec_queues[0], NSEC_PER_SEC);
+
 	for (i = 0; i < n_exec_queues; i++) {
 		xe_exec_queue_destroy(fd, exec_queues[i]);
 		if (bind_exec_queues[i])
 			xe_exec_queue_destroy(fd, bind_exec_queues[i]);
 	}
 
+	munmap(exec_sync, sync_size);
+
 	if (bo) {
 		munmap(data, bo_size);
 		gem_close(fd, bo);
-- 
2.25.1

