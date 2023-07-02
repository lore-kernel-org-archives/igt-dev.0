Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8592E10E031
 for <igt-dev@lists.freedesktop.org>; Sun,  2 Jul 2023 22:14:19 +0000 (UTC)
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sun,  2 Jul 2023 15:14:27 -0700
Message-Id: <20230702221427.1332519-2-matthew.brost@intel.com>
In-Reply-To: <20230702221427.1332519-1-matthew.brost@intel.com>
References: <20230702221427.1332519-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 2/2] xe_vm: add bind engine conflict section
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

Verify bind engines can't race and corrupt page tables.

Signed-of-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/xe/xe_vm.c | 43 ++++++++++++++++++++++++++++++++++++-------
 1 file changed, 36 insertions(+), 7 deletions(-)

diff --git a/tests/xe/xe_vm.c b/tests/xe/xe_vm.c
index dd09a4f91..156d8c5bb 100644
--- a/tests/xe/xe_vm.c
+++ b/tests/xe/xe_vm.c
@@ -697,10 +697,18 @@ shared_pte_page(int fd, struct drm_xe_engine_class_instance *eci, int n_bo,
  * Description: Test independent bind engines
  * Functionality: bind engines
  * Run type: BAT
+ *
+ * SUBTEST: bind-engines-conflict
+ * Description: Test conflict bind engines
+ * Functionality: bind engines
+ * Run type: BAT
  */
 
+#define CONFLICT	(0x1 << 0)
+
 static void
-test_bind_engines_independent(int fd, struct drm_xe_engine_class_instance *eci)
+test_bind_engines_independent(int fd, struct drm_xe_engine_class_instance *eci,
+			      unsigned int flags)
 {
 	uint32_t vm;
 	uint64_t addr = 0x1a0000;
@@ -767,7 +775,7 @@ test_bind_engines_independent(int fd, struct drm_xe_engine_class_instance *eci)
 			xe_spin_wait_started(&data[i].spin);
 
 			/* Do bind to 1st engine blocked on cork */
-			addr += bo_size;
+			addr += (flags & CONFLICT) ? (0x1 << 21) : bo_size;
 			sync[1].flags &= ~DRM_XE_SYNC_SIGNAL;
 			sync[1].handle = syncobjs[e];
 			xe_vm_bind_async(fd, vm, bind_engines[e], bo, 0, addr,
@@ -803,10 +811,20 @@ test_bind_engines_independent(int fd, struct drm_xe_engine_class_instance *eci)
 		xe_exec(fd, &exec);
 	}
 
-	/* Verify initial bind, bind + write to 2nd engine done */
-	igt_assert(syncobj_wait(fd, &syncobjs[1], 1, INT64_MAX, 0, NULL));
-	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
-	igt_assert_eq(data[1].data, 0xc0ffee);
+	if (!(flags & CONFLICT)) {
+		/* Verify initial bind, bind + write to 2nd engine done */
+		igt_assert(syncobj_wait(fd, &syncobjs[1], 1, INT64_MAX, 0,
+					NULL));
+		igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0,
+					NULL));
+		igt_assert_eq(data[1].data, 0xc0ffee);
+	} else {
+		/* Let jobs runs for a bit */
+		usleep(100000);
+		/* bind + write to 2nd engine waiting */
+		igt_assert(!syncobj_wait(fd, &syncobjs[1], 1, 1, 0, NULL));
+		igt_assert(!syncobj_wait(fd, &sync[0].handle, 1, 0, 0, NULL));
+	}
 
 	/* Verify bind + write to 1st engine still inflight */
 	igt_assert(!syncobj_wait(fd, &syncobjs[0], 1, 1, 0, NULL));
@@ -819,6 +837,13 @@ test_bind_engines_independent(int fd, struct drm_xe_engine_class_instance *eci)
 				NULL));
 	igt_assert_eq(data[0].data, 0xc0ffee);
 
+	if (flags & CONFLICT) {
+		/* Verify bind + write to 2nd engine done */
+		igt_assert(syncobj_wait(fd, &syncobjs[1], 1, INT64_MAX, 0,
+					NULL));
+		igt_assert_eq(data[1].data, 0xc0ffee);
+	}
+
 	syncobj_destroy(fd, sync[0].handle);
 	sync[0].handle = syncobj_create(fd, 0);
 	sync[0].flags |= DRM_XE_SYNC_SIGNAL;
@@ -2020,7 +2045,11 @@ igt_main
 
 	igt_subtest("bind-engines-independent")
 		xe_for_each_hw_engine(fd, hwe)
-			test_bind_engines_independent(fd, hwe);
+			test_bind_engines_independent(fd, hwe, 0);
+
+	igt_subtest("bind-engines-conflict")
+		xe_for_each_hw_engine(fd, hwe)
+			test_bind_engines_independent(fd, hwe, CONFLICT);
 
 	igt_subtest("bind-array-twice")
 		xe_for_each_hw_engine(fd, hwe)
-- 
2.34.1
