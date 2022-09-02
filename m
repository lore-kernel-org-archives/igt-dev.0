Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1843C10E78A
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Sep 2022 07:52:42 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  2 Sep 2022 09:52:18 +0200
Message-Id: <20220902075227.50690-4-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220902075227.50690-1-zbigniew.kempczynski@intel.com>
References: <20220902075227.50690-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 03/12] i915/gem_create: Verify all
 regions return cleared objects
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

From: Chris Wilson <chris.p.wilson@intel.com>

We do not tolerate leaking stale information in newly created objects, so
make sure the test covers all memory regions.

Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/i915/gem_create.c | 99 +++++++++++++++++++++++++++++++----------
 1 file changed, 76 insertions(+), 23 deletions(-)

diff --git a/tests/i915/gem_create.c b/tests/i915/gem_create.c
index d7d2a01722..114c1c7c9b 100644
--- a/tests/i915/gem_create.c
+++ b/tests/i915/gem_create.c
@@ -59,6 +59,7 @@
 #include "i915/gem_create.h"
 #include "i915/gem_engine_topology.h"
 #include "i915/gem_mman.h"
+#include "i915/intel_memory_region.h"
 #include "i915_drm.h"
 
 IGT_TEST_DESCRIPTION("Ensure that basic gem_create and gem_create_ext works"
@@ -145,45 +146,87 @@ static uint64_t get_npages(_Atomic(uint64_t) *global, uint64_t npages)
 
 struct thread_clear {
 	_Atomic(uint64_t) max;
+	struct drm_i915_gem_memory_class_instance region;
 	int timeout;
 	int i915;
 };
 
+static uint32_t batch_create(int i915)
+{
+	const uint32_t bbe = MI_BATCH_BUFFER_END;
+	uint32_t handle = gem_create(i915, sizeof(bbe));
+
+	gem_write(i915, handle, 0, &bbe, sizeof(bbe));
+	return handle;
+}
+
+static void make_resident(int i915, uint32_t batch, uint32_t handle)
+{
+	struct drm_i915_gem_exec_object2 obj[2] = {
+		[0] = {
+			.handle = handle,
+			.flags = EXEC_OBJECT_SUPPORTS_48B_ADDRESS,
+		},
+		[1] = {
+			.handle = batch ?: batch_create(i915),
+			.flags = EXEC_OBJECT_SUPPORTS_48B_ADDRESS,
+		},
+	};
+	struct drm_i915_gem_execbuffer2 eb = {
+		.buffers_ptr = to_user_pointer(obj),
+		.buffer_count = ARRAY_SIZE(obj),
+	};
+	int err;
+
+	err = __gem_execbuf(i915, &eb);
+	if (obj[1].handle != batch)
+		gem_close(i915, obj[1].handle);
+
+	igt_assert(err == 0 || err == -E2BIG || err == -ENOSPC);
+}
+
 static void *thread_clear(void *data)
 {
 	struct thread_clear *arg = data;
 	unsigned long checked = 0, total = 0;
-	enum { PRW, GTT, WC, WB, __LAST__ } mode = PRW;
+	enum { PRW, GTT, WC, WB, __LAST__, FIXED } mode = PRW;
 	int i915 = arg->i915;
+	uint32_t batch = batch_create(i915);
+
+	if (__gem_write(i915, 0, 0, 0, 0) == -EOPNOTSUPP)
+		mode = FIXED;
 
 	igt_until_timeout(arg->timeout) {
-		struct drm_i915_gem_create create = {};
-		uint64_t npages;
+		uint64_t npages, size;
+		uint32_t handle;
 		void *ptr;
 
 		npages = random();
 		npages <<= 32;
 		npages |= random();
 		npages = get_npages(&arg->max, npages);
-		create.size = npages << 12;
+		size = npages << 12;
+
+		igt_assert_eq(__gem_create_in_memory_region_list(i915, &handle, &size, 0, &arg->region, 1), 0);
+		if (random() & 1)
+			make_resident(i915, batch, handle);
 
-		create_ioctl(i915, &create);
 		switch (mode) {
+		case FIXED:
+			ptr = __gem_mmap_offset__fixed(i915, handle, 0, size, PROT_READ);
+			break;
 		case __LAST__:
 		case PRW:
 			ptr = NULL;
 			break;
 		case WB:
-			ptr = __gem_mmap__cpu(i915, create.handle,
-					      0, create.size, PROT_READ);
+			ptr = __gem_mmap__cpu(i915, handle, 0, size, PROT_READ);
 			break;
 		case WC:
-			ptr = __gem_mmap__wc(i915, create.handle,
-					     0, create.size, PROT_READ);
+			ptr = __gem_mmap__wc(i915, handle, 0, size, PROT_READ);
 			break;
 		case GTT:
-			ptr = __gem_mmap__gtt(i915, create.handle,
-					      create.size, PROT_READ);
+			ptr = __gem_mmap__gtt(i915, handle, size, PROT_READ);
 			break;
 		}
 		/* No set-domains as we are being as naughty as possible */
@@ -195,7 +238,7 @@ static void *thread_clear(void *data)
 			};
 
 			if (!ptr)
-				gem_read(i915, create.handle, x[0], x, sizeof(x));
+				gem_read(i915, handle, x[0], x, sizeof(x));
 			else if (page & 1)
 				igt_memcpy_from_wc(x, ptr + x[0], sizeof(x));
 			else
@@ -207,26 +250,28 @@ static void *thread_clear(void *data)
 			checked++;
 		}
 		if (ptr)
-			munmap(ptr, create.size);
-		gem_close(i915, create.handle);
+			munmap(ptr, size);
+		gem_close(i915, handle);
 
 		total += npages;
 		atomic_fetch_add(&arg->max, npages);
 
-		if (++mode == __LAST__)
+		if (mode < __LAST__ && ++mode == __LAST__)
 			mode = PRW;
 	}
