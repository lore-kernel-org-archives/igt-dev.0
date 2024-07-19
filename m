Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3843C3DA5D
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jul 2024 19:27:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F42710E0BD;
	Fri, 19 Jul 2024 19:27:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DuGd+ViS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CC2C10E067
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jul 2024 19:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721417221; x=1752953221;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=jqFzXMmif8LO6/w/mwouD2rWijadlTU4cCMSoydCq6g=;
 b=DuGd+ViS/SoUIWzVCfyZR6jO0iXjvynVMCe8BjWbliqeqZVkuvs5l4rU
 ipl9BrmEgeLj9LZTSoyzofXfLL27hebc/eklWBXMg5juxGDXLklkUlqQb
 KPbLGh/x05lLeTEQtnJkyM7AbrvmmSkxy0BDoSB39puAhrfrAWXLeebDI
 pVjfjwz9hQ1oRyl8sKGB/L2Nu/mkyz6Gz6zR920s0mUE+ZyH29VkL1sY0
 HcClcM/D+d4jW8itrkuPtu+1J2UMxtD523zxrDClm6yNRNgffakFuHMOH
 oFHvbg9d677dflxLSOSpuyukxEhDHK815zY/Z78uqFtxOxIkrVQyypos3 w==;
X-CSE-ConnectionGUID: GoFE5oKnQW2qAJHeSVMdJA==
X-CSE-MsgGUID: 6j+8SghpTfy/C4OAiwhl4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="30206498"
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="30206498"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 12:27:01 -0700
X-CSE-ConnectionGUID: +Htj/G0ZQU2XXVf2E/tFVw==
X-CSE-MsgGUID: 6SpAM6qISyO5uX5IzwtcEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="51943861"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 12:27:00 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 2/2] tests/intel/xe_vm: Add bind array -ENOBUFS section
Date: Fri, 19 Jul 2024 12:27:46 -0700
Message-Id: <20240719192746.1544906-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240719192746.1544906-1-matthew.brost@intel.com>
References: <20240719192746.1544906-1-matthew.brost@intel.com>
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

v2:
- Use do_ioctl_err (Matthew Auld)
- Move xe_vm_bind_array_err to xe_vm.c

Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/intel/xe_vm.c | 51 ++++++++++++++++++++++++++++++++++-----------
 1 file changed, 39 insertions(+), 12 deletions(-)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index e9711a60a5..a088bd5db8 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -869,7 +869,7 @@ static void xe_vm_bind_array_err(int fd, uint32_t vm, uint32_t exec_queue,
 }
 
 #define BIND_ARRAY_BIND_EXEC_QUEUE_FLAG	(0x1 << 0)
-
+#define BIND_ARRAY_ENOBUFS_FLAG		(0x1 << 1)
 
 /**
  * SUBTEST: bind-array-twice
@@ -882,6 +882,11 @@ static void xe_vm_bind_array_err(int fd, uint32_t vm, uint32_t exec_queue,
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
@@ -894,10 +899,10 @@ static void xe_vm_bind_array_err(int fd, uint32_t vm, uint32_t exec_queue,
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
@@ -907,9 +912,7 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
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
@@ -918,10 +921,11 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
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
@@ -949,6 +953,22 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
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
+		xe_vm_bind_array_err(fd, vm, bind_exec_queue, bind_ops,
+				     n_execs, sync, 2, -ENOBUFS);
+		xe_cork_end(&cork);
+		xe_cork_wait_done(&cork);
+		xe_cork_fini(&cork);
+		n_execs = n_execs / 2;
+	}
+
 	xe_vm_bind_array(fd, vm, bind_exec_queue, bind_ops, n_execs, sync, 1);
 
 	addr = base_addr;
@@ -1008,6 +1028,7 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
 	munmap(data, bo_size);
 	gem_close(fd, bo);
 	xe_vm_destroy(fd, vm);
+	free(bind_ops);
 }
 
 /**
@@ -2397,20 +2418,26 @@ igt_main
 
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
+			test_bind_array(fd, hwe, xe_has_vram(fd) ? 1024 : 512,
+					0x1a0000, SZ_2M,
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

