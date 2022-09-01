Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2C6410E6C5
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Sep 2022 11:45:09 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  1 Sep 2022 13:44:36 +0200
Message-Id: <20220901114442.55071-7-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220901114442.55071-1-zbigniew.kempczynski@intel.com>
References: <20220901114442.55071-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 06/12] i915/gem_mmap_offset: Verify all
 regions return clear mmaps on cration
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
---
 tests/i915/gem_mmap_offset.c | 87 +++++++++++++++++++++++++-----------
 1 file changed, 60 insertions(+), 27 deletions(-)

diff --git a/tests/i915/gem_mmap_offset.c b/tests/i915/gem_mmap_offset.c
index d1075c32eb..faadbd4ee6 100644
--- a/tests/i915/gem_mmap_offset.c
+++ b/tests/i915/gem_mmap_offset.c
@@ -35,6 +35,7 @@
 
 #include "i915/gem.h"
 #include "i915/gem_create.h"
+#include "i915/intel_memory_region.h"
 #include "igt.h"
 #include "igt_x86.h"
 
@@ -75,6 +76,37 @@ __mmap_offset(int i915, uint32_t handle, uint64_t offset, uint64_t size,
 	return ptr;
 }
 
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
+
+	gem_execbuf(i915, &eb);
+	if (obj[1].handle != batch)
+		gem_close(i915, obj[1].handle);
+}
+
 static void bad_object(int i915)
 {
 	uint32_t real_handle;
@@ -529,44 +561,35 @@ static uint64_t get_npages(_Atomic(uint64_t) *global, uint64_t npages)
 
 struct thread_clear {
 	_Atomic(uint64_t) max;
+	struct drm_i915_gem_memory_class_instance region;
 	int timeout;
 	int i915;
 };
 
-static int create_ioctl(int i915, struct drm_i915_gem_create *create)
-{
-	int err = 0;
-
-	if (igt_ioctl(i915, DRM_IOCTL_I915_GEM_CREATE, create)) {
-		err = -errno;
-		igt_assume(err != 0);
-	}
-
-	errno = 0;
-	return err;
-}
-
 static void *thread_clear(void *data)
 {
 	struct thread_clear *arg = data;
 	const struct mmap_offset *t;
-	unsigned long checked = 0;
+	unsigned long checked = 0, total = 0;
 	int i915 = arg->i915;
+	uint32_t batch = batch_create(i915);
 
 	t = mmap_offset_types;
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
 
-		create_ioctl(i915, &create);
-		ptr = __mmap_offset(i915, create.handle, 0, create.size,
+		igt_assert_eq(__gem_create_in_memory_region_list(i915, &handle, &size, 0, &arg->region, 1), 0);
+		make_resident(i915, batch, handle);
+
+		ptr = __mmap_offset(i915, handle, 0, size,
 				    PROT_READ | PROT_WRITE,
 				    t->type);
 		/* No set-domains as we are being as naughty as possible */
@@ -584,26 +607,32 @@ static void *thread_clear(void *data)
 			for (int i = 0; i < ARRAY_SIZE(x); i++)
 				igt_assert_eq_u64(x[i], 0);
 		}
-		if (ptr)
-			munmap(ptr, create.size);
-		gem_close(i915, create.handle);
-		checked += npages;
+		if (ptr) {
+			munmap(ptr, size);
+			checked += npages;
+		}
+		gem_close(i915, handle);
 
+		total += npages;
 		atomic_fetch_add(&arg->max, npages);
 
 		if (!(++t)->name)
 			t = mmap_offset_types;
 	}
 
+	gem_close(i915, batch);
+
+	igt_info("Checked %'lu / %'lu pages\n", checked, total);
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
@@ -750,8 +779,12 @@ igt_main
 	igt_subtest_f("open-flood")
 		open_flood(i915, 20);
 
-	igt_subtest_f("clear")
-		always_clear(i915, 20);
+	igt_subtest_with_dynamic("clear") {
+		for_each_memory_region(r, i915) {
+			igt_dynamic_f("%s", r->name)
+				always_clear(i915, r, 20);
+		}
+	}
 
 	igt_subtest_f("blt-coherency")
 		blt_coherency(i915);
-- 
2.34.1
