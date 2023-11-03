Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F92210EA34
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Nov 2023 14:45:16 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  3 Nov 2023 14:43:54 +0000
Message-Id: <20231103144359.7-60-francois.dugast@intel.com>
In-Reply-To: <20231103144359.7-1-francois.dugast@intel.com>
References: <20231103144359.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 59/64] drm-uapi/xe: Remove bogus engine list
 from the wait_user_fence IOCTL
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Rodrigo Vivi <rodrigo.vivi@intel.com>

Aligns with kernel commit ("drm/xe/uapi: Remove bogus engine list from the wait_user_fence IOCTL")

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 include/drm-uapi/xe_drm.h          | 17 ++---------------
 lib/xe/xe_ioctl.c                  |  9 +--------
 lib/xe/xe_ioctl.h                  |  2 --
 tests/intel/xe_evict.c             |  4 ++--
 tests/intel/xe_exec_balancer.c     | 12 ++++++------
 tests/intel/xe_exec_compute_mode.c | 12 ++++++------
 tests/intel/xe_exec_fault_mode.c   | 14 +++++++-------
 tests/intel/xe_exec_reset.c        |  6 +++---
 tests/intel/xe_exec_threads.c      | 12 ++++++------
 tests/intel/xe_waitfence.c         |  4 ++--
 10 files changed, 35 insertions(+), 57 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 6eee35d99..6acb39c7b 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -1278,8 +1278,7 @@ struct drm_xe_wait_user_fence {
 	/** @op: wait operation (type of comparison) */
 	__u16 op;
 
-#define DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP	(1 << 0)	/* e.g. Wait on VM bind */
-#define DRM_XE_UFENCE_WAIT_FLAG_ABSTIME	(1 << 1)
+#define DRM_XE_UFENCE_WAIT_FLAG_ABSTIME	(1 << 0)
 	/** @flags: wait flags */
 	__u16 flags;
 
@@ -1312,20 +1311,8 @@ struct drm_xe_wait_user_fence {
 	 */
 	__s64 timeout;
 
-	/**
-	 * @num_engines: number of engine instances to wait on, must be zero
-	 * when DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP set
-	 */
-	__u64 num_engines;
-
-	/**
-	 * @instances: user pointer to array of drm_xe_engine_class_instance to
-	 * wait on, must be NULL when DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP set
-	 */
-	__u64 instances;
-
 	/** @reserved: Reserved */
-	__u64 reserved[2];
+	__u64 reserved[4];
 };
 
 /**
diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index a8b18021e..0426d4851 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -417,18 +417,14 @@ void xe_exec_wait(int fd, uint32_t exec_queue, uint64_t addr)
 }
 
 int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
-		       struct drm_xe_engine_class_instance *eci,
 		       int64_t timeout)
 {
 	struct drm_xe_wait_user_fence wait = {
 		.addr = to_user_pointer(addr),
 		.op = DRM_XE_UFENCE_WAIT_OP_EQ,
-		.flags = !eci ? DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP : 0,
 		.value = value,
 		.mask = DRM_XE_UFENCE_WAIT_MASK_U64,
 		.timeout = timeout,
-		.num_engines = eci ? 1 :0,
-		.instances = eci ? to_user_pointer(eci) : 0,
 	};
 
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait), 0);
@@ -449,18 +445,15 @@ int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
  * Returns elapsed time in nanoseconds if user fence was signalled.
  */
 int64_t xe_wait_ufence_abstime(int fd, uint64_t *addr, uint64_t value,
-			       struct drm_xe_engine_class_instance *eci,
 			       int64_t timeout)
 {
 	struct drm_xe_wait_user_fence wait = {
 		.addr = to_user_pointer(addr),
 		.op = DRM_XE_UFENCE_WAIT_OP_EQ,
-		.flags = !eci ? DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP | DRM_XE_UFENCE_WAIT_FLAG_ABSTIME : 0,
+		.flags = DRM_XE_UFENCE_WAIT_FLAG_ABSTIME,
 		.value = value,
 		.mask = DRM_XE_UFENCE_WAIT_MASK_U64,
 		.timeout = timeout,
-		.num_engines = eci ? 1 : 0,
-		.instances = eci ? to_user_pointer(eci) : 0,
 	};
 	struct timespec ts;
 
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index bc609442a..7aa33664b 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -84,10 +84,8 @@ void xe_exec_sync(int fd, uint32_t exec_queue, uint64_t addr,
 		  struct drm_xe_sync *sync, uint32_t num_syncs);
 void xe_exec_wait(int fd, uint32_t exec_queue, uint64_t addr);
 int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
-		       struct drm_xe_engine_class_instance *eci,
 		       int64_t timeout);
 int64_t xe_wait_ufence_abstime(int fd, uint64_t *addr, uint64_t value,
-			       struct drm_xe_engine_class_instance *eci,
 			       int64_t timeout);
 void xe_force_gt_reset(int fd, int gt);
 
diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
index 7f7eba52f..3d06570bf 100644
--- a/tests/intel/xe_evict.c
+++ b/tests/intel/xe_evict.c
@@ -320,7 +320,7 @@ test_evict_cm(int fd, struct drm_xe_query_engine_info *engine,
 			}
 #define TWENTY_SEC	MS_TO_NS(20000)
 			xe_wait_ufence(fd, &data[i].vm_sync, USER_FENCE_VALUE,
-				       NULL, TWENTY_SEC);
+				       TWENTY_SEC);
 		}
 		sync[0].addr = addr + (char *)&data[i].exec_sync -
 			(char *)data;
