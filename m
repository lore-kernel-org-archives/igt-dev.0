Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A918C2BBCA
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 23:54:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 310C610E2FE;
	Thu, 20 Jun 2024 23:54:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O4ZTFBjh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B5CA10E2FE
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 23:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718927642; x=1750463642;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nB1ixJpO/dQZKc5gKw8S2efg6+yDVeYTcDtB1/E7sps=;
 b=O4ZTFBjhwX0m7dRYLdu9s49nGc0HNqsMjVeiKfeZNRdiTxGmDToWZ1hP
 /Cxq/gOM0PfKoutCRIgROVQhnIy+tiUwNuhWhth1OVsWld+XXDpjX92Sg
 Kn+Qqre1ScLrMuLS8hsWxah0Pv96HZl18HXF5EmTmgd0L9S5kRWTq7rwj
 zB39KyOiL4k++rwDlxCh6iFQ6sEIxIMLYsHjgK1yN/8Lb2ETN8PujTQmz
 4D2al+nbF97T0A9+um+jG7FOOu7BGfYaN46/x9LX2u/iV8VvNGt8h4Qfl
 PIG01pfsYFiSNb5K/fuQnJWuwJxDIhy9uZbe35Ed3IUUHFgz+xX7bjQ7g Q==;
X-CSE-ConnectionGUID: isehNYKdSZO1I0MjE/ve+g==
X-CSE-MsgGUID: GsTYlqaZSsWWPcU3D9m1eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="15775559"
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; d="scan'208";a="15775559"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 16:54:01 -0700
X-CSE-ConnectionGUID: IRAfsmTVSy6TOExGtPpi8Q==
X-CSE-MsgGUID: sSl2OFHkSgWeNFh3MINC7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; d="scan'208";a="46940894"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 16:54:00 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.auld@intel.com
Subject: [PATCH] xe_vm: Add bind array -ENOBUFS section
Date: Thu, 20 Jun 2024 16:54:37 -0700
Message-Id: <20240620235437.3722232-1-matthew.brost@intel.com>
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

Add section which has a large enough array of binds which triggers BB
suballocation failure. Verify -ENOBUFS is returned in this case.

Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 lib/xe/xe_ioctl.c   | 19 +++++++++++++++++
 lib/xe/xe_ioctl.h   |  4 ++++
 tests/intel/xe_vm.c | 50 ++++++++++++++++++++++++++++++++++-----------
 3 files changed, 61 insertions(+), 12 deletions(-)

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index a437fd828a..9072801ce1 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -115,6 +115,25 @@ void xe_vm_bind_array_enospc(int fd, uint32_t vm, uint32_t exec_queue,
 	igt_assert_eq(-errno, -ENOSPC);
 }
 
