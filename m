Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD7C3D5CC91
	for <igt-dev@archiver.kernel.org>; Wed, 30 Oct 2024 23:00:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AED210E819;
	Wed, 30 Oct 2024 23:00:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hl1Q97WK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D145310E81A
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Oct 2024 23:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730329228; x=1761865228;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XlPoFUybeVvwDd85evxm0jEqfhCKa5A/O3iaTqfJTSI=;
 b=hl1Q97WK8x/omp+ZtkLVKMh+dXcVS/7ELNvOMKYfa6GMuTxJ5y7HxTum
 s2Uh9LjaZkf83FuwoKEnoiPnWtepxI5tyEJ5SBSbNrA2r5gOQlXLvXxzg
 Pqxy7oX6ydZWXK/O1abWFlzdxb3YLoKeqy/brLAYpfr8ickooMyvDWSg9
 QuZCPRgQoTw6ZSACnQ7RC8PIqS7V6xkjhy0xJKOUWqriBVieRJ0J8jKcn
 0eBuKtRmjMjsztq/6vp+5W2k7txjB8VRQsfBoMPPalx29A9rQuXsCwPlg
 i1cj1AiD79Qhg94tzqwIzaR0uQbHjGpB/ZONeFyz9slJ+DO9rwP7mtqPJ A==;
X-CSE-ConnectionGUID: dpyHx2v+TvaYHFNf9nfY+Q==
X-CSE-MsgGUID: AxX8HOmSTJKL+D6PtOw9OQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="33748300"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="33748300"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 16:00:28 -0700
X-CSE-ConnectionGUID: c8LdUkAWQLu8eQmf9m4fXQ==
X-CSE-MsgGUID: rr34Kh9iR4m/Prx2V1QZ6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; d="scan'208";a="87015289"
Received: from fyang16-desk.jf.intel.com ([10.165.21.214])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 16:00:22 -0700
From: fei.yang@intel.com
To: igt-dev@lists.freedesktop.org
Cc: Fei Yang <fei.yang@intel.com>
Subject: [i-g-t 4/4] tests/intel/xe_exec_threads: separate sync data and batch
 buffer
Date: Wed, 30 Oct 2024 16:03:50 -0700
Message-Id: <20241030230350.1681757-5-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241030230350.1681757-1-fei.yang@intel.com>
References: <20241030230350.1681757-1-fei.yang@intel.com>
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
physical location, and that would cause a problem for verifying stored
data and comparing ufence value at the end of the execution. To fix this
the data used for synchronization purpose needs to be separated from the
batch buffer for instructions, and during the execution we remap the
batch buffer only.

Signed-off-by: Fei Yang <fei.yang@intel.com>
---
 tests/intel/xe_exec_threads.c | 70 ++++++++++++++++++++---------------
 1 file changed, 41 insertions(+), 29 deletions(-)

diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index 03043c53e..c14ffb1c9 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -241,6 +241,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 		  struct drm_xe_engine_class_instance *eci,
 		  int n_exec_queues, int n_execs, unsigned int flags)
 {
+	uint64_t syncaddr = addr + 0x10000000;
 #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
 	struct drm_xe_sync sync[1] = {
 		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
@@ -253,15 +254,17 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 	};
 	int64_t fence_timeout;
 	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
-	size_t bo_size;
+	size_t bo_size, sync_size;
 	uint32_t bo = 0;
 	struct {
 		uint32_t batch[16];
 		uint64_t pad;
+	} *data;
+	struct {
 		uint64_t vm_sync;
 		uint64_t exec_sync;
 		uint32_t data;
-	} *data;
+	} *syncdata;
 	int i, j, b;
 	int map_fd = -1;
 	bool owns_vm = false, owns_fd = false;
