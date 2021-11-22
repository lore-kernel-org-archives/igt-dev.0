Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A86BF6E536
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Nov 2021 07:40:24 +0000 (UTC)
From: sai.gowtham.ch@intel.com
Date: Mon, 22 Nov 2021 13:06:28 +0530
Message-Id: <20211122073628.8143-1-sai.gowtham.ch@intel.com>
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
 tests/i915/gem_exec_suspend.c | 186 +++++++++++++++++++++++++++-------
 1 file changed, 148 insertions(+), 38 deletions(-)

diff --git a/tests/i915/gem_exec_suspend.c b/tests/i915/gem_exec_suspend.c
index 887bb735..f22981fd 100644
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
 
@@ -113,12 +123,11 @@ static void run_test(int fd, const intel_ctx_t *ctx,
 	execbuf.rsvd1 = ctx->id;
 
 	memset(obj, 0, sizeof(obj));
-	obj[0].handle = gem_create(fd, 4096);
+	obj[0].handle = gem_create_in_memory_regions(fd, 4096, region);
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
@@ -296,6 +305,10 @@ igt_main
 	igt_hang_t hang;
 	const intel_ctx_t *ctx;
 	int fd;
+	char *sub_name;
+	uint32_t region;
+	struct drm_i915_query_memory_regions *query_info;
+	struct igt_collection *set, *regions;
 
 	igt_fixture {
 		fd = drm_open_driver_master(DRIVER_INTEL);
@@ -304,20 +317,73 @@ igt_main
 		ctx = intel_ctx_create_all_physical(fd);
 
 		igt_fork_hang_detector(fd);
+		query_info = gem_get_query_memory_regions(fd);
+		igt_assert(query_info);
+
+		set = get_memory_region_set(query_info,
+					I915_SYSTEM_MEMORY,
+					I915_DEVICE_MEMORY);
+	}
+
+	igt_subtest_with_dynamic("basic") {
+		for_each_combination(regions, 1, set) {
+			sub_name = memregion_dynamic_subtest_name(regions);
+			region = igt_collection_get_value(regions, 0);
+			igt_dynamic_f("%s", sub_name)
+				run_test(fd, ctx, ALL_ENGINES, NOSLEEP, region);
+			free(sub_name);
+		}
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
+	igt_subtest_with_dynamic("basic-S0") {
+		for_each_combination(regions, 1, set) {
+			sub_name = memregion_dynamic_subtest_name(regions);
+			region = igt_collection_get_value(regions, 0);
+			igt_dynamic_f("%s", sub_name)
+				run_test(fd, ctx, ALL_ENGINES, IDLE, region);
+			free(sub_name);
+		}
+	}
+
+	igt_subtest_with_dynamic("basic-S3-devices") {
+		for_each_combination(regions, 1, set) {
+			sub_name = memregion_dynamic_subtest_name(regions);
+			region = igt_collection_get_value(regions, 0);
+			igt_dynamic_f("%s", sub_name)
+				run_test(fd, ctx, ALL_ENGINES, SUSPEND_DEVICES, region);
+			free(sub_name);
+		}
+	}
+
+	igt_subtest_with_dynamic("basic-S3") {
+		for_each_combination(regions, 1, set) {
+			sub_name = memregion_dynamic_subtest_name(regions);
+			region = igt_collection_get_value(regions, 0);
+			igt_dynamic_f("%s", sub_name)
+				run_test(fd, ctx, ALL_ENGINES, SUSPEND, region);
+			free(sub_name);
+		}
+	}
+
+	igt_subtest_with_dynamic("basic-S4-devices") {
+		for_each_combination(regions, 1, set) {
+			sub_name = memregion_dynamic_subtest_name(regions);
+			region = igt_collection_get_value(regions, 0);
+			igt_dynamic_f("%s", sub_name)
+				run_test(fd, ctx, ALL_ENGINES, HIBERNATE_DEVICES, region);
+			free(sub_name);
+		}
+	}
+
+	igt_subtest_with_dynamic("basic-S4") {
+		for_each_combination(regions, 1, set) {
+			sub_name = memregion_dynamic_subtest_name(regions);
+			region = igt_collection_get_value(regions, 0);
+			igt_dynamic_f("%s", sub_name)
+				run_test(fd, ctx, ALL_ENGINES, HIBERNATE, region);
+			free(sub_name);
+		}
+	}
 
 	for (m = modes; m->suffix; m++) {
 		igt_subtest_with_dynamic_f("fixed%s", m->suffix) {
@@ -325,8 +391,12 @@ igt_main
 			for_each_ctx_engine(fd, ctx, e) {
 				if (!gem_class_can_store_dword(fd, e->class))
 					continue;
-				igt_dynamic_f("%s", e->name)
-					run_test(fd, ctx, e->flags, m->mode);
+				for_each_combination(regions, 1, set) {
+					sub_name = memregion_dynamic_subtest_name(regions);
+					region = igt_collection_get_value(regions, 0);
+					igt_dynamic_f("%s-%s", e->name, sub_name)
+						run_test(fd, ctx, e->flags, m->mode, region);
+				}
 			}
 		}
 
@@ -335,8 +405,12 @@ igt_main
 			for_each_ctx_engine(fd, ctx, e) {
 				if (!gem_class_can_store_dword(fd, e->class))
 					continue;
-				igt_dynamic_f("%s", e->name)
-					run_test(fd, ctx, e->flags, m->mode | UNCACHED);
+				for_each_combination(regions, 1, set) {
+					sub_name = memregion_dynamic_subtest_name(regions);
+					region = igt_collection_get_value(regions, 0);
+					igt_dynamic_f("%s-%s", e->name, sub_name)
+						run_test(fd, ctx, e->flags, m->mode | UNCACHED, region);
+				}
 			}
 		}
 
@@ -345,8 +419,12 @@ igt_main
 			for_each_ctx_engine(fd, ctx, e) {
 				if (!gem_class_can_store_dword(fd, e->class))
 					continue;
-				igt_dynamic_f("%s", e->name)
-					run_test(fd, ctx, e->flags, m->mode | CACHED);
+				for_each_combination(regions, 1, set) {
+					sub_name = memregion_dynamic_subtest_name(regions);
+					region = igt_collection_get_value(regions, 0);
+					igt_dynamic_f("%s-%s", e->name, sub_name)
+						run_test(fd, ctx, e->flags, m->mode | CACHED, region);
+				}
 			}
 		}
 	}
