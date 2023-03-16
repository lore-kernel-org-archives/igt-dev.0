Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43DB310E109
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Mar 2023 16:16:36 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 16 Mar 2023 17:08:56 +0100
Message-Id: <20230316160856.85520-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/xe_query: Rename for_each_gt macro for
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

As i915 and xe start to coexist in igt ensure gt iterator for Xe
tests is unique and won't conflict in the future merges.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/xe/xe_query.h           |  2 +-
 tests/xe/xe_debugfs.c       |  2 +-
 tests/xe/xe_exec_balancer.c | 22 +++++++++++-----------
 tests/xe/xe_exec_reset.c    | 14 +++++++-------
 tests/xe/xe_exec_threads.c  |  4 ++--
 tests/xe/xe_guc_pc.c        | 24 ++++++++++++------------
 6 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index beea9d0949..7ee45ef286 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -69,7 +69,7 @@ struct xe_device {
 #define for_each_hw_engine_class(__class) \
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
diff --git a/tests/xe/xe_exec_balancer.c b/tests/xe/xe_exec_balancer.c
index a247b1d268..566ec88a41 100644
--- a/tests/xe/xe_exec_balancer.c
+++ b/tests/xe/xe_exec_balancer.c
@@ -632,25 +632,25 @@ igt_main
 	}
 
 	igt_subtest("virtual-all-active")
-		for_each_gt(fd, gt)
+		xe_for_each_gt(fd, gt)
 			for_each_hw_engine_class(class)
 				test_all_active(fd, gt, class);
 
 	for (const struct section *s = sections; s->name; s++) {
 		igt_subtest_f("once-%s", s->name)
-			for_each_gt(fd, gt)
+			xe_for_each_gt(fd, gt)
 				for_each_hw_engine_class(class)
 					test_exec(fd, gt, class, 1, 1,
 						  s->flags);
 
 		igt_subtest_f("twice-%s", s->name)
-			for_each_gt(fd, gt)
+			xe_for_each_gt(fd, gt)
 				for_each_hw_engine_class(class)
 					test_exec(fd, gt, class, 1, 2,
 						  s->flags);
 
 		igt_subtest_f("many-%s", s->name)
-			for_each_gt(fd, gt)
+			xe_for_each_gt(fd, gt)
 				for_each_hw_engine_class(class)
 					test_exec(fd, gt, class, 1,
 						  s->flags & (REBIND | INVALIDATE) ?
@@ -658,7 +658,7 @@ igt_main
 						  s->flags);
 
 		igt_subtest_f("many-engines-%s", s->name)
-			for_each_gt(fd, gt)
+			xe_for_each_gt(fd, gt)
 				for_each_hw_engine_class(class)
 					test_exec(fd, gt, class, 16,
 						  s->flags & (REBIND | INVALIDATE) ?
@@ -666,7 +666,7 @@ igt_main
 						  s->flags);
 
 		igt_subtest_f("no-exec-%s", s->name)
-			for_each_gt(fd, gt)
+			xe_for_each_gt(fd, gt)
 				for_each_hw_engine_class(class)
 					test_exec(fd, gt, class, 1, 0,
 						  s->flags);
@@ -675,17 +675,17 @@ igt_main
 			continue;
 
 		igt_subtest_f("once-cm-%s", s->name)
-			for_each_gt(fd, gt)
+			xe_for_each_gt(fd, gt)
 				for_each_hw_engine_class(class)
 					test_cm(fd, gt, class, 1, 1, s->flags);
 
 		igt_subtest_f("twice-cm-%s", s->name)
-			for_each_gt(fd, gt)
+			xe_for_each_gt(fd, gt)
 				for_each_hw_engine_class(class)
 					test_cm(fd, gt, class, 1, 2, s->flags);
 
 		igt_subtest_f("many-cm-%s", s->name)
-			for_each_gt(fd, gt)
+			xe_for_each_gt(fd, gt)
 				for_each_hw_engine_class(class)
 					test_cm(fd, gt, class, 1,
 						s->flags & (REBIND | INVALIDATE) ?
@@ -693,7 +693,7 @@ igt_main
 						s->flags);
 
 		igt_subtest_f("many-engines-cm-%s", s->name)
-			for_each_gt(fd, gt)
+			xe_for_each_gt(fd, gt)
 				for_each_hw_engine_class(class)
 					test_cm(fd, gt, class, 16,
 						s->flags & (REBIND | INVALIDATE) ?
@@ -701,7 +701,7 @@ igt_main
 						s->flags);
 
 		igt_subtest_f("no-exec-cm-%s", s->name)
-			for_each_gt(fd, gt)
+			xe_for_each_gt(fd, gt)
 				for_each_hw_engine_class(class)
 					test_cm(fd, gt, class, 1, 0, s->flags);
 	}
