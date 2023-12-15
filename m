Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ECAA10E1BD
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Dec 2023 15:51:05 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH v1 02/10] drm-uapi/xe: add exec_queue_id member to
 drm_xe_wait_user_fence structure
Date: Fri, 15 Dec 2023 15:50:42 +0000
Message-Id: <20231215155050.7-3-francois.dugast@intel.com>
In-Reply-To: <20231215155050.7-1-francois.dugast@intel.com>
References: <20231215155050.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>

remove the num_engines/instances members from drm_xe_wait_user_fence structure
and add a exec_queue_id member

Right now this is only checking if the engine list is sane and nothing
else. In the end every operation with this IOCTL is a soft check.
So, let's formalize that and only use this IOCTL to wait on the fence.

exec_queue_id member will help to user space to get proper error code
from kernel while in exec_queue reset

v2: Also fix test invalid_flag (Francois Dugast)

v3: Replace -ETIME with -EIO in test_compute_mode (Brian Welty)

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 include/drm-uapi/xe_drm.h          | 17 +++++-----------
 lib/xe/xe_ioctl.c                  | 29 ++++++++++++---------------
 lib/xe/xe_ioctl.h                  | 11 ++++------
 tests/intel/xe_evict.c             |  4 ++--
 tests/intel/xe_exec_balancer.c     | 15 +++++++-------
 tests/intel/xe_exec_compute_mode.c | 18 ++++++++---------
 tests/intel/xe_exec_fault_mode.c   | 21 +++++++++++---------
 tests/intel/xe_exec_reset.c        | 10 +++++-----
 tests/intel/xe_exec_threads.c      | 15 +++++++-------
 tests/intel/xe_waitfence.c         | 32 ++++++++++++++----------------
 10 files changed, 81 insertions(+), 91 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 313e555d2..fd06e4920 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -1031,8 +1031,7 @@ struct drm_xe_wait_user_fence {
 	/** @op: wait operation (type of comparison) */
 	__u16 op;
 
-#define DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP	(1 << 0)	/* e.g. Wait on VM bind */
-#define DRM_XE_UFENCE_WAIT_FLAG_ABSTIME	(1 << 1)
+#define DRM_XE_UFENCE_WAIT_FLAG_ABSTIME	(1 << 0)
 	/** @flags: wait flags */
 	__u16 flags;
 
@@ -1065,17 +1064,11 @@ struct drm_xe_wait_user_fence {
 	 */
 	__s64 timeout;
 
-	/**
-	 * @num_engines: number of engine instances to wait on, must be zero
-	 * when DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP set
-	 */
-	__u64 num_engines;
+	/** @exec_queue_id: exec_queue_id returned from xe_exec_queue_create_ioctl */
+	__u32 exec_queue_id;
 
-	/**
-	 * @instances: user pointer to array of drm_xe_engine_class_instance to
-	 * wait on, must be NULL when DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP set
-	 */
-	__u64 instances;
+	/** @pad2: MBZ */
+	__u32 pad2;
 
 	/** @reserved: Reserved */
 	__u64 reserved[2];
diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index cdad3d7e2..8f466318d 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -481,7 +481,7 @@ void xe_exec_wait(int fd, uint32_t exec_queue, uint64_t addr)
  * @fd: xe device fd
  * @addr: address of value to compare
  * @value: expected value (equal) in @address
- * @eci: engine class instance
+ * @exec_queue: exec_queue id
  * @timeout: pointer to time to wait in nanoseconds
  *
  * Function compares @value with memory pointed by @addr until they are equal.
@@ -490,17 +490,15 @@ void xe_exec_wait(int fd, uint32_t exec_queue, uint64_t addr)
  * signalled. Returns 0 on success, -errno of ioctl on error.
  */
 int __xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
-		     struct drm_xe_engine_class_instance *eci,
-		     int64_t *timeout)
+		     uint32_t exec_queue, int64_t *timeout)
 {
 	struct drm_xe_wait_user_fence wait = {
 		.addr = to_user_pointer(addr),
 		.op = DRM_XE_UFENCE_WAIT_OP_EQ,
-		.flags = !eci ? DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP : 0,
+		.flags = 0,
 		.value = value,
 		.mask = DRM_XE_UFENCE_WAIT_MASK_U64,
-		.num_engines = eci ? 1 :0,
-		.instances = eci ? to_user_pointer(eci) : 0,
+		.exec_queue_id = exec_queue,
 	};
 
 	igt_assert(timeout);
@@ -518,7 +516,7 @@ int __xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
  * @fd: xe device fd
  * @addr: address of value to compare
  * @value: expected value (equal) in @address
- * @eci: engine class instance
+ * @exec_queue: exec_queue id
  * @timeout: time to wait in nanoseconds
  *
  * Function compares @value with memory pointed by @addr until they are equal.
@@ -527,10 +525,9 @@ int __xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
  * Returns elapsed time in nanoseconds if user fence was signalled.
  */
 int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
-		       struct drm_xe_engine_class_instance *eci,
-		       int64_t timeout)
+		       uint32_t exec_queue, int64_t timeout)
 {
-	igt_assert_eq(__xe_wait_ufence(fd, addr, value, eci, &timeout), 0);
+	igt_assert_eq(__xe_wait_ufence(fd, addr, value, exec_queue, &timeout), 0);
 	return timeout;
 }
 
