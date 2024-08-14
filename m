Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9734C531DE
	for <igt-dev@archiver.kernel.org>; Wed, 14 Aug 2024 21:47:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F48010E217;
	Wed, 14 Aug 2024 21:47:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BXB132P8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9511010E1EE
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Aug 2024 21:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723672035; x=1755208035;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NIfhfb3RiP1NhnU8iP0YSRM9uILER41oiIS+fQV/dmo=;
 b=BXB132P8FYnt3fwH+5EEHRqBqZv9WhY7QbXnhcl4QHeHFuPXxXiJDZUH
 t3fk6T6kGhzbIkfzdoc08peqQ4wcDi++dUTyO2laFdYjuue06dNEmoO35
 +G24k/8yqwjrLwXoQkGYzeslrwsKWOVTP9PMVuGI/wzRbzWWAzO/JWHwT
 gGYrBMkDvpZ4a31CZ3Me5ZOvlRsCxEBqBsywdhqT1kzOQqwUoH1m0briE
 J5yHbgZ7AAdnITuDABEKmHV1MbL6DHEGE+4rudRPP55SmszGUolZmeinW
 9Tmu5VWnLEFxHr+kmTKMZ8HNiIEqN5jiZ/T4gEQeyhfT7DCSrZXBt8oaH A==;
X-CSE-ConnectionGUID: VHfqYbWUSv6OgW+4tz4OYQ==
X-CSE-MsgGUID: fvu/yfOsSkKcrHRfcTOGfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="21785903"
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; d="scan'208";a="21785903"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 14:47:14 -0700
X-CSE-ConnectionGUID: 39R65VOqSra3ztRAdJKTXw==
X-CSE-MsgGUID: fe9fBei2Ru+Ui5L34JAJGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; d="scan'208";a="63983771"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 14:47:13 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 3/3] lib/xe: Remove MS_TO_NS()
Date: Wed, 14 Aug 2024 14:47:05 -0700
Message-ID: <20240814214705.3718355-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240814214705.3718355-1-lucas.demarchi@intel.com>
References: <20240814214705.3718355-1-lucas.demarchi@intel.com>
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

This was added in lib/xe/xe_query.h to quickly convert the kernel
interface to use nsec rather than msec. However it's misplaced and
doesn't follow the same style as for other time-conversion macros.

Worth noting that the "#define ONE_SEC" and the like are error-prone
if we are using other interfaces with different units. Example:
`usleep(ONE_SEC)` could go unnoticed since there's no unit in the
define.

Use the common way of doing time-conversion via the NSEC_PER_SEC
macros.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/xe/xe_query.h                  |  2 --
 tests/intel/xe_evict.c             |  5 ++---
 tests/intel/xe_exec_balancer.c     | 13 ++++++-------
 tests/intel/xe_exec_compute_mode.c | 19 ++++++++-----------
 tests/intel/xe_exec_fault_mode.c   | 15 +++++++--------
 tests/intel/xe_exec_mix_modes.c    |  7 +++----
 tests/intel/xe_exec_reset.c        |  7 +++----
 tests/intel/xe_exec_threads.c      |  4 +---
 tests/intel/xe_waitfence.c         |  8 ++++----
 9 files changed, 34 insertions(+), 46 deletions(-)

diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index c33f91ca1..054cd6343 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -109,6 +109,4 @@ uint16_t xe_gt_get_tile_id(int fd, int gt);
 struct xe_device *xe_device_get(int fd);
 void xe_device_put(int fd);
 
-#define MS_TO_NS(ms) (((int64_t)ms) * 1000000)
-
 #endif	/* XE_QUERY_H */
diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
index f0c66c49e..892c8d2cc 100644
--- a/tests/intel/xe_evict.c
+++ b/tests/intel/xe_evict.c
@@ -311,9 +311,8 @@ test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
 				xe_vm_bind_async(fd, vm, bind_exec_queues[0], __bo,
 						 0, addr, bo_size, sync, 1);
 			}
