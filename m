Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B401C3DA5D
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jul 2024 19:45:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5BDA10E12E;
	Fri, 19 Jul 2024 19:45:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EbGW5esn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CB6610E157
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jul 2024 19:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721418328; x=1752954328;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=a6IAV/UAwgpBc2F91lICcTOR6Qe1RJhY0PPGJxqhrbE=;
 b=EbGW5esnvBO3sOVuIgWJLITzCSZMLmf93zpfrh/ikQo0enFpm0ObQbGM
 3JAuXJhGAoNgzli12Yf4tijWdHQYBvNYcE+I8QukApkWDGvGyf9USus2t
 huyyf/0bsb2HxsL3Kby/UDQRQkJ8++YfdON3lA/iiibYAR3YgR46kS2hv
 5jwFXpEWwfSQZPzqjCK3Nw8G3XmaWOcVs3Jltl1ilXiIcJVFKKNTEd0Yn
 Z1AEPPG/n0rQ4MlzsHUk6CdSybPsoG2s+pv+guo1vHz68HxpCFUPoYQ94
 4PpHQTg5WIOXXTkzk3b+U4uDIMRl/t7gr7Mtx8I+dFEiT2RlR9JUP0Unj Q==;
X-CSE-ConnectionGUID: bwu2aYTHQZahaoec2/3ShQ==
X-CSE-MsgGUID: zR9bV2MgRTKjdY3L5utg9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="30478000"
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="30478000"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 12:45:27 -0700
X-CSE-ConnectionGUID: sAYfi95/QVao4z+mZu87Qg==
X-CSE-MsgGUID: 2rigZxcoQ7W51EMmRq1AUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; d="scan'208";a="50960527"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 12:45:28 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH v2 2/2] tests/intel/xe_vm: Add bind array -ENOBUFS section
Date: Fri, 19 Jul 2024 12:46:13 -0700
Message-Id: <20240719194613.1549550-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240719194613.1549550-1-matthew.brost@intel.com>
References: <20240719194613.1549550-1-matthew.brost@intel.com>
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
v3:
- Fix sign of error usage

Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/intel/xe_vm.c | 51 ++++++++++++++++++++++++++++++++++-----------
 1 file changed, 39 insertions(+), 12 deletions(-)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index a5f25acc7e..cff71487e4 100644
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
+				     n_execs, sync, 2, ENOBUFS);
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