@@ -539,8 +536,9 @@ int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
  * @fd: xe device fd
  * @addr: address of value to compare
  * @value: expected value (equal) in @address
- * @eci: engine class instance
+ * @exec_queue: exec_queue id
  * @timeout: absolute time when wait expire
+ * @flag: wait flag
  *
  * Function compares @value with memory pointed by @addr until they are equal.
  * Asserts that ioctl returned without error.
@@ -548,18 +546,17 @@ int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
  * Returns elapsed time in nanoseconds if user fence was signalled.
  */
 int64_t xe_wait_ufence_abstime(int fd, uint64_t *addr, uint64_t value,
-			       struct drm_xe_engine_class_instance *eci,
-			       int64_t timeout)
+			       uint32_t exec_queue, int64_t timeout,
+			       uint16_t flag)
 {
 	struct drm_xe_wait_user_fence wait = {
 		.addr = to_user_pointer(addr),
 		.op = DRM_XE_UFENCE_WAIT_OP_EQ,
-		.flags = !eci ? DRM_XE_UFENCE_WAIT_FLAG_SOFT_OP | DRM_XE_UFENCE_WAIT_FLAG_ABSTIME : 0,
+		.flags = flag,
 		.value = value,
 		.mask = DRM_XE_UFENCE_WAIT_MASK_U64,
 		.timeout = timeout,
-		.num_engines = eci ? 1 : 0,
-		.instances = eci ? to_user_pointer(eci) : 0,
+		.exec_queue_id = exec_queue,
 	};
 	struct timespec ts;
 
diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
index c8d46fb29..05480e40b 100644
--- a/lib/xe/xe_ioctl.h
+++ b/lib/xe/xe_ioctl.h
@@ -92,14 +92,11 @@ void xe_exec_sync(int fd, uint32_t exec_queue, uint64_t addr,
 		  struct drm_xe_sync *sync, uint32_t num_syncs);
 void xe_exec_wait(int fd, uint32_t exec_queue, uint64_t addr);
 int __xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
-		     struct drm_xe_engine_class_instance *eci,
-		     int64_t *timeout);
+		     uint32_t exec_queue, int64_t *timeout);
 int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
-		       struct drm_xe_engine_class_instance *eci,
-		       int64_t timeout);
-int64_t xe_wait_ufence_abstime(int fd, uint64_t *addr, uint64_t value,
-			       struct drm_xe_engine_class_instance *eci,
-			       int64_t timeout);
+		       uint32_t exec_queue, int64_t timeout);
+int64_t xe_wait_ufence_abstime(int fd, uint64_t *addr, uint64_t value, uint32_t
+			       exec_queue, int64_t timeout, uint16_t flag);
 void xe_force_gt_reset(int fd, int gt);
 
 #endif /* XE_IOCTL_H */
diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
index 89dc46fae..0ac83a3f7 100644
--- a/tests/intel/xe_evict.c
+++ b/tests/intel/xe_evict.c
@@ -317,7 +317,7 @@ test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
 			}
 #define TWENTY_SEC	MS_TO_NS(20000)
 			xe_wait_ufence(fd, &data[i].vm_sync, USER_FENCE_VALUE,
-				       NULL, TWENTY_SEC);
+				       bind_exec_queues[0], TWENTY_SEC);
 		}
 		sync[0].addr = addr + (char *)&data[i].exec_sync -
 			(char *)data;
@@ -352,7 +352,7 @@ test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
 		data = xe_bo_map(fd, __bo,
 				 ALIGN(sizeof(*data) * n_execs, 0x1000));
 		xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
-			       NULL, TWENTY_SEC);
+			       exec_queues[i % n_exec_queues], TWENTY_SEC);
 		igt_assert_eq(data[i].data, 0xc0ffee);
 	}
 	munmap(data, ALIGN(sizeof(*data) * n_execs, 0x1000));
diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
index 79ff65e89..5dded3ce4 100644
--- a/tests/intel/xe_exec_balancer.c
+++ b/tests/intel/xe_exec_balancer.c
@@ -483,7 +483,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 					 bo_size, sync, 1);
 
 #define ONE_SEC	MS_TO_NS(1000)
-	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL, ONE_SEC);
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, ONE_SEC);
 	data[0].vm_sync = 0;
 
 	for (i = 0; i < n_execs; i++) {
@@ -514,7 +514,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 
 		if (flags & REBIND && i + 1 != n_execs) {
 			xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
-				       NULL, ONE_SEC);
+				       exec_queues[e], ONE_SEC);
 			xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, NULL,
 					   0);
 
@@ -529,7 +529,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 							 addr, bo_size, sync,
 							 1);
 			xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
-				       NULL, ONE_SEC);
+				       0, ONE_SEC);
 			data[0].vm_sync = 0;
 		}
 
@@ -542,7 +542,8 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 				 * an invalidate.
 				 */
 				xe_wait_ufence(fd, &data[i].exec_sync,
-					       USER_FENCE_VALUE, NULL, ONE_SEC);
+					       USER_FENCE_VALUE, exec_queues[e],
+					       ONE_SEC);
 				igt_assert_eq(data[i].data, 0xc0ffee);
 			} else if (i * 2 != n_execs) {
 				/*
@@ -571,8 +572,8 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 
 	j = flags & INVALIDATE && n_execs ? n_execs - 1 : 0;
 	for (i = j; i < n_execs; i++)
-		xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE, NULL,
-			       ONE_SEC);
+		xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
+			       exec_queues[i % n_exec_queues], ONE_SEC);
 
 	/* Wait for all execs to complete */
 	if (flags & INVALIDATE)
@@ -580,7 +581,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
 
 	sync[0].addr = to_user_pointer(&data[0].vm_sync);
 	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
-	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL, ONE_SEC);
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, ONE_SEC);
 
 	for (i = (flags & INVALIDATE && n_execs) ? n_execs - 1 : 0;
 	     i < n_execs; i++)
diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
index 7d3004d65..6123d2b29 100644
--- a/tests/intel/xe_exec_compute_mode.c
+++ b/tests/intel/xe_exec_compute_mode.c
@@ -171,8 +171,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 
 	fence_timeout = igt_run_in_simulation() ? HUNDRED_SEC : ONE_SEC;
 
-	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL,
-		       fence_timeout);
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
+		       bind_exec_queues[0], fence_timeout);
 	data[0].vm_sync = 0;
 
 	for (i = 0; i < n_execs; i++) {
@@ -198,7 +198,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 
 		if (flags & REBIND && i + 1 != n_execs) {
 			xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
-				       NULL, fence_timeout);
+				       exec_queues[e], fence_timeout);
 			xe_vm_unbind_async(fd, vm, bind_exec_queues[e], 0,
 					   addr, bo_size, NULL, 0);
 