@@ -355,7 +355,7 @@ test_evict_cm(int fd, struct drm_xe_query_engine_info *engine,
 		data = xe_bo_map(fd, __bo,
 				 ALIGN(sizeof(*data) * n_execs, 0x1000));
 		xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
-			       NULL, TWENTY_SEC);
+			       TWENTY_SEC);
 		igt_assert_eq(data[i].data, 0xc0ffee);
 	}
 	munmap(data, ALIGN(sizeof(*data) * n_execs, 0x1000));
diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
index 00e2949af..fe806677d 100644
--- a/tests/intel/xe_exec_balancer.c
+++ b/tests/intel/xe_exec_balancer.c
@@ -515,7 +515,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 					 bo_size, sync, 1);
 
 #define ONE_SEC	MS_TO_NS(1000)
-	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL, ONE_SEC);
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, ONE_SEC);
 	data[0].vm_sync = 0;
 
 	for (i = 0; i < n_execs; i++) {
@@ -546,7 +546,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 
 		if (flags & REBIND && i + 1 != n_execs) {
 			xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
-				       NULL, ONE_SEC);
+				       ONE_SEC);
 			xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, NULL,
 					   0);
 
@@ -561,7 +561,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 							 addr, bo_size, sync,
 							 1);
 			xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
-				       NULL, ONE_SEC);
+				       ONE_SEC);
 			data[0].vm_sync = 0;
 		}
 
@@ -574,7 +574,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 				 * an invalidate.
 				 */
 				xe_wait_ufence(fd, &data[i].exec_sync,
-					       USER_FENCE_VALUE, NULL, ONE_SEC);
+					       USER_FENCE_VALUE, ONE_SEC);
 				igt_assert_eq(data[i].data, 0xc0ffee);
 			} else if (i * 2 != n_execs) {
 				/*
@@ -603,7 +603,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 
 	j = flags & INVALIDATE && n_execs ? n_execs - 1 : 0;
 	for (i = j; i < n_execs; i++)
-		xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE, NULL,
+		xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
 			       ONE_SEC);
 
 	/* Wait for all execs to complete */
@@ -612,7 +612,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 
 	sync[0].addr = to_user_pointer(&data[0].vm_sync);
 	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
-	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL, ONE_SEC);
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, ONE_SEC);
 
 	for (i = (flags & INVALIDATE && n_execs) ? n_execs - 1 : 0;
 	     i < n_execs; i++)
diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
index fe4bf4522..4928b47f6 100644
--- a/tests/intel/xe_exec_compute_mode.c
+++ b/tests/intel/xe_exec_compute_mode.c
@@ -171,7 +171,7 @@ test_exec(int fd, struct drm_xe_query_engine_info *engine,
 
 	fence_timeout = igt_run_in_simulation() ? HUNDRED_SEC : ONE_SEC;
 
-	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL,
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
 		       fence_timeout);
 	data[0].vm_sync = 0;
 
@@ -198,7 +198,7 @@ test_exec(int fd, struct drm_xe_query_engine_info *engine,
 
 		if (flags & REBIND && i + 1 != n_execs) {
 			xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
-				       NULL, fence_timeout);
+				       fence_timeout);
 			xe_vm_unbind_async(fd, vm, bind_exec_queues[e], 0,
 					   addr, bo_size, NULL, 0);
 
