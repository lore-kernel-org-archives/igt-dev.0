Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39397899DC
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Aug 2021 13:09:11 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon,  9 Aug 2021 15:05:05 +0200
Message-Id: <20210809130533.27759-38-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210809130533.27759-1-zbigniew.kempczynski@intel.com>
References: <20210809130533.27759-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 37/65] tests/gem_tiled_fence_blits: Adopt
 to use allocator
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
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, Petri Latvala <petri.latvala@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

For newer gens we're not able to rely on relocations. Adopt to use
offsets acquired from the allocator.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_tiled_fence_blits.c | 65 ++++++++++++++++++++++--------
 1 file changed, 48 insertions(+), 17 deletions(-)

diff --git a/tests/i915/gem_tiled_fence_blits.c b/tests/i915/gem_tiled_fence_blits.c
index 6ce3a38d9..9ea61f110 100644
--- a/tests/i915/gem_tiled_fence_blits.c
+++ b/tests/i915/gem_tiled_fence_blits.c
@@ -86,18 +86,18 @@ static void check_bo(int fd, uint32_t handle, uint32_t start_val)
 	}
 }
 
-static uint32_t
-create_batch(int fd, struct drm_i915_gem_relocation_entry *reloc)
+static void
+update_batch(int fd, uint32_t bb_handle,
+	     struct drm_i915_gem_relocation_entry *reloc,
+	     uint64_t dst_offset, uint64_t src_offset)
 {
 	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
 	const bool has_64b_reloc = gen >= 8;
 	uint32_t *batch;
-	uint32_t handle;
 	uint32_t pitch;
 	int i = 0;
 
-	handle = gem_create(fd, 4096);
-	batch = gem_mmap__cpu(fd, handle, 0, 4096, PROT_WRITE);
+	batch = gem_mmap__cpu(fd, bb_handle, 0, 4096, PROT_WRITE);
 
 	batch[i] = (XY_SRC_COPY_BLT_CMD |
 		    XY_SRC_COPY_BLT_WRITE_ALPHA |
@@ -117,22 +117,20 @@ create_batch(int fd, struct drm_i915_gem_relocation_entry *reloc)
 	reloc[0].offset = sizeof(*batch) * i;
 	reloc[0].read_domains = I915_GEM_DOMAIN_RENDER;
 	reloc[0].write_domain = I915_GEM_DOMAIN_RENDER;
-	batch[i++] = 0;
+	batch[i++] = dst_offset;
 	if (has_64b_reloc)
-		batch[i++] = 0;
+		batch[i++] = dst_offset >> 32;
 
 	batch[i++] = 0; /* src (x1, y1) */
 	batch[i++] = pitch;
 	reloc[1].offset = sizeof(*batch) * i;
 	reloc[1].read_domains = I915_GEM_DOMAIN_RENDER;
-	batch[i++] = 0;
+	batch[i++] = src_offset;
 	if (has_64b_reloc)
-		batch[i++] = 0;
+		batch[i++] = src_offset >> 32;
 
 	batch[i++] = MI_BATCH_BUFFER_END;
 	munmap(batch, 4096);
-
-	return handle;
 }
 
 static void xchg_u32(void *array, unsigned i, unsigned j)
@@ -144,7 +142,7 @@ static void xchg_u32(void *array, unsigned i, unsigned j)
 	base[j] = tmp;
 }
 
-static void run_test(int fd, int count)
+static void run_test(int fd, int count, uint64_t end)
 {
 	struct drm_i915_gem_relocation_entry reloc[2];
 	struct drm_i915_gem_exec_object2 obj[3];
@@ -152,14 +150,27 @@ static void run_test(int fd, int count)
 	uint32_t *src_order, *dst_order;
 	uint32_t *bo, *bo_start_val;
 	uint32_t start = 0;
+	uint64_t ahnd = 0;
 
+	if (!gem_has_relocations(fd))
+		ahnd = intel_allocator_open_full(fd, 0, 0, end,
+						 INTEL_ALLOCATOR_RELOC,
+						 ALLOC_STRATEGY_LOW_TO_HIGH);
 	memset(reloc, 0, sizeof(reloc));
 	memset(obj, 0, sizeof(obj));
 	obj[0].flags = EXEC_OBJECT_NEEDS_FENCE;
 	obj[1].flags = EXEC_OBJECT_NEEDS_FENCE;
-	obj[2].handle = create_batch(fd, reloc);
+	obj[2].handle = gem_create(fd, 4096);
+	obj[2].offset = get_offset(ahnd, obj[2].handle, 4096, 0);
+	if (ahnd) {
+		obj[0].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE;
+		obj[1].flags |= EXEC_OBJECT_PINNED;
+		obj[2].flags |= EXEC_OBJECT_PINNED;
+	}
 	obj[2].relocs_ptr = to_user_pointer(reloc);
-	obj[2].relocation_count = ARRAY_SIZE(reloc);
+	obj[2].relocation_count = !ahnd ? ARRAY_SIZE(reloc) : 0;
+	update_batch(fd, obj[2].handle, reloc,
+		     obj[0].offset, obj[1].offset);
 
 	memset(&eb, 0, sizeof(eb));
 	eb.buffers_ptr = to_user_pointer(obj);
@@ -198,7 +209,23 @@ static void run_test(int fd, int count)
 			reloc[0].target_handle = obj[0].handle = bo[dst];
 			reloc[1].target_handle = obj[1].handle = bo[src];
 
+			if (ahnd) {
+				obj[0].offset = get_offset(ahnd, obj[0].handle,
+						sizeof(linear), 0);
+				obj[1].offset = get_offset(ahnd, obj[1].handle,
+						sizeof(linear), 0);
+				obj[2].offset = get_offset(ahnd, obj[2].handle,
+						4096, 0);
+				update_batch(fd, obj[2].handle, reloc,
+					     obj[0].offset, obj[1].offset);
+			}
+
 			gem_execbuf(fd, &eb);
+			if (ahnd) {
+				gem_close(fd, obj[2].handle);
+				obj[2].handle = gem_create(fd, 4096);
+			}
+
 			bo_start_val[dst] = bo_start_val[src];
 		}
 	}
@@ -210,6 +237,7 @@ static void run_test(int fd, int count)
 	free(bo);
 
 	gem_close(fd, obj[2].handle);
+	put_ahnd(ahnd);
 }
 
 #define MAX_32b ((1ull << 32) - 4096)
@@ -217,7 +245,7 @@ static void run_test(int fd, int count)
 igt_main
 {
 	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
-	uint64_t count = 0;
+	uint64_t count = 0, end;
 	int fd;
 
 	igt_fixture {
@@ -229,6 +257,7 @@ igt_main
 		count = gem_mappable_aperture_size(fd); /* thrash fences! */
 		if (count >> 32)
 			count = MAX_32b;
+		end = count;
 		count = 3 + count / (1024 * 1024);
 		igt_require(count > 1);
 		intel_require_memory(count, 1024 * 1024 , CHECK_RAM);
@@ -238,12 +267,14 @@ igt_main
 	}
 
 	igt_subtest("basic")
-		run_test (fd, 2);
+		run_test(fd, 2, end);
 
 	igt_subtest("normal") {
+		intel_allocator_multiprocess_start();
 		igt_fork(child, ncpus)
-			run_test(fd, count);
+			run_test(fd, count, end);
 		igt_waitchildren();
+		intel_allocator_multiprocess_stop();
 	}
 
 	igt_fixture
-- 
2.26.0