@@ -214,7 +214,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 							 addr, bo_size, sync,
 							 1);
 			xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
-				       NULL, fence_timeout);
+				       bind_exec_queues[e], fence_timeout);
 			data[0].vm_sync = 0;
 		}
 
@@ -227,7 +227,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 				 * an invalidate.
 				 */
 				xe_wait_ufence(fd, &data[i].exec_sync,
-					       USER_FENCE_VALUE, NULL,
+					       USER_FENCE_VALUE, exec_queues[e],
 					       fence_timeout);
 				igt_assert_eq(data[i].data, 0xc0ffee);
 			} else if (i * 2 != n_execs) {
@@ -257,8 +257,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 
 	j = flags & INVALIDATE ? n_execs - 1 : 0;
 	for (i = j; i < n_execs; i++)
-		xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE, NULL,
-			       fence_timeout);
+		xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
+			       exec_queues[i % n_exec_queues], fence_timeout);
 
 	/* Wait for all execs to complete */
 	if (flags & INVALIDATE)
@@ -267,8 +267,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	sync[0].addr = to_user_pointer(&data[0].vm_sync);
 	xe_vm_unbind_async(fd, vm, bind_exec_queues[0], 0, addr, bo_size,
 			   sync, 1);
-	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL,
-		       fence_timeout);
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
+		       bind_exec_queues[0], fence_timeout);
 
 	for (i = j; i < n_execs; i++)
 		igt_assert_eq(data[i].data, 0xc0ffee);
diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index ee7cbb604..3dda33469 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -195,15 +195,16 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	}
 
 #define ONE_SEC	MS_TO_NS(1000)
-	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL, ONE_SEC);
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
+		       bind_exec_queues[0], ONE_SEC);
 	data[0].vm_sync = 0;
 
 	if (flags & PREFETCH) {
 		/* Should move to system memory */
 		xe_vm_prefetch_async(fd, vm, bind_exec_queues[0], 0, addr,
 				     bo_size, sync, 1, 0);
-		xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL,
-			       ONE_SEC);
+		xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
+			       bind_exec_queues[0], ONE_SEC);
 		data[0].vm_sync = 0;
 	}
 
@@ -230,7 +231,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 
 		if (flags & REBIND && i + 1 != n_execs) {
 			xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
-				       NULL, ONE_SEC);
+				       exec_queues[e], ONE_SEC);
 			xe_vm_unbind_async(fd, vm, bind_exec_queues[e], 0,
 					   addr, bo_size, NULL, 0);
 
@@ -246,7 +247,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 							 addr, bo_size, sync,
 							 1);
 			xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
-				       NULL, ONE_SEC);
+				       bind_exec_queues[e], ONE_SEC);
 			data[0].vm_sync = 0;
 		}
 
@@ -259,7 +260,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 				 * an invalidate.
 				 */
 				xe_wait_ufence(fd, &data[i].exec_sync,
-					       USER_FENCE_VALUE, NULL, ONE_SEC);
+					       USER_FENCE_VALUE, exec_queues[e],
+					       ONE_SEC);
 				igt_assert_eq(data[i].data, 0xc0ffee);
 			} else if (i * 2 != n_execs) {
 				/*
@@ -289,14 +291,15 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	if (!(flags & INVALID_FAULT)) {
 		j = flags & INVALIDATE ? n_execs - 1 : 0;
 		for (i = j; i < n_execs; i++)
-			xe_wait_ufence(fd, &data[i].exec_sync,
-				       USER_FENCE_VALUE, NULL, ONE_SEC);
+			xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
+				       exec_queues[i % n_exec_queues], ONE_SEC);
 	}
 
 	sync[0].addr = to_user_pointer(&data[0].vm_sync);
 	xe_vm_unbind_async(fd, vm, bind_exec_queues[0], 0, addr, bo_size,
 			   sync, 1);
-	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL, ONE_SEC);
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
+		       bind_exec_queues[0], ONE_SEC);
 
 	if (!(flags & INVALID_FAULT)) {
 		for (i = j; i < n_execs; i++)
diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 094b34896..9d0c7658b 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -564,7 +564,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
 
 #define THREE_SEC	MS_TO_NS(3000)
-	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL, THREE_SEC);
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, THREE_SEC);
 	data[0].vm_sync = 0;
 
 	for (i = 0; i < n_execs; i++) {
@@ -621,17 +621,17 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 		int err;
 
 		err = __xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
-				       NULL, &timeout);
+				       exec_queues[i % n_exec_queues], &timeout);
 		if (flags & GT_RESET)
-			/* exec races with reset: may timeout or complete */
-			igt_assert(err == -ETIME || !err);
+			/* exec races with reset: may return -EIO or complete */
+			igt_assert(err == -EIO || !err);
 		else
 			igt_assert_eq(err, 0);
 	}
 
 	sync[0].addr = to_user_pointer(&data[0].vm_sync);
 	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
