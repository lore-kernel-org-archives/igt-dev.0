Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC73210E03E
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Mar 2023 05:35:06 +0000 (UTC)
From: Vikas Srivastava <vikas.srivastava@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  2 Mar 2023 11:02:09 +0530
Message-Id: <20230302053209.69970-1-vikas.srivastava@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] tests/i915: skip gem_set_caching call for mtl
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

Call to gem_set_caching skips the test since i915_gem_set_caching_ioctl is
deprecated for MTL. To avoid this added the return value check for
0 or EOPNOTSUPP in __gem_set_caching.

FIXME: This is a temp solution to fix the IGT test issues where
set caching call is used , there is alternate API available
but support not yet available to use that.Once set_pat_index
support available need to bring that change replacing this one.

Signed-off-by: Vikas Srivastava <vikas.srivastava@intel.com>
---
 tests/i915/gem_caching.c            |  8 +++++---
 tests/i915/gem_exec_flush.c         | 10 ++++++----
 tests/i915/gem_exec_latency.c       |  4 +++-
 tests/i915/gem_exec_suspend.c       |  7 +++++--
 tests/i915/gem_render_tiled_blits.c |  5 +++--
 tests/i915/gem_softpin.c            |  4 +++-
 tests/i915/gem_userptr_blits.c      |  8 +++++---
 tests/i915/gem_workarounds.c        |  8 +++++---
 tests/i915/i915_pm_rpm.c            |  7 +++++--
 tests/prime_vgem.c                  |  4 +++-
 10 files changed, 43 insertions(+), 22 deletions(-)

diff --git a/tests/i915/gem_caching.c b/tests/i915/gem_caching.c
index eb0170abc..3f6576c47 100644
--- a/tests/i915/gem_caching.c
+++ b/tests/i915/gem_caching.c
@@ -136,7 +136,7 @@ igt_main
 	struct intel_bb *ibb;
 	data_t data = {0, };
 	unsigned flags = TEST_BOTH;
-	int i, j;
+	int i, j, ret;
 	uint8_t *cpu_ptr;
 	uint8_t *gtt_ptr;
 
@@ -163,8 +163,10 @@ igt_main
 		scratch_buf = intel_buf_create(data.bops, BO_SIZE/4, 1,
 					       32, 0, I915_TILING_NONE, 0);
 
-		if (!gem_has_lmem(data.fd))
-			gem_set_caching(data.fd, scratch_buf->handle, 1);
+		if (!gem_has_lmem(data.fd)) {
+			ret = __gem_set_caching(data.fd, scratch_buf->handle, 1);
+			igt_require(ret == 0 || ret == -EOPNOTSUPP);
+		}
 
 		staging_buf = intel_buf_create(data.bops, BO_SIZE/4, 1,
 					       32, 0, I915_TILING_NONE, 0);