+	gem_close(i915, batch);
 
 	igt_info("Checked %'lu / %'lu pages\n", checked, total);
 	return (void *)(uintptr_t)checked;
 }
 
-static void always_clear(int i915, int timeout)
+static void always_clear(int i915, const struct gem_memory_region *r, int timeout)
 {
 	struct thread_clear arg = {
 		.i915 = i915,
+		.region = r->ci,
+		.max = r->size / 2 >> 12, /* in pages */
 		.timeout = timeout,
-		.max = igt_get_avail_ram_mb() << (20 - 12), /* in pages */
 	};
 	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
 	unsigned long checked;
@@ -244,7 +289,7 @@ static void always_clear(int i915, int timeout)
 	igt_info("Checked %'lu page allocations\n", checked);
 }
 
-static void busy_create(int i915, int timeout)
+static void busy_create(int i915, const struct gem_memory_region *r, int timeout)
 {
 	struct intel_execution_engine2 *e;
 	const intel_ctx_t *ctx;
@@ -267,7 +312,7 @@ static void busy_create(int i915, int timeout)
 			uint32_t handle;
 			igt_spin_t *next;
 
-			handle = gem_create(i915, 4096);
+			handle = gem_create_in_memory_region_list(i915, 4096, 0, &r->ci, 1);
 			next = igt_spin_new(i915,
 					    .ahnd = ahnd,
 					    .ctx = ctx,
@@ -808,12 +853,20 @@ igt_main
 		size_update(fd);
 
 	igt_describe("Verify that all new objects are clear.");
-	igt_subtest("create-clear")
-		always_clear(fd, 30);
+	igt_subtest_with_dynamic("create-clear") {
+		for_each_memory_region(r, fd) {
+			igt_dynamic_f("%s", r->name)
+				always_clear(fd, r, 30);
+		}
+	}
 
 	igt_describe("Create buffer objects while GPU is busy.");
-	igt_subtest("busy-create")
-		busy_create(fd, 30);
+	igt_subtest_with_dynamic("busy-create") {
+		for_each_memory_region(r, fd) {
+			igt_dynamic_f("%s", r->name)
+				busy_create(fd, r, 30);
+		}
+	}
 
 	igt_describe("Exercise create_ext placements extension.");
 	igt_subtest("create-ext-placement-sanity-check")
-- 
2.34.1
