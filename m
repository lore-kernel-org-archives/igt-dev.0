Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35AA210E1FF
 for <igt-dev@lists.freedesktop.org>; Tue,  2 May 2023 06:55:35 +0000 (UTC)
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  1 May 2023 23:55:31 -0700
Message-Id: <20230502065536.3223489-3-matthew.brost@intel.com>
In-Reply-To: <20230502065536.3223489-1-matthew.brost@intel.com>
References: <20230502065536.3223489-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 2/7] xe_exec_basic: Add NULL VM bind section
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

A NULL VM bind results in writes being dropped and reads returning zero,
verify uAPI for NULL VM binds is working as designed.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/xe/xe_exec_basic.c | 33 ++++++++++++++++++++++++++++-----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/tests/xe/xe_exec_basic.c b/tests/xe/xe_exec_basic.c
index 2a176a5b3..f7ad6aeeb 100644
--- a/tests/xe/xe_exec_basic.c
+++ b/tests/xe/xe_exec_basic.c
@@ -27,6 +27,7 @@
 #define BIND_ENGINE	(0x1 << 4)
 #define DEFER_ALLOC	(0x1 << 5)
 #define DEFER_BIND	(0x1 << 6)
+#define SPARSE		(0x1 << 7)
 
 /**
  * SUBTEST: once-%s
@@ -67,6 +68,10 @@
  * @userptr-rebind:			userptr rebind
  * @userptr-invalidate:			userptr invalidate
  * @userptr-invalidate-race:		userptr invalidate racy
+ * @null:				null
+ * @null-defer-mmap:			null defer mmap
+ * @null-defer-bind:			null defer bind
+ * @null-rebind:			null rebind
  * @bindengine:				bind engine
  * @bindengine-userptr:			bind engine userptr description
  * @bindengine-rebind:			bind engine rebind description
@@ -89,6 +94,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		.syncs = to_user_pointer(sync),
 	};
 	uint64_t addr[MAX_N_ENGINES];
+	uint64_t sparse_addr[MAX_N_ENGINES];
 	uint32_t vm[MAX_N_ENGINES];
 	uint32_t engines[MAX_N_ENGINES];
 	uint32_t bind_engines[MAX_N_ENGINES];
@@ -113,8 +119,11 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 			xe_get_default_alignment(fd));
 
 	addr[0] = 0x1a0000;
-	for (i = 1; i < MAX_N_ENGINES; ++i)
+	sparse_addr[0] = 0x301a0000;
+	for (i = 1; i < MAX_N_ENGINES; ++i) {
 		addr[i] = addr[i - 1] + (0x1ull << 32);
+		sparse_addr[i] = sparse_addr[i - 1] + (0x1ull << 32);
+	}
 
 	if (flags & USERPTR) {
 #define	MAP_ADDRESS	0x00007fadeadbe000
@@ -163,6 +172,13 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 			xe_vm_bind_userptr_async(fd, vm[i], bind_engines[i],
 						 to_user_pointer(data), addr[i],
 						 bo_size, sync, 1);
+		if (flags & SPARSE)
+			__xe_vm_bind_assert(fd, vm[i], bind_engines[i],
+					    0, 0, sparse_addr[i], bo_size,
+					    XE_VM_BIND_OP_MAP |
+					    XE_VM_BIND_FLAG_ASYNC |
+					    XE_VM_BIND_FLAG_NULL, sync,
+					    1, 0, 0);
 	}
 
 	if (flags & DEFER_BIND)
@@ -174,7 +190,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
 		uint64_t batch_addr = __addr + batch_offset;
 		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
-		uint64_t sdi_addr = __addr + sdi_offset;
+		uint64_t sdi_addr = (flags & SPARSE ? sparse_addr[i % n_vm] :
+				     __addr)+ sdi_offset;
 		int e = i % n_engines;
 
 		b = 0;
@@ -261,9 +278,11 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 					INT64_MAX, 0, NULL));
 	}
 
-	for (i = (flags & INVALIDATE && n_execs) ? n_execs - 1 : 0;
-	     i < n_execs; i++)
-		igt_assert_eq(data[i].data, 0xc0ffee);
+	if (!(flags & SPARSE)) {
+		for (i = (flags & INVALIDATE && n_execs) ? n_execs - 1 : 0;
+		     i < n_execs; i++)
+			igt_assert_eq(data[i].data, 0xc0ffee);
+	}
 
 	for (i = 0; i < n_engines; i++) {
 		syncobj_destroy(fd, syncobjs[i]);
@@ -296,6 +315,10 @@ igt_main
 		{ "basic-defer-bind", DEFER_ALLOC | DEFER_BIND },
 		{ "userptr", USERPTR },
 		{ "rebind", REBIND },
+		{ "null", SPARSE },
+		{ "null-defer-mmap", SPARSE | DEFER_ALLOC },
+		{ "null-defer-bind", SPARSE | DEFER_ALLOC | DEFER_BIND },
+		{ "null-rebind", SPARSE | REBIND },
 		{ "userptr-rebind", USERPTR | REBIND },
 		{ "userptr-invalidate", USERPTR | INVALIDATE },
 		{ "userptr-invalidate-race", USERPTR | INVALIDATE | RACE },
-- 
2.34.1