@@ -280,6 +283,8 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = xe_bb_size(fd, bo_size);
+	sync_size = sizeof(*syncdata) * n_execs;
+	sync_size = xe_bb_size(fd, sync_size);
 
 	if (flags & USERPTR) {
 		if (flags & INVALIDATE) {
@@ -301,28 +306,37 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 	}
 	memset(data, 0, bo_size);
 
+	syncdata = mmap(from_user_pointer(userptr + 0x10000000),
+			sync_size, PROT_READ | PROT_WRITE,
+			MAP_SHARED | MAP_FIXED | MAP_ANONYMOUS, -1, 0);
+	igt_assert(syncdata != MAP_FAILED);
+	memset(syncdata, 0, sync_size);
+
 	for (i = 0; i < n_exec_queues; i++)
 		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
 
 	pthread_barrier_wait(&barrier);
 
-	sync[0].addr = to_user_pointer(&data[0].vm_sync);
+	sync[0].addr = to_user_pointer(&syncdata[0].vm_sync);
+	xe_vm_bind_userptr_async(fd, vm, 0, to_user_pointer(syncdata),
+				 syncaddr, sync_size, sync, 1);
+	fence_timeout = (igt_run_in_simulation() ? 30 : 3) * NSEC_PER_SEC;
+	xe_wait_ufence(fd, &syncdata[0].vm_sync, USER_FENCE_VALUE, 0, fence_timeout);
+	syncdata[0].vm_sync = 0;
+
 	if (bo)
 		xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
 	else
 		xe_vm_bind_userptr_async(fd, vm, 0, to_user_pointer(data), addr,
 					 bo_size, sync, 1);
-
-	fence_timeout = (igt_run_in_simulation() ? 30 : 3) * NSEC_PER_SEC;
-
-	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, fence_timeout);
-	data[0].vm_sync = 0;
+	xe_wait_ufence(fd, &syncdata[0].vm_sync, USER_FENCE_VALUE, 0, fence_timeout);
+	syncdata[0].vm_sync = 0;
 
 	for (i = 0; i < n_execs; i++) {
 		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
 		uint64_t batch_addr = addr + batch_offset;
-		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
-		uint64_t sdi_addr = addr + sdi_offset;
+		uint64_t sdi_offset = (char *)&syncdata[i].data - (char *)syncdata;
+		uint64_t sdi_addr = syncaddr + sdi_offset;
 		int e = i % n_exec_queues;
 
 		b = 0;
@@ -333,7 +347,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 		data[i].batch[b++] = MI_BATCH_BUFFER_END;
 		igt_assert(b <= ARRAY_SIZE(data[i].batch));
 
-		sync[0].addr = addr + (char *)&data[i].exec_sync - (char *)data;
+		sync[0].addr = syncaddr + (char *)&syncdata[i].exec_sync - (char *)syncdata;
 
 		exec.exec_queue_id = exec_queues[e];
 		exec.address = batch_addr;
@@ -341,13 +355,13 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 
 		if (flags & REBIND && i && !(i & 0x1f)) {
 			for (j = i == 0x20 ? 0 : i - 0x1f; j <= i; ++j)
-				xe_wait_ufence(fd, &data[j].exec_sync,
+				xe_wait_ufence(fd, &syncdata[j].exec_sync,
 					       USER_FENCE_VALUE,
 					       exec_queues[e], fence_timeout);
 			xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size,
 					   NULL, 0);
 
-			sync[0].addr = to_user_pointer(&data[0].vm_sync);
+			sync[0].addr = to_user_pointer(&syncdata[0].vm_sync);
 			addr += bo_size;
 			if (bo)
 				xe_vm_bind_async(fd, vm, 0, bo, 0, addr,
@@ -357,9 +371,9 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 							 to_user_pointer(data),
 							 addr, bo_size, sync,
 							 1);
-			xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
+			xe_wait_ufence(fd, &syncdata[0].vm_sync, USER_FENCE_VALUE,
 				       0, fence_timeout);
-			data[0].vm_sync = 0;
+			syncdata[0].vm_sync = 0;
 		}
 
 		if (flags & INVALIDATE && i && !(i & 0x1f)) {
@@ -371,11 +385,11 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 				 * an invalidate.
 				 */
 				for (j = i == 0x20 ? 0 : i - 0x1f; j <= i; ++j)
-					xe_wait_ufence(fd, &data[j].exec_sync,
+					xe_wait_ufence(fd, &syncdata[j].exec_sync,
 						       USER_FENCE_VALUE,
 						       exec_queues[e],
 						       fence_timeout);
-				igt_assert_eq(data[i].data, 0xc0ffee);
+				igt_assert_eq(syncdata[i].data, 0xc0ffee);
 			} else if (i * 2 != n_execs) {
 				/*
 				 * We issue 1 mmap which races against running
@@ -409,15 +423,9 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 		/*
 		 * For !RACE cases xe_wait_ufence has been called in above for-loop
 		 * except the last batch of submissions. For RACE cases we will need
-		 * to wait for the second half of the submissions to complete. There
-		 * is a potential race here because the first half submissions might
-		 * have updated the fence in the old physical location while the test
-		 * is remapping the buffer from a different physical location, but the
-		 * wait_ufence only checks the fence from the new location which would
-		 * never be updated. We have to assume the first half of the submissions
-		 * complete before the second half.
+		 * to wait for all submissions to complete.
 		 */
-		j = (flags & RACE) ? (n_execs / 2 + 1) : (((n_execs - 1) & ~0x1f) + 1);
+		j = (flags & RACE) ? 0 : (((n_execs - 1) & ~0x1f) + 1);
 	else if (flags & REBIND)
 		/*
 		 * For REBIND cases xe_wait_ufence has been called in above for-loop
@@ -426,19 +434,23 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 		j = ((n_execs - 1) & ~0x1f) + 1;
 
 	for (i = j; i < n_execs; i++)
-		xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
+		xe_wait_ufence(fd, &syncdata[i].exec_sync, USER_FENCE_VALUE,
 			       exec_queues[i % n_exec_queues], fence_timeout);
 
-	sync[0].addr = to_user_pointer(&data[0].vm_sync);
+	sync[0].addr = to_user_pointer(&syncdata[0].vm_sync);
 	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
-	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, fence_timeout);
+	xe_wait_ufence(fd, &syncdata[0].vm_sync, USER_FENCE_VALUE, 0, fence_timeout);
+	syncdata[0].vm_sync = 0;
+	xe_vm_unbind_async(fd, vm, 0, 0, syncaddr, sync_size, sync, 1);
+	xe_wait_ufence(fd, &syncdata[0].vm_sync, USER_FENCE_VALUE, 0, fence_timeout);
 
 	for (i = j; i < n_execs; i++)
-		igt_assert_eq(data[i].data, 0xc0ffee);
+		igt_assert_eq(syncdata[i].data, 0xc0ffee);
 
 	for (i = 0; i < n_exec_queues; i++)
 		xe_exec_queue_destroy(fd, exec_queues[i]);
 
+	munmap(syncdata, sync_size);
 	if (bo) {
 		munmap(data, bo_size);
 		gem_close(fd, bo);
-- 
2.25.1