-	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL, THREE_SEC);
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, THREE_SEC);
 
 	if (!(flags & GT_RESET)) {
 		for (i = 1; i < n_execs; i++)
diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index fcb926698..ca2dd421e 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -331,7 +331,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 
 	fence_timeout = igt_run_in_simulation() ? THIRTY_SEC : THREE_SEC;
 
-	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL, fence_timeout);
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, fence_timeout);
 	data[0].vm_sync = 0;
 
 	for (i = 0; i < n_execs; i++) {
@@ -359,7 +359,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 			for (j = i - 0x20; j <= i; ++j)
 				xe_wait_ufence(fd, &data[j].exec_sync,
 					       USER_FENCE_VALUE,
-					       NULL, fence_timeout);
+					       exec_queues[e], fence_timeout);
 			xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size,
 					   NULL, 0);
 
@@ -374,7 +374,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 							 addr, bo_size, sync,
 							 1);
 			xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
-				       NULL, fence_timeout);
+				       0, fence_timeout);
 			data[0].vm_sync = 0;
 		}
 
@@ -389,7 +389,8 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 				for (j = i == 0x20 ? 0 : i - 0x1f; j <= i; ++j)
 					xe_wait_ufence(fd, &data[j].exec_sync,
 						       USER_FENCE_VALUE,
-						       NULL, fence_timeout);
+						       exec_queues[e],
+						       fence_timeout);
 				igt_assert_eq(data[i].data, 0xc0ffee);
 			} else if (i * 2 != n_execs) {
 				/*
@@ -421,8 +422,8 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 	j = flags & INVALIDATE ?
 		(flags & RACE ? n_execs / 2 + 1 : n_execs - 1) : 0;
 	for (i = j; i < n_execs; i++)
-		xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE, NULL,
-			       fence_timeout);
+		xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
+			       exec_queues[i % n_exec_queues], fence_timeout);
 
 	/* Wait for all execs to complete */
 	if (flags & INVALIDATE)
@@ -430,7 +431,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 
 	sync[0].addr = to_user_pointer(&data[0].vm_sync);
 	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
-	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL, fence_timeout);
+	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, fence_timeout);
 
 	for (i = j; i < n_execs; i++)
 		igt_assert_eq(data[i].data, 0xc0ffee);
diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
index 3be987954..d7e2008c5 100644
--- a/tests/intel/xe_waitfence.c
+++ b/tests/intel/xe_waitfence.c
@@ -37,22 +37,20 @@ static void do_bind(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
 }
 
 static int64_t wait_with_eci_abstime(int fd, uint64_t *addr, uint64_t value,
-				     struct drm_xe_engine_class_instance *eci,
-				     int64_t timeout)
+				     uint32_t exec_queue, int64_t timeout,
+				     uint16_t flag)
 {
 	struct drm_xe_wait_user_fence wait = {
 		.addr = to_user_pointer(addr),
 		.op = DRM_XE_UFENCE_WAIT_OP_EQ,
-		.flags = !eci ? 0 : DRM_XE_UFENCE_WAIT_FLAG_ABSTIME,
+		.flags = flag,
 		.value = value,
 		.mask = DRM_XE_UFENCE_WAIT_MASK_U64,
 		.timeout = timeout,
-		.num_engines = eci ? 1 : 0,
-		.instances = eci ? to_user_pointer(eci) : 0,
+		.exec_queue_id = exec_queue,
 	};
 	struct timespec ts;
 
-	igt_assert(eci);
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait), 0);
 	igt_assert_eq(clock_gettime(CLOCK_MONOTONIC, &ts), 0);
 
