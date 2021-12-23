Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C22210E272
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Dec 2021 05:13:39 +0000 (UTC)
From: sai.gowtham.ch@intel.com
Date: Thu, 23 Dec 2021 10:37:21 +0530
Message-Id: <20211223050721.30926-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_exec_capture: Add support
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
 tests/i915/gem_exec_capture.c | 41 +++++++++++++++++++++++++----------
 1 file changed, 29 insertions(+), 12 deletions(-)

diff --git a/tests/i915/gem_exec_capture.c b/tests/i915/gem_exec_capture.c
index b80f597f..9beb36fc 100644
--- a/tests/i915/gem_exec_capture.c
+++ b/tests/i915/gem_exec_capture.c
@@ -243,7 +243,7 @@ static void wait_to_die(int fence_out)
 
 static void __capture1(int fd, int dir, uint64_t ahnd, const intel_ctx_t *ctx,
 		       const struct intel_execution_engine2 *e,
-		       uint32_t target, uint64_t target_size)
+		       uint32_t target, uint64_t target_size, uint32_t region)
 {
 	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
 	struct drm_i915_gem_exec_object2 obj[4];
@@ -260,13 +260,13 @@ static void __capture1(int fd, int dir, uint64_t ahnd, const intel_ctx_t *ctx,
 	configure_hangs(fd, e, ctx->id);
 
 	memset(obj, 0, sizeof(obj));
-	obj[SCRATCH].handle = gem_create(fd, 4096);
+	obj[SCRATCH].handle = gem_create_in_memory_regions(fd, 4096, region);
 	obj[SCRATCH].flags = EXEC_OBJECT_WRITE;
 	obj[CAPTURE].handle = target;
 	obj[CAPTURE].flags = EXEC_OBJECT_CAPTURE;
 	obj[NOCAPTURE].handle = gem_create(fd, 4096);
 
-	obj[BATCH].handle = gem_create(fd, 4096);
+	obj[BATCH].handle = gem_create_in_memory_regions(fd, 4096, region);
 	obj[BATCH].relocs_ptr = (uintptr_t)reloc;
 	obj[BATCH].relocation_count = !ahnd ? ARRAY_SIZE(reloc) : 0;
 
@@ -374,16 +374,16 @@ static void __capture1(int fd, int dir, uint64_t ahnd, const intel_ctx_t *ctx,
 }
 
 static void capture(int fd, int dir, const intel_ctx_t *ctx,
-		    const struct intel_execution_engine2 *e)
+		    const struct intel_execution_engine2 *e, uint32_t region)
 {
 	uint32_t handle;
 	uint64_t ahnd;
 	int obj_size = 4096;
 
-	handle = gem_create(fd, obj_size);
+	handle = gem_create_in_memory_regions(fd, obj_size, region);
 	ahnd = get_reloc_ahnd(fd, ctx->id);
 
-	__capture1(fd, dir, ahnd, ctx, e, handle, obj_size);
+	__capture1(fd, dir, ahnd, ctx, e, handle, obj_size, region);
 
 	gem_close(fd, handle);
 	put_ahnd(ahnd);
@@ -696,6 +696,7 @@ static void userptr(int fd, int dir)
 	uint64_t ahnd;
 	void *ptr;
 	int obj_size = 4096;
+	uint32_t system_region = INTEL_MEMORY_REGION_ID(I915_SYSTEM_MEMORY, 0);
 
 	find_first_available_engine(fd, ctx, e);
 
@@ -704,7 +705,7 @@ static void userptr(int fd, int dir)
 	igt_require(__gem_userptr(fd, ptr, obj_size, 0, 0, &handle) == 0);
 	ahnd = get_reloc_ahnd(fd, ctx->id);
 
-	__capture1(fd, dir, ahnd, ctx, e, handle, obj_size);
+	__capture1(fd, dir, ahnd, ctx, e, handle, obj_size, system_region);
 
 	gem_close(fd, handle);
 	put_ahnd(ahnd);
@@ -731,7 +732,6 @@ static size_t safer_strlen(const char *s)
 #define test_each_engine(T, i915, ctx, e) \
 	igt_subtest_with_dynamic(T) for_each_ctx_engine(i915, ctx, e) \
 		for_each_if(gem_class_can_store_dword(i915, (e)->class)) \
-			igt_dynamic_f("%s", (e)->name)
 
 igt_main
 {
@@ -740,6 +740,10 @@ igt_main
 	igt_hang_t hang;
 	int fd = -1;
 	int dir = -1;
+	struct drm_i915_query_memory_regions *query_info;
+	struct igt_collection *regions, *set;
+	char *sub_name;
+	uint32_t region;
 
 	igt_fixture {
 		int gen;
@@ -751,7 +755,7 @@ igt_main
 			igt_device_set_master(fd);
 
 		igt_require_gem(fd);
-		gem_require_mmap_wc(fd);
+		gem_require_mmap_device_coherent(fd);
 		igt_require(has_capture(fd));
 		ctx = intel_ctx_create_all_physical(fd);
 		igt_allow_hang(fd, ctx->id, HANG_ALLOW_CAPTURE | HANG_WANT_ENGINE_RESET);
@@ -759,10 +763,22 @@ igt_main
 		dir = igt_sysfs_open(fd);
 		igt_require(igt_sysfs_set(dir, "error", "Begone!"));
 		igt_require(safer_strlen(igt_sysfs_get(dir, "error")) > 0);
+		query_info = gem_get_query_memory_regions(fd);
+		igt_assert(query_info);
+		set = get_memory_region_set(query_info,
+				I915_SYSTEM_MEMORY,
+				I915_DEVICE_MEMORY);
 	}
 
-	test_each_engine("capture", fd, ctx, e)
-		capture(fd, dir, ctx, e);
+	test_each_engine("capture", fd, ctx, e) {
+		for_each_combination(regions, 1, set) {
+			sub_name = memregion_dynamic_subtest_name(regions);
+			region = igt_collection_get_value(regions, 0);
+			igt_dynamic_f("%s-%s", e->name, sub_name)
+				capture(fd, dir, ctx, e, region);
+			free(sub_name);
+		}
+	}
 
 	igt_subtest_f("many-4K-zero") {
 		igt_require(gem_can_store_dword(fd, 0));
@@ -797,7 +813,8 @@ igt_main
 	}
 
 	test_each_engine("pi", fd, ctx, e)
-		prioinv(fd, dir, ctx, e);
+		igt_dynamic_f("%s", (e)->name)
+			prioinv(fd, dir, ctx, e);
 
 	igt_fixture {
 		close(dir);
-- 
2.32.0
