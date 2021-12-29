Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 562D310E1CC
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Dec 2021 13:57:57 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Wed, 29 Dec 2021 14:57:41 +0100
Message-Id: <20211229135742.37177-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20211229135742.37177-1-zbigniew.kempczynski@intel.com>
References: <20211229135742.37177-1-zbigniew.kempczynski@intel.com>
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

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_softpin.c | 70 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/tests/i915/gem_softpin.c b/tests/i915/gem_softpin.c
index d085dea34..0c5934fef 100644
--- a/tests/i915/gem_softpin.c
+++ b/tests/i915/gem_softpin.c
@@ -1072,6 +1072,66 @@ static void test_allocator_evict(int fd, const intel_ctx_t *ctx,
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
+	uint32_t shandle, lhandle;
+	uint64_t alignment, soffset, loffset, ssize = 4096, lsize = 4096;
+
+	igt_assert(__gem_create_in_memory_regions(i915, &shandle, &ssize, REGION_SMEM) == 0);
+	igt_assert(shandle);
+	make_batch(i915, shandle, ssize);
+	igt_assert(__gem_create_in_memory_regions(i915, &lhandle, &lsize, REGION_LMEM(0)) == 0);
+	igt_assert(lhandle);
+	make_batch(i915, lhandle, lsize);
+
+	soffset = gem_get_start_offset_for_region(i915, REGION_SMEM);
+	loffset = gem_get_start_offset_for_region(i915, REGION_LMEM(0));
+	alignment = gem_get_safe_alignment(i915);
+	igt_debug("safe alignment: %llx\n", (long long) alignment);
+	igt_debug("safe start offset: %llx\n",
+		  (long long) gem_get_safe_start_offset(i915));
+	igt_debug("minimum smem start offset: %llx\n", (long long) soffset);
+	igt_debug("minimum lmem start offset: %llx\n", (long long) loffset);
+
+	execbuf.buffer_count = 2;
+	execbuf.buffers_ptr = to_user_pointer(obj);
+
+	obj[0].offset = soffset;
+	obj[0].flags = EXEC_OBJECT_PINNED;
+	obj[0].handle = shandle;
+	obj[1].offset = max(ALIGN(soffset + ssize, alignment), loffset);
+	obj[1].flags = EXEC_OBJECT_PINNED;
+	obj[1].handle = lhandle;
+	igt_debug("obj[0].offset: %llx, handle: %u\n", obj[0].offset, obj[0].handle);
+	igt_debug("obj[1].offset: %llx, handle: %u\n", obj[1].offset, obj[1].handle);
+	gem_execbuf(i915, &execbuf);
+
+	execbuf.flags = I915_EXEC_BATCH_FIRST;
+	gem_execbuf(i915, &execbuf);
+
+	obj[0].offset = loffset;
+	obj[0].flags = EXEC_OBJECT_PINNED;
+	obj[0].handle = lhandle;
+	obj[1].offset = max(ALIGN(loffset + lsize, alignment), soffset);
+	obj[1].flags = EXEC_OBJECT_PINNED;
+	obj[1].handle = shandle;
+	igt_debug("obj[0].offset: %llx, handle: %u\n", obj[0].offset, obj[0].handle);
+	igt_debug("obj[1].offset: %llx, handle: %u\n", obj[1].offset, obj[1].handle);
+	gem_execbuf(i915, &execbuf);
+
+	execbuf.flags = 0;
+	gem_execbuf(i915, &execbuf);
+}
+
 #define test_each_engine(T, i915, ctx, e) \
 	igt_subtest_with_dynamic(T) for_each_ctx_engine(i915, ctx, e) \
 		igt_dynamic_f("%s", e->name)
@@ -1133,6 +1193,16 @@ igt_main
 			test_allocator_evict(fd, ctx, ALL_ENGINES, 20);
 	}
 
+	igt_subtest_group {
+		igt_fixture {
+			igt_require(gem_has_lmem(fd));
+		}
+
+		igt_describe("Check start offset and alignment detection");
+		igt_subtest("safe-alignment")
+			safe_alignment(fd);
+	}
+
 	igt_subtest("softpin")
 		test_softpin(fd);
 	igt_subtest("overlap")
-- 
2.32.0