diff --git a/tests/xe/xe_exec_reset.c b/tests/xe/xe_exec_reset.c
index 106fe941c1..f86525f78e 100644
--- a/tests/xe/xe_exec_reset.c
+++ b/tests/xe/xe_exec_reset.c
@@ -896,46 +896,46 @@ igt_main
 
 	for (const struct section *s = sections; s->name; s++) {
 		igt_subtest_f("%s-cancel", s->name)
-			for_each_gt(fd, gt)
+			xe_for_each_gt(fd, gt)
 				for_each_hw_engine_class(class)
 					test_balancer(fd, gt, class, 1, 1,
 						      CANCEL | s->flags);
 
 		igt_subtest_f("%s-engine-reset", s->name)
-			for_each_gt(fd, gt)
+			xe_for_each_gt(fd, gt)
 				for_each_hw_engine_class(class)
 					test_balancer(fd, gt, class, MAX_INSTANCE + 1,
 						      MAX_INSTANCE + 1,
 						      ENGINE_RESET | s->flags);
 
 		igt_subtest_f("%s-cat-error", s->name)
-			for_each_gt(fd, gt)
+			xe_for_each_gt(fd, gt)
 				for_each_hw_engine_class(class)
 					test_balancer(fd, gt, class, MAX_INSTANCE + 1,
 						      MAX_INSTANCE + 1,
 						      CAT_ERROR | s->flags);
 
 		igt_subtest_f("%s-gt-reset", s->name)
-			for_each_gt(fd, gt)
+			xe_for_each_gt(fd, gt)
 				for_each_hw_engine_class(class)
 					test_balancer(fd, gt, class, MAX_INSTANCE + 1,
 						      MAX_INSTANCE + 1,
 						      GT_RESET | s->flags);
 
 		igt_subtest_f("%s-close-fd-no-exec", s->name)
-			for_each_gt(fd, gt)
+			xe_for_each_gt(fd, gt)
 				for_each_hw_engine_class(class)
 					test_balancer(-1, gt, class, 16, 0,
 						      CLOSE_FD | s->flags);
 
 		igt_subtest_f("%s-close-fd", s->name)
-			for_each_gt(fd, gt)
+			xe_for_each_gt(fd, gt)
 				for_each_hw_engine_class(class)
 					test_balancer(-1, gt, class, 16, 256,
 						      CLOSE_FD | s->flags);
 
 		igt_subtest_f("%s-close-engines-close-fd", s->name)
-			for_each_gt(fd, gt)
+			xe_for_each_gt(fd, gt)
 				for_each_hw_engine_class(class)
 					test_balancer(-1, gt, class, 16, 256, CLOSE_FD |
 						      CLOSE_ENGINES | s->flags);
diff --git a/tests/xe/xe_exec_threads.c b/tests/xe/xe_exec_threads.c
index 69055a829b..37c42029e9 100644
--- a/tests/xe/xe_exec_threads.c
+++ b/tests/xe/xe_exec_threads.c
@@ -1042,7 +1042,7 @@ static void threads(int fd, int flags)
 		++n_hw_engines;
 
 	if (flags & BALANCER) {
-		for_each_gt(fd, gt)
+		xe_for_each_gt(fd, gt)
 			for_each_hw_engine_class(class) {
 				int num_placements = 0;
 
@@ -1126,7 +1126,7 @@ static void threads(int fd, int flags)
 	}
 
 	if (flags & BALANCER) {
-		for_each_gt(fd, gt)
+		xe_for_each_gt(fd, gt)
 			for_each_hw_engine_class(class) {
 				int num_placements = 0;
 
diff --git a/tests/xe/xe_guc_pc.c b/tests/xe/xe_guc_pc.c
index 3f520d7bf4..91c826d853 100644
--- a/tests/xe/xe_guc_pc.c
+++ b/tests/xe/xe_guc_pc.c
@@ -398,18 +398,18 @@ igt_main
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
+		xe_for_each_gt(fd, gt) {
 			for_each_hw_engine(fd, hwe)
 				igt_fork(child, ncpus) {
 					igt_debug("Execution Started\n");
@@ -423,13 +423,13 @@ igt_main
 	}
 
 	igt_subtest("freq_range_idle") {
-		for_each_gt(fd, gt) {
+		xe_for_each_gt(fd, gt) {
 			test_freq_range(sysfs, gt);
 		}
 	}
 
 	igt_subtest("freq_range_exec") {
-		for_each_gt(fd, gt) {
+		xe_for_each_gt(fd, gt) {
 			for_each_hw_engine(fd, hwe)
 				igt_fork(child, ncpus) {
 					igt_debug("Execution Started\n");
@@ -443,37 +443,37 @@ igt_main
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
 			for_each_hw_engine(fd, hwe)
 				igt_fork(child, ncpus) {
@@ -488,7 +488,7 @@ igt_main
 	}
 
 	igt_fixture {
-		for_each_gt(fd, gt) {
+		xe_for_each_gt(fd, gt) {
 			set_freq(sysfs, gt, "min", stash_min);
 			set_freq(sysfs, gt, "max", stash_max);
 		}
-- 
2.34.1
