Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C616EBA5
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Aug 2021 09:48:16 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri,  6 Aug 2021 11:46:33 +0200
Message-Id: <20210806094649.21162-41-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210806094649.21162-1-zbigniew.kempczynski@intel.com>
References: <20210806094649.21162-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 40/56] tests/gem_userptr_blits: Adopt to
 use allocator
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
---
 tests/i915/gem_userptr_blits.c | 44 +++++++++++++++++++++++++++-------
 1 file changed, 35 insertions(+), 9 deletions(-)

diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blits.c
index 532298dce..756bd6e47 100644
--- a/tests/i915/gem_userptr_blits.c
+++ b/tests/i915/gem_userptr_blits.c
@@ -100,6 +100,12 @@ static int copy(int fd, uint32_t dst, uint32_t src)
 	struct drm_i915_gem_execbuffer2 exec;
 	uint32_t handle;
 	int ret, i=0;
+	uint64_t dst_offset, src_offset, bb_offset;
+	bool has_relocs = gem_has_relocations(fd);
+
+	bb_offset = 16 << 20;
+	dst_offset = bb_offset + 4096;
+	src_offset = dst_offset + WIDTH * HEIGHT * sizeof(uint32_t) * (src != dst);
 
 	batch[i++] = XY_SRC_COPY_BLT_CMD |
 		  XY_SRC_COPY_BLT_WRITE_ALPHA |
@@ -114,14 +120,14 @@ static int copy(int fd, uint32_t dst, uint32_t src)
 		  WIDTH*4;
 	batch[i++] = 0; /* dst x1,y1 */
 	batch[i++] = (HEIGHT << 16) | WIDTH; /* dst x2,y2 */
-	batch[i++] = 0; /* dst reloc */
+	batch[i++] = dst_offset; /* dst reloc */
 	if (intel_gen(intel_get_drm_devid(fd)) >= 8)
-		batch[i++] = 0;
+		batch[i++] = dst_offset >> 32;
 	batch[i++] = 0; /* src x1,y1 */
 	batch[i++] = WIDTH*4;
-	batch[i++] = 0; /* src reloc */
+	batch[i++] = src_offset; /* src reloc */
 	if (intel_gen(intel_get_drm_devid(fd)) >= 8)
-		batch[i++] = 0;
+		batch[i++] = src_offset >> 32;
 	batch[i++] = MI_BATCH_BUFFER_END;
 	batch[i++] = MI_NOOP;
 
@@ -148,19 +154,28 @@ static int copy(int fd, uint32_t dst, uint32_t src)
 	memset(obj, 0, sizeof(obj));
 
 	obj[exec.buffer_count].handle = dst;
+	obj[exec.buffer_count].offset = dst_offset;
 	obj[exec.buffer_count].flags = EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
+	if (!has_relocs)
+		obj[exec.buffer_count].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE;
 	exec.buffer_count++;
 
 	if (src != dst) {
 		obj[exec.buffer_count].handle = src;
+		obj[exec.buffer_count].offset = src_offset;
 		obj[exec.buffer_count].flags = EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
+		if (!has_relocs)
+			obj[exec.buffer_count].flags |= EXEC_OBJECT_PINNED;
 		exec.buffer_count++;
 	}
 
 	obj[exec.buffer_count].handle = handle;
-	obj[exec.buffer_count].relocation_count = 2;
+	obj[exec.buffer_count].offset = bb_offset;
+	obj[exec.buffer_count].relocation_count = has_relocs ? 2 : 0;
 	obj[exec.buffer_count].relocs_ptr = to_user_pointer(reloc);
 	obj[exec.buffer_count].flags = EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
+	if (!has_relocs)
+		obj[exec.buffer_count].flags |= EXEC_OBJECT_PINNED;
 	exec.buffer_count++;
 	exec.buffers_ptr = to_user_pointer(obj);
 	exec.flags = HAS_BLT_RING(intel_get_drm_devid(fd)) ? I915_EXEC_BLT : 0;
@@ -588,6 +603,7 @@ static void test_nohangcheck_hostile(int i915)
 	int fence = -1;
 	int err = 0;
 	int dir;