-#define TWENTY_SEC	MS_TO_NS(20000)
 			xe_wait_ufence(fd, &data[i].vm_sync, USER_FENCE_VALUE,
-				       bind_exec_queues[0], TWENTY_SEC);
+				       bind_exec_queues[0], 20 * NSEC_PER_SEC);
 		}
 		sync[0].addr = addr + (char *)&data[i].exec_sync -
 			(char *)data;
@@ -348,7 +347,7 @@ test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
 		data = xe_bo_map(fd, __bo,
 				 ALIGN(sizeof(*data) * n_execs, 0x1000));
 		xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
-			       exec_queues[i % n_exec_queues], TWENTY_SEC);
+			       exec_queues[i % n_exec_queues], 20 * NSEC_PER_SEC);
 		igt_assert_eq(data[i].data, 0xc0ffee);
 	}
 	munmap(data, ALIGN(sizeof(*data) * n_execs, 0x1000));
diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
index 73f69e7b0..5e1bc76ce 100644
--- a/tests/intel/xe_exec_balancer.c
+++ b/tests/intel/xe_exec_balancer.c
@@ -459,8 +459,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 		xe_vm_bind_userptr_async(fd, vm, 0, to_user_pointer(data), addr,
 					 bo_size, sync, 1);
 
-#define ONE_SEC	MS_TO_NS(1000)
-	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, ONE_SEC);
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
 	data[0].vm_sync = 0;
 
 	for (i = 0; i < n_execs; i++) {
@@ -491,7 +490,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 
 		if (flags & REBIND && i + 1 != n_execs) {
 			xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
-				       exec_queues[e], ONE_SEC);
+				       exec_queues[e], NSEC_PER_SEC);
 			xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, NULL,
 					   0);
 
@@ -506,7 +505,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 							 addr, bo_size, sync,
 							 1);
 			xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
-				       0, ONE_SEC);
+				       0, NSEC_PER_SEC);
 			data[0].vm_sync = 0;
 		}
 
@@ -520,7 +519,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 				 */
 				xe_wait_ufence(fd, &data[i].exec_sync,
 					       USER_FENCE_VALUE, exec_queues[e],
-					       ONE_SEC);
+					       NSEC_PER_SEC);
 				igt_assert_eq(data[i].data, 0xc0ffee);
 			} else if (i * 2 != n_execs) {
 				/*
@@ -551,7 +550,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 	j = flags & INVALIDATE && n_execs ? n_execs - 1 : 0;
 	for (i = j; i < n_execs; i++)
 		xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
-			       exec_queues[i % n_exec_queues], ONE_SEC);
+			       exec_queues[i % n_exec_queues], NSEC_PER_SEC);
 
 	/* Wait for all execs to complete */
 	if (flags & INVALIDATE)
@@ -559,7 +558,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 
 	sync[0].addr = to_user_pointer(&data[0].vm_sync);
 	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
-	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, ONE_SEC);
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
 
 	for (i = (flags & INVALIDATE && n_execs) ? n_execs - 1 : 0;
 	     i < n_execs; i++)
diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
index 82cf061e8..7d434f798 100644
--- a/tests/intel/xe_exec_compute_mode.c
+++ b/tests/intel/xe_exec_compute_mode.c
@@ -190,10 +190,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 					 to_user_pointer(data), addr,
 					 bo_size, sync, 1);
 	}
-#define ONE_SEC	MS_TO_NS(1000)
-#define HUNDRED_SEC	MS_TO_NS(100000)
 
-	fence_timeout = igt_run_in_simulation() ? HUNDRED_SEC : ONE_SEC;
+	fence_timeout = (igt_run_in_simulation() ? 100 : 1) * NSEC_PER_SEC;
 
 	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
 		       bind_exec_queues[0], fence_timeout);
@@ -326,7 +324,6 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
  * Description: Fill the ring and check we get expected errors.
  * Test category: functionality test
  */