@@ -214,7 +214,7 @@ test_exec(int fd, struct drm_xe_query_engine_info *engine,
 							 addr, bo_size, sync,
 							 1);
 			xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
-				       NULL, fence_timeout);
+				       fence_timeout);
 			data[0].vm_sync = 0;
 		}
 
@@ -227,7 +227,7 @@ test_exec(int fd, struct drm_xe_query_engine_info *engine,
 				 * an invalidate.
 				 */
 				xe_wait_ufence(fd, &data[i].exec_sync,
-					       USER_FENCE_VALUE, NULL,
+					       USER_FENCE_VALUE,
 					       fence_timeout);
 				igt_assert_eq(data[i].data, 0xc0ffee);
 			} else if (i * 2 != n_execs) {
@@ -257,7 +257,7 @@ test_exec(int fd, struct drm_xe_query_engine_info *engine,
 
 	j = flags & INVALIDATE ? n_execs - 1 : 0;
 	for (i = j; i < n_execs; i++)
-		xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE, NULL,
+		xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
 			       fence_timeout);
 
 	/* Wait for all execs to complete */
@@ -267,7 +267,7 @@ test_exec(int fd, struct drm_xe_query_engine_info *engine,
 	sync[0].addr = to_user_pointer(&data[0].vm_sync);
 	xe_vm_unbind_async(fd, vm, bind_exec_queues[0], 0, addr, bo_size,
 			   sync, 1);
-	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL,
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
 		       fence_timeout);
 
 	for (i = j; i < n_execs; i++)
diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index 1cd3688ac..61d40a0b2 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -195,14 +195,14 @@ test_exec(int fd, struct drm_xe_query_engine_info *engine,
 	}
 
 #define ONE_SEC	MS_TO_NS(1000)
-	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL, ONE_SEC);
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, ONE_SEC);
 	data[0].vm_sync = 0;
 
 	if (flags & PREFETCH) {
 		/* Should move to system memory */
 		xe_vm_prefetch_async(fd, vm, bind_exec_queues[0], 0, addr,
 				     bo_size, sync, 1, 0);
-		xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL,
+		xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
 			       ONE_SEC);
 		data[0].vm_sync = 0;
 	}
@@ -230,7 +230,7 @@ test_exec(int fd, struct drm_xe_query_engine_info *engine,
 
 		if (flags & REBIND && i + 1 != n_execs) {
 			xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
-				       NULL, ONE_SEC);
+				       ONE_SEC);
 			xe_vm_unbind_async(fd, vm, bind_exec_queues[e], 0,
 					   addr, bo_size, NULL, 0);
 
@@ -246,7 +246,7 @@ test_exec(int fd, struct drm_xe_query_engine_info *engine,
 							 addr, bo_size, sync,
 							 1);
 			xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
-				       NULL, ONE_SEC);
+				       ONE_SEC);
 			data[0].vm_sync = 0;
 		}
 
