Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AE086EC70
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Apr 2021 21:50:03 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id m12so15352186pgr.9
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Apr 2021 14:50:03 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Fri, 23 Apr 2021 16:48:03 -0500
Message-Id: <20210423214853.876911-40-jason@jlekstrand.net>
In-Reply-To: <20210423214853.876911-1-jason@jlekstrand.net>
References: <20210423214853.876911-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 39/89] tests/i915/gem_exec_suspend: Convert
 to intel_ctx_t
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 tests/i915/gem_exec_suspend.c | 52 +++++++++++++++++++----------------
 1 file changed, 29 insertions(+), 23 deletions(-)

diff --git a/tests/i915/gem_exec_suspend.c b/tests/i915/gem_exec_suspend.c
index b6558a14..0f663bf3 100644
--- a/tests/i915/gem_exec_suspend.c
+++ b/tests/i915/gem_exec_suspend.c
@@ -50,7 +50,8 @@
 #define CACHED (1<<8)
 #define HANG (2<<8)
 
-static void run_test(int fd, unsigned engine, unsigned flags);
+static void run_test(int fd, const intel_ctx_t *ctx,
+		     unsigned engine, unsigned flags);
 
 static void check_bo(int fd, uint32_t handle)
 {
@@ -65,12 +66,13 @@ static void check_bo(int fd, uint32_t handle)
 	munmap(map, 4096);
 }
 
-static void test_all(int fd, unsigned flags)
+static void test_all(int fd, const intel_ctx_t *ctx, unsigned flags)
 {
-	run_test(fd, ALL_ENGINES, flags & ~0xff);
+	run_test(fd, ctx, ALL_ENGINES, flags & ~0xff);
 }
 