+	uint64_t ahnd;
 
 	/*
 	 * Even if the user disables hangcheck, we must still recover.
@@ -602,6 +618,7 @@ static void test_nohangcheck_hostile(int i915)
 	ctx = intel_ctx_create_all_physical(i915);
 	hang = igt_allow_hang(i915, ctx->id, 0);
 	igt_require(__enable_hangcheck(dir, false));
+	ahnd = get_reloc_ahnd(i915, ctx->id);
 
 	for_each_ctx_engine(i915, ctx, e) {
 		igt_spin_t *spin;
@@ -611,7 +628,7 @@ static void test_nohangcheck_hostile(int i915)
 		gem_engine_property_printf(i915, e->name,
 					   "preempt_timeout_ms", "%d", 50);
 
-		spin = __igt_spin_new(i915, .ctx = ctx,
+		spin = __igt_spin_new(i915, .ahnd = ahnd, .ctx = ctx,
 				      .engine = e->flags,
 				      .flags = (IGT_SPIN_NO_PREEMPTION |
 						IGT_SPIN_USERPTR |
@@ -634,6 +651,7 @@ static void test_nohangcheck_hostile(int i915)
 		}
 	}
 	intel_ctx_destroy(i915, ctx);
+	put_ahnd(ahnd);
 	igt_assert(fence != -1);
 
 	if (sync_fence_wait(fence, MSEC_PER_SEC)) { /* 640ms preempt-timeout */
@@ -690,13 +708,15 @@ static void test_vma_merge(int i915)
 	igt_spin_t *spin;
 	uint32_t handle;
 	void *addr;
+	uint64_t ahnd = get_reloc_ahnd(i915, 0);
 
 	addr = mmap(NULL, sz, PROT_READ | PROT_WRITE,
 		    MAP_SHARED | MAP_ANONYMOUS, -1, 0);
 
 	gem_userptr(i915, addr + sz / 2, 4096, 0, userptr_flags, &handle);
 
-	spin = igt_spin_new(i915, .dependency = handle, .flags = IGT_SPIN_FENCE_OUT);
+	spin = igt_spin_new(i915, .ahnd = ahnd, .dependency = handle,
+			    .flags = IGT_SPIN_FENCE_OUT);
 	igt_assert(gem_bo_busy(i915, handle));
 
 	for (size_t x = 0; x < sz; x += 4096) {
@@ -716,6 +736,7 @@ static void test_vma_merge(int i915)
 	gem_sync(i915, spin->handle);
 	igt_assert_eq(sync_fence_status(spin->out_fence), 1);
 	igt_spin_free(i915, spin);
+	put_ahnd(ahnd);
 }
 
 static void test_huge_split(int i915)
@@ -725,6 +746,7 @@ static void test_huge_split(int i915)
 	igt_spin_t *spin;
 	uint32_t handle;
 	void *addr;
+	uint64_t ahnd = get_reloc_ahnd(i915, 0);
 
 	flags = MFD_HUGETLB;
 #if defined(MFD_HUGE_2MB)
@@ -749,7 +771,8 @@ static void test_huge_split(int i915)
 	madvise(addr, sz, MADV_HUGEPAGE);
 
 	gem_userptr(i915, addr + sz / 2 - 4096, 8192, 0, userptr_flags, &handle);
-	spin = igt_spin_new(i915, .dependency = handle, .flags = IGT_SPIN_FENCE_OUT);
+	spin = igt_spin_new(i915, .ahnd = ahnd, .dependency = handle,
+			    .flags = IGT_SPIN_FENCE_OUT);
 	igt_assert(gem_bo_busy(i915, handle));
 
 	igt_assert(mmap(addr, 4096, PROT_READ,
@@ -767,6 +790,7 @@ static void test_huge_split(int i915)
 	gem_sync(i915, spin->handle);
 	igt_assert_eq(sync_fence_status(spin->out_fence), 1);
 	igt_spin_free(i915, spin);
+	put_ahnd(ahnd);
 }
 
 static int test_access_control(int fd)
@@ -2353,8 +2377,10 @@ igt_main_args("c:", NULL, help_str, opt_handler, NULL)
 		igt_subtest("userfault")
 			test_userfault(fd);
 
-		igt_subtest("relocations")
+		igt_subtest("relocations") {
+			igt_require(gem_has_relocations(fd));
 			test_relocations(fd);
+		}
 	}
 
 	igt_subtest_group {
-- 
2.26.0