diff --git a/tests/i915/gem_exec_flush.c b/tests/i915/gem_exec_flush.c
index 40c58db2b..bd9fe4cda 100644
--- a/tests/i915/gem_exec_flush.c
+++ b/tests/i915/gem_exec_flush.c
@@ -127,7 +127,7 @@ static void run(int fd, unsigned ring, int nchild, int timeout,
 		bool snoop = false;
 		uint32_t *ptr;
 		uint32_t *map;
-		int i;
+		int i, ret;
 		bool has_relocs = gem_has_relocations(fd);
 
 		memset(obj, 0, sizeof(obj));
@@ -142,7 +142,8 @@ static void run(int fd, unsigned ring, int nchild, int timeout,
 				       I915_GEM_DOMAIN_WC);
 		} else {
 			snoop = flags & COHERENT;
-			gem_set_caching(fd, obj[0].handle, snoop);
+			ret = __gem_set_caching(fd, obj[0].handle, snoop);
+			igt_require(ret == 0 || ret == -EOPNOTSUPP);
 			map = gem_mmap__cpu(fd, obj[0].handle, 0, 4096, PROT_WRITE);
 			gem_set_domain(fd, obj[0].handle,
 				       I915_GEM_DOMAIN_CPU,
@@ -394,14 +395,15 @@ static void batch(int fd, unsigned ring, int nchild, int timeout,
 		unsigned long cycles = 0;
 		uint32_t *ptr;
 		uint32_t *map;
-		int i;
+		int i, ret;
 		bool has_relocs = gem_has_relocations(fd);
 
 		memset(obj, 0, sizeof(obj));
 		obj[0].handle = gem_create(fd, 4096);
 		obj[0].flags |= EXEC_OBJECT_WRITE;
 
-		gem_set_caching(fd, obj[0].handle, !!(flags & COHERENT));
+		ret = __gem_set_caching(fd, obj[0].handle, !!(flags & COHERENT));
+		igt_require(ret == 0 || ret == -EOPNOTSUPP);
 		map = gem_mmap__cpu(fd, obj[0].handle, 0, 4096, PROT_WRITE);
 
 		gem_set_domain(fd, obj[0].handle,
diff --git a/tests/i915/gem_exec_latency.c b/tests/i915/gem_exec_latency.c
index fcdf7787b..f24e95f33 100644
--- a/tests/i915/gem_exec_latency.c
+++ b/tests/i915/gem_exec_latency.c
@@ -756,6 +756,7 @@ static void context_switch(int i915, const intel_ctx_t *ctx,
 	const uint32_t mmio_base = gem_engine_mmio_base(i915, e->name);
 	struct igt_mean mean;
 	const intel_ctx_t *tmp_ctx[2];
+	int ret;
 
 	igt_require(mmio_base);
 	igt_require(gem_class_has_mutable_submission(i915, e->class));
@@ -770,7 +771,8 @@ static void context_switch(int i915, const intel_ctx_t *ctx,
 
 	memset(obj, 0, sizeof(obj));
 	obj[0].handle = gem_create(i915, 4096);
-	gem_set_caching(i915, obj[0].handle, 1);
+	ret = __gem_set_caching(i915, obj[0].handle, 1);
+	igt_require(ret == 0 || ret == -EOPNOTSUPP);
 	results = gem_mmap__cpu(i915, obj[0].handle, 0, 4096, PROT_READ);
 	gem_set_domain(i915, obj[0].handle, I915_GEM_DOMAIN_CPU, 0);
 
diff --git a/tests/i915/gem_exec_suspend.c b/tests/i915/gem_exec_suspend.c
index 3b59966a1..2b5e47725 100644
--- a/tests/i915/gem_exec_suspend.c
+++ b/tests/i915/gem_exec_suspend.c
@@ -86,6 +86,7 @@ static void run_test(int fd, const intel_ctx_t *ctx,
 	unsigned nengine;
 	igt_spin_t *spin = NULL;
 	uint64_t ahnd = get_reloc_ahnd(fd, 0);
+	int ret;
 
 	nengine = 0;
 	if (engine == ALL_ENGINES) {
@@ -116,8 +117,10 @@ static void run_test(int fd, const intel_ctx_t *ctx,
 
 	memset(obj, 0, sizeof(obj));
 	obj[0].handle = gem_create_in_memory_regions(fd, 4096, region);
-	if (!gem_has_lmem(fd))
-		gem_set_caching(fd, obj[0].handle, !!(flags & CACHED));
+	if (!gem_has_lmem(fd)) {
+		ret = __gem_set_caching(fd, obj[0].handle, !!(flags & CACHED));
+		igt_require(ret == 0 || ret == -EOPNOTSUPP);
+	}
 	obj[0].flags |= EXEC_OBJECT_WRITE;
 	obj[1].handle = gem_create_in_memory_regions(fd, 4096, region);
 	gem_write(fd, obj[1].handle, 0, &bbe, sizeof(bbe));
diff --git a/tests/i915/gem_render_tiled_blits.c b/tests/i915/gem_render_tiled_blits.c
index eae06a332..c3bf1beaf 100644
--- a/tests/i915/gem_render_tiled_blits.c
+++ b/tests/i915/gem_render_tiled_blits.c
@@ -97,7 +97,7 @@ static void run_test (int fd, int count)
 	struct intel_bb *ibb;
 	uint32_t *start_val;
 	struct intel_buf *bufs;
-	int i, j;
+	int i, j, ret;
 	uint32_t devid;
 
 	devid = intel_get_drm_devid(fd);
@@ -117,7 +117,8 @@ static void run_test (int fd, int count)
 	intel_buf_init(bops, &linear, WIDTH, HEIGHT, 32, 0,
 		       I915_TILING_NONE, I915_COMPRESSION_NONE);
 	if (snoop) {
-		gem_set_caching(fd, linear.handle, 1);
+		ret = __gem_set_caching(fd, linear.handle, 1);
+		igt_require(ret == 0 || ret == -EOPNOTSUPP);
 		igt_info("Using a snoop linear buffer for comparisons\n");
 	}
 
diff --git a/tests/i915/gem_softpin.c b/tests/i915/gem_softpin.c
index ad6d3f531..eb58f285a 100644
--- a/tests/i915/gem_softpin.c
+++ b/tests/i915/gem_softpin.c
@@ -518,6 +518,7 @@ static void test_evict_snoop(int fd, unsigned int flags)
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct drm_i915_gem_exec_object2 object[2];
 	uint64_t hole;
+	int ret;
 
 	igt_require(!gem_has_llc(fd));
 	igt_require(!gem_uses_ppgtt(fd));
@@ -537,7 +538,8 @@ static void test_evict_snoop(int fd, unsigned int flags)
 	/* Create a snoop + uncached pair */
 	object[0].handle = gem_create(fd, 4096);
 	object[0].flags = EXEC_OBJECT_PINNED;
-	gem_set_caching(fd, object[0].handle, 1);
+	ret = __gem_set_caching(fd, object[0].handle, 1);
+	igt_require(ret == 0 || ret == -EOPNOTSUPP);
 	object[1].handle = gem_create(fd, 4096);
 	object[1].flags = EXEC_OBJECT_PINNED;
 	gem_write(fd, object[1].handle, 4096-sizeof(bbe), &bbe, sizeof(bbe));
diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blits.c
index 698508669..617a1d235 100644
--- a/tests/i915/gem_userptr_blits.c
+++ b/tests/i915/gem_userptr_blits.c
@@ -1105,15 +1105,17 @@ static void test_relocations(int fd)
 	struct drm_i915_gem_execbuffer2 exec;
 	unsigned size;
 	void *ptr;
-	int i;
+	int i, ret;
 
 	size = PAGE_SIZE + ALIGN(sizeof(*reloc)*256, PAGE_SIZE);
 
 	memset(&obj, 0, sizeof(obj));
 	igt_assert(posix_memalign(&ptr, PAGE_SIZE, size) == 0);
 	gem_userptr(fd, ptr, size, 0, userptr_flags, &obj.handle);
-	if (!gem_has_llc(fd))
-		gem_set_caching(fd, obj.handle, 0);
+	if (!gem_has_llc(fd)) {
+		ret = __gem_set_caching(fd, obj.handle, 0);
+		igt_require(ret == 0 || ret == -EOPNOTSUPP);
+	}
 	*(uint32_t *)ptr = MI_BATCH_BUFFER_END;
 
 	reloc = (typeof(reloc))((char *)ptr + PAGE_SIZE);
diff --git a/tests/i915/gem_workarounds.c b/tests/i915/gem_workarounds.c
index 5fb2d73fd..3a580f59f 100644
--- a/tests/i915/gem_workarounds.c
+++ b/tests/i915/gem_workarounds.c
@@ -92,7 +92,7 @@ static int workaround_fail_count(int i915, const intel_ctx_t *ctx)
 	uint32_t result_sz, batch_sz;
 	uint32_t *base, *out;
 	igt_spin_t *spin;
-	int fw, fail = 0;
+	int fw, fail = 0, ret;
 	uint64_t ahnd = get_reloc_ahnd(i915, ctx->id);
 
 	reloc = calloc(num_wa_regs, sizeof(*reloc));
@@ -106,8 +106,10 @@ static int workaround_fail_count(int i915, const intel_ctx_t *ctx)
 
 	memset(obj, 0, sizeof(obj));
 	obj[0].handle = gem_create(i915, result_sz);
-	if (!gem_has_lmem(i915))
-		gem_set_caching(i915, obj[0].handle, I915_CACHING_CACHED);
+	if (!gem_has_lmem(i915)) {
+		ret = __gem_set_caching(i915, obj[0].handle, I915_CACHING_CACHED);
+		igt_require(ret == 0 || ret == -EOPNOTSUPP);
+	}
 	obj[1].handle = gem_create(i915, batch_sz);
 	obj[1].relocs_ptr = to_user_pointer(reloc);
 	obj[1].relocation_count = !ahnd ? num_wa_regs : 0;
diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index 74935430c..9c372e43d 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -1977,6 +1977,7 @@ static void pm_test_caching(void)
 {
 	uint32_t handle;
 	uint8_t *gem_buf;
+	int ret;
 
 	uint32_t i;
 	uint32_t default_cache_level;
@@ -1995,7 +1996,8 @@ static void pm_test_caching(void)
 
 	for (i = 0; i < ARRAY_SIZE(cache_levels); i++) {
 		igt_assert(wait_for_suspended());
-		gem_set_caching(drm_fd, handle, default_cache_level);
+		ret = __gem_set_caching(drm_fd, handle, default_cache_level);
+		igt_require(ret == 0 || ret == -EOPNOTSUPP);
 
 		/* Ensure we bind the vma into the GGTT */
 		memset(gem_buf, 16 << i, gtt_obj_max_size);
@@ -2008,7 +2010,8 @@ static void pm_test_caching(void)
 		 */
 		igt_debug("Setting cache level %u\n", cache_levels[i]);
 		igt_assert(wait_for_suspended());
-		gem_set_caching(drm_fd, handle, cache_levels[i]);
+		ret = __gem_set_caching(drm_fd, handle, cache_levels[i]);
+		igt_require(ret == 0 || ret == -EOPNOTSUPP);
 	}
 
 	igt_assert(munmap(gem_buf, gtt_obj_max_size) == 0);
diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
index 06be273c0..caef8040f 100644
--- a/tests/prime_vgem.c
+++ b/tests/prime_vgem.c
@@ -316,6 +316,7 @@ static void test_userptr(int vgem, int i915)
 	};
 	struct vgem_bo scratch;
 	uint32_t *ptr;
+	int ret;
 
 	igt_require(has_userptr(i915));
 
@@ -330,7 +331,8 @@ static void test_userptr(int vgem, int i915)
 	*ptr = MI_BATCH_BUFFER_END;
 
 	gem_userptr(i915, ptr, scratch.size, 0, 0, &obj.handle);
-	gem_set_caching(i915, obj.handle, I915_CACHING_NONE); /* for !llc exec */
+	ret = __gem_set_caching(i915, obj.handle, I915_CACHING_NONE); /* for !llc exec */
+	igt_require(ret == 0 || ret == -EOPNOTSUPP);
 
 	gem_execbuf(i915, &execbuf);
 	gem_close(i915, obj.handle);
-- 
2.25.1