@@ -356,17 +434,49 @@ igt_main
 		hang = igt_allow_hang(fd, 0, 0);
 	}
 
-	igt_subtest("hang-S3")
-		run_test(fd, intel_ctx_0(fd), 0, SUSPEND | HANG);
-	igt_subtest("hang-S4")
-		run_test(fd, intel_ctx_0(fd), 0, HIBERNATE | HANG);
+	igt_subtest_with_dynamic("hang-S3") {
+		for_each_combination(regions, 1, set) {
+			sub_name = memregion_dynamic_subtest_name(regions);
+			region = igt_collection_get_value(regions, 0);
+			igt_dynamic_f("%s", sub_name)
+				run_test(fd, intel_ctx_0(fd), 0, SUSPEND | HANG, region);
+			free(sub_name);
+		}
+	}
 
-	igt_subtest("power-S0")
-		power_test(fd, intel_ctx_0(fd), 0, IDLE);
-	igt_subtest("power-S3")
-		power_test(fd, intel_ctx_0(fd), 0, SUSPEND);
+	igt_subtest_with_dynamic("hang-S4") {
+		for_each_combination(regions, 1, set) {
+			sub_name = memregion_dynamic_subtest_name(regions);
+			region = igt_collection_get_value(regions, 0);
+			igt_dynamic_f("%s", sub_name)
+				run_test(fd, intel_ctx_0(fd), 0, HIBERNATE | HANG, region);
+			free(sub_name);
+		}
+	}
+
+	igt_subtest_with_dynamic("power-S0") {
+		for_each_combination(regions, 1, set) {
+			sub_name = memregion_dynamic_subtest_name(regions);
+			region = igt_collection_get_value(regions, 0);
+			igt_dynamic_f("%s", sub_name)
+				power_test(fd, intel_ctx_0(fd), 0, IDLE, region);
+			free(sub_name);
+		}
+	}
+
+	igt_subtest_with_dynamic("power-S3") {
+		for_each_combination(regions, 1, set) {
+			sub_name = memregion_dynamic_subtest_name(regions);
+			region = igt_collection_get_value(regions, 0);
+			igt_dynamic_f("%s", sub_name)
+				power_test(fd, intel_ctx_0(fd), 0, SUSPEND, region);
+			free(sub_name);
+		}
+	}
 
 	igt_fixture {
+		free(query_info);
+		igt_collection_destroy(set);
 		igt_disallow_hang(fd, hang);
 		intel_ctx_destroy(fd, ctx);
 		close(fd);
-- 
2.32.0
