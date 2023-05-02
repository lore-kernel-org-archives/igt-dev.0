Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE92B10E326
 for <igt-dev@lists.freedesktop.org>; Tue,  2 May 2023 06:55:35 +0000 (UTC)
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  1 May 2023 23:55:35 -0700
Message-Id: <20230502065536.3223489-7-matthew.brost@intel.com>
In-Reply-To: <20230502065536.3223489-1-matthew.brost@intel.com>
References: <20230502065536.3223489-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 6/7] xe_exec_compute_mode: All dma-fences as
 in-syncs to compute execs
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

We allow this behavior now, lets test it.

Signed-of-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/xe/xe_exec_compute_mode.c | 159 ++++++++++++++++++++++++++++----
 1 file changed, 141 insertions(+), 18 deletions(-)

diff --git a/tests/xe/xe_exec_compute_mode.c b/tests/xe/xe_exec_compute_mode.c
index 750815764..750e65b5d 100644
--- a/tests/xe/xe_exec_compute_mode.c
+++ b/tests/xe/xe_exec_compute_mode.c
@@ -30,6 +30,7 @@
 #define BIND_ENGINE	(0x1 << 4)
 #define VM_FOR_BO	(0x1 << 5)
 #define ENGINE_EARLY	(0x1 << 6)
+#define DMA_FENCES_FOR_BINDS	(0x1 << 7)
 
 /**
  * SUBTEST: twice-%s
@@ -61,6 +62,32 @@
  * @bindengine-userptr-rebind:		bindengine userptr rebind
  * @bindengine-userptr-invalidate:	bindengine userptr invalidate
  * @bindengine-userptr-invalidate-race:	bindengine-userptr invalidate race
+ * @basic-dma-fences:
+ *	basic dma fences
+ * @preempt-fence-early-dma-fences:
+ *	preempt fence early dma fences
+ * @userptr-dma-fences:
+ *	userptr dma fences
+ * @rebind-dma-fences:
+ *	rebind dma fences
+ * @userptr-rebind-dma-fences:
+ *	userptr rebind dma fences
+ * @userptr-invalidate-dma-fences:
+ *	userptr invalidate dma fences
+ * @userptr-invalidate-race-dma-fences:
+ *	userptr invalidate race dma fences
+ * @bindengine-dma-fences:
+ *	bindengine dma fences
+ * @bindengine-userptr-dma-fences:
+ *	bindengine userptr dma fences
+ * @bindengine-rebind-dma-fences:
+ *	bindengine rebind dma fences
+ * @bindengine-userptr-rebind-dma-fences:
+ *	bindengine userptr rebind dma fences
+ * @bindengine-userptr-invalidate-dma-fences:
+ *	bindengine userptr invalidate dma fences
+ * @bindengine-userptr-invalidate-race-dma-fences:
+ *	bindengine-userptr invalidate race dma fences
  */
 
 /**
@@ -83,6 +110,28 @@
  * @bindengine-rebind:			bindengine rebind
  * @bindengine-userptr-rebind:		bindengine userptr rebind
  * @bindengine-userptr-invalidate:	bindengine userptr invalidate
+ * @basic-dma-fences:
+ *	basic dma fences
+ * @preempt-fence-early-dma-fences:
+ *	preempt fence early dma fences
+ * @userptr-dma-fences:
+ *	userptr dma fences
+ * @rebind-dma-fences:
+ *	rebind dma fences
+ * @userptr-rebind-dma-fences:
+ *	userptr rebind dma fences
+ * @userptr-invalidate-dma-fences:
+ *	userptr invalidate dma fences
+ * @bindengine-dma-fences:
+ *	bindengine dma fences
+ * @bindengine-userptr-dma-fences:
+ *	bindengine userptr dma fences
+ * @bindengine-rebind-dma-fences:
+ *	bindengine rebind dma fences
+ * @bindengine-userptr-rebind-dma-fences:
+ *	bindengine userptr rebind dma fences
+ * @bindengine-userptr-invalidate-dma-fences:
+ *	bindengine userptr invalidate dma fences
  */
 static void
 test_exec(int fd, struct drm_xe_engine_class_instance *eci,
@@ -91,14 +140,21 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	uint32_t vm;
 	uint64_t addr = 0x1a0000;
 #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
+	bool dma_fences = flags & DMA_FENCES_FOR_BINDS;
 	struct drm_xe_sync sync[1] = {
 		{ .flags = DRM_XE_SYNC_USER_FENCE | DRM_XE_SYNC_SIGNAL,
 	          .timeline_value = USER_FENCE_VALUE },
 	};
+	struct drm_xe_sync dma_sync[2] = {
+		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
+		{ .flags = DRM_XE_SYNC_USER_FENCE | DRM_XE_SYNC_SIGNAL,
+	          .timeline_value = USER_FENCE_VALUE },
+	};
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
-		.num_syncs = 1,
-		.syncs = to_user_pointer(sync),
+		.num_syncs = dma_fences ? 2 : 1,
+		.syncs = dma_fences ? to_user_pointer(dma_sync) :
+			to_user_pointer(sync),
 	};
 	uint32_t engines[MAX_N_ENGINES];
 	uint32_t bind_engines[MAX_N_ENGINES];