-#define ONE_SEC	MS_TO_NS(1000)
 #define VM_DATA		0
 #define SPIN_DATA	1
 #define EXEC_DATA	2
@@ -378,7 +375,7 @@ static void non_block(int fd, int expect)
 	sync[0].addr = to_user_pointer(&data[VM_DATA].vm_sync);
 	xe_vm_bind_async(fd, vm, engine->instance.gt_id, bo, 0,
 			       addr, bo_size, sync, 1);
-	xe_wait_ufence(fd, &data[VM_DATA].vm_sync, USER_FENCE_VALUE, 0, ONE_SEC);
+	xe_wait_ufence(fd, &data[VM_DATA].vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
 	data[VM_DATA].vm_sync = 0;
 
 	spin_opts.addr = addr + (char *)&data[SPIN_DATA].spin - (char *)data;
@@ -414,16 +411,16 @@ static void non_block(int fd, int expect)
 	igt_assert_eq(errno, expect);
 
 	xe_spin_end(&data[SPIN_DATA].spin);
-	xe_wait_ufence(fd, &data[SPIN_DATA].exec_sync, USER_FENCE_VALUE, 0, ONE_SEC);
+	xe_wait_ufence(fd, &data[SPIN_DATA].exec_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
 	usleep(50000);
 
 	exec.num_syncs = 1;
 	xe_exec(fd, &exec);
-	xe_wait_ufence(fd, &data[EXEC_DATA].exec_sync, USER_FENCE_VALUE, 0, ONE_SEC);
+	xe_wait_ufence(fd, &data[EXEC_DATA].exec_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
 
 	sync[0].addr = to_user_pointer(&data[VM_DATA].vm_sync);
 	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
-	xe_wait_ufence(fd, &data[VM_DATA].vm_sync, USER_FENCE_VALUE, 0, ONE_SEC);
+	xe_wait_ufence(fd, &data[VM_DATA].vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
 	munmap(data, bo_size);
 	gem_close(fd, bo);
 
@@ -473,7 +470,7 @@ static void lr_mode_workload(int fd)
 
 	sync.addr = to_user_pointer(&vm_sync);
 	xe_vm_bind_async(fd, vm, engine->instance.gt_id, bo, 0, spin_addr, bo_size, &sync, 1);
-	xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0, ONE_SEC);
+	xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
 
 	xe_spin_init_opts(spin, .addr = spin_addr, .write_timestamp = true);
 	sync.addr = spin_addr + (char *)&spin->exec_sync - (char *)spin;
@@ -490,7 +487,7 @@ static void lr_mode_workload(int fd)
 	igt_assert_neq_u32(ts_1, ts_2);
 
 	xe_spin_end(spin);
-	xe_wait_ufence(fd, &spin->exec_sync, USER_FENCE_VALUE, 0, ONE_SEC);
+	xe_wait_ufence(fd, &spin->exec_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
 
 	/* Check timestamps to make sure spinner is stopped */
 	ts_1 = spin->timestamp;
@@ -500,7 +497,7 @@ static void lr_mode_workload(int fd)
 
 	sync.addr = to_user_pointer(&vm_sync);
 	xe_vm_unbind_async(fd, vm, 0, 0, spin_addr, bo_size, &sync, 1);
-	xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0, ONE_SEC);
+	xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
 	munmap(spin, bo_size);
 	gem_close(fd, bo);
 
diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index 56bad2b75..87375ed17 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -207,9 +207,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 						 bo_size, sync, 1);
 	}
 
-#define ONE_SEC	MS_TO_NS(1000)
 	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
-		       bind_exec_queues[0], ONE_SEC);
+		       bind_exec_queues[0], NSEC_PER_SEC);
 	data[0].vm_sync = 0;
 
 	if (flags & PREFETCH) {
@@ -217,7 +216,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		xe_vm_prefetch_async(fd, vm, bind_exec_queues[0], 0, addr,
 				     bo_size, sync, 1, 0);
 		xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
-			       bind_exec_queues[0], ONE_SEC);
+			       bind_exec_queues[0], NSEC_PER_SEC);
 		data[0].vm_sync = 0;
 	}
 
