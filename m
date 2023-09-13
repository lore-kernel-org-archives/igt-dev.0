Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A44910E114
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Sep 2023 22:07:05 +0000 (UTC)
Date: Wed, 13 Sep 2023 15:06:57 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <ZQIygadrj9yi0lmh@nvishwa1-DESK>
References: <20230912234954.2110973-1-matthew.brost@intel.com>
 <20230912234954.2110973-3-matthew.brost@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230912234954.2110973-3-matthew.brost@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 2/2] xe: Update uAPI and remove
 XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Sep 12, 2023 at 04:49:54PM -0700, Matthew Brost wrote:
>XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE has been removed from uAPI,
>remove all references in Xe tests.
>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>---
> include/drm-uapi/xe_drm.h          | 27 ++++++++++-----------------
> tests/intel/xe_evict.c             | 14 +++-----------
> tests/intel/xe_exec_balancer.c     |  8 +-------
> tests/intel/xe_exec_compute_mode.c | 20 ++------------------
> tests/intel/xe_exec_reset.c        | 10 ++--------
> tests/intel/xe_exec_threads.c      | 13 ++-----------
> tests/intel/xe_noexec_ping_pong.c  | 10 +---------
> 7 files changed, 21 insertions(+), 81 deletions(-)
>
>diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
>index 804c02270d..8b05573cec 100644
>--- a/include/drm-uapi/xe_drm.h
>+++ b/include/drm-uapi/xe_drm.h
>@@ -3,8 +3,8 @@
>  * Copyright © 2023 Intel Corporation
>  */
>
>-#ifndef _XE_DRM_H_
>-#define _XE_DRM_H_
>+#ifndef _UAPI_XE_DRM_H_
>+#define _UAPI_XE_DRM_H_
>
> #include "drm.h"
>
>@@ -39,7 +39,7 @@ extern "C" {
>  * redefine the interface more easily than an ever growing struct of
>  * increasing complexity, and for large parts of that interface to be
>  * entirely optional. The downside is more pointer chasing; chasing across
>- * the boundary with pointers encapsulated inside u64.
>+ * the __user boundary with pointers encapsulated inside u64.
>  *
>  * Example chaining:
>  *
>@@ -707,21 +707,14 @@ struct drm_xe_exec_queue_set_property {
> 	/** @exec_queue_id: Exec queue ID */
> 	__u32 exec_queue_id;
>
>-#define XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY			0
>+#define XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY		0
> #define XE_EXEC_QUEUE_SET_PROPERTY_TIMESLICE		1
> #define XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT	2
>-	/*
>-	 * Long running or ULLS engine mode. DMA fences not allowed in this
>-	 * mode. Must match the value of DRM_XE_VM_CREATE_COMPUTE_MODE, serves
>-	 * as a sanity check the UMD knows what it is doing. Can only be set at
>-	 * engine create time.
>-	 */
>-#define XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE		3
>-#define XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE		4
>-#define XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT		5
>-#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		6
>-#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		7
>-#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY		8
>+#define XE_EXEC_QUEUE_SET_PROPERTY_PERSISTENCE		3
>+#define XE_EXEC_QUEUE_SET_PROPERTY_JOB_TIMEOUT		4
>+#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		5
>+#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		6
>+#define XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY	7
> 	/** @property: property to set */
> 	__u32 property;
>
>@@ -1057,4 +1050,4 @@ struct drm_xe_vm_madvise {
> }
> #endif
>
>-#endif /* _XE_DRM_H_ */
>+#endif /* _UAPI_XE_DRM_H_ */
>diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c
>index 5b64e56b45..5d8981f8da 100644
>--- a/tests/intel/xe_evict.c
>+++ b/tests/intel/xe_evict.c
>@@ -252,19 +252,11 @@ test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
> 	}
>
> 	for (i = 0; i < n_exec_queues; i++) {
>-		struct drm_xe_ext_exec_queue_set_property ext = {
>-			.base.next_extension = 0,
>-			.base.name = XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>-			.property = XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE,
>-			.value = 1,
>-		};
>-
> 		if (flags & MULTI_VM)
>-			exec_queues[i] = xe_exec_queue_create(fd, i & 1 ? vm2 : vm, eci,
>-						      to_user_pointer(&ext));
>+			exec_queues[i] = xe_exec_queue_create(fd, i & 1 ? vm2 :
>+							      vm, eci, 0);
> 		else
>-			exec_queues[i] = xe_exec_queue_create(fd, vm, eci,
>-						      to_user_pointer(&ext));
>+			exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
> 	}
>
> 	for (i = 0; i < n_execs; i++) {
>diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
>index 3fb535988c..85545d4925 100644
>--- a/tests/intel/xe_exec_balancer.c
>+++ b/tests/intel/xe_exec_balancer.c
>@@ -453,18 +453,12 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
> 	memset(data, 0, bo_size);
>
> 	for (i = 0; i < n_exec_queues; i++) {
>-		struct drm_xe_ext_exec_queue_set_property ext = {
>-			.base.next_extension = 0,
>-			.base.name = XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>-			.property = XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE,
>-			.value = 1,
>-		};
> 		struct drm_xe_exec_queue_create create = {
> 			.vm_id = vm,
> 			.width = 1,
> 			.num_placements = num_placements,
> 			.instances = to_user_pointer(eci),
>-			.extensions = to_user_pointer(&ext),
>+			.extensions = 0,
> 		};
>
> 		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE,
>diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
>index 6d10847270..02e7ef201c 100644
>--- a/tests/intel/xe_exec_compute_mode.c
>+++ b/tests/intel/xe_exec_compute_mode.c
>@@ -120,15 +120,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
> 			xe_get_default_alignment(fd));
>
> 	for (i = 0; (flags & EXEC_QUEUE_EARLY) && i < n_exec_queues; i++) {
>-		struct drm_xe_ext_exec_queue_set_property ext = {
>-			.base.next_extension = 0,
>-			.base.name = XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>-			.property = XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE,
>-			.value = 1,
>-		};
>-
>-		exec_queues[i] = xe_exec_queue_create(fd, vm, eci,
>-					      to_user_pointer(&ext));
>+		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
> 		if (flags & BIND_EXECQUEUE)
> 			bind_exec_queues[i] =
> 				xe_bind_exec_queue_create(fd, vm, 0);
>@@ -156,15 +148,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
> 	memset(data, 0, bo_size);
>
> 	for (i = 0; !(flags & EXEC_QUEUE_EARLY) && i < n_exec_queues; i++) {
>-		struct drm_xe_ext_exec_queue_set_property ext = {
>-			.base.next_extension = 0,
>-			.base.name = XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>-			.property = XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE,
>-			.value = 1,
>-		};
>-
>-		exec_queues[i] = xe_exec_queue_create(fd, vm, eci,
>-					      to_user_pointer(&ext));
>+		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
> 		if (flags & BIND_EXECQUEUE)
> 			bind_exec_queues[i] =
> 				xe_bind_exec_queue_create(fd, vm, 0);
>diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
>index f12af4d921..7b4921cd49 100644
>--- a/tests/intel/xe_exec_reset.c
>+++ b/tests/intel/xe_exec_reset.c
>@@ -536,14 +536,8 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
> 	memset(data, 0, bo_size);
>
> 	for (i = 0; i < n_exec_queues; i++) {
>-		struct drm_xe_ext_exec_queue_set_property compute = {
>-			.base.next_extension = 0,
>-			.base.name = XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>-			.property = XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE,
>-			.value = 1,
>-		};
> 		struct drm_xe_ext_exec_queue_set_property preempt_timeout = {
>-			.base.next_extension = to_user_pointer(&compute),
>+			.base.next_extension = 0,
> 			.base.name = XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
> 			.property = XE_EXEC_QUEUE_SET_PROPERTY_PREEMPTION_TIMEOUT,
> 			.value = 1000,
>@@ -553,7 +547,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
> 		if (flags & EXEC_QUEUE_RESET)
> 			ext = to_user_pointer(&preempt_timeout);
> 		else
>-			ext = to_user_pointer(&compute);
>+			ext = 0;
>

The 'else' clause is not required here as 'ext' is initialized to 0.
Other than that,

Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

> 		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, ext);
> 	};
>diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
>index 34bcb3d4d5..4bcc81f90c 100644
>--- a/tests/intel/xe_exec_threads.c
>+++ b/tests/intel/xe_exec_threads.c
>@@ -313,17 +313,8 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
> 	}
> 	memset(data, 0, bo_size);
>
>-	for (i = 0; i < n_exec_queues; i++) {
>-		struct drm_xe_ext_exec_queue_set_property ext = {
>-			.base.next_extension = 0,
>-			.base.name = XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>-			.property = XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE,
>-			.value = 1,
>-		};
>-
>-		exec_queues[i] = xe_exec_queue_create(fd, vm, eci,
>-					      to_user_pointer(&ext));
>-	};
>+	for (i = 0; i < n_exec_queues; i++)
>+		exec_queues[i] = xe_exec_queue_create(fd, vm, eci, 0);
>
> 	pthread_barrier_wait(&barrier);
>
>diff --git a/tests/intel/xe_noexec_ping_pong.c b/tests/intel/xe_noexec_ping_pong.c
>index 3f486adf97..88b22ed11c 100644
>--- a/tests/intel/xe_noexec_ping_pong.c
>+++ b/tests/intel/xe_noexec_ping_pong.c
>@@ -64,13 +64,6 @@ static void test_ping_pong(int fd, struct drm_xe_engine_class_instance *eci)
> 	 * stats.
> 	 */
> 	for (i = 0; i < NUM_VMS; ++i) {
>-		struct drm_xe_ext_exec_queue_set_property ext = {
>-			.base.next_extension = 0,
>-			.base.name = XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>-			.property = XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE,
>-			.value = 1,
>-		};
>-
> 		vm[i] = xe_vm_create(fd, DRM_XE_VM_CREATE_COMPUTE_MODE, 0);
> 		for (j = 0; j < NUM_BOS; ++j) {
> 			igt_debug("Creating bo size %lu for vm %u\n",
>@@ -82,8 +75,7 @@ static void test_ping_pong(int fd, struct drm_xe_engine_class_instance *eci)
> 			xe_vm_bind(fd, vm[i], bo[i][j], 0, 0x40000 + j*bo_size,
> 				   bo_size, NULL, 0);
> 		}
>-		exec_queues[i] = xe_exec_queue_create(fd, vm[i], eci,
>-					      to_user_pointer(&ext));
>+		exec_queues[i] = xe_exec_queue_create(fd, vm[i], eci, 0);
> 	}
>
> 	igt_info("Now sleeping for %ds.\n", SECONDS_TO_WAIT);
>-- 
>2.34.1
>
