Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 178E110E317
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Dec 2021 08:51:35 +0000 (UTC)
From: sai.gowtham.ch@intel.com
Date: Mon, 13 Dec 2021 14:16:41 +0530
Message-Id: <20211213084641.23845-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_exec_suspend: Add support
 for local memory
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, sai.gowtham.ch@intel.com, zbigniew.kempczynski@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Ch Sai Gowtham <sai.gowtham.ch@intel.com>

Add support for local memory region (Device memory)

Signed-off-by: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/i915/gem_exec_suspend.c | 132 +++++++++++++++++++++-------------
 1 file changed, 82 insertions(+), 50 deletions(-)

diff --git a/tests/i915/gem_exec_suspend.c b/tests/i915/gem_exec_suspend.c
index 887bb735..0bb69b00 100644
--- a/tests/i915/gem_exec_suspend.c
+++ b/tests/i915/gem_exec_suspend.c
@@ -51,8 +51,19 @@
 #define CACHED (1<<8)
 #define HANG (2<<8)
 
+static uint32_t batch_create(int fd, uint32_t batch_size, uint32_t region)
+{
+	const uint32_t bbe = MI_BATCH_BUFFER_END;
+	uint32_t handle;
+
+	handle = gem_create_in_memory_regions(fd, batch_size, region);
+	gem_write(fd, handle, 0, &bbe, sizeof(bbe));
+
+	return handle;
+}
+
 static void run_test(int fd, const intel_ctx_t *ctx,
-		     unsigned engine, unsigned flags);
+		     unsigned engine, unsigned flags, uint32_t region);
 
 static void check_bo(int fd, uint32_t handle)
 {
@@ -67,16 +78,15 @@ static void check_bo(int fd, uint32_t handle)
 	munmap(map, 4096);
 }
 
