Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64CF010E5A2
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Apr 2022 17:18:13 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  4 Apr 2022 19:18:07 +0200
Message-Id: <20220404171807.355524-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_softpin: Exercise single
 offset eviction on all engines
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Test verifies does eviction works when all engines try to use same
offset for different handles. It replaces allocator-evict-all-engines
test because it simpler version of it.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 tests/i915/gem_softpin.c | 85 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 83 insertions(+), 2 deletions(-)

diff --git a/tests/i915/gem_softpin.c b/tests/i915/gem_softpin.c
index 34fc9983ff..5945317ed1 100644
--- a/tests/i915/gem_softpin.c
+++ b/tests/i915/gem_softpin.c
@@ -1072,6 +1072,87 @@ static void test_allocator_evict(int fd, const intel_ctx_t *ctx,
 	igt_assert_eq(intel_detect_and_clear_missed_interrupts(fd), 0);
 }
 
+static void single_offset_submit(int fd, struct drm_i915_gem_execbuffer2 *eb,
+				 struct batch *batches, unsigned int count)
+{
+	struct drm_i915_gem_exec_object2 obj;
+	uint64_t address = max_t(uint64_t, gem_detect_safe_start_offset(fd), 0x200000);
+
+	memset(&obj, 0, sizeof(obj));
+	obj.flags = EXEC_OBJECT_PINNED;
+
+	for (unsigned int i = 0; i < count; i++) {
+		obj.handle = batches[i].handle;
+		obj.offset = address;
+		eb->buffers_ptr = to_user_pointer(&obj);
+		gem_execbuf(fd, eb);
+	}
+}
+
+static void evict_single_offset(int fd, const intel_ctx_t *ctx, int timeout)
+{
+	struct drm_i915_gem_execbuffer2 execbuf;
+	struct intel_execution_engine2 *e;
+	unsigned int engines[I915_EXEC_RING_MASK + 1];
+	struct batch *batches;
+	unsigned int nengine;
+	unsigned int count;
+	uint64_t size;
+
+	nengine = 0;
+	for_each_ctx_engine(fd, ctx, e) {
+		engines[nengine++] = e->flags;
+	}
+	igt_require(nengine);
+
+	size = gem_aperture_size(fd);
+	if (size > 1ull<<32) /* Limit to 4GiB as we do not use allow-48b */
+		size = 1ull << 32;
+	igt_require(size < (1ull<<32) * BATCH_SIZE);
+
+	count = size / BATCH_SIZE + 1;
+	igt_debug("Using %'d batches to fill %'llu aperture on %d engines\n",
+		  count, (long long)size, nengine);
+
+	intel_require_memory(count, BATCH_SIZE, CHECK_RAM);
+	intel_detect_and_clear_missed_interrupts(fd);
+
+	memset(&execbuf, 0, sizeof(execbuf));
+	execbuf.buffer_count = 1;
+	execbuf.rsvd1 = ctx->id;
+
+	batches = calloc(count, sizeof(*batches));
+	igt_assert(batches);
+	for (unsigned int i = 0; i < count; i++) {
+		uint32_t *p;
+
+		batches[i].handle = gem_create(fd, BATCH_SIZE);
+		batches[i].ptr =
+			gem_mmap__device_coherent(fd, batches[i].handle,
+						  0, BATCH_SIZE, PROT_WRITE);
+		p = batches[i].ptr + BATCH_SIZE - 8;
+		*p = MI_BATCH_BUFFER_END;
+	}
+
+	/* Flush all memory before we start the timer */
+	single_offset_submit(fd, &execbuf, batches, count);
+
+	igt_fork(child, nengine) {
+		execbuf.flags |= engines[child];
+		igt_until_timeout(timeout)
+			single_offset_submit(fd, &execbuf, batches, count);
+	}
+	igt_waitchildren();
+
+	for (unsigned int i = 0; i < count; i++) {
+		munmap(batches[i].ptr, BATCH_SIZE);
+		gem_close(fd, batches[i].handle);
+	}
+	free(batches);
+
+	igt_assert_eq(intel_detect_and_clear_missed_interrupts(fd), 0);
+}
+
 static void make_batch(int i915, uint32_t handle, uint64_t size)
 {
 	uint32_t *bb = gem_mmap__device_coherent(i915, handle, 0, size, PROT_WRITE);
@@ -1212,8 +1293,8 @@ igt_main
 		test_each_engine("allocator-evict", fd, ctx, e)
 			test_allocator_evict(fd, ctx, e->flags, 20);
 
-		igt_subtest("allocator-evict-all-engines")
-			test_allocator_evict(fd, ctx, ALL_ENGINES, 20);
+		igt_subtest("evict-single-offset")
+			evict_single_offset(fd, ctx, 20);
 	}
 
 	igt_describe("Check start offset and alignment detection");
-- 
2.32.0
