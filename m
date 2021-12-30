Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA45A10E32A
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Dec 2021 08:14:38 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Thu, 30 Dec 2021 09:14:21 +0100
Message-Id: <20211230081422.11703-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20211230081422.11703-1-zbigniew.kempczynski@intel.com>
References: <20211230081422.11703-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/3] tests/i915/gem_softpin: Add
 safe-alignment test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Exercise start offset and alignment detection when we start mixing
system and local memory.

v2: support integrated and check smem <-> smem alignment

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_softpin.c | 66 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/tests/i915/gem_softpin.c b/tests/i915/gem_softpin.c
index d085dea34..02a78c6a3 100644
--- a/tests/i915/gem_softpin.c
+++ b/tests/i915/gem_softpin.c
@@ -1072,6 +1072,68 @@ static void test_allocator_evict(int fd, const intel_ctx_t *ctx,
 	igt_assert_eq(intel_detect_and_clear_missed_interrupts(fd), 0);
 }
 
+static void make_batch(int i915, uint32_t handle, uint64_t size)
+{
+	uint32_t *bb = gem_mmap__device_coherent(i915, handle, 0, size, PROT_WRITE);
+	*bb = MI_BATCH_BUFFER_END;
+	munmap(bb, size);
+}
+
+static void safe_alignment(int i915)
+{
+	struct drm_i915_gem_execbuffer2 execbuf = {};
+	struct drm_i915_gem_exec_object2 obj[2] = {};
+	uint32_t handle1, handle2, region1, region2;
+	uint64_t alignment, offset1, offset2, size1 = 4096, size2 = 4096;
+
+	region1 = REGION_SMEM;
+	region2 = gem_has_lmem(i915) ? REGION_LMEM(0) : REGION_SMEM;
+	igt_assert(__gem_create_in_memory_regions(i915, &handle1, &size1, region1) == 0);
+	igt_assert(handle1);
+	make_batch(i915, handle1, 4096);
+	igt_assert(__gem_create_in_memory_regions(i915, &handle2, &size2, region2) == 0);
+	igt_assert(handle2);
+	make_batch(i915, handle2, 4096);
+
+	offset1 = gem_detect_min_start_offset_for_region(i915, region1);
+	offset2 = gem_detect_min_start_offset_for_region(i915, region2);
+	alignment = gem_detect_safe_alignment(i915);
+	igt_debug("safe alignment: %llx\n", (long long) alignment);
+	igt_debug("safe start offset: %llx\n",
+		  (long long) gem_detect_safe_start_offset(i915));
+	igt_debug("minimum object1 start offset: %llx\n", (long long) offset1);
+	igt_debug("minimum object2 start offset: %llx\n", (long long) offset2);
+
+	execbuf.buffer_count = 2;
+	execbuf.buffers_ptr = to_user_pointer(obj);
+
+	obj[0].offset = offset1;
+	obj[0].flags = EXEC_OBJECT_PINNED;
+	obj[0].handle = handle1;
+	obj[1].offset = max(ALIGN(offset1 + size1, alignment), offset2);
+	obj[1].flags = EXEC_OBJECT_PINNED;
+	obj[1].handle = handle2;
+	igt_debug("obj[0].offset: %llx, handle: %u\n", obj[0].offset, obj[0].handle);
+	igt_debug("obj[1].offset: %llx, handle: %u\n", obj[1].offset, obj[1].handle);
+
+	gem_execbuf(i915, &execbuf);
+	execbuf.flags = I915_EXEC_BATCH_FIRST;
+	gem_execbuf(i915, &execbuf);
+
+	obj[0].offset = offset2;
+	obj[0].flags = EXEC_OBJECT_PINNED;
+	obj[0].handle = handle2;
+	obj[1].offset = max(ALIGN(offset2 + size2, alignment), offset1);
+	obj[1].flags = EXEC_OBJECT_PINNED;
+	obj[1].handle = handle1;
+	igt_debug("obj[0].offset: %llx, handle: %u\n", obj[0].offset, obj[0].handle);
+	igt_debug("obj[1].offset: %llx, handle: %u\n", obj[1].offset, obj[1].handle);
+
+	gem_execbuf(i915, &execbuf);
+	execbuf.flags = 0;
+	gem_execbuf(i915, &execbuf);
+}
+
 #define test_each_engine(T, i915, ctx, e) \
 	igt_subtest_with_dynamic(T) for_each_ctx_engine(i915, ctx, e) \
 		igt_dynamic_f("%s", e->name)
@@ -1133,6 +1195,10 @@ igt_main
 			test_allocator_evict(fd, ctx, ALL_ENGINES, 20);
 	}
 
+	igt_describe("Check start offset and alignment detection");
+	igt_subtest("safe-alignment")
+		safe_alignment(fd);
+
 	igt_subtest("softpin")
 		test_softpin(fd);
 	igt_subtest("overlap")
-- 
2.32.0
