Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0B0C10E127
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Mar 2023 06:27:34 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 17 Mar 2023 07:27:27 +0100
Message-Id: <20230317062727.144338-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/xe_query: Rename for_each_* macros for
 Xe tests
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

As i915 and xe start to coexist in igt ensure iterators for Xe
tests are unique and won't conflict in the future merges.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/xe/xe_query.h               |  6 ++--
 tests/xe/xe_debugfs.c           |  2 +-
 tests/xe/xe_dma_buf_sync.c      |  2 +-
 tests/xe/xe_evict.c             |  2 +-
 tests/xe/xe_exec_balancer.c     | 50 ++++++++++++++--------------
 tests/xe/xe_exec_basic.c        | 12 +++----
 tests/xe/xe_exec_compute_mode.c |  8 ++---
 tests/xe/xe_exec_fault_mode.c   | 16 ++++-----
 tests/xe/xe_exec_reset.c        | 58 ++++++++++++++++-----------------
 tests/xe/xe_exec_threads.c      | 18 +++++-----
 tests/xe/xe_guc_pc.c            | 30 ++++++++---------
 tests/xe/xe_pm.c                | 14 ++++----
 tests/xe/xe_query.c             |  2 +-
 tests/xe/xe_vm.c                | 52 ++++++++++++++---------------
 14 files changed, 136 insertions(+), 136 deletions(-)

diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index beea9d0949..70de183cc0 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -63,13 +63,13 @@ struct xe_device {
 	uint16_t dev_id;
 };
 
-#define for_each_hw_engine(__fd, __hwe) \
+#define xe_for_each_hw_engine(__fd, __hwe) \
 	for (int __i = 0; __i < xe_number_hw_engines(__fd) && \
 	     (__hwe = xe_hw_engine(__fd, __i)); ++__i)
-#define for_each_hw_engine_class(__class) \
+#define xe_for_each_hw_engine_class(__class) \
 	for (__class = 0; __class < DRM_XE_ENGINE_CLASS_COMPUTE + 1; \
 	     ++__class)
-#define for_each_gt(__fd, __gt) \
+#define xe_for_each_gt(__fd, __gt) \
 	for (__gt = 0; __gt < xe_number_gt(__fd); ++__gt)
 
 #define XE_IS_CLASS_SYSMEM(__region) ((__region)->mem_class == XE_MEM_REGION_CLASS_SYSMEM)