@@ -82,7 +80,7 @@ enum waittype {
 static void
 waitfence(int fd, enum waittype wt)
 {
-	struct drm_xe_engine *engine = NULL;
+	uint32_t exec_queue;
 	struct timespec ts;
 	int64_t current, signalled;
 	uint32_t bo_1;
@@ -111,15 +109,17 @@ waitfence(int fd, enum waittype wt)
 	do_bind(fd, vm, bo_7, 0, 0xeffff0000, 0x10000, 7);
 
 	if (wt == RELTIME) {
-		timeout = xe_wait_ufence(fd, &wait_fence, 7, NULL, MS_TO_NS(10));
+		timeout = xe_wait_ufence(fd, &wait_fence, 7, 0, MS_TO_NS(10));
 		igt_debug("wait type: RELTIME - timeout: %ld, timeout left: %ld\n",
 			  MS_TO_NS(10), timeout);
 	} else if (wt == ENGINE) {
-		engine = xe_engine(fd, 1);
+		exec_queue = xe_exec_queue_create_class(fd, vm, DRM_XE_ENGINE_CLASS_COPY);
 		clock_gettime(CLOCK_MONOTONIC, &ts);
 		current = ts.tv_sec * 1e9 + ts.tv_nsec;
 		timeout = current + MS_TO_NS(10);
-		signalled = wait_with_eci_abstime(fd, &wait_fence, 7, &engine->instance, timeout);
+		signalled = wait_with_eci_abstime(fd, &wait_fence, 7,
+						  exec_queue, timeout,
+						  DRM_XE_UFENCE_WAIT_FLAG_ABSTIME);
 		igt_debug("wait type: ENGINE ABSTIME - timeout: %" PRId64
 			  ", signalled: %" PRId64
 			  ", elapsed: %" PRId64 "\n",
@@ -128,7 +128,8 @@ waitfence(int fd, enum waittype wt)
 		clock_gettime(CLOCK_MONOTONIC, &ts);
 		current = ts.tv_sec * 1e9 + ts.tv_nsec;
 		timeout = current + MS_TO_NS(10);
-		signalled = xe_wait_ufence_abstime(fd, &wait_fence, 7, NULL, timeout);
+		signalled = xe_wait_ufence_abstime(fd, &wait_fence, 7, 0,
+						   timeout, 0);
 		igt_debug("wait type: ABSTIME - timeout: %" PRId64
 			  ", signalled: %" PRId64
 			  ", elapsed: %" PRId64 "\n",
@@ -166,8 +167,7 @@ invalid_flag(int fd)
 		.value = 1,
 		.mask = DRM_XE_UFENCE_WAIT_MASK_U64,
 		.timeout = -1,
-		.num_engines = 0,
-		.instances = 0,
+		.exec_queue_id = 0,
 	};
 
 	uint32_t vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
@@ -191,8 +191,7 @@ invalid_ops(int fd)
 		.value = 1,
 		.mask = DRM_XE_UFENCE_WAIT_MASK_U64,
 		.timeout = 1,
-		.num_engines = 0,
-		.instances = 0,
+		.exec_queue_id = 0,
 	};
 
 	uint32_t vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
@@ -216,8 +215,7 @@ invalid_engine(int fd)
 		.value = 1,
 		.mask = DRM_XE_UFENCE_WAIT_MASK_U64,
 		.timeout = -1,
-		.num_engines = 1,
-		.instances = 0,
+		.exec_queue_id = 0,
 	};
 
 	uint32_t vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
-- 
2.34.1