-static void run_test(int fd, unsigned engine, unsigned flags)
+static void run_test(int fd, const intel_ctx_t *ctx,
+		     unsigned engine, unsigned flags)
 {
 	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
@@ -85,7 +87,7 @@ static void run_test(int fd, unsigned engine, unsigned flags)
 	if (engine == ALL_ENGINES) {
 		const struct intel_execution_engine2 *e;
 
-		__for_each_physical_engine(fd, e) {
+		for_each_ctx_engine(fd, ctx, e) {
 			if (gem_class_can_store_dword(fd, e->class))
 				engines[nengine++] = e->flags;
 		}
@@ -96,7 +98,7 @@ static void run_test(int fd, unsigned engine, unsigned flags)
 
 	/* Before suspending, check normal operation */
 	if (mode(flags) != NOSLEEP)
-		test_all(fd, flags);
+		test_all(fd, ctx, flags);
 
 	gem_quiescent_gpu(fd);
 
@@ -106,6 +108,7 @@ static void run_test(int fd, unsigned engine, unsigned flags)
 	execbuf.flags = 1 << 11;
 	if (gen < 6)
 		execbuf.flags |= I915_EXEC_SECURE;
+	execbuf.rsvd1 = ctx->id;
 
 	memset(obj, 0, sizeof(obj));
 	obj[0].handle = gem_create(fd, 4096);
@@ -202,7 +205,7 @@ static void run_test(int fd, unsigned engine, unsigned flags)
 
 	/* After resume, make sure it still works */
 	if (mode(flags) != NOSLEEP)
-		test_all(fd, flags);
+		test_all(fd, ctx, flags);
 }
 
 struct battery_sample {
@@ -229,7 +232,8 @@ static double d_time(const struct battery_sample *after,
 		(after->tv.tv_nsec - before->tv.tv_nsec) * 1e-9); /* s */
 }
 
-static void power_test(int i915, unsigned engine, unsigned flags)
+static void power_test(int i915, const intel_ctx_t *ctx,
+		       unsigned engine, unsigned flags)
 {
 	struct battery_sample before, after;
 	char *status;
@@ -249,7 +253,7 @@ static void power_test(int i915, unsigned engine, unsigned flags)
 	igt_set_autoresume_delay(5 * 60); /* 5 minutes; longer == more stable */
 
 	igt_assert(get_power(dir, &before));
-	run_test(i915, engine, flags);
+	run_test(i915, ctx, engine, flags);
 	igt_assert(get_power(dir, &after));
 
 	igt_set_autoresume_delay(0);
@@ -273,45 +277,47 @@ igt_main
 	}, *m;
 	const struct intel_execution_engine2 *e;
 	igt_hang_t hang;
+	const intel_ctx_t *ctx;
 	int fd;
 
 	igt_fixture {
 		fd = drm_open_driver_master(DRIVER_INTEL);
 		igt_require_gem(fd);
 		igt_require(gem_can_store_dword(fd, 0));
+		ctx = intel_ctx_create_all_physical(fd);
 
 		igt_fork_hang_detector(fd);
 	}
 
 	igt_subtest("basic")
-		run_test(fd, ALL_ENGINES, NOSLEEP);
+		run_test(fd, ctx, ALL_ENGINES, NOSLEEP);
 	igt_subtest("basic-S0")
-		run_test(fd, ALL_ENGINES, IDLE);
+		run_test(fd, ctx, ALL_ENGINES, IDLE);
 	igt_subtest("basic-S3-devices")
-		run_test(fd, ALL_ENGINES, SUSPEND_DEVICES);
+		run_test(fd, ctx, ALL_ENGINES, SUSPEND_DEVICES);
 	igt_subtest("basic-S3")
-		run_test(fd, ALL_ENGINES, SUSPEND);
+		run_test(fd, ctx, ALL_ENGINES, SUSPEND);
 	igt_subtest("basic-S4-devices")
-		run_test(fd, ALL_ENGINES, HIBERNATE_DEVICES);
+		run_test(fd, ctx, ALL_ENGINES, HIBERNATE_DEVICES);
 	igt_subtest("basic-S4")
-		run_test(fd, ALL_ENGINES, HIBERNATE);
+		run_test(fd, ctx, ALL_ENGINES, HIBERNATE);
 
 	for (m = modes; m->suffix; m++) {
 		igt_subtest_with_dynamic_f("uncached%s", m->suffix) {
-			__for_each_physical_engine(fd, e) {
+			for_each_ctx_engine(fd, ctx, e) {
 				if (!gem_class_can_store_dword(fd, e->class))
 					continue;
 				igt_dynamic_f("%s", e->name)
-					run_test(fd, e->flags, m->mode | UNCACHED);
+					run_test(fd, ctx, e->flags, m->mode | UNCACHED);
 			}
 		}
 
 		igt_subtest_with_dynamic_f("cached%s", m->suffix) {
-			__for_each_physical_engine(fd, e) {
+			for_each_ctx_engine(fd, ctx, e) {
 				if (!gem_class_can_store_dword(fd, e->class))
 					continue;
 				igt_dynamic_f("%s", e->name)
-					run_test(fd, e->flags, m->mode | CACHED);
+					run_test(fd, ctx, e->flags, m->mode | CACHED);
 			}
 		}
 	}
@@ -322,14 +328,14 @@ igt_main
 	}
 
 	igt_subtest("hang-S3")
-		run_test(fd, 0, SUSPEND | HANG);
+		run_test(fd, intel_ctx_0(fd), 0, SUSPEND | HANG);
 	igt_subtest("hang-S4")
-		run_test(fd, 0, HIBERNATE | HANG);
+		run_test(fd, intel_ctx_0(fd), 0, HIBERNATE | HANG);
 
 	igt_subtest("power-S0")
-		power_test(fd, 0, IDLE);
+		power_test(fd, intel_ctx_0(fd), 0, IDLE);
 	igt_subtest("power-S3")
-		power_test(fd, 0, SUSPEND);
+		power_test(fd, intel_ctx_0(fd), 0, SUSPEND);
 
 	igt_fixture {
 		igt_disallow_hang(fd, hang);
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