diff --git a/tests/xe/xe_debugfs.c b/tests/xe/xe_debugfs.c
index 38c8beccc5..29b0078f39 100644
--- a/tests/xe/xe_debugfs.c
+++ b/tests/xe/xe_debugfs.c
@@ -260,7 +260,7 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 
 
 	igt_subtest("gt") {
-		for_each_gt(fd, gt) {
+		xe_for_each_gt(fd, gt) {
 			snprintf(devnode, sizeof(devnode), "gt%d", gt);
 			igt_require(igt_debugfs_exists(fd, devnode, O_RDONLY));
 			test_gt(fd, gt);
diff --git a/tests/xe/xe_dma_buf_sync.c b/tests/xe/xe_dma_buf_sync.c
index e1a652ff53..8b97480a79 100644
--- a/tests/xe/xe_dma_buf_sync.c
+++ b/tests/xe/xe_dma_buf_sync.c
@@ -234,7 +234,7 @@ igt_main
 		fd = drm_open_driver(DRIVER_XE);
 		xe_device_get(fd);
 
-		for_each_hw_engine(fd, hwe)
+		xe_for_each_hw_engine(fd, hwe)
 			if (hwe0 == NULL) {
 				hwe0 = hwe;
 			} else {
diff --git a/tests/xe/xe_evict.c b/tests/xe/xe_evict.c
index edd4b6d2e6..eddbbd6f4c 100644
--- a/tests/xe/xe_evict.c
+++ b/tests/xe/xe_evict.c
@@ -673,7 +673,7 @@ igt_main
 		vram_size = xe_vram_size(fd, 0);
 		igt_assert(vram_size);
 
-		for_each_hw_engine(fd, hwe)
+		xe_for_each_hw_engine(fd, hwe)
 			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COPY)
 				break;
 	}
diff --git a/tests/xe/xe_exec_balancer.c b/tests/xe/xe_exec_balancer.c
index a247b1d268..f3341a99e9 100644
--- a/tests/xe/xe_exec_balancer.c
+++ b/tests/xe/xe_exec_balancer.c
@@ -57,7 +57,7 @@ static void test_all_active(int fd, int gt, int class)
 	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
 	int i, num_placements = 0;
 
-	for_each_hw_engine(fd, hwe) {
+	xe_for_each_hw_engine(fd, hwe) {
 		if (hwe->engine_class != class || hwe->gt_id != gt)
 			continue;
 
@@ -203,7 +203,7 @@ test_exec(int fd, int gt, int class, int n_engines, int n_execs,
 
 	igt_assert(n_engines <= MAX_N_ENGINES);
 
-	for_each_hw_engine(fd, hwe) {
+	xe_for_each_hw_engine(fd, hwe) {
 		if (hwe->engine_class != class || hwe->gt_id != gt)
 			continue;
 
@@ -426,7 +426,7 @@ test_cm(int fd, int gt, int class, int n_engines, int n_execs,
 
 	igt_assert(n_engines <= MAX_N_ENGINES);
 
-	for_each_hw_engine(fd, hwe) {
+	xe_for_each_hw_engine(fd, hwe) {
 		if (hwe->engine_class != class || hwe->gt_id != gt)
 			continue;
 
@@ -632,42 +632,42 @@ igt_main
 	}
 
 	igt_subtest("virtual-all-active")
-		for_each_gt(fd, gt)
-			for_each_hw_engine_class(class)
+		xe_for_each_gt(fd, gt)
+			xe_for_each_hw_engine_class(class)
 				test_all_active(fd, gt, class);
 
 	for (const struct section *s = sections; s->name; s++) {
 		igt_subtest_f("once-%s", s->name)
-			for_each_gt(fd, gt)
-				for_each_hw_engine_class(class)
+			xe_for_each_gt(fd, gt)
+				xe_for_each_hw_engine_class(class)
 					test_exec(fd, gt, class, 1, 1,
 						  s->flags);
 
 		igt_subtest_f("twice-%s", s->name)
-			for_each_gt(fd, gt)
-				for_each_hw_engine_class(class)
+			xe_for_each_gt(fd, gt)
+				xe_for_each_hw_engine_class(class)
 					test_exec(fd, gt, class, 1, 2,
 						  s->flags);
 
 		igt_subtest_f("many-%s", s->name)
-			for_each_gt(fd, gt)
-				for_each_hw_engine_class(class)
+			xe_for_each_gt(fd, gt)
+				xe_for_each_hw_engine_class(class)
 					test_exec(fd, gt, class, 1,
 						  s->flags & (REBIND | INVALIDATE) ?
 						  64 : 1024,
 						  s->flags);
 
 		igt_subtest_f("many-engines-%s", s->name)
-			for_each_gt(fd, gt)
-				for_each_hw_engine_class(class)
+			xe_for_each_gt(fd, gt)
+				xe_for_each_hw_engine_class(class)
 					test_exec(fd, gt, class, 16,
 						  s->flags & (REBIND | INVALIDATE) ?
 						  64 : 1024,
 						  s->flags);
 
 		igt_subtest_f("no-exec-%s", s->name)
-			for_each_gt(fd, gt)
-				for_each_hw_engine_class(class)
+			xe_for_each_gt(fd, gt)
+				xe_for_each_hw_engine_class(class)
 					test_exec(fd, gt, class, 1, 0,
 						  s->flags);
 
@@ -675,34 +675,34 @@ igt_main
 			continue;
 
 		igt_subtest_f("once-cm-%s", s->name)
-			for_each_gt(fd, gt)
-				for_each_hw_engine_class(class)
+			xe_for_each_gt(fd, gt)
+				xe_for_each_hw_engine_class(class)
 					test_cm(fd, gt, class, 1, 1, s->flags);
 
 		igt_subtest_f("twice-cm-%s", s->name)
-			for_each_gt(fd, gt)
-				for_each_hw_engine_class(class)
+			xe_for_each_gt(fd, gt)
+				xe_for_each_hw_engine_class(class)
 					test_cm(fd, gt, class, 1, 2, s->flags);
 
 		igt_subtest_f("many-cm-%s", s->name)
-			for_each_gt(fd, gt)
-				for_each_hw_engine_class(class)
+			xe_for_each_gt(fd, gt)
+				xe_for_each_hw_engine_class(class)
 					test_cm(fd, gt, class, 1,
 						s->flags & (REBIND | INVALIDATE) ?
 						64 : 1024,
 						s->flags);
 
 		igt_subtest_f("many-engines-cm-%s", s->name)
-			for_each_gt(fd, gt)
-				for_each_hw_engine_class(class)
+			xe_for_each_gt(fd, gt)
+				xe_for_each_hw_engine_class(class)
 					test_cm(fd, gt, class, 16,
 						s->flags & (REBIND | INVALIDATE) ?
 						64 : 1024,
 						s->flags);
 
 		igt_subtest_f("no-exec-cm-%s", s->name)
-			for_each_gt(fd, gt)
-				for_each_hw_engine_class(class)
+			xe_for_each_gt(fd, gt)
+				xe_for_each_hw_engine_class(class)
 					test_cm(fd, gt, class, 1, 0, s->flags);
 	}
 
diff --git a/tests/xe/xe_exec_basic.c b/tests/xe/xe_exec_basic.c
index 106980e844..2a3cebd368 100644
--- a/tests/xe/xe_exec_basic.c
+++ b/tests/xe/xe_exec_basic.c
@@ -318,36 +318,36 @@ igt_main
 
 	for (const struct section *s = sections; s->name; s++) {
 		igt_subtest_f("once-%s", s->name)
-			for_each_hw_engine(fd, hwe)
+			xe_for_each_hw_engine(fd, hwe)
 				test_exec(fd, hwe, 1, 1, 1, s->flags);
 
 		igt_subtest_f("twice-%s", s->name)
-			for_each_hw_engine(fd, hwe)
+			xe_for_each_hw_engine(fd, hwe)
 				test_exec(fd, hwe, 1, 2, 1, s->flags);
 
 		igt_subtest_f("many-%s", s->name)
-			for_each_hw_engine(fd, hwe)
+			xe_for_each_hw_engine(fd, hwe)
 				test_exec(fd, hwe, 1,
 					  s->flags & (REBIND | INVALIDATE) ?
 					  64 : 1024, 1,
 					  s->flags);
 
 		igt_subtest_f("many-engines-%s", s->name)
-			for_each_hw_engine(fd, hwe)
+			xe_for_each_hw_engine(fd, hwe)
 				test_exec(fd, hwe, 16,
 					  s->flags & (REBIND | INVALIDATE) ?
 					  64 : 1024, 1,
 					  s->flags);
 
 		igt_subtest_f("many-engines-many-vm-%s", s->name)
-			for_each_hw_engine(fd, hwe)
+			xe_for_each_hw_engine(fd, hwe)
 				test_exec(fd, hwe, 16,
 					  s->flags & (REBIND | INVALIDATE) ?
 					  64 : 1024, 16,
 					  s->flags);
 
 		igt_subtest_f("no-exec-%s", s->name)
-			for_each_hw_engine(fd, hwe)
+			xe_for_each_hw_engine(fd, hwe)
 				test_exec(fd, hwe, 1, 0, 1, s->flags);
 	}
 
diff --git a/tests/xe/xe_exec_compute_mode.c b/tests/xe/xe_exec_compute_mode.c
index e65767ae4f..60713a9581 100644
--- a/tests/xe/xe_exec_compute_mode.c
+++ b/tests/xe/xe_exec_compute_mode.c
@@ -334,15 +334,15 @@ igt_main
 
 	for (const struct section *s = sections; s->name; s++) {
 		igt_subtest_f("once-%s", s->name)
-			for_each_hw_engine(fd, hwe)
+			xe_for_each_hw_engine(fd, hwe)
 				test_exec(fd, hwe, 1, 1, s->flags);
 
 		igt_subtest_f("twice-%s", s->name)
-			for_each_hw_engine(fd, hwe)
+			xe_for_each_hw_engine(fd, hwe)
 				test_exec(fd, hwe, 1, 2, s->flags);
 
 		igt_subtest_f("many-%s", s->name)
-			for_each_hw_engine(fd, hwe)
+			xe_for_each_hw_engine(fd, hwe)
 				test_exec(fd, hwe, 1,
 					  s->flags & (REBIND | INVALIDATE) ?
 					  64 : 128,
@@ -352,7 +352,7 @@ igt_main
 			continue;
 
 		igt_subtest_f("many-engines-%s", s->name)
-			for_each_hw_engine(fd, hwe)
+			xe_for_each_hw_engine(fd, hwe)
 				test_exec(fd, hwe, 16,
 					  s->flags & (REBIND | INVALIDATE) ?
 					  64 : 128,
diff --git a/tests/xe/xe_exec_fault_mode.c b/tests/xe/xe_exec_fault_mode.c
index 2a67352c2a..b5d924a338 100644
--- a/tests/xe/xe_exec_fault_mode.c
+++ b/tests/xe/xe_exec_fault_mode.c
@@ -530,22 +530,22 @@ igt_main
 
 	for (const struct section *s = sections; s->name; s++) {
 		igt_subtest_f("once-%s", s->name)
-			for_each_hw_engine(fd, hwe)
+			xe_for_each_hw_engine(fd, hwe)
 				test_exec(fd, hwe, 1, 1, s->flags);
 
 		igt_subtest_f("twice-%s", s->name)
-			for_each_hw_engine(fd, hwe)
+			xe_for_each_hw_engine(fd, hwe)
 				test_exec(fd, hwe, 1, 2, s->flags);
 
 		igt_subtest_f("many-%s", s->name)
-			for_each_hw_engine(fd, hwe)
+			xe_for_each_hw_engine(fd, hwe)
 				test_exec(fd, hwe, 1,
 					  s->flags & (REBIND | INVALIDATE) ?
 					  64 : 128,
 					  s->flags);
 
 		igt_subtest_f("many-engines-%s", s->name)
-			for_each_hw_engine(fd, hwe)
+			xe_for_each_hw_engine(fd, hwe)
 				test_exec(fd, hwe, 16,
 					  s->flags & (REBIND | INVALIDATE) ?
 					  64 : 128,
@@ -553,19 +553,19 @@ igt_main
 	}
 
 	igt_subtest("atomic-once")
-		for_each_hw_engine(fd, hwe)
+		xe_for_each_hw_engine(fd, hwe)
 			test_atomic(fd, hwe, 1, 0);
 
 	igt_subtest("atomic-once-wait")
-		for_each_hw_engine(fd, hwe)
+		xe_for_each_hw_engine(fd, hwe)
 			test_atomic(fd, hwe, 1, WAIT_ATOMIC);
 
 	igt_subtest("atomic-many")
-		for_each_hw_engine(fd, hwe)
+		xe_for_each_hw_engine(fd, hwe)
 			test_atomic(fd, hwe, 8, 0);
 
 	igt_subtest("atomic-many-wait")
-		for_each_hw_engine(fd, hwe)
+		xe_for_each_hw_engine(fd, hwe)
 			test_atomic(fd, hwe, 8, WAIT_ATOMIC);
 
 	igt_fixture {
diff --git a/tests/xe/xe_exec_reset.c b/tests/xe/xe_exec_reset.c
index 106fe941c1..57dc90dd00 100644
--- a/tests/xe/xe_exec_reset.c
+++ b/tests/xe/xe_exec_reset.c
@@ -183,7 +183,7 @@ test_balancer(int fd, int gt, int class, int n_engines, int n_execs,
 		xe_device_get(fd);
 	}
 
-	for_each_hw_engine(fd, hwe) {
+	xe_for_each_hw_engine(fd, hwe) {
 		if (hwe->engine_class != class || hwe->gt_id != gt)
 			continue;
 
@@ -837,106 +837,106 @@ igt_main
 	}
 
 	igt_subtest("spin")
-		for_each_hw_engine(fd, hwe)
+		xe_for_each_hw_engine(fd, hwe)
 			test_spin(fd, hwe);
 
 	igt_subtest("cancel")
-		for_each_hw_engine(fd, hwe)
+		xe_for_each_hw_engine(fd, hwe)
 			test_legacy_mode(fd, hwe, 1, 1, CANCEL);
 
 	igt_subtest("engine-reset")
-		for_each_hw_engine(fd, hwe)
+		xe_for_each_hw_engine(fd, hwe)
 			test_legacy_mode(fd, hwe, 2, 2, ENGINE_RESET);
 
 	igt_subtest("cat-error")
-		for_each_hw_engine(fd, hwe)
+		xe_for_each_hw_engine(fd, hwe)
 			test_legacy_mode(fd, hwe, 2, 2, CAT_ERROR);
 
 	igt_subtest("gt-reset")
-		for_each_hw_engine(fd, hwe)
+		xe_for_each_hw_engine(fd, hwe)
 			test_legacy_mode(fd, hwe, 2, 2, GT_RESET);
 
 	igt_subtest("close-fd-no-exec")
-		for_each_hw_engine(fd, hwe)
+		xe_for_each_hw_engine(fd, hwe)
 			test_legacy_mode(-1, hwe, 16, 0, CLOSE_FD);
 
 	igt_subtest("close-fd")
-		for_each_hw_engine(fd, hwe)
+		xe_for_each_hw_engine(fd, hwe)
 			test_legacy_mode(-1, hwe, 16, 256, CLOSE_FD);
 
 	igt_subtest("close-engines-close-fd")
-		for_each_hw_engine(fd, hwe)
+		xe_for_each_hw_engine(fd, hwe)
 			test_legacy_mode(-1, hwe, 16, 256, CLOSE_FD |
 					 CLOSE_ENGINES);
 
 	igt_subtest("cm-engine-reset")
-		for_each_hw_engine(fd, hwe)
+		xe_for_each_hw_engine(fd, hwe)
 			test_compute_mode(fd, hwe, 2, 2, ENGINE_RESET);
 
 	igt_subtest("cm-cat-error")
-		for_each_hw_engine(fd, hwe)
+		xe_for_each_hw_engine(fd, hwe)
 			test_compute_mode(fd, hwe, 2, 2, CAT_ERROR);
 
 	igt_subtest("cm-gt-reset")
-		for_each_hw_engine(fd, hwe)
+		xe_for_each_hw_engine(fd, hwe)
 			test_compute_mode(fd, hwe, 2, 2, GT_RESET);
 
 	igt_subtest("cm-close-fd-no-exec")
-		for_each_hw_engine(fd, hwe)
+		xe_for_each_hw_engine(fd, hwe)
 			test_compute_mode(-1, hwe, 16, 0, CLOSE_FD);
 
 	igt_subtest("cm-close-fd")
-		for_each_hw_engine(fd, hwe)
+		xe_for_each_hw_engine(fd, hwe)
 			test_compute_mode(-1, hwe, 16, 256, CLOSE_FD);
 
 	igt_subtest("cm-close-engines-close-fd")
-		for_each_hw_engine(fd, hwe)
+		xe_for_each_hw_engine(fd, hwe)
 			test_compute_mode(-1, hwe, 16, 256, CLOSE_FD |
 					  CLOSE_ENGINES);
 
 	for (const struct section *s = sections; s->name; s++) {
 		igt_subtest_f("%s-cancel", s->name)
-			for_each_gt(fd, gt)
-				for_each_hw_engine_class(class)
+			xe_for_each_gt(fd, gt)
+				xe_for_each_hw_engine_class(class)
 					test_balancer(fd, gt, class, 1, 1,
 						      CANCEL | s->flags);
 
 		igt_subtest_f("%s-engine-reset", s->name)
-			for_each_gt(fd, gt)
-				for_each_hw_engine_class(class)
+			xe_for_each_gt(fd, gt)
+				xe_for_each_hw_engine_class(class)
 					test_balancer(fd, gt, class, MAX_INSTANCE + 1,
 						      MAX_INSTANCE + 1,
 						      ENGINE_RESET | s->flags);
 
 		igt_subtest_f("%s-cat-error", s->name)
-			for_each_gt(fd, gt)
-				for_each_hw_engine_class(class)
+			xe_for_each_gt(fd, gt)
+				xe_for_each_hw_engine_class(class)
 					test_balancer(fd, gt, class, MAX_INSTANCE + 1,
 						      MAX_INSTANCE + 1,
 						      CAT_ERROR | s->flags);
 
 		igt_subtest_f("%s-gt-reset", s->name)
-			for_each_gt(fd, gt)
-				for_each_hw_engine_class(class)
+			xe_for_each_gt(fd, gt)
+				xe_for_each_hw_engine_class(class)
 					test_balancer(fd, gt, class, MAX_INSTANCE + 1,
 						      MAX_INSTANCE + 1,
 						      GT_RESET | s->flags);
 
 		igt_subtest_f("%s-close-fd-no-exec", s->name)
-			for_each_gt(fd, gt)
-				for_each_hw_engine_class(class)
+			xe_for_each_gt(fd, gt)
+				xe_for_each_hw_engine_class(class)
 					test_balancer(-1, gt, class, 16, 0,
 						      CLOSE_FD | s->flags);
 
 		igt_subtest_f("%s-close-fd", s->name)
-			for_each_gt(fd, gt)
-				for_each_hw_engine_class(class)
+			xe_for_each_gt(fd, gt)
+				xe_for_each_hw_engine_class(class)
 					test_balancer(-1, gt, class, 16, 256,
 						      CLOSE_FD | s->flags);
 
 		igt_subtest_f("%s-close-engines-close-fd", s->name)
-			for_each_gt(fd, gt)
-				for_each_hw_engine_class(class)
+			xe_for_each_gt(fd, gt)
+				xe_for_each_hw_engine_class(class)
 					test_balancer(-1, gt, class, 16, 256, CLOSE_FD |
 						      CLOSE_ENGINES | s->flags);
 	}
diff --git a/tests/xe/xe_exec_threads.c b/tests/xe/xe_exec_threads.c
index 69055a829b..c34d8aec6b 100644
--- a/tests/xe/xe_exec_threads.c
+++ b/tests/xe/xe_exec_threads.c
@@ -82,7 +82,7 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
 		owns_vm = true;
 	}
 
-	for_each_hw_engine(fd, hwe) {
+	xe_for_each_hw_engine(fd, hwe) {
 		if (hwe->engine_class != class || hwe->gt_id != gt)
 			continue;
 
@@ -1038,15 +1038,15 @@ static void threads(int fd, int flags)
 	int n_threads = 0;
 	int gt;
 
-	for_each_hw_engine(fd, hwe)
+	xe_for_each_hw_engine(fd, hwe)
 		++n_hw_engines;
 
 	if (flags & BALANCER) {
-		for_each_gt(fd, gt)
-			for_each_hw_engine_class(class) {
+		xe_for_each_gt(fd, gt)
+			xe_for_each_hw_engine_class(class) {
 				int num_placements = 0;
 
-				for_each_hw_engine(fd, hwe) {
+				xe_for_each_hw_engine(fd, hwe) {
 					if (hwe->engine_class != class ||
 					    hwe->gt_id != gt)
 						continue;
@@ -1089,7 +1089,7 @@ static void threads(int fd, int flags)
 
 	}
 
-	for_each_hw_engine(fd, hwe) {
+	xe_for_each_hw_engine(fd, hwe) {
 		threads_data[i].mutex = &mutex;
 		threads_data[i].cond = &cond;
 #define ADDRESS_SHIFT	39
@@ -1126,11 +1126,11 @@ static void threads(int fd, int flags)
 	}
 
 	if (flags & BALANCER) {
-		for_each_gt(fd, gt)
-			for_each_hw_engine_class(class) {
+		xe_for_each_gt(fd, gt)
+			xe_for_each_hw_engine_class(class) {
 				int num_placements = 0;
 
-				for_each_hw_engine(fd, hwe) {
+				xe_for_each_hw_engine(fd, hwe) {
 					if (hwe->engine_class != class ||
 					    hwe->gt_id != gt)
 						continue;
diff --git a/tests/xe/xe_guc_pc.c b/tests/xe/xe_guc_pc.c
index 3f520d7bf4..60c93288bf 100644
--- a/tests/xe/xe_guc_pc.c
+++ b/tests/xe/xe_guc_pc.c
@@ -398,19 +398,19 @@ igt_main
 	}
 
 	igt_subtest("freq_basic_api") {
-		for_each_gt(fd, gt)
+		xe_for_each_gt(fd, gt)
 			test_freq_basic_api(sysfs, gt);
 	}
 
 	igt_subtest("freq_fixed_idle") {
-		for_each_gt(fd, gt) {
+		xe_for_each_gt(fd, gt) {
 			test_freq_fixed(sysfs, gt);
 		}
 	}
 
 	igt_subtest("freq_fixed_exec") {
-		for_each_gt(fd, gt) {
-			for_each_hw_engine(fd, hwe)
+		xe_for_each_gt(fd, gt) {
+			xe_for_each_hw_engine(fd, hwe)
 				igt_fork(child, ncpus) {
 					igt_debug("Execution Started\n");
 					exec_basic(fd, hwe, MAX_N_ENGINES, 16);
@@ -423,14 +423,14 @@ igt_main
 	}
 
 	igt_subtest("freq_range_idle") {
-		for_each_gt(fd, gt) {
+		xe_for_each_gt(fd, gt) {
 			test_freq_range(sysfs, gt);
 		}
 	}
 
 	igt_subtest("freq_range_exec") {
-		for_each_gt(fd, gt) {
-			for_each_hw_engine(fd, hwe)
+		xe_for_each_gt(fd, gt) {
+			xe_for_each_hw_engine(fd, hwe)
 				igt_fork(child, ncpus) {
 					igt_debug("Execution Started\n");
 					exec_basic(fd, hwe, MAX_N_ENGINES, 16);
@@ -443,39 +443,39 @@ igt_main
 	}
 
 	igt_subtest("freq_low_max") {
-		for_each_gt(fd, gt) {
+		xe_for_each_gt(fd, gt) {
 			test_freq_low_max(sysfs, gt);
 		}
 	}
 
 	igt_subtest("freq_suspend") {
-		for_each_gt(fd, gt) {
+		xe_for_each_gt(fd, gt) {
 			test_suspend(sysfs, gt);
 		}
 	}
 
 	igt_subtest("freq_reset") {
-		for_each_gt(fd, gt) {
+		xe_for_each_gt(fd, gt) {
 			test_reset(fd, sysfs, gt, 1);
 		}
 	}
 
 	igt_subtest("freq_reset_multiple") {
-		for_each_gt(fd, gt) {
+		xe_for_each_gt(fd, gt) {
 			test_reset(fd, sysfs, gt, 50);
 		}
 	}
 
 	igt_subtest("rc6_on_idle") {
-		for_each_gt(fd, gt) {
+		xe_for_each_gt(fd, gt) {
 			assert(igt_wait(in_rc6(sysfs, gt), 1000, 1));
 		}
 	}
 
 	igt_subtest("rc0_on_exec") {
-		for_each_gt(fd, gt) {
+		xe_for_each_gt(fd, gt) {
 			assert(igt_wait(in_rc6(sysfs, gt), 1000, 1));
-			for_each_hw_engine(fd, hwe)
+			xe_for_each_hw_engine(fd, hwe)
 				igt_fork(child, ncpus) {
 					igt_debug("Execution Started\n");
 					exec_basic(fd, hwe, MAX_N_ENGINES, 16);
@@ -488,7 +488,7 @@ igt_main
 	}
 
 	igt_fixture {
-		for_each_gt(fd, gt) {
+		xe_for_each_gt(fd, gt) {
 			set_freq(sysfs, gt, "min", stash_min);
 			set_freq(sysfs, gt, "max", stash_max);
 		}
diff --git a/tests/xe/xe_pm.c b/tests/xe/xe_pm.c
index eb752b0208..23b8246ede 100644
--- a/tests/xe/xe_pm.c
+++ b/tests/xe/xe_pm.c
@@ -373,7 +373,7 @@ igt_main
 		xe_device_get(device.fd_xe);
 
 		/* Always perform initial once-basic exec checking for health */
-		for_each_hw_engine(device.fd_xe, hwe)
+		xe_for_each_hw_engine(device.fd_xe, hwe)
 			test_exec(device, hwe, 1, 1, NO_SUSPEND, NO_RPM);
 
 		get_d3cold_allowed(device.pci_xe, d3cold_allowed);
@@ -387,7 +387,7 @@ igt_main
 		}
 
 		igt_subtest_f("%s-basic-exec", s->name) {
-			for_each_hw_engine(device.fd_xe, hwe)
+			xe_for_each_hw_engine(device.fd_xe, hwe)
 				test_exec(device, hwe, 1, 2, s->state,
 					  NO_RPM);
 		}
@@ -395,13 +395,13 @@ igt_main
 		igt_subtest_f("%s-exec-after", s->name) {
 			igt_system_suspend_autoresume(s->state,
 						      SUSPEND_TEST_NONE);
-			for_each_hw_engine(device.fd_xe, hwe)
+			xe_for_each_hw_engine(device.fd_xe, hwe)
 				test_exec(device, hwe, 1, 2, NO_SUSPEND,
 					  NO_RPM);
 		}
 
 		igt_subtest_f("%s-multiple-execs", s->name) {
-			for_each_hw_engine(device.fd_xe, hwe)
+			xe_for_each_hw_engine(device.fd_xe, hwe)
 				test_exec(device, hwe, 16, 32, s->state,
 					  NO_RPM);
 		}
@@ -409,7 +409,7 @@ igt_main
 		for (const struct d_state *d = d_states; d->name; d++) {
 			igt_subtest_f("%s-%s-basic-exec", s->name, d->name) {
 				igt_assert(setup_d3(device, d->state));
-				for_each_hw_engine(device.fd_xe, hwe)
+				xe_for_each_hw_engine(device.fd_xe, hwe)
 					test_exec(device, hwe, 1, 2, s->state,
 						  NO_RPM);
 			}
@@ -424,14 +424,14 @@ igt_main
 
 		igt_subtest_f("%s-basic-exec", d->name) {
 			igt_assert(setup_d3(device, d->state));
-			for_each_hw_engine(device.fd_xe, hwe)
+			xe_for_each_hw_engine(device.fd_xe, hwe)
 				test_exec(device, hwe, 1, 1,
 					  NO_SUSPEND, d->state);
 		}
 
 		igt_subtest_f("%s-multiple-execs", d->name) {
 			igt_assert(setup_d3(device, d->state));
-			for_each_hw_engine(device.fd_xe, hwe)
+			xe_for_each_hw_engine(device.fd_xe, hwe)
 				test_exec(device, hwe, 16, 32,
 					  NO_SUSPEND, d->state);
 		}
diff --git a/tests/xe/xe_query.c b/tests/xe/xe_query.c
index b5b78517ce..3f03822555 100644
--- a/tests/xe/xe_query.c
+++ b/tests/xe/xe_query.c
@@ -181,7 +181,7 @@ test_query_engines(int fd)
 	struct drm_xe_engine_class_instance *hwe;
 	int i = 0;
 
-	for_each_hw_engine(fd, hwe) {
+	xe_for_each_hw_engine(fd, hwe) {
 		igt_assert(hwe);
 		igt_info("engine %d: %s\n", i++,
 			xe_engine_class_string(hwe->engine_class));
diff --git a/tests/xe/xe_vm.c b/tests/xe/xe_vm.c
index 265308a111..15356c704d 100644
--- a/tests/xe/xe_vm.c
+++ b/tests/xe/xe_vm.c
@@ -1619,7 +1619,7 @@ igt_main
 		fd = drm_open_driver(DRIVER_XE);
 		xe_device_get(fd);
 
-		for_each_hw_engine(fd, hwe)
+		xe_for_each_hw_engine(fd, hwe)
 			if (hwe->engine_class != DRM_XE_ENGINE_CLASS_COPY) {
 				hwe_non_copy = hwe;
 				break;
@@ -1654,41 +1654,41 @@ igt_main
 		vm_async_ops_err(fd, true);
 
 	igt_subtest("shared-pte-page")
-		for_each_hw_engine(fd, hwe)
+		xe_for_each_hw_engine(fd, hwe)
 			shared_pte_page(fd, hwe, 4,
 					xe_get_default_alignment(fd));
 
 	igt_subtest("shared-pde-page")
-		for_each_hw_engine(fd, hwe)
+		xe_for_each_hw_engine(fd, hwe)
 			shared_pte_page(fd, hwe, 4, 0x1000ul * 512);
 
 	igt_subtest("shared-pde2-page")
-		for_each_hw_engine(fd, hwe)
+		xe_for_each_hw_engine(fd, hwe)
 			shared_pte_page(fd, hwe, 4, 0x1000ul * 512 * 512);
 
 	igt_subtest("shared-pde3-page")
-		for_each_hw_engine(fd, hwe)
+		xe_for_each_hw_engine(fd, hwe)
 			shared_pte_page(fd, hwe, 4, 0x1000ul * 512 * 512 * 512);
 
 	igt_subtest("bind-engines-independent")
-		for_each_hw_engine(fd, hwe)
+		xe_for_each_hw_engine(fd, hwe)
 			test_bind_engines_independent(fd, hwe);
 
 	igt_subtest("bind-array-twice")
-		for_each_hw_engine(fd, hwe)
+		xe_for_each_hw_engine(fd, hwe)
 			test_bind_array(fd, hwe, 2, 0);
 
 	igt_subtest("bind-array-many")
-		for_each_hw_engine(fd, hwe)
+		xe_for_each_hw_engine(fd, hwe)
 			test_bind_array(fd, hwe, 16, 0);
 
 	igt_subtest("bind-array-engine-twice")
-		for_each_hw_engine(fd, hwe)
+		xe_for_each_hw_engine(fd, hwe)
 			test_bind_array(fd, hwe, 2,
 					BIND_ARRAY_BIND_ENGINE_FLAG);
 
 	igt_subtest("bind-array-engine-many")
-		for_each_hw_engine(fd, hwe)
+		xe_for_each_hw_engine(fd, hwe)
 			test_bind_array(fd, hwe, 16,
 					BIND_ARRAY_BIND_ENGINE_FLAG);
 
@@ -1696,41 +1696,41 @@ igt_main
 	     bind_size = bind_size << 1) {
 		igt_subtest_f("large-binds-%lld",
 			      (long long)bind_size)
-			for_each_hw_engine(fd, hwe) {
+			xe_for_each_hw_engine(fd, hwe) {
 				test_large_binds(fd, hwe, 4, 16, bind_size, 0);
 				break;
 			}
 		igt_subtest_f("large-split-binds-%lld",
 			      (long long)bind_size)
-			for_each_hw_engine(fd, hwe) {
+			xe_for_each_hw_engine(fd, hwe) {
 				test_large_binds(fd, hwe, 4, 16, bind_size,
 						 LARGE_BIND_FLAG_SPLIT);
 				break;
 			}
 		igt_subtest_f("large-misaligned-binds-%lld",
 			      (long long)bind_size)
-			for_each_hw_engine(fd, hwe) {
+			xe_for_each_hw_engine(fd, hwe) {
 				test_large_binds(fd, hwe, 4, 16, bind_size,
 						 LARGE_BIND_FLAG_MISALIGNED);
 				break;
 			}
 		igt_subtest_f("large-split-misaligned-binds-%lld",
 			      (long long)bind_size)
-			for_each_hw_engine(fd, hwe) {
+			xe_for_each_hw_engine(fd, hwe) {
 				test_large_binds(fd, hwe, 4, 16, bind_size,
 						 LARGE_BIND_FLAG_SPLIT |
 						 LARGE_BIND_FLAG_MISALIGNED);
 				break;
 			}
 		igt_subtest_f("large-userptr-binds-%lld", (long long)bind_size)
-			for_each_hw_engine(fd, hwe) {
+			xe_for_each_hw_engine(fd, hwe) {
 				test_large_binds(fd, hwe, 4, 16, bind_size,
 						 LARGE_BIND_FLAG_USERPTR);
 				break;
 			}
 		igt_subtest_f("large-userptr-split-binds-%lld",
 			      (long long)bind_size)
-			for_each_hw_engine(fd, hwe) {
+			xe_for_each_hw_engine(fd, hwe) {
 				test_large_binds(fd, hwe, 4, 16, bind_size,
 						 LARGE_BIND_FLAG_SPLIT |
 						 LARGE_BIND_FLAG_USERPTR);
@@ -1738,7 +1738,7 @@ igt_main
 			}
 		igt_subtest_f("large-userptr-misaligned-binds-%lld",
 			      (long long)bind_size)
-			for_each_hw_engine(fd, hwe) {
+			xe_for_each_hw_engine(fd, hwe) {
 				test_large_binds(fd, hwe, 4, 16, bind_size,
 						 LARGE_BIND_FLAG_MISALIGNED |
 						 LARGE_BIND_FLAG_USERPTR);
@@ -1746,7 +1746,7 @@ igt_main
 			}
 		igt_subtest_f("large-userptr-split-misaligned-binds-%lld",
 			      (long long)bind_size)
-			for_each_hw_engine(fd, hwe) {
+			xe_for_each_hw_engine(fd, hwe) {
 				test_large_binds(fd, hwe, 4, 16, bind_size,
 						 LARGE_BIND_FLAG_SPLIT |
 						 LARGE_BIND_FLAG_MISALIGNED |
@@ -1757,13 +1757,13 @@ igt_main
 
 	bind_size = (0x1ull << 21) + (0x1ull << 20);
 	igt_subtest_f("mixed-binds-%lld", (long long)bind_size)
-		for_each_hw_engine(fd, hwe) {
+		xe_for_each_hw_engine(fd, hwe) {
 			test_large_binds(fd, hwe, 4, 16, bind_size, 0);
 			break;
 		}
 
 	igt_subtest_f("mixed-misaligned-binds-%lld", (long long)bind_size)
-		for_each_hw_engine(fd, hwe) {
+		xe_for_each_hw_engine(fd, hwe) {
 			test_large_binds(fd, hwe, 4, 16, bind_size,
 					 LARGE_BIND_FLAG_MISALIGNED);
 			break;
@@ -1771,14 +1771,14 @@ igt_main
 
 	bind_size = (0x1ull << 30) + (0x1ull << 29) + (0x1ull << 20);
 	igt_subtest_f("mixed-binds-%lld", (long long)bind_size)
-		for_each_hw_engine(fd, hwe) {
+		xe_for_each_hw_engine(fd, hwe) {
 			test_large_binds(fd, hwe, 4, 16, bind_size, 0);
 			break;
 		}
 
 	bind_size = (0x1ull << 30) + (0x1ull << 29) + (0x1ull << 20);
 	igt_subtest_f("mixed-misaligned-binds-%lld", (long long)bind_size)
-		for_each_hw_engine(fd, hwe) {
+		xe_for_each_hw_engine(fd, hwe) {
 			test_large_binds(fd, hwe, 4, 16, bind_size,
 					 LARGE_BIND_FLAG_MISALIGNED);
 			break;
@@ -1786,7 +1786,7 @@ igt_main
 
 	bind_size = (0x1ull << 21) + (0x1ull << 20);
 	igt_subtest_f("mixed-userptr-binds-%lld", (long long) bind_size)
-		for_each_hw_engine(fd, hwe) {
+		xe_for_each_hw_engine(fd, hwe) {
 			test_large_binds(fd, hwe, 4, 16, bind_size,
 					 LARGE_BIND_FLAG_USERPTR);
 			break;
@@ -1794,7 +1794,7 @@ igt_main
 
 	igt_subtest_f("mixed-userptr-misaligned-binds-%lld",
 		      (long long)bind_size)
-		for_each_hw_engine(fd, hwe) {
+		xe_for_each_hw_engine(fd, hwe) {
 			test_large_binds(fd, hwe, 4, 16, bind_size,
 					 LARGE_BIND_FLAG_MISALIGNED |
 					 LARGE_BIND_FLAG_USERPTR);
@@ -1803,7 +1803,7 @@ igt_main
 
 	bind_size = (0x1ull << 30) + (0x1ull << 29) + (0x1ull << 20);
 	igt_subtest_f("mixed-userptr-binds-%lld", (long long)bind_size)
-		for_each_hw_engine(fd, hwe) {
+		xe_for_each_hw_engine(fd, hwe) {
 			test_large_binds(fd, hwe, 4, 16, bind_size,
 					 LARGE_BIND_FLAG_USERPTR);
 			break;
@@ -1812,7 +1812,7 @@ igt_main
 	bind_size = (0x1ull << 30) + (0x1ull << 29) + (0x1ull << 20);
 	igt_subtest_f("mixed-userptr-misaligned-binds-%lld",
 		      (long long)bind_size)
-		for_each_hw_engine(fd, hwe) {
+		xe_for_each_hw_engine(fd, hwe) {
 			test_large_binds(fd, hwe, 4, 16, bind_size,
 					 LARGE_BIND_FLAG_MISALIGNED |
 					 LARGE_BIND_FLAG_USERPTR);
-- 
2.34.1
