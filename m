Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CBB4D6B6B4
	for <igt-dev@archiver.kernel.org>; Wed, 30 Oct 2024 23:00:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24E4810E81B;
	Wed, 30 Oct 2024 23:00:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mpf3few/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E3B710E821
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Oct 2024 23:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730329228; x=1761865228;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NIy3dRQJsERtxJI9DUmWDeR0lxTX9ZS+HBfMw4tE8mw=;
 b=Mpf3few/Kh0blEhLRdXppowl9dTiFU5WNNp1VNGIj8gtj+SV/zsbNxW/
 GmbylmcibpSNWa/HWiLHBEh4qcObTqazb5MkXSbpVkpWXq/G4Rt2ZtN8U
 4TlBty23NhRN6k4cHPrZK+XrOu79JGxEzSh8BLU6eLNgv37NgPGpLSky8
 vN7v+HBQeA/9qnxjr2APaMiUChqjeYYcfHiPuCyAn4K9//zkR+2vUDbJS
 azXAQ/DK+TwefgXD8KvU+jRqhR5kHuOUsYryJ+Cfg1CFdSxk4BJNDUse9
 tjhTtlvkdWXMOXl1STxqNKgTXEkmZKkxC3gMZAS9mco0R9/DDJBsZJF+n Q==;
X-CSE-ConnectionGUID: ft7g+GTaRzCb7VEaPCyxmQ==
X-CSE-MsgGUID: /0HReFF0TGiNzsXh9ycYMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="33748296"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="33748296"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 16:00:28 -0700
X-CSE-ConnectionGUID: gOoh19RZRQKSvlmrnG3jtA==
X-CSE-MsgGUID: Qen9RyIESni7zmv9VUdTDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; d="scan'208";a="87015279"
Received: from fyang16-desk.jf.intel.com ([10.165.21.214])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 16:00:21 -0700
From: fei.yang@intel.com
To: igt-dev@lists.freedesktop.org
Cc: Fei Yang <fei.yang@intel.com>
Subject: [i-g-t 1/4] tests/intel/xe_exec_fault_mode: separate sync data and
 batch buffer
Date: Wed, 30 Oct 2024 16:03:47 -0700
Message-Id: <20241030230350.1681757-2-fei.yang@intel.com>
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
 tests/intel/xe_exec_fault_mode.c | 70 ++++++++++++++++++++++----------
 1 file changed, 48 insertions(+), 22 deletions(-)

diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index d416c773b..995517087 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -116,6 +116,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 {
 	uint32_t vm;
 	uint64_t addr = 0x1a0000;
+	uint64_t syncaddr = 0x101a0000;
 #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
 	struct drm_xe_sync sync[1] = {
 		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE, .flags = DRM_XE_SYNC_FLAG_SIGNAL,
@@ -128,15 +129,17 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	};
 	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
 	uint32_t bind_exec_queues[MAX_N_EXEC_QUEUES];
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
 
@@ -151,6 +154,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 				  DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
 	bo_size = sizeof(*data) * n_execs;
 	bo_size = xe_bb_size(fd, bo_size);
+	sync_size = sizeof(*syncdata) * n_execs;
+	sync_size = xe_bb_size(fd, sync_size);
 
 	if (flags & USERPTR) {
 #define	MAP_ADDRESS	0x00007fadeadbe000
@@ -178,6 +183,12 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	}
 	memset(data, 0, bo_size);
 
+#define SYNCDATA_ADDRESS	0x00007fbdeadbe000
+	syncdata = mmap((void *)SYNCDATA_ADDRESS, sync_size, PROT_READ | PROT_WRITE,
+			MAP_SHARED | MAP_FIXED | MAP_ANONYMOUS, -1, 0);
+	igt_assert(syncdata != MAP_FAILED);
+	memset(syncdata, 0, sync_size);
+
 	for (i = 0; i < n_exec_queues; i++) {
 		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
 		if (flags & BIND_EXEC_QUEUE)
@@ -187,7 +198,14 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 			bind_exec_queues[i] = 0;
 	};
 
-	sync[0].addr = to_user_pointer(&data[0].vm_sync);
+	sync[0].addr = to_user_pointer(&syncdata[0].vm_sync);
+	xe_vm_bind_userptr_async(fd, vm, bind_exec_queues[0],
+				 to_user_pointer(syncdata), syncaddr,
+				 sync_size, sync, 1);
+	xe_wait_ufence(fd, &syncdata[0].vm_sync, USER_FENCE_VALUE,
+			bind_exec_queues[0], NSEC_PER_SEC);
+	syncdata[0].vm_sync = 0;
+
 	if (flags & IMMEDIATE) {
 		if (bo)
 			xe_vm_bind_async_flags(fd, vm, bind_exec_queues[0], bo, 0,
@@ -208,24 +226,24 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 						 bo_size, sync, 1);
 	}
 
-	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
+	xe_wait_ufence(fd, &syncdata[0].vm_sync, USER_FENCE_VALUE,
 		       bind_exec_queues[0], NSEC_PER_SEC);
-	data[0].vm_sync = 0;
+	syncdata[0].vm_sync = 0;
 
 	if (flags & PREFETCH) {
 		/* Should move to system memory */
 		xe_vm_prefetch_async(fd, vm, bind_exec_queues[0], 0, addr,
 				     bo_size, sync, 1, 0);
-		xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
+		xe_wait_ufence(fd, &syncdata[0].vm_sync, USER_FENCE_VALUE,
 			       bind_exec_queues[0], NSEC_PER_SEC);
-		data[0].vm_sync = 0;
+		syncdata[0].vm_sync = 0;
 	}
 
 	for (i = 0; i < n_execs; i++) {
 		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
 		uint64_t batch_addr = addr + batch_offset;
-		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
-		uint64_t sdi_addr = addr + sdi_offset;
+		uint64_t sdi_offset = (char *)&syncdata[i].data - (char *)syncdata;
+		uint64_t sdi_addr = syncaddr + sdi_offset;
 		int e = i % n_exec_queues;
 
 		b = 0;
@@ -239,19 +257,19 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		data[i].batch[b++] = MI_BATCH_BUFFER_END;
 		igt_assert(b <= ARRAY_SIZE(data[i].batch));
 
-		sync[0].addr = addr + (char *)&data[i].exec_sync - (char *)data;
+		sync[0].addr = syncaddr + (char *)&syncdata[i].exec_sync - (char *)syncdata;
 
 		exec.exec_queue_id = exec_queues[e];
 		exec.address = batch_addr;
 		xe_exec(fd, &exec);
 
 		if (flags & REBIND && i + 1 != n_execs) {
-			xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
+			xe_wait_ufence(fd, &syncdata[i].exec_sync, USER_FENCE_VALUE,
 				       exec_queues[e], NSEC_PER_SEC);
 			xe_vm_unbind_async(fd, vm, bind_exec_queues[e], 0,
 					   addr, bo_size, NULL, 0);
 
-			sync[0].addr = to_user_pointer(&data[0].vm_sync);
+			sync[0].addr = to_user_pointer(&syncdata[0].vm_sync);
 			addr += bo_size;
 			if (bo)
 				xe_vm_bind_async(fd, vm, bind_exec_queues[e], bo,
@@ -262,9 +280,9 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 							 to_user_pointer(data),
 							 addr, bo_size, sync,
 							 1);
-			xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
+			xe_wait_ufence(fd, &syncdata[0].vm_sync, USER_FENCE_VALUE,
 				       bind_exec_queues[e], NSEC_PER_SEC);
-			data[0].vm_sync = 0;
+			syncdata[0].vm_sync = 0;
 		}
 
 		if (flags & INVALIDATE && i + 1 != n_execs) {
@@ -275,10 +293,10 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 				 * physical memory on next mmap call triggering
 				 * an invalidate.
 				 */
-				xe_wait_ufence(fd, &data[i].exec_sync,
+				xe_wait_ufence(fd, &syncdata[i].exec_sync,
 					       USER_FENCE_VALUE, exec_queues[e],
 					       NSEC_PER_SEC);
-				igt_assert_eq(data[i].data, 0xc0ffee);
+				igt_assert_eq(syncdata[i].data, 0xc0ffee);
 			} else if (i * 2 != n_execs) {
 				/*
 				 * We issue 1 mmap which races against running
@@ -319,17 +337,22 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 			int64_t timeout = NSEC_PER_SEC;
 
 			if (flags & INVALID_VA && !(flags & ENABLE_SCRATCH))
-				igt_assert_eq(__xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
+				igt_assert_eq(__xe_wait_ufence(fd, &syncdata[i].exec_sync, USER_FENCE_VALUE,
 							       exec_queues[i % n_exec_queues], &timeout), -EIO);
 			else
-				igt_assert_eq(__xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
+				igt_assert_eq(__xe_wait_ufence(fd, &syncdata[i].exec_sync, USER_FENCE_VALUE,
 							       exec_queues[i % n_exec_queues], &timeout), 0);
 		}
 	}
-	sync[0].addr = to_user_pointer(&data[0].vm_sync);
+	sync[0].addr = to_user_pointer(&syncdata[0].vm_sync);
 	xe_vm_unbind_async(fd, vm, bind_exec_queues[0], 0, addr, bo_size,
 			   sync, 1);
-	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
+	xe_wait_ufence(fd, &syncdata[0].vm_sync, USER_FENCE_VALUE,
+		       bind_exec_queues[0], NSEC_PER_SEC);
+	syncdata[0].vm_sync = 0;
+	xe_vm_unbind_async(fd, vm, bind_exec_queues[0], 0, syncaddr, sync_size,
+			   sync, 1);
+	xe_wait_ufence(fd, &syncdata[0].vm_sync, USER_FENCE_VALUE,
 		       bind_exec_queues[0], NSEC_PER_SEC);
 
 	if (flags & INVALID_FAULT) {
@@ -337,13 +360,13 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 			int ret;
 			int64_t timeout = NSEC_PER_SEC;
 
-			ret = __xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
+			ret = __xe_wait_ufence(fd, &syncdata[i].exec_sync, USER_FENCE_VALUE,
 					       exec_queues[i % n_exec_queues], &timeout);
 			igt_assert(ret == -EIO || ret == 0);
 		}
 	} else if (!(flags & INVALID_VA)) {
 		for (i = j; i < n_execs; i++)
-			igt_assert_eq(data[i].data, 0xc0ffee);
+			igt_assert_eq(syncdata[i].data, 0xc0ffee);
 
 	}
 
@@ -353,12 +376,15 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 			xe_exec_queue_destroy(fd, bind_exec_queues[i]);
 	}
 
+	munmap(syncdata, sync_size);
+
 	if (bo) {
 		munmap(data, bo_size);
 		gem_close(fd, bo);
 	} else if (!(flags & INVALIDATE)) {
 		free(data);
 	}
+
 	xe_vm_destroy(fd, vm);
 	if (map_fd != -1)
 		close(map_fd);
-- 
2.25.1