@@ -113,6 +169,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	} *data;
 	int i, j, b;
 	int map_fd = -1;
+	uint32_t syncobj;
 
 	igt_assert(n_engines <= MAX_N_ENGINES);
 
@@ -175,17 +232,29 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 			bind_engines[i] = 0;
 	};
 
-	sync[0].addr = to_user_pointer(&data[0].vm_sync);
+	if (dma_fences) {
+		syncobj = syncobj_create(fd, 0);
+		dma_sync[0].handle = syncobj;
+	} else {
+		sync[0].addr = to_user_pointer(&data[0].vm_sync);
+	}
+
 	if (bo)
 		xe_vm_bind_async(fd, vm, bind_engines[0], bo, 0, addr,
-				 bo_size, sync, 1);
+				 bo_size, dma_fences ? dma_sync : sync, 1);
 	else
 		xe_vm_bind_userptr_async(fd, vm, bind_engines[0],
 					 to_user_pointer(data), addr,
-					 bo_size, sync, 1);
+					 bo_size, dma_fences ? dma_sync : sync,
+					 1);
 #define ONE_SEC	1000
-	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL, ONE_SEC);
-	data[0].vm_sync = 0;
+	if (!dma_fences) {
+		xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL,
+			       ONE_SEC);
+		data[0].vm_sync = 0;
+	} else {
+		dma_sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
+	}
 
 	for (i = 0; i < n_execs; i++) {
 		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
@@ -202,7 +271,12 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		data[i].batch[b++] = MI_BATCH_BUFFER_END;
 		igt_assert(b <= ARRAY_SIZE(data[i].batch));
 
-		sync[0].addr = addr + (char *)&data[i].exec_sync - (char *)data;
+		if (dma_fences)
+			dma_sync[1].addr = addr +
+				(char *)&data[i].exec_sync - (char *)data;
+		else
+			sync[0].addr = addr +
+				(char *)&data[i].exec_sync - (char *)data;
 
 		exec.engine_id = engines[e];
 		exec.address = batch_addr;
@@ -214,20 +288,31 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 			xe_vm_unbind_async(fd, vm, bind_engines[e], 0,
 					   addr, bo_size, NULL, 0);
 
-			sync[0].addr = to_user_pointer(&data[0].vm_sync);
+			if (dma_fences)
+				dma_sync[0].flags |= DRM_XE_SYNC_SIGNAL;
+			else
+				sync[0].addr =
+					to_user_pointer(&data[0].vm_sync);
 			addr += bo_size;
 			if (bo)
 				xe_vm_bind_async(fd, vm, bind_engines[e], bo,
-						 0, addr, bo_size, sync, 1);
+						 0, addr, bo_size,
+						 dma_fences ? dma_sync : sync,
+						 1);
 			else
 				xe_vm_bind_userptr_async(fd, vm,
 							 bind_engines[e],
 							 to_user_pointer(data),
-							 addr, bo_size, sync,
-							 1);
-			xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE,
-				       NULL, ONE_SEC);
-			data[0].vm_sync = 0;
+							 addr, bo_size,
+							 dma_fences ? dma_sync :
+							 sync, 1);
+			if (!dma_fences) {
+				xe_wait_ufence(fd, &data[0].vm_sync,
+					       USER_FENCE_VALUE, NULL, ONE_SEC);
+				data[0].vm_sync = 0;
+			} else {
+				dma_sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
+			}
 		}
 
 		if (flags & INVALIDATE && i + 1 != n_execs) {
@@ -275,10 +360,21 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 	if (flags & INVALIDATE)
 		usleep(250000);
 
-	sync[0].addr = to_user_pointer(&data[0].vm_sync);
+	if (dma_fences) {
+		syncobj_reset(fd, &syncobj, 1);
+		dma_sync[0].flags |= DRM_XE_SYNC_SIGNAL;
+	} else {
+		sync[0].addr = to_user_pointer(&data[0].vm_sync);
+	}
+
 	xe_vm_unbind_async(fd, vm, bind_engines[0], 0, addr, bo_size,
-			   sync, 1);
-	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL, ONE_SEC);
+			   dma_fences ? dma_sync : sync, 1);
+	if (dma_fences)
+		igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0,
+					NULL));
+	else
+		xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, NULL,
+			       ONE_SEC);
 
 	for (i = j; i < n_execs; i++)
 		igt_assert_eq(data[i].data, 0xc0ffee);