+void xe_vm_bind_array_enobufs(int fd, uint32_t vm, uint32_t exec_queue,
+			      struct drm_xe_vm_bind_op *bind_ops,
+			      uint32_t num_bind, struct drm_xe_sync *sync,
+			      uint32_t num_syncs)
+{
+	struct drm_xe_vm_bind bind = {
+		.vm_id = vm,
+		.num_binds = num_bind,
+		.vector_of_binds = (uintptr_t)bind_ops,
+		.num_syncs = num_syncs,
+		.syncs = (uintptr_t)sync,
+		.exec_queue_id = exec_queue,
+	};
+
+	igt_assert(num_bind > 1);
+	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind), -1);
+	igt_assert_eq(-errno, -ENOBUFS);
+}
+
 int  __xe_vm_bind(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
 		  uint64_t offset, uint64_t addr, uint64_t size, uint32_t op,
 		  uint32_t flags, struct drm_xe_sync *sync, uint32_t num_syncs,
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index 2c7506caaf..a9954d0d41 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -61,6 +61,10 @@ void xe_vm_bind_array_enospc(int fd, uint32_t vm, uint32_t exec_queue,
 			     struct drm_xe_vm_bind_op *bind_ops,
 			     uint32_t num_bind, struct drm_xe_sync *sync,
 			     uint32_t num_syncs);
+void xe_vm_bind_array_enobufs(int fd, uint32_t vm, uint32_t exec_queue,
+			      struct drm_xe_vm_bind_op *bind_ops,
+			      uint32_t num_bind, struct drm_xe_sync *sync,
+			      uint32_t num_syncs);
 void xe_vm_unbind_all_async(int fd, uint32_t vm, uint32_t exec_queue,
 			    uint32_t bo, struct drm_xe_sync *sync,
 			    uint32_t num_syncs);
diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 7be85da62f..b116d7da1b 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -728,7 +728,7 @@ test_bind_execqueues_independent(int fd, struct drm_xe_engine_class_instance *ec
 }
 
 #define BIND_ARRAY_BIND_EXEC_QUEUE_FLAG	(0x1 << 0)
-
+#define BIND_ARRAY_ENOBUFS_FLAG		(0x1 << 1)
 
 /**
  * SUBTEST: bind-array-twice
@@ -741,6 +741,11 @@ test_bind_execqueues_independent(int fd, struct drm_xe_engine_class_instance *ec
  * Functionality: bind exec_queues
  * Test category: functionality test
  *
+ * SUBTEST: bind-array-enobufs
+ * Description: Test bind array which too large are trigger -ENOBUFs error
+ * Functionality: bind exec_queues
+ * Test category: functionality test
+ *
  * SUBTEST: bind-array-exec_queue-twice
  * Description: Test bind array exec_queue twice
  * Functionality: bind exec_queues
@@ -753,10 +758,10 @@ test_bind_execqueues_independent(int fd, struct drm_xe_engine_class_instance *ec
  */
 static void
 test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
-		unsigned int flags)
+		uint64_t addr, size_t bo_size, unsigned int flags)
 {
 	uint32_t vm;
-	uint64_t addr = 0x1a0000, base_addr = 0x1a0000;
+	uint64_t base_addr = addr;
 	struct drm_xe_sync sync[2] = {
 		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
 		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
@@ -766,9 +771,7 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
 		.syncs = to_user_pointer(sync),
 	};
 	uint32_t exec_queue, bind_exec_queue = 0;
-#define BIND_ARRAY_MAX_N_EXEC	16
-	struct drm_xe_vm_bind_op bind_ops[BIND_ARRAY_MAX_N_EXEC] = { };
-	size_t bo_size;
+	struct drm_xe_vm_bind_op *bind_ops;
 	uint32_t bo = 0;
 	struct {
 		uint32_t batch[16];
@@ -777,10 +780,11 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
 	} *data;
 	int i, b;
 
-	igt_assert(n_execs <= BIND_ARRAY_MAX_N_EXEC);
+	bind_ops = malloc(sizeof(*bind_ops) * n_execs);
+	igt_assert(bind_ops);
 
 	vm = xe_vm_create(fd, 0, 0);
-	bo_size = sizeof(*data) * n_execs;
+	bo_size = bo_size ?: sizeof(*data) * n_execs;
 	bo_size = xe_bb_size(fd, bo_size);
 
 	bo = xe_bo_create(fd, vm, bo_size,
@@ -808,6 +812,22 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
 	}
 
 	sync[0].handle = syncobj_create(fd, 0);
+	if (flags & BIND_ARRAY_ENOBUFS_FLAG) {
+		struct xe_cork cork;
+
+		xe_cork_init(fd, eci, &cork);
+
+		sync[1].handle = xe_cork_sync_handle(&cork);
+		sync[1].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
+
+		xe_vm_bind_array_enobufs(fd, vm, bind_exec_queue, bind_ops,
+					 n_execs, sync, 2);
+		xe_cork_end(&cork);
+		xe_cork_wait_done(&cork);
+		xe_cork_fini(&cork);
+		n_execs = n_execs / 2;
+	}
+
 	xe_vm_bind_array(fd, vm, bind_exec_queue, bind_ops, n_execs, sync, 1);
 
 	addr = base_addr;
@@ -867,6 +887,7 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
 	munmap(data, bo_size);
 	gem_close(fd, bo);
 	xe_vm_destroy(fd, vm);
+	free(bind_ops);
 }
 
 /**
@@ -2251,20 +2272,25 @@ igt_main
 
 	igt_subtest("bind-array-twice")
 		xe_for_each_engine(fd, hwe)
-			test_bind_array(fd, hwe, 2, 0);
+			test_bind_array(fd, hwe, 2, 0x1a0000, 0, 0);
 
 	igt_subtest("bind-array-many")
 		xe_for_each_engine(fd, hwe)
-			test_bind_array(fd, hwe, 16, 0);
+			test_bind_array(fd, hwe, 16, 0x1a0000, 0, 0);
+
+	igt_subtest("bind-array-enobufs")
+		xe_for_each_engine(fd, hwe)
+			test_bind_array(fd, hwe, 512, 0x1a0000, SZ_2M,
+					BIND_ARRAY_ENOBUFS_FLAG);
 
 	igt_subtest("bind-array-exec_queue-twice")
 		xe_for_each_engine(fd, hwe)
-			test_bind_array(fd, hwe, 2,
+			test_bind_array(fd, hwe, 2, 0x1a0000, 0,
 					BIND_ARRAY_BIND_EXEC_QUEUE_FLAG);
 
 	igt_subtest("bind-array-exec_queue-many")
 		xe_for_each_engine(fd, hwe)
-			test_bind_array(fd, hwe, 16,
+			test_bind_array(fd, hwe, 16, 0x1a0000, 0,
 					BIND_ARRAY_BIND_EXEC_QUEUE_FLAG);
 
 	igt_subtest("bind-array-conflict")
-- 
2.34.1