-static void test_all(int fd, const intel_ctx_t *ctx, unsigned flags)
+static void test_all(int fd, const intel_ctx_t *ctx, unsigned flags, uint32_t region)
 {
-	run_test(fd, ctx, ALL_ENGINES, flags & ~0xff);
+	run_test(fd, ctx, ALL_ENGINES, flags & ~0xff, region);
 }
 
 static void run_test(int fd, const intel_ctx_t *ctx,
-		     unsigned engine, unsigned flags)
+		     unsigned engine, unsigned flags, uint32_t region)
 {
 	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
-	const uint32_t bbe = MI_BATCH_BUFFER_END;
 	struct drm_i915_gem_exec_object2 obj[2];
 	struct drm_i915_gem_relocation_entry reloc;
 	struct drm_i915_gem_execbuffer2 execbuf;
@@ -100,7 +110,7 @@ static void run_test(int fd, const intel_ctx_t *ctx,
 
 	/* Before suspending, check normal operation */
 	if (mode(flags) != NOSLEEP)
-		test_all(fd, ctx, flags);
+		test_all(fd, ctx, flags, region);
 
 	gem_quiescent_gpu(fd);
 
@@ -117,8 +127,7 @@ static void run_test(int fd, const intel_ctx_t *ctx,
 	if (!gem_has_lmem(fd))
 		gem_set_caching(fd, obj[0].handle, !!(flags & CACHED));
 	obj[0].flags |= EXEC_OBJECT_WRITE;
-	obj[1].handle = gem_create(fd, 4096);
-	gem_write(fd, obj[1].handle, 0, &bbe, sizeof(bbe));
+	obj[1].handle = batch_create(fd, 4096, region);
 	igt_require(__gem_execbuf(fd, &execbuf) == 0);
 	gem_close(fd, obj[1].handle);
 
@@ -222,7 +231,7 @@ static void run_test(int fd, const intel_ctx_t *ctx,
 
 	/* After resume, make sure it still works */
 	if (mode(flags) != NOSLEEP)
-		test_all(fd, ctx, flags);
+		test_all(fd, ctx, flags, region);
 }
 
 struct battery_sample {
@@ -250,7 +259,7 @@ static double d_time(const struct battery_sample *after,
 }
 
 static void power_test(int i915, const intel_ctx_t *ctx,
-		       unsigned engine, unsigned flags)
+		       unsigned engine, unsigned flags, uint32_t region)
 {
 	struct battery_sample before, after;
 	char *status;
@@ -270,7 +279,7 @@ static void power_test(int i915, const intel_ctx_t *ctx,
 	igt_set_autoresume_delay(5 * 60); /* 5 minutes; longer == more stable */
 
 	igt_assert(get_power(dir, &before));
-	run_test(i915, ctx, engine, flags);
+	run_test(i915, ctx, engine, flags, region);
 	igt_assert(get_power(dir, &after));
 
 	igt_set_autoresume_delay(0);
@@ -292,10 +301,33 @@ igt_main
 		{ "-S4", HIBERNATE },
 		{ NULL, 0 }
 	}, *m;
+	struct test {
+		const char *name;
+		unsigned int flags;
+		void (*fn)(int, const intel_ctx_t *, unsigned, unsigned, uint32_t);
+	} *test, tests_all_engines[] = {
+		{ "basic", NOSLEEP, run_test },
+		{ "basic-S0", IDLE, run_test },
+		{ "basic-S3-devices", SUSPEND_DEVICES, run_test },
+		{ "basic-S3", SUSPEND, run_test },
+		{ "basic-S4-devices", HIBERNATE_DEVICES, run_test },
+		{ "basic-S4", HIBERNATE, run_test },
+		{ }
+	}, tests_power_hang[] = {
+		{ "hang-S3", SUSPEND | HANG, run_test },
+		{ "hang-S4", HIBERNATE | HANG, run_test },
+		{ "power-S0", IDLE, power_test },
+		{ "power-S3", SUSPEND, power_test },
+		{ }
+	};
 	const struct intel_execution_engine2 *e;
 	igt_hang_t hang;
 	const intel_ctx_t *ctx;
 	int fd;
+	char *sub_name;
+	uint32_t region;
+	struct drm_i915_query_memory_regions *query_info;
+	struct igt_collection *set, *regions;
 
 	igt_fixture {
 		fd = drm_open_driver_master(DRIVER_INTEL);
@@ -304,50 +336,55 @@ igt_main
 		ctx = intel_ctx_create_all_physical(fd);
 
 		igt_fork_hang_detector(fd);
+		query_info = gem_get_query_memory_regions(fd);
+		igt_assert(query_info);
+
+		set = get_memory_region_set(query_info,
+				I915_SYSTEM_MEMORY,
+				I915_DEVICE_MEMORY);
+	}
+
+#define subtest_for_each_combination(__name, __ctx, __flags, __fn) \
+	igt_subtest_with_dynamic(__name) { \
+		for_each_combination(regions, 1, set) { \
+			sub_name = memregion_dynamic_subtest_name(regions); \
+			region = igt_collection_get_value(regions, 0); \
+			igt_dynamic_f("%s", sub_name) \
+				(__fn)(fd, (__ctx), ALL_ENGINES, (__flags), region); \
+			free(sub_name); \
+		} \
 	}
 
-	igt_subtest("basic")
-		run_test(fd, ctx, ALL_ENGINES, NOSLEEP);
-	igt_subtest("basic-S0")
-		run_test(fd, ctx, ALL_ENGINES, IDLE);
-	igt_subtest("basic-S3-devices")
-		run_test(fd, ctx, ALL_ENGINES, SUSPEND_DEVICES);
-	igt_subtest("basic-S3")
-		run_test(fd, ctx, ALL_ENGINES, SUSPEND);
-	igt_subtest("basic-S4-devices")
-		run_test(fd, ctx, ALL_ENGINES, HIBERNATE_DEVICES);
-	igt_subtest("basic-S4")
-		run_test(fd, ctx, ALL_ENGINES, HIBERNATE);
+#define for_each_ctx_engine_combination(__mode) \
+	for_each_ctx_engine(fd, ctx, e) { \
+		if (!gem_class_can_store_dword(fd, e->class)) \
+			continue; \
+		for_each_combination(regions, 1, set) { \
+			sub_name = memregion_dynamic_subtest_name(regions); \
+			region = igt_collection_get_value(regions, 0); \
+			igt_dynamic_f("%s-%s", e->name, sub_name) \
+				run_test(fd, ctx, e->flags, (__mode), region); \
+			free(sub_name); \
+		} \
+	}
+
+	for (test = tests_all_engines; test->name; test++)
+		subtest_for_each_combination(test->name, ctx, test->flags, test->fn);
 
 	for (m = modes; m->suffix; m++) {
 		igt_subtest_with_dynamic_f("fixed%s", m->suffix) {
 			igt_require(gem_has_lmem(fd));
-			for_each_ctx_engine(fd, ctx, e) {
-				if (!gem_class_can_store_dword(fd, e->class))
-					continue;
-				igt_dynamic_f("%s", e->name)
-					run_test(fd, ctx, e->flags, m->mode);
-			}
+			for_each_ctx_engine_combination(m->mode);
 		}
 
 		igt_subtest_with_dynamic_f("uncached%s", m->suffix) {
 			igt_require(!gem_has_lmem(fd));
-			for_each_ctx_engine(fd, ctx, e) {
-				if (!gem_class_can_store_dword(fd, e->class))
-					continue;
-				igt_dynamic_f("%s", e->name)
-					run_test(fd, ctx, e->flags, m->mode | UNCACHED);
-			}
+			for_each_ctx_engine_combination(m->mode | UNCACHED);
 		}
 
 		igt_subtest_with_dynamic_f("cached%s", m->suffix) {
 			igt_require(!gem_has_lmem(fd));
-			for_each_ctx_engine(fd, ctx, e) {
-				if (!gem_class_can_store_dword(fd, e->class))
-					continue;
-				igt_dynamic_f("%s", e->name)
-					run_test(fd, ctx, e->flags, m->mode | CACHED);
-			}
+			for_each_ctx_engine_combination(m->mode | CACHED);
 		}
 	}
 
@@ -356,17 +393,12 @@ igt_main
 		hang = igt_allow_hang(fd, 0, 0);
 	}
 
-	igt_subtest("hang-S3")
-		run_test(fd, intel_ctx_0(fd), 0, SUSPEND | HANG);
-	igt_subtest("hang-S4")
-		run_test(fd, intel_ctx_0(fd), 0, HIBERNATE | HANG);
-
-	igt_subtest("power-S0")
-		power_test(fd, intel_ctx_0(fd), 0, IDLE);
-	igt_subtest("power-S3")
-		power_test(fd, intel_ctx_0(fd), 0, SUSPEND);
+	for (test = tests_power_hang; test->name; test++)
+		subtest_for_each_combination(test->name, ctx, test->flags, test->fn);
 
 	igt_fixture {
+		free(query_info);
+		igt_collection_destroy(set);
 		igt_disallow_hang(fd, hang);
 		intel_ctx_destroy(fd, ctx);
 		close(fd);
-- 
2.32.0