@@ -247,7 +246,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 
 		if (flags & REBIND && i + 1 != n_execs) {
 			xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
-				       exec_queues[e], ONE_SEC);
+				       exec_queues[e], NSEC_PER_SEC);
 			xe_vm_unbind_async(fd, vm, bind_exec_queues[e], 0,
 					   addr, bo_size, NULL, 0);
 
@@ -263,7 +262,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 							 addr, bo_size, sync,
 							 1);
 			xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
-				       bind_exec_queues[e], ONE_SEC);
+				       bind_exec_queues[e], NSEC_PER_SEC);
 			data[0].vm_sync = 0;
 		}
 
@@ -277,7 +276,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 				 */
 				xe_wait_ufence(fd, &data[i].exec_sync,
 					       USER_FENCE_VALUE, exec_queues[e],
-					       ONE_SEC);
+					       NSEC_PER_SEC);
 				igt_assert_eq(data[i].data, 0xc0ffee);
 			} else if (i * 2 != n_execs) {
 				/*
@@ -308,7 +307,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		j = flags & INVALIDATE ? n_execs - 1 : 0;
 
 		for (i = j; i < n_execs; i++) {
-			int64_t timeout = ONE_SEC;
+			int64_t timeout = NSEC_PER_SEC;
 
 			if (flags & INVALID_VA && !(flags & ENABLE_SCRATCH))
 				igt_assert_eq(__xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
@@ -322,7 +321,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	xe_vm_unbind_async(fd, vm, bind_exec_queues[0], 0, addr, bo_size,
 			   sync, 1);
 	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
-		       bind_exec_queues[0], ONE_SEC);
+		       bind_exec_queues[0], NSEC_PER_SEC);
 
 	if (!(flags & INVALID_FAULT) && !(flags & INVALID_VA)) {
 		for (i = j; i < n_execs; i++)
diff --git a/tests/intel/xe_exec_mix_modes.c b/tests/intel/xe_exec_mix_modes.c
index f7bb96255..eeae9d122 100644
--- a/tests/intel/xe_exec_mix_modes.c
+++ b/tests/intel/xe_exec_mix_modes.c
@@ -29,7 +29,6 @@
 
 #define NUM_INTERRUPTING_JOBS	5
 #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
-#define ONE_SEC			MS_TO_NS(1000)
 #define VM_DATA			0
 #define SPIN_DATA		1
 #define EXEC_DATA		2
@@ -121,7 +120,7 @@ run_job(int fd, struct drm_xe_engine_class_instance *hwe,
 
 	store_dword_batch(data, addr, value);
 	if (engine_execution_mode == EXEC_MODE_LR) {
-		xe_wait_ufence(fd, &data[VM_DATA].vm_sync, USER_FENCE_VALUE, 0, ONE_SEC);
+		xe_wait_ufence(fd, &data[VM_DATA].vm_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
 		sync[0].addr = addr + (char *)&data[EXEC_DATA].exec_sync - (char *)data;
 	} else if (engine_execution_mode == EXEC_MODE_DMA_FENCE) {
 		igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
@@ -178,9 +177,9 @@ run_job(int fd, struct drm_xe_engine_class_instance *hwe,
 
 	if (engine_execution_mode == EXEC_MODE_LR) {
 		if (job_type == SPINNER_INTERRUPTED)
-			xe_wait_ufence(fd, &data[SPIN_DATA].exec_sync, USER_FENCE_VALUE, 0, ONE_SEC);
+			xe_wait_ufence(fd, &data[SPIN_DATA].exec_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
 		else if (job_type == SIMPLE_BATCH_STORE)
-			xe_wait_ufence(fd, &data[EXEC_DATA].exec_sync, USER_FENCE_VALUE, 0, ONE_SEC);
+			xe_wait_ufence(fd, &data[EXEC_DATA].exec_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
 	} else if (engine_execution_mode == EXEC_MODE_DMA_FENCE) {
 		igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
 		syncobj_destroy(fd, sync[0].handle);
diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 61c35ce69..801a53efc 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -509,8 +509,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	sync[0].addr = to_user_pointer(&data[0].vm_sync);
 	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
 
-#define THREE_SEC	MS_TO_NS(3000)
-	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, THREE_SEC);
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, 3 * NSEC_PER_SEC);
 	data[0].vm_sync = 0;
 
 	for (i = 0; i < n_execs; i++) {
@@ -563,7 +562,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	}
 
 	for (i = 1; i < n_execs; i++) {
-		int64_t timeout = THREE_SEC;
+		int64_t timeout = 3 * NSEC_PER_SEC;
 		int err;
 
 		err = __xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
@@ -577,7 +576,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 
 	sync[0].addr = to_user_pointer(&data[0].vm_sync);
 	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
-	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, THREE_SEC);
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, 3 * NSEC_PER_SEC);
 
 	if (!(flags & GT_RESET)) {
 		for (i = 1; i < n_execs; i++)
diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index 6e53d3cf8..3874e9865 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -318,10 +318,8 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 	else
 		xe_vm_bind_userptr_async(fd, vm, 0, to_user_pointer(data), addr,
 					 bo_size, sync, 1);
-#define THREE_SEC	MS_TO_NS(3000)
-#define THIRTY_SEC	MS_TO_NS(30000)
 
-	fence_timeout = igt_run_in_simulation() ? THIRTY_SEC : THREE_SEC;
+	fence_timeout = (igt_run_in_simulation() ? 30 : 3) * NSEC_PER_SEC;
 
 	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, fence_timeout);
 	data[0].vm_sync = 0;
diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
index cf4e73368..c1cab64f4 100644
--- a/tests/intel/xe_waitfence.c
+++ b/tests/intel/xe_waitfence.c
@@ -110,14 +110,14 @@ waitfence(int fd, enum waittype wt)
 	do_bind(fd, vm, bo_7, 0, 0xeffff0000, 0x10000, 7);
 
 	if (wt == RELTIME) {
-		timeout = xe_wait_ufence(fd, &wait_fence, 7, 0, MS_TO_NS(10));
+		timeout = xe_wait_ufence(fd, &wait_fence, 7, 0, 10 * NSEC_PER_MSEC);
 		igt_debug("wait type: RELTIME - timeout: %ld, timeout left: %ld\n",
-			  MS_TO_NS(10), timeout);
+			  (int64_t)10 * NSEC_PER_MSEC, timeout);
 	} else if (wt == ENGINE) {
 		exec_queue = xe_exec_queue_create_class(fd, vm, DRM_XE_ENGINE_CLASS_COPY);
 		clock_gettime(CLOCK_MONOTONIC, &ts);
 		current = ts.tv_sec * 1e9 + ts.tv_nsec;
-		timeout = current + MS_TO_NS(10);
+		timeout = current + 10 * NSEC_PER_MSEC;
 		signalled = wait_ufence_abstime(fd, &wait_fence, 7,
 						  exec_queue, timeout,
 						  DRM_XE_UFENCE_WAIT_FLAG_ABSTIME);
@@ -128,7 +128,7 @@ waitfence(int fd, enum waittype wt)
 	} else {
 		clock_gettime(CLOCK_MONOTONIC, &ts);
 		current = ts.tv_sec * 1e9 + ts.tv_nsec;
-		timeout = current + MS_TO_NS(10);
+		timeout = current + 10 * NSEC_PER_MSEC;
 		signalled = wait_ufence_abstime(fd, &wait_fence, 7, 0,
 						   timeout, 0);
 		igt_debug("wait type: ABSTIME - timeout: %" PRId64
-- 
2.43.0

