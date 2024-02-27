Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01DD0C48BF6
	for <igt-dev@archiver.kernel.org>; Tue, 27 Feb 2024 02:39:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AB8510E5E4;
	Tue, 27 Feb 2024 02:39:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xg075vxX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C866D10E5E4
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Feb 2024 02:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709001597; x=1740537597;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7B9b4HOCJEtiQLXEMnivPNH3+qDD0jmihz7L2Tyu/nc=;
 b=Xg075vxXb+JHxonK+W1Wa9h+J+rlb4l1Q3MfqMe8mhJGmbRCuRPSMc1R
 /qHMsbKsse9rbGVzJQ83zeocU0PuMkHd7f8sejXifPegwknrzW/E2Xciy
 kH4tej+Ktq7y+9eLfKtDr2wGXxajVP+gjEo6nr9IT3BOBhe0Do0AJkum7
 N/ECJZl23wRiYafU4IWf4ZgR7iUAjq45ROlZoPt8av/xqHzs2uqQyHbMd
 YJnstjJ3W2ap0Cg1kmQq7vWYFJkprXDASRBkJLeptVqfN1SBs2vqoL+a2
 pC893LqkYItpub06aDp4dAy+lBKiMIpLECT6E4EtStN5PNsEchmdAgioB Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="14748211"
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; d="scan'208";a="14748211"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 18:39:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; d="scan'208";a="11661140"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 18:39:56 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] xe_exec_compute_mode: Add malloc-ufence test
Date: Mon, 26 Feb 2024 18:39:56 -0800
Message-Id: <20240227023956.141475-1-matthew.brost@intel.com>
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

The get user page ufence path is not triggered by the test as ufence
memory is a mapped BO. To trigger this path use a malloc'd address.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/intel/xe_exec_compute_mode.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
index 7dad715093..c0cddbc02b 100644
--- a/tests/intel/xe_exec_compute_mode.c
+++ b/tests/intel/xe_exec_compute_mode.c
@@ -31,6 +31,7 @@
 #define BIND_EXECQUEUE		(0x1 << 4)
 #define VM_FOR_BO			(0x1 << 5)
 #define EXEC_QUEUE_EARLY	(0x1 << 6)
+#define MALLOC_USER_FENCE		(0x1 <<7)
 
 /**
  * SUBTEST: twice-%s
@@ -48,6 +49,7 @@
  * arg[1]:
  *
  * @basic:				basic
+ * @malloc-ufence:			malloc user fence
  * @preempt-fence-early:		preempt fence early
  * @userptr:				userptr
  * @rebind:				rebind
@@ -110,6 +112,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		uint64_t exec_sync;
 		uint32_t data;
 	} *data;
+	uint64_t *vm_sync;
 	int i, j, b;
 	int map_fd = -1;
 	int64_t fence_timeout;
@@ -149,6 +152,12 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	}
 	memset(data, 0, bo_size);
 
+	if (flags & MALLOC_USER_FENCE)
+		vm_sync = malloc(sizeof(*vm_sync));
+	else
+		vm_sync = &data[0].vm_sync;
+	igt_assert(vm_sync);
+
 	for (i = 0; !(flags & EXEC_QUEUE_EARLY) && i < n_exec_queues; i++) {
 		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
 		if (flags & BIND_EXECQUEUE)
@@ -158,7 +167,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 			bind_exec_queues[i] = 0;
 	};
 
-	sync[0].addr = to_user_pointer(&data[0].vm_sync);
+	sync[0].addr = to_user_pointer(vm_sync);
 	if (bo)
 		xe_vm_bind_async(fd, vm, bind_exec_queues[0], bo, 0, addr,
 				 bo_size, sync, 1);
@@ -171,9 +180,9 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 
 	fence_timeout = igt_run_in_simulation() ? HUNDRED_SEC : ONE_SEC;
 
-	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
+	xe_wait_ufence(fd, vm_sync, USER_FENCE_VALUE,
 		       bind_exec_queues[0], fence_timeout);
-	data[0].vm_sync = 0;
+	*vm_sync = 0;
 
 	for (i = 0; i < n_execs; i++) {
 		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
@@ -202,7 +211,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 			xe_vm_unbind_async(fd, vm, bind_exec_queues[e], 0,
 					   addr, bo_size, NULL, 0);
 
-			sync[0].addr = to_user_pointer(&data[0].vm_sync);
+			sync[0].addr = to_user_pointer(vm_sync);
 			addr += bo_size;
 			if (bo)
 				xe_vm_bind_async(fd, vm, bind_exec_queues[e], bo,
@@ -213,9 +222,9 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 							 to_user_pointer(data),
 							 addr, bo_size, sync,
 							 1);
-			xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
+			xe_wait_ufence(fd, vm_sync, USER_FENCE_VALUE,
 				       bind_exec_queues[e], fence_timeout);
-			data[0].vm_sync = 0;
+			*vm_sync = 0;
 		}
 
 		if (flags & INVALIDATE && i + 1 != n_execs) {
@@ -264,10 +273,10 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	if (flags & INVALIDATE)
 		usleep(250000);
 
-	sync[0].addr = to_user_pointer(&data[0].vm_sync);
+	sync[0].addr = to_user_pointer(vm_sync);
 	xe_vm_unbind_async(fd, vm, bind_exec_queues[0], 0, addr, bo_size,
 			   sync, 1);
-	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
+	xe_wait_ufence(fd, vm_sync, USER_FENCE_VALUE,
 		       bind_exec_queues[0], fence_timeout);
 
 	for (i = j; i < n_execs; i++)
@@ -288,6 +297,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	xe_vm_destroy(fd, vm);
 	if (map_fd != -1)
 		close(map_fd);
+	if (flags & MALLOC_USER_FENCE)
+		free(vm_sync);
 }
 
 /**
@@ -408,6 +419,7 @@ igt_main
 		unsigned int flags;
 	} sections[] = {
 		{ "basic", 0 },
+		{ "malloc-ufence", MALLOC_USER_FENCE },
 		{ "preempt-fence-early", VM_FOR_BO | EXEC_QUEUE_EARLY },
 		{ "userptr", USERPTR },
 		{ "rebind", REBIND },
-- 
2.34.1

