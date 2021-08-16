Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72FA28982E
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Aug 2021 11:56:43 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon, 16 Aug 2021 13:56:24 +0200
Message-Id: <20210816115626.22759-4-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210816115626.22759-1-zbigniew.kempczynski@intel.com>
References: <20210816115626.22759-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/5] tests/gem_exec_fence: Adopt to use
 allocator
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
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, Andrzej Turko <andrzej.turko@linux.intel.com>, Petri Latvala <petri.latvala@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

For newer gens we're not able to rely on relocations. Adopt to use
offsets acquired from the allocator.

Three subtests are not covered here, there are:
- syncobj-timeline-chain-engines
- syncobj-stationary-timeline-chain-engines
- syncobj-backward-timeline-chain-engines

Due to sophisticated manner of the three tests mentioned above they
will be subject of separate patch. At the moment CI depends on reloc
version only so this doesn't introduce regression there and decreases
coverage gap on no-reloc discrete runs.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Andrzej Turko <andrzej.turko@linux.intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_exec_fence.c | 240 +++++++++++++++++++++++++-----------
 1 file changed, 171 insertions(+), 69 deletions(-)

diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
index 620e7ac22..8859c81cd 100644
--- a/tests/i915/gem_exec_fence.c
+++ b/tests/i915/gem_exec_fence.c
@@ -57,9 +57,10 @@ struct sync_merge_data {
 #define   MI_SEMAPHORE_SAD_EQ_SDD       (4 << 12)
 #define   MI_SEMAPHORE_SAD_NEQ_SDD      (5 << 12)
 
-static void store(int fd, const intel_ctx_t *ctx,
+static void store(int fd, uint64_t ahnd, const intel_ctx_t *ctx,
 		  const struct intel_execution_engine2 *e,
-		  int fence, uint32_t target, unsigned offset_value)
+		  int fence, uint32_t target, uint64_t target_offset,
+		  unsigned offset_value)
 {
 	const int SCRATCH = 0;
 	const int BATCH = 1;
@@ -67,7 +68,8 @@ static void store(int fd, const intel_ctx_t *ctx,
 	struct drm_i915_gem_exec_object2 obj[2];
 	struct drm_i915_gem_relocation_entry reloc;
 	struct drm_i915_gem_execbuffer2 execbuf;
-	uint32_t batch[16];
+	uint32_t batch[16], delta;
+	uint64_t bb_offset;
 	int i;
 
 	memset(&execbuf, 0, sizeof(execbuf));
@@ -84,33 +86,43 @@ static void store(int fd, const intel_ctx_t *ctx,
 
 	obj[BATCH].handle = gem_create(fd, 4096);
 	obj[BATCH].relocs_ptr = to_user_pointer(&reloc);
-	obj[BATCH].relocation_count = 1;
+	obj[BATCH].relocation_count = !ahnd ? 1 : 0;
+	bb_offset = get_offset(ahnd, obj[BATCH].handle, 4096, 0);
 	memset(&reloc, 0, sizeof(reloc));
 
 	i = 0;
-	reloc.target_handle = obj[SCRATCH].handle;
-	reloc.presumed_offset = -1;
-	reloc.offset = sizeof(uint32_t) * (i + 1);
-	reloc.delta = sizeof(uint32_t) * offset_value;
-	reloc.read_domains = I915_GEM_DOMAIN_INSTRUCTION;
-	reloc.write_domain = I915_GEM_DOMAIN_INSTRUCTION;
+	delta = sizeof(uint32_t) * offset_value;
+	if (!ahnd) {
+		reloc.target_handle = obj[SCRATCH].handle;
+		reloc.presumed_offset = -1;
+		reloc.offset = sizeof(uint32_t) * (i + 1);
+		reloc.delta = delta;
+		reloc.read_domains = I915_GEM_DOMAIN_INSTRUCTION;
+		reloc.write_domain = I915_GEM_DOMAIN_INSTRUCTION;
+	} else {
+		obj[SCRATCH].offset = target_offset;
+		obj[SCRATCH].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE;
+		obj[BATCH].offset = bb_offset;
+		obj[BATCH].flags |= EXEC_OBJECT_PINNED;
+	}
 	batch[i] = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
 	if (gen >= 8) {
-		batch[++i] = reloc.delta;
-		batch[++i] = 0;
+		batch[++i] = target_offset + delta;
+		batch[++i] = target_offset >> 32;
 	} else if (gen >= 4) {
 		batch[++i] = 0;
-		batch[++i] = reloc.delta;
+		batch[++i] = delta;
 		reloc.offset += sizeof(uint32_t);
 	} else {
 		batch[i]--;
-		batch[++i] = reloc.delta;
+		batch[++i] = delta;
 	}
 	batch[++i] = offset_value;
 	batch[++i] = MI_BATCH_BUFFER_END;
 	gem_write(fd, obj[BATCH].handle, 0, batch, sizeof(batch));
 	gem_execbuf(fd, &execbuf);
 	gem_close(fd, obj[BATCH].handle);
+	put_offset(ahnd, obj[BATCH].handle);
 }
 
 static bool fence_busy(int fence)
@@ -132,6 +144,7 @@ static void test_fence_busy(int fd, const intel_ctx_t *ctx,
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct timespec tv;
 	uint32_t *batch;
+	uint64_t ahnd = get_reloc_ahnd(fd, ctx->id);
 	int fence, i, timeout;
 
 	if ((flags & HANG) == 0)
@@ -147,10 +160,7 @@ static void test_fence_busy(int fd, const intel_ctx_t *ctx,
 
 	memset(&obj, 0, sizeof(obj));
 	obj.handle = gem_create(fd, 4096);
-
-	obj.relocs_ptr = to_user_pointer(&reloc);
-	obj.relocation_count = 1;
-	memset(&reloc, 0, sizeof(reloc));
+	obj.offset = get_offset(ahnd, obj.handle, 4096, 0);
 
 	batch = gem_mmap__device_coherent(fd, obj.handle, 0, 4096, PROT_WRITE);
 	gem_set_domain(fd, obj.handle,
@@ -160,24 +170,31 @@ static void test_fence_busy(int fd, const intel_ctx_t *ctx,
 	if ((flags & HANG) == 0)
 		batch[i++] = 0x5 << 23;
 
-	reloc.target_handle = obj.handle; /* recurse */
-	reloc.presumed_offset = 0;
-	reloc.offset = (i + 1) * sizeof(uint32_t);
-	reloc.delta = 0;
-	reloc.read_domains = I915_GEM_DOMAIN_COMMAND;
-	reloc.write_domain = 0;
+	if (!ahnd) {
+		obj.relocs_ptr = to_user_pointer(&reloc);
+		obj.relocation_count = 1;
+		memset(&reloc, 0, sizeof(reloc));
+		reloc.target_handle = obj.handle; /* recurse */
+		reloc.presumed_offset = obj.offset;
+		reloc.offset = (i + 1) * sizeof(uint32_t);
+		reloc.delta = 0;
+		reloc.read_domains = I915_GEM_DOMAIN_COMMAND;
+		reloc.write_domain = 0;
+	} else {
+		obj.flags |= EXEC_OBJECT_PINNED;
+	}
 
 	batch[i] = MI_BATCH_BUFFER_START;
 	if (gen >= 8) {
 		batch[i] |= 1 << 8 | 1;
-		batch[++i] = 0;
-		batch[++i] = 0;
+		batch[++i] = obj.offset;
+		batch[++i] = obj.offset >> 32;
 	} else if (gen >= 6) {
 		batch[i] |= 1 << 8;
-		batch[++i] = 0;
+		batch[++i] = obj.offset;
 	} else {
 		batch[i] |= 2 << 6;
-		batch[++i] = 0;
+		batch[++i] = obj.offset;
 		if (gen < 4) {
 			batch[i] |= 1;
 			reloc.delta = 1;
@@ -216,6 +233,8 @@ static void test_fence_busy(int fd, const intel_ctx_t *ctx,
 
 	close(fence);
 	gem_close(fd, obj.handle);
+	put_offset(ahnd, obj.handle);
+	put_ahnd(ahnd);
 
 	gem_quiescent_gpu(fd);
 }
@@ -229,6 +248,7 @@ static void test_fence_busy_all(int fd, const intel_ctx_t *ctx, unsigned flags)
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct timespec tv;
 	uint32_t *batch;
+	uint64_t ahnd = get_reloc_ahnd(fd, ctx->id);
 	int all, i, timeout;
 
 	gem_quiescent_gpu(fd);
@@ -239,10 +259,8 @@ static void test_fence_busy_all(int fd, const intel_ctx_t *ctx, unsigned flags)
 
 	memset(&obj, 0, sizeof(obj));
 	obj.handle = gem_create(fd, 4096);
-
-	obj.relocs_ptr = to_user_pointer(&reloc);
-	obj.relocation_count = 1;
-	memset(&reloc, 0, sizeof(reloc));
+	obj.offset = get_offset(ahnd, obj.handle, 4096, 0);
+	igt_assert(obj.offset != -1);
 
 	batch = gem_mmap__device_coherent(fd, obj.handle, 0, 4096, PROT_WRITE);
 	gem_set_domain(fd, obj.handle,
@@ -252,24 +270,31 @@ static void test_fence_busy_all(int fd, const intel_ctx_t *ctx, unsigned flags)
 	if ((flags & HANG) == 0)
 		batch[i++] = 0x5 << 23;
 
-	reloc.target_handle = obj.handle; /* recurse */
-	reloc.presumed_offset = 0;
-	reloc.offset = (i + 1) * sizeof(uint32_t);
-	reloc.delta = 0;
-	reloc.read_domains = I915_GEM_DOMAIN_COMMAND;
-	reloc.write_domain = 0;
+	if (!ahnd) {
+		obj.relocs_ptr = to_user_pointer(&reloc);
+		obj.relocation_count = 1;
+		memset(&reloc, 0, sizeof(reloc));
+		reloc.target_handle = obj.handle; /* recurse */
+		reloc.presumed_offset = obj.offset;
+		reloc.offset = (i + 1) * sizeof(uint32_t);
+		reloc.delta = 0;
+		reloc.read_domains = I915_GEM_DOMAIN_COMMAND;
+		reloc.write_domain = 0;
+	} else {
+		obj.flags |= EXEC_OBJECT_PINNED;
+	}
 
 	batch[i] = MI_BATCH_BUFFER_START;
 	if (gen >= 8) {
 		batch[i] |= 1 << 8 | 1;
-		batch[++i] = 0;
-		batch[++i] = 0;
+		batch[++i] = obj.offset;
+		batch[++i] = obj.offset >> 32;
 	} else if (gen >= 6) {
 		batch[i] |= 1 << 8;
-		batch[++i] = 0;
+		batch[++i] = obj.offset;
 	} else {
 		batch[i] |= 2 << 6;
-		batch[++i] = 0;
+		batch[++i] = obj.offset;
 		if (gen < 4) {
 			batch[i] |= 1;
 			reloc.delta = 1;
@@ -331,6 +356,8 @@ static void test_fence_busy_all(int fd, const intel_ctx_t *ctx, unsigned flags)
 
 	close(all);
 	gem_close(fd, obj.handle);
+	put_offset(ahnd, obj.handle);
+	put_ahnd(ahnd);
 
 	gem_quiescent_gpu(fd);
 }
@@ -351,13 +378,17 @@ static void test_fence_await(int fd, const intel_ctx_t *ctx,
 	uint32_t scratch = gem_create(fd, 4096);
 	igt_spin_t *spin;
 	uint32_t *out;
+	uint64_t scratch_offset, ahnd = get_reloc_ahnd(fd, ctx->id);
 	int i;
 
+	scratch_offset = get_offset(ahnd, scratch, 4096, 0);
+
 	out = gem_mmap__device_coherent(fd, scratch, 0, 4096, PROT_WRITE);
 	gem_set_domain(fd, scratch,
 			I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
 
 	spin = igt_spin_new(fd,
+			    .ahnd = ahnd,
 			    .ctx = ctx,
 			    .engine = e->flags,
 			    .flags = IGT_SPIN_FENCE_OUT | spin_hang(flags));
@@ -369,10 +400,15 @@ static void test_fence_await(int fd, const intel_ctx_t *ctx,
 			continue;
 
 		if (flags & NONBLOCK) {
-			store(fd, ctx, e2, spin->out_fence, scratch, i);
+			store(fd, ahnd, ctx, e2, spin->out_fence,
+			      scratch, scratch_offset, i);
 		} else {
-			igt_fork(child, 1)
-				store(fd, ctx, e2, spin->out_fence, scratch, i);
+			igt_fork(child, 1) {
+				ahnd = get_reloc_ahnd(fd, ctx->id);
+				store(fd, ahnd, ctx, e2, spin->out_fence,
+				      scratch, scratch_offset, i);
+				put_ahnd(ahnd);
+			}
 		}
 
 		i++;
@@ -398,6 +434,8 @@ static void test_fence_await(int fd, const intel_ctx_t *ctx,
 
 	igt_spin_free(fd, spin);
 	gem_close(fd, scratch);
+	put_offset(ahnd, scratch);
+	put_ahnd(ahnd);
 }
 
 static uint32_t timeslicing_batches(int i915, uint32_t *offset)
@@ -623,9 +661,12 @@ static void test_parallel(int i915, const intel_ctx_t *ctx,
 	igt_spin_t *spin;
 	int fence;
 	int x = 0;
+	uint64_t ahnd = get_reloc_ahnd(i915, ctx->id), bb_offset;
+	uint64_t scratch_offset = get_offset(ahnd, scratch, 4096, 0);
 
 	fence = igt_cork_plug(&cork, i915),
 	spin = igt_spin_new(i915,
+			    .ahnd = ahnd,
 			    .ctx = ctx,
 			    .engine = e->flags,
 			    .fence = fence,
@@ -644,7 +685,7 @@ static void test_parallel(int i915, const intel_ctx_t *ctx,
 			{ .handle = scratch, },
 			{
 				.relocs_ptr = to_user_pointer(&reloc),
-				.relocation_count = 1,
+				.relocation_count = !ahnd ? 1 : 0,
 			}
 		};
 		struct drm_i915_gem_execbuffer2 execbuf = {
@@ -662,11 +703,19 @@ static void test_parallel(int i915, const intel_ctx_t *ctx,
 
 		obj[1].handle = gem_create(i915, 4096);
 
+		if (ahnd) {
+			bb_offset = get_offset(ahnd, obj[1].handle, 4096, 0);
+			obj[1].offset = bb_offset;
+			obj[1].flags = EXEC_OBJECT_PINNED;
+			obj[0].offset = scratch_offset;
+			obj[0].flags = EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE;
+		}
+
 		i = 0;
 		batch[i] = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
 		if (gen >= 8) {
-			batch[++i] = reloc.delta;
-			batch[++i] = 0;
+			batch[++i] = scratch_offset + reloc.delta;
+			batch[++i] = scratch_offset >> 32;
 		} else if (gen >= 4) {
 			batch[++i] = 0;
 			batch[++i] = reloc.delta;
@@ -687,6 +736,7 @@ static void test_parallel(int i915, const intel_ctx_t *ctx,
 	}
 	igt_assert(gem_bo_busy(i915, spin->handle));
 	gem_close(i915, scratch);
+	put_offset(ahnd, scratch);
 	igt_require(x);
 
 	/*
@@ -713,18 +763,21 @@ static void test_parallel(int i915, const intel_ctx_t *ctx,
 
 		igt_assert_eq_u32(out[i], ~i);
 		gem_close(i915, handle[i]);
+		put_offset(ahnd, handle[i]);
 	}
 	munmap(out, 4096);
 
 	/* Master should still be spinning, but all output should be written */
 	igt_assert(gem_bo_busy(i915, spin->handle));
 	igt_spin_free(i915, spin);
+	put_ahnd(ahnd);
 }
 
 static void test_concurrent(int i915, const intel_ctx_t *ctx,
 			    const struct intel_execution_engine2 *e)
 {
 	const unsigned int gen = intel_gen(intel_get_drm_devid(i915));
+	uint64_t ahnd = get_reloc_ahnd(i915, ctx->id);
 	struct drm_i915_gem_relocation_entry reloc = {
 		.target_handle =  gem_create(i915, 4096),
 		.write_domain = I915_GEM_DOMAIN_RENDER,
@@ -735,7 +788,7 @@ static void test_concurrent(int i915, const intel_ctx_t *ctx,
 		{
 			.handle = gem_create(i915, 4096),
 			.relocs_ptr = to_user_pointer(&reloc),
-			.relocation_count = 1,
+			.relocation_count = !ahnd ? 1 : 0,
 		}
 	};
 	struct drm_i915_gem_execbuffer2 execbuf = {
@@ -749,9 +802,19 @@ static void test_concurrent(int i915, const intel_ctx_t *ctx,
 	igt_spin_t *spin;
 	const intel_ctx_t *tmp_ctx;
 	uint32_t result;
+	uint64_t bb_offset, target_offset;
 	int fence;
 	int i;
 
+	bb_offset = get_offset(ahnd, obj[1].handle, 4096, 0);
+	target_offset = get_offset(ahnd, obj[0].handle, 4096, 0);
+	if (ahnd) {
+		obj[1].offset = bb_offset;
+		obj[1].flags = EXEC_OBJECT_PINNED;
+		obj[0].offset = target_offset;
+		obj[0].flags = EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE;
+	}
+
 	/*
 	 * A variant of test_parallel() that runs a bonded pair on a single
 	 * engine and ensures that the secondary batch cannot start before
@@ -760,6 +823,7 @@ static void test_concurrent(int i915, const intel_ctx_t *ctx,
 
 	fence = igt_cork_plug(&cork, i915),
 	      spin = igt_spin_new(i915,
+				  .ahnd = ahnd,
 				  .ctx = ctx,
 				  .engine = e->flags,
 				  .fence = fence,
@@ -770,8 +834,8 @@ static void test_concurrent(int i915, const intel_ctx_t *ctx,
 	i = 0;
 	batch[i] = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
 	if (gen >= 8) {
-		batch[++i] = reloc.delta;
-		batch[++i] = 0;
+		batch[++i] = target_offset + reloc.delta;
+		batch[++i] = target_offset >> 32;
 	} else if (gen >= 4) {
 		batch[++i] = 0;
 		batch[++i] = reloc.delta;
@@ -793,6 +857,7 @@ static void test_concurrent(int i915, const intel_ctx_t *ctx,
 	gem_execbuf(i915, &execbuf);
 	intel_ctx_destroy(i915, tmp_ctx);
 	gem_close(i915, obj[1].handle);
+	put_offset(ahnd, obj[1].handle);
 
 	/*
 	 * No secondary should be executed since master is stalled. If there
@@ -814,10 +879,12 @@ static void test_concurrent(int i915, const intel_ctx_t *ctx,
 	gem_read(i915, obj[0].handle, 0, &result, sizeof(result));
 	igt_assert_eq_u32(result, 0xd0df0d);
 	gem_close(i915, obj[0].handle);
+	put_offset(ahnd, obj[0].handle);
 
 	/* Master should still be spinning, but all output should be written */
 	igt_assert(gem_bo_busy(i915, spin->handle));
 	igt_spin_free(i915, spin);
+	put_ahnd(ahnd);
 }
 
 static void test_submit_chain(int i915, const intel_ctx_t *ctx)
@@ -827,12 +894,14 @@ static void test_submit_chain(int i915, const intel_ctx_t *ctx)
 	IGT_LIST_HEAD(list);
 	IGT_CORK_FENCE(cork);
 	int fence;
+	uint64_t ahnd = get_reloc_ahnd(i915, ctx->id);
 
 	/* Check that we can simultaneously launch spinners on each engine */
 
 	fence = igt_cork_plug(&cork, i915);
 	for_each_ctx_engine(i915, ctx, e) {
 		spin = igt_spin_new(i915,
+				    .ahnd = ahnd,
 				    .ctx = ctx,
 				    .engine = e->flags,
 				    .fence = fence,
@@ -860,6 +929,7 @@ static void test_submit_chain(int i915, const intel_ctx_t *ctx)
 		igt_assert_eq(sync_fence_status(spin->out_fence), 1);
 		igt_spin_free(i915, spin);
 	}
+	put_ahnd(ahnd);
 }
 
 static uint32_t batch_create(int fd)
@@ -889,9 +959,10 @@ static void test_keep_in_fence(int fd, const intel_ctx_t *ctx,
 	unsigned long count, last;
 	struct itimerval itv;
 	igt_spin_t *spin;
+	uint64_t ahnd = get_reloc_ahnd(fd, ctx->id);
 	int fence;
 
-	spin = igt_spin_new(fd, .ctx = ctx, .engine = e->flags);
+	spin = igt_spin_new(fd, .ahnd = ahnd, .ctx = ctx, .engine = e->flags);
 
 	gem_execbuf_wr(fd, &execbuf);
 	fence = upper_32_bits(execbuf.rsvd2);
@@ -940,6 +1011,7 @@ static void test_keep_in_fence(int fd, const intel_ctx_t *ctx,
 
 	igt_spin_free(fd, spin);
 	gem_quiescent_gpu(fd);
+	put_ahnd(ahnd);
 }
 
 #define EXPIRED 0x10000
@@ -1165,7 +1237,8 @@ static void test_syncobj_unused_fence(int fd)
 	struct drm_i915_gem_exec_fence fence = {
 		.handle = syncobj_create(fd, 0),
 	};
-	igt_spin_t *spin = igt_spin_new(fd);
+	uint64_t ahnd = get_reloc_ahnd(fd, 0);
+	igt_spin_t *spin = igt_spin_new(fd, .ahnd = ahnd);
 
 	/* sanity check our syncobj_to_sync_file interface */
 	igt_assert_eq(__syncobj_to_sync_file(fd, 0), -ENOENT);
@@ -1191,6 +1264,7 @@ static void test_syncobj_unused_fence(int fd)
 	syncobj_destroy(fd, fence.handle);
 
 	igt_spin_free(fd, spin);
+	put_ahnd(ahnd);
 }
 
 static void test_syncobj_invalid_wait(int fd)
@@ -1257,7 +1331,8 @@ static void test_syncobj_signal(int fd)
 	struct drm_i915_gem_exec_fence fence = {
 		.handle = syncobj_create(fd, 0),
 	};
-	igt_spin_t *spin = igt_spin_new(fd);
+	uint64_t ahnd = get_reloc_ahnd(fd, 0);
+	igt_spin_t *spin = igt_spin_new(fd, .ahnd = ahnd);
 
 	/* Check that the syncobj is signaled only when our request/fence is */
 
@@ -1286,6 +1361,7 @@ static void test_syncobj_signal(int fd)
 
 	gem_close(fd, obj.handle);
 	syncobj_destroy(fd, fence.handle);
+	put_ahnd(ahnd);
 }
 
 static void test_syncobj_wait(int fd, const intel_ctx_t *ctx)
@@ -1300,6 +1376,7 @@ static void test_syncobj_wait(int fd, const intel_ctx_t *ctx)
 	unsigned handle[I915_EXEC_RING_MASK + 1];
 	igt_spin_t *spin;
 	int n;
+	uint64_t ahnd = get_reloc_ahnd(fd, 0);
 
 	/* Check that we can use the syncobj to asynchronous wait prior to
 	 * execution.
@@ -1307,7 +1384,7 @@ static void test_syncobj_wait(int fd, const intel_ctx_t *ctx)
 
 	gem_quiescent_gpu(fd);
 
-	spin = igt_spin_new(fd);
+	spin = igt_spin_new(fd, .ahnd = ahnd);
 
 	memset(&execbuf, 0, sizeof(execbuf));
 	execbuf.buffers_ptr = to_user_pointer(&obj);
@@ -1357,6 +1434,8 @@ static void test_syncobj_wait(int fd, const intel_ctx_t *ctx)
 		gem_sync(fd, handle[i]);
 		gem_close(fd, handle[i]);
 	}
+
+	put_ahnd(ahnd);
 }
 
 static void test_syncobj_export(int fd)
@@ -1368,7 +1447,10 @@ static void test_syncobj_export(int fd)
 		.handle = syncobj_create(fd, 0),
 	};
 	int export[2];
-	igt_spin_t *spin = igt_spin_new(fd);
+	igt_spin_t *spin;
+	uint64_t ahnd = get_reloc_ahnd(fd, 0);
+
+	spin = igt_spin_new(fd, .ahnd = ahnd);
 
 	/* Check that if we export the syncobj prior to use it picks up
 	 * the later fence. This allows a syncobj to establish a channel
@@ -1416,6 +1498,8 @@ static void test_syncobj_export(int fd)
 		syncobj_destroy(fd, import);
 		close(export[n]);
 	}
+
+	put_ahnd(ahnd);
 }
 
 static void test_syncobj_repeat(int fd)
@@ -1426,7 +1510,10 @@ static void test_syncobj_repeat(int fd)
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct drm_i915_gem_exec_fence *fence;
 	int export;
-	igt_spin_t *spin = igt_spin_new(fd);
+	igt_spin_t *spin;
+	uint64_t ahnd = get_reloc_ahnd(fd, 0);
+
+	spin = igt_spin_new(fd, .ahnd = ahnd);
 
 	/* Check that we can wait on the same fence multiple times */
 	fence = calloc(nfences, sizeof(*fence));
@@ -1474,6 +1561,8 @@ static void test_syncobj_repeat(int fd)
 		syncobj_destroy(fd, fence[i].handle);
 	}
 	free(fence);
+
+	put_ahnd(ahnd);
 }
 
 static void test_syncobj_import(int fd)
@@ -1481,7 +1570,8 @@ static void test_syncobj_import(int fd)
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
 	struct drm_i915_gem_exec_object2 obj;
 	struct drm_i915_gem_execbuffer2 execbuf;
-	igt_spin_t *spin = igt_spin_new(fd);
+	uint64_t ahnd = get_reloc_ahnd(fd, 0);
+	igt_spin_t *spin = igt_spin_new(fd, .ahnd = ahnd);
 	uint32_t sync = syncobj_create(fd, 0);
 	int fence;
 
@@ -1517,6 +1607,7 @@ static void test_syncobj_import(int fd)
 
 	gem_close(fd, obj.handle);
 	syncobj_destroy(fd, sync);
+	put_ahnd(ahnd);
 }
 
 static void test_syncobj_channel(int fd)
@@ -1808,8 +1899,8 @@ static void test_syncobj_timeline_unused_fence(int fd)
 	struct drm_i915_gem_exec_fence fence = {
 		.handle = syncobj_create(fd, 0),
 	};
-	igt_spin_t *spin = igt_spin_new(fd);
-	uint64_t value = 1;
+	uint64_t value = 1, ahnd = get_reloc_ahnd(fd, 0);
+	igt_spin_t *spin = igt_spin_new(fd, .ahnd = ahnd);
 
 	/* sanity check our syncobj_to_sync_file interface */
 	igt_assert_eq(__syncobj_to_sync_file(fd, 0), -ENOENT);
@@ -1841,6 +1932,7 @@ static void test_syncobj_timeline_unused_fence(int fd)
 	syncobj_destroy(fd, fence.handle);
 
 	igt_spin_free(fd, spin);
+	put_ahnd(ahnd);
 }
 
 static const char *test_syncobj_timeline_invalid_wait_desc =
@@ -1949,7 +2041,7 @@ static void test_syncobj_timeline_signal(int fd)
 	struct drm_i915_gem_exec_fence fence = {
 		.handle = syncobj_create(fd, 0),
 	};
-	uint64_t value = 42, query_value;
+	uint64_t value = 42, query_value, ahnd = get_reloc_ahnd(fd, 0);
 	igt_spin_t *spin;
 
 	/* Check that the syncobj is signaled only when our request/fence is */
@@ -1974,7 +2066,7 @@ static void test_syncobj_timeline_signal(int fd)
 	fence.flags = I915_EXEC_FENCE_SIGNAL;
 
 	/* Check syncobj after waiting on the buffer handle. */
-	spin = igt_spin_new(fd);
+	spin = igt_spin_new(fd, .ahnd = ahnd);
 	gem_execbuf(fd, &execbuf);
 
 	igt_assert(gem_bo_busy(fd, obj.handle));
@@ -1993,7 +2085,7 @@ static void test_syncobj_timeline_signal(int fd)
 	syncobj_timeline_query(fd, &fence.handle, &query_value, 1);
 	igt_assert_eq(query_value, value);
 
-	spin = igt_spin_new(fd);
+	spin = igt_spin_new(fd, .ahnd = ahnd);
 
 	/*
 	 * Wait on the syncobj and verify the state of the buffer
@@ -2024,6 +2116,7 @@ static void test_syncobj_timeline_signal(int fd)
 
 	gem_close(fd, obj.handle);
 	syncobj_destroy(fd, fence.handle);
+	put_ahnd(ahnd);
 }
 
 static const char *test_syncobj_timeline_wait_desc =
@@ -2046,7 +2139,7 @@ static void test_syncobj_timeline_wait(int fd, const intel_ctx_t *ctx)
 	};
 	unsigned handle[I915_EXEC_RING_MASK + 1];
 	const struct intel_execution_engine2 *e;
-	uint64_t value = 1;
+	uint64_t value = 1, ahnd = get_reloc_ahnd(fd, ctx->id);
 	igt_spin_t *spin;
 	int n;
 
@@ -2056,7 +2149,7 @@ static void test_syncobj_timeline_wait(int fd, const intel_ctx_t *ctx)
 
 	gem_quiescent_gpu(fd);
 
-	spin = igt_spin_new(fd, .ctx = ctx, .engine = ALL_ENGINES);
+	spin = igt_spin_new(fd, .ahnd = ahnd, .ctx = ctx, .engine = ALL_ENGINES);
 
 	memset(&timeline_fences, 0, sizeof(timeline_fences));
 	timeline_fences.base.name = DRM_I915_GEM_EXECBUFFER_EXT_TIMELINE_FENCES;
@@ -2105,6 +2198,7 @@ static void test_syncobj_timeline_wait(int fd, const intel_ctx_t *ctx)
 		gem_sync(fd, handle[i]);
 		gem_close(fd, handle[i]);
 	}
+	put_ahnd(ahnd);
 }
 
 static const char *test_syncobj_timeline_export_desc =
@@ -2121,9 +2215,9 @@ static void test_syncobj_timeline_export(int fd)
 	struct drm_i915_gem_exec_fence fence = {
 		.handle = syncobj_create(fd, 0),
 	};
-	uint64_t value = 1;
+	uint64_t value = 1, ahnd = get_reloc_ahnd(fd, 0);
 	int export[2];
-	igt_spin_t *spin = igt_spin_new(fd);
+	igt_spin_t *spin = igt_spin_new(fd, .ahnd = ahnd);
 
 	/* Check that if we export the syncobj prior to use it picks up
 	 * the later fence. This allows a syncobj to establish a channel
@@ -2177,6 +2271,7 @@ static void test_syncobj_timeline_export(int fd)
 		syncobj_destroy(fd, import);
 		close(export[n]);
 	}
+	put_ahnd(ahnd);
 }
 
 static const char *test_syncobj_timeline_repeat_desc =
@@ -2193,9 +2288,9 @@ static void test_syncobj_timeline_repeat(int fd)
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct drm_i915_gem_execbuffer_ext_timeline_fences timeline_fences;
 	struct drm_i915_gem_exec_fence *fence;
-	uint64_t *values;
+	uint64_t *values, ahnd = get_reloc_ahnd(fd, 0);
 	int export;
-	igt_spin_t *spin = igt_spin_new(fd);
+	igt_spin_t *spin = igt_spin_new(fd, .ahnd = ahnd);
 
 	/* Check that we can wait on the same fence multiple times */
 	fence = calloc(nfences, sizeof(*fence));
@@ -2266,6 +2361,7 @@ static void test_syncobj_timeline_repeat(int fd)
 	}
 	free(fence);
 	free(values);
+	put_ahnd(ahnd);
 }
 
 static const char *test_syncobj_timeline_multiple_ext_nodes_desc =
@@ -3005,6 +3101,7 @@ igt_main
 		igt_subtest_group {
 			igt_fixture {
 				igt_fork_hang_detector(i915);
+				intel_allocator_multiprocess_start();
 			}
 
 			igt_subtest_with_dynamic("basic-busy") {
@@ -3097,6 +3194,7 @@ igt_main
 			}
 
 			igt_fixture {
+				intel_allocator_multiprocess_stop();
 				igt_stop_hang_detector();
 			}
 		}
@@ -3106,6 +3204,7 @@ igt_main
 
 			igt_fixture {
 				hang = igt_allow_hang(i915, 0, 0);
+				intel_allocator_multiprocess_start();
 			}
 
 			igt_subtest_with_dynamic("busy-hang") {
@@ -3133,6 +3232,7 @@ igt_main
 				}
 			}
 			igt_fixture {
+				intel_allocator_multiprocess_stop();
 				igt_disallow_hang(i915, hang);
 			}
 		}
@@ -3162,6 +3262,7 @@ igt_main
 			igt_require(exec_has_fence_array(i915));
 			igt_assert(has_syncobj(i915));
 			igt_fork_hang_detector(i915);
+			intel_allocator_multiprocess_start();
 		}
 
 		igt_subtest("invalid-fence-array")
@@ -3195,6 +3296,7 @@ igt_main
 			test_syncobj_channel(i915);
 
 		igt_fixture {
+			intel_allocator_multiprocess_stop();
 			igt_stop_hang_detector();
 		}
 	}
-- 
2.26.0