@@ -259,7 +259,7 @@ test_exec(int fd, struct drm_xe_query_engine_info *engine,
 				 * an invalidate.
 				 */
 				xe_wait_ufence(fd, &data[i].exec_sync,
-					       USER_FENCE_VALUE, NULL, ONE_SEC);
+					       USER_FENCE_VALUE, ONE_SEC);
 				igt_assert_eq(data[i].data, 0xc0ffee);
 			} else if (i * 2 != n_execs) {
 				/*
@@ -290,13 +290,13 @@ test_exec(int fd, struct drm_xe_query_engine_info *engine,
 		j = flags & INVALIDATE ? n_execs - 1 : 0;
 		for (i = j; i < n_execs; i++)
 			xe_wait_ufence(fd, &data[i].exec_sync,
-				       USER_FENCE_VALUE, NULL, ONE_SEC);
+				       USER_FENCE_VALUE, ONE_SEC);
 	}
 
 	sync[0].addr = to_user_pointer(&data[0].vm_sync);
 	xe_vm_unbind_async(fd, vm, bind_exec_queues[0], 0, addr, bo_size,
 			   sync, 1);
-	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL, ONE_SEC);
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, ONE_SEC);
 
 	if (!(flags & INVALID_FAULT)) {
 		for (i = j; i < n_execs; i++)
diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index fc90d965c..05ce4cdf2 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -580,7 +580,7 @@ test_compute_mode(int fd, struct drm_xe_query_engine_info *engine,
 	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
 
 #define THREE_SEC	MS_TO_NS(3000)
-	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL, THREE_SEC);
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, THREE_SEC);
 	data[0].vm_sync = 0;
 
 	for (i = 0; i < n_execs; i++) {
@@ -634,11 +634,11 @@ test_compute_mode(int fd, struct drm_xe_query_engine_info *engine,
 
 	for (i = 1; i < n_execs; i++)
 		xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
-			       NULL, THREE_SEC);
+			       THREE_SEC);
 
 	sync[0].addr = to_user_pointer(&data[0].vm_sync);
 	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
-	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL, THREE_SEC);
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, THREE_SEC);
 
 	for (i = 1; i < n_execs; i++)
 		igt_assert_eq(data[i].data, 0xc0ffee);
diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index df87fab2b..a0b0c96ea 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -343,7 +343,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 
 	fence_timeout = igt_run_in_simulation() ? THIRTY_SEC : THREE_SEC;
 
-	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL, fence_timeout);
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, fence_timeout);
 	data[0].vm_sync = 0;
 
 	for (i = 0; i < n_execs; i++) {
@@ -371,7 +371,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 			for (j = i - 0x20; j <= i; ++j)
 				xe_wait_ufence(fd, &data[j].exec_sync,
 					       USER_FENCE_VALUE,
-					       NULL, fence_timeout);
+					       fence_timeout);
 			xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size,
 					   NULL, 0);
 
@@ -386,7 +386,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 							 addr, bo_size, sync,
 							 1);
 			xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
-				       NULL, fence_timeout);
+				       fence_timeout);
 			data[0].vm_sync = 0;
 		}
 
@@ -401,7 +401,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 				for (j = i == 0x20 ? 0 : i - 0x1f; j <= i; ++j)
 					xe_wait_ufence(fd, &data[j].exec_sync,
 						       USER_FENCE_VALUE,
-						       NULL, fence_timeout);
+						       fence_timeout);
 				igt_assert_eq(data[i].data, 0xc0ffee);
 			} else if (i * 2 != n_execs) {
 				/*
@@ -433,7 +433,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 	j = flags & INVALIDATE ?
 		(flags & RACE ? n_execs / 2 + 1 : n_execs - 1) : 0;
 	for (i = j; i < n_execs; i++)
-		xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE, NULL,
+		xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
 			       fence_timeout);
 
 	/* Wait for all execs to complete */
@@ -442,7 +442,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 
 	sync[0].addr = to_user_pointer(&data[0].vm_sync);
 	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
-	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL, fence_timeout);
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, fence_timeout);
 
 	for (i = j; i < n_execs; i++)
 		igt_assert_eq(data[i].data, 0xc0ffee);
diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
index 0835a1ff1..1ee365c56 100644
--- a/tests/intel/xe_waitfence.c
+++ b/tests/intel/xe_waitfence.c
@@ -80,7 +80,7 @@ waitfence(int fd, enum waittype wt)
 	do_bind(fd, vm, bo_7, 0, 0xeffff0000, 0x10000, 7);
 
 	if (wt == RELTIME) {
-		timeout = xe_wait_ufence(fd, &wait_fence, 7, NULL, MS_TO_NS(10));
+		timeout = xe_wait_ufence(fd, &wait_fence, 7, MS_TO_NS(10));
 		igt_debug("wait type: RELTIME - timeout: %ld, timeout left: %ld\n",
 			  MS_TO_NS(10), timeout);
 	} else {
@@ -90,7 +90,7 @@ waitfence(int fd, enum waittype wt)
 		clock_gettime(CLOCK_MONOTONIC, &ts);
 		current = ts.tv_sec * 1e9 + ts.tv_nsec;
 		timeout = current + MS_TO_NS(10);
-		signalled = xe_wait_ufence_abstime(fd, &wait_fence, 7, NULL, timeout);
+		signalled = xe_wait_ufence_abstime(fd, &wait_fence, 7, timeout);
 		igt_debug("wait type: ABSTIME - timeout: %" PRId64
 			  ", signalled: %" PRId64
 			  ", elapsed: %" PRId64 "\n",
-- 
2.34.1