@@ -289,6 +385,9 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 			xe_engine_destroy(fd, bind_engines[i]);
 	}
 
+	if (dma_fences)
+		syncobj_destroy(fd, syncobj);
+
 	if (bo) {
 		munmap(data, bo_size);
 		gem_close(fd, bo);
@@ -323,6 +422,30 @@ igt_main
 			INVALIDATE },
 		{ "bindengine-userptr-invalidate-race", BIND_ENGINE | USERPTR |
 			INVALIDATE | RACE },
+		{ "basic-dma-fences", DMA_FENCES_FOR_BINDS | 0 },
+		{ "preempt-fence-early-dma-fences", DMA_FENCES_FOR_BINDS |
+			VM_FOR_BO | ENGINE_EARLY },
+		{ "userptr-dma-fences", DMA_FENCES_FOR_BINDS | USERPTR },
+		{ "rebind-dma-fences", DMA_FENCES_FOR_BINDS | REBIND },
+		{ "userptr-rebind-dma-fences", DMA_FENCES_FOR_BINDS | USERPTR |
+			REBIND },
+		{ "userptr-invalidate-dma-fences", DMA_FENCES_FOR_BINDS |
+			USERPTR | INVALIDATE },
+		{ "userptr-invalidate-race-dma-fences", DMA_FENCES_FOR_BINDS |
+			USERPTR | INVALIDATE | RACE },
+		{ "bindengine-dma-fences", DMA_FENCES_FOR_BINDS | BIND_ENGINE },
+		{ "bindengine-userptr-dma-fences", DMA_FENCES_FOR_BINDS |
+			BIND_ENGINE | USERPTR },
+		{ "bindengine-rebind-dma-fences", DMA_FENCES_FOR_BINDS |
+			BIND_ENGINE | REBIND },
+		{ "bindengine-userptr-rebind-dma-fences", DMA_FENCES_FOR_BINDS |
+			BIND_ENGINE | USERPTR | REBIND },
+		{ "bindengine-userptr-invalidate-dma-fences",
+			DMA_FENCES_FOR_BINDS |  BIND_ENGINE | USERPTR |
+				INVALIDATE },
+		{ "bindengine-userptr-invalidate-race-dma-fences",
+			DMA_FENCES_FOR_BINDS | BIND_ENGINE | USERPTR |
+				INVALIDATE | RACE },
 		{ NULL },
 	};
 	int fd;
-- 
2.34.1
