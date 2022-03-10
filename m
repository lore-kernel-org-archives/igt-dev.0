Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A33F510F256
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Mar 2022 07:15:49 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 10 Mar 2022 08:15:25 +0100
Message-Id: <20220310071529.61930-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220310071529.61930-1-zbigniew.kempczynski@intel.com>
References: <20220310071529.61930-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/6] tests/api_intel_allocator: Verify
 gem-pool is working as expected
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

Simple check which acquires buffer objects from gem-pool. It verifies:
- object reuse (previously created is completed in execbuf)
- object creation (submitting batches when spinner is executing).

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/i915/api_intel_allocator.c | 58 ++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/tests/i915/api_intel_allocator.c b/tests/i915/api_intel_allocator.c
index a652caf4ec..a7929e9b13 100644
--- a/tests/i915/api_intel_allocator.c
+++ b/tests/i915/api_intel_allocator.c
@@ -692,6 +692,60 @@ static void fork_reopen_allocator(int fd, uint8_t type)
 	intel_allocator_multiprocess_stop();
 }
 
+static uint32_t single_exec_from_pool(int i915, uint64_t ahnd, uint64_t size)
+{
+	struct drm_i915_gem_execbuffer2 execbuf = {};
+	struct drm_i915_gem_exec_object2 obj = {};
+	uint32_t bb = gem_create_from_pool(i915, &size, REGION_SMEM);
+	uint32_t *bbptr;
+
+	bbptr = gem_mmap__device_coherent(i915, bb, 0, size, PROT_WRITE);
+	*bbptr = MI_BATCH_BUFFER_END;
+	gem_munmap(bbptr, size);
+	obj.offset = get_offset(ahnd, bb, size, 0);
+	if (ahnd)
+		obj.flags = EXEC_OBJECT_PINNED;
+	obj.handle = bb;
+	execbuf.buffer_count = 1;
+	execbuf.buffers_ptr = to_user_pointer(&obj);
+	gem_execbuf(i915, &execbuf);
+
+	return bb;
+}
+
+static void gem_pool(int i915)
+{
+	uint32_t bb[4];
+	uint64_t ahnd = get_reloc_ahnd(i915, 0);
+	igt_spin_t *spin;
+
+	bb[0] = single_exec_from_pool(i915, ahnd, 4096);
+	gem_sync(i915, bb[0]);
+	bb[1] = single_exec_from_pool(i915, ahnd, 4096);
+	igt_assert(bb[0] == bb[1]);
+
+	bb[2] = single_exec_from_pool(i915, ahnd, 8192);
+	gem_sync(i915, bb[2]);
+	bb[3] = single_exec_from_pool(i915, ahnd, 8192);
+	igt_assert(bb[2] == bb[3]);
+	igt_assert(bb[0] != bb[2]);
+
+	spin = igt_spin_new(i915,
+			    .ahnd = ahnd,
+			    .engine = I915_EXEC_DEFAULT);
+	bb[0] = single_exec_from_pool(i915, ahnd, 4096);
+	bb[1] = single_exec_from_pool(i915, ahnd, 4096);
+	bb[2] = single_exec_from_pool(i915, ahnd, 8192);
+	bb[3] = single_exec_from_pool(i915, ahnd, 8192);
+	igt_spin_free(i915, spin);
+	igt_assert(bb[0] != bb[1]);
+	igt_assert(bb[2] != bb[3]);
+
+	put_ahnd(ahnd);
+
+	gem_pool_dump();
+}
+
 struct allocators {
 	const char *name;
 	uint8_t type;
@@ -790,6 +844,10 @@ igt_main
 	igt_subtest_f("execbuf-with-allocator")
 		execbuf_with_allocator(fd);
 
+	igt_describe("Verifies creating and executing bb from gem pool");
+	igt_subtest_f("gem-pool")
+		gem_pool(fd);
+
 	igt_fixture
 		close(fd);
 }
-- 
2.32.0
