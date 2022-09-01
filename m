Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8995C10E5CC
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Sep 2022 06:30:15 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  1 Sep 2022 08:29:48 +0200
Message-Id: <20220901063000.25640-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20220901063000.25640-1-zbigniew.kempczynski@intel.com>
References: <20220901063000.25640-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 01/13] lib: Fix off-by-one-page in 48b
 obj.flags
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

From: Chris Wilson <chris.p.wilson@linux.intel.com>

The kernel checks that the last byte of the object will fit inside the
32b GTT window unless the object is marked as being suitable for use
with 48b addressing. However, the spinner only checked the start of the
object which depending on the mix of size/alignment, could allow the
object to straddle the 32b boundary and not be marked as 48b capable.

Always set 48b for all the objects where ppGTT merites.

In the process, there was one location where we failed to write the
upper 32b of the address into the instruction.

Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
---
 lib/igt_dummyload.c | 63 ++++++++++++++++++++++-----------------------
 1 file changed, 31 insertions(+), 32 deletions(-)

diff --git a/lib/igt_dummyload.c b/lib/igt_dummyload.c
index dc1bd51e08..17ae21f567 100644
--- a/lib/igt_dummyload.c
+++ b/lib/igt_dummyload.c
@@ -100,12 +100,21 @@ emit_recursive_batch(igt_spin_t *spin,
 	struct drm_i915_gem_execbuffer2 *execbuf;
 	struct drm_i915_gem_exec_object2 *obj;
 	unsigned int flags[GEM_MAX_ENGINES];
+	unsigned int objflags = 0;
 	unsigned int nengine;
 	int fence_fd = -1;
-	uint64_t addr, addr_scratch, ahnd = opts->ahnd, objflags = 0;
+	uint64_t addr, addr_scratch, ahnd = opts->ahnd;
 	uint32_t *cs;
 	int i;
 
+	igt_assert(!(opts->ctx && opts->ctx_id));
+
+	r = memset(relocs, 0, sizeof(relocs));
+	execbuf = memset(&spin->execbuf, 0, sizeof(spin->execbuf));
+	execbuf->rsvd1 = opts->ctx ? opts->ctx->id : opts->ctx_id;
+	execbuf->flags = I915_EXEC_NO_RELOC;
+	obj = memset(spin->obj, 0, sizeof(spin->obj));
+
 	/*
 	 * Pick a random location for our spinner et al.
 	 *
@@ -121,8 +130,12 @@ emit_recursive_batch(igt_spin_t *spin,
 	 * that wrap.
 	 */
 
+	addr = gem_aperture_size(fd) / 2;
+	if (addr >> 32)
+		objflags |= EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
+
 	if (!ahnd) {
-		addr = gem_aperture_size(fd) / 2;
+		addr /= 2;
 		if (addr >> 31)
 			addr = 1u << 31;
 		addr += random() % addr / 2;
@@ -131,8 +144,6 @@ emit_recursive_batch(igt_spin_t *spin,
 		objflags |= EXEC_OBJECT_PINNED;
 	}
 
-	igt_assert(!(opts->ctx && opts->ctx_id));
-
 	nengine = 0;
 	if (opts->engine == ALL_ENGINES) {
 		struct intel_execution_engine2 *engine;
@@ -150,11 +161,6 @@ emit_recursive_batch(igt_spin_t *spin,
 	}
 	igt_require(nengine);
 
-	memset(relocs, 0, sizeof(relocs));
-	execbuf = memset(&spin->execbuf, 0, sizeof(spin->execbuf));
-	execbuf->flags = I915_EXEC_NO_RELOC;
-	obj = memset(spin->obj, 0, sizeof(spin->obj));
-
 	obj[BATCH].handle =
 		handle_create(fd, BATCH_SIZE, opts->flags, &spin->batch);
 	if (!spin->batch) {
@@ -175,9 +181,7 @@ emit_recursive_batch(igt_spin_t *spin,
 							   BATCH_SIZE, 0,
 							   ALLOC_STRATEGY_LOW_TO_HIGH);
 	obj[BATCH].offset = CANONICAL(addr);
-	obj[BATCH].flags |= objflags;
-	if (obj[BATCH].offset >= (1ull << 32))
-		obj[BATCH].flags |= EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
+	obj[BATCH].flags = objflags;
 
 	addr += BATCH_SIZE;
 
@@ -192,27 +196,23 @@ emit_recursive_batch(igt_spin_t *spin,
 
 		obj[SCRATCH].handle = opts->dependency;
 		obj[SCRATCH].offset = CANONICAL(addr_scratch);
-		obj[SCRATCH].flags |= objflags;
-		if (obj[SCRATCH].offset >= (1ull << 32))
-			obj[SCRATCH].flags |= EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
+		obj[SCRATCH].flags = objflags;
 
 		if (!(opts->flags & IGT_SPIN_SOFTDEP)) {
 			obj[SCRATCH].flags |= EXEC_OBJECT_WRITE;
 
 			/* dummy write to dependency */
-			r = &relocs[obj[BATCH].relocation_count++];
 			r->presumed_offset = obj[SCRATCH].offset;
 			r->target_handle = obj[SCRATCH].handle;
 			r->offset = sizeof(uint32_t) * 1020;
 			r->delta = 0;
 			r->read_domains = I915_GEM_DOMAIN_RENDER;
 			r->write_domain = I915_GEM_DOMAIN_RENDER;
+			r++;
 		}
 
 		execbuf->buffer_count++;
 	} else if (opts->flags & IGT_SPIN_POLL_RUN) {
-		r = &relocs[obj[BATCH].relocation_count++];
-
 		igt_assert(!opts->dependency);
 
 		if (gen == 4 || gen == 5) {
@@ -244,6 +244,7 @@ emit_recursive_batch(igt_spin_t *spin,
 								   ALLOC_STRATEGY_LOW_TO_HIGH);
 		addr += 4096; /* guard page */
 		obj[SCRATCH].offset = CANONICAL(addr);
+		obj[SCRATCH].flags = objflags;
 		addr += 4096;
 
 		igt_assert_eq(spin->poll[SPIN_POLL_START_IDX], 0);
@@ -253,10 +254,6 @@ emit_recursive_batch(igt_spin_t *spin,
 		r->offset = sizeof(uint32_t) * 1;
 		r->delta = sizeof(uint32_t) * SPIN_POLL_START_IDX;
 
-		obj[SCRATCH].flags |= objflags;
-		if (obj[SCRATCH].offset >= (1ull << 32))
-			obj[SCRATCH].flags |= EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
-
 		*cs++ = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
 
 		if (gen >= 8) {
@@ -274,6 +271,7 @@ emit_recursive_batch(igt_spin_t *spin,
 		*cs++ = 1;
 
 		execbuf->buffer_count++;
+		r++;
 	}
 
 	spin->handle = obj[BATCH].handle;
@@ -314,8 +312,6 @@ emit_recursive_batch(igt_spin_t *spin,
 	 * no matter how they modify it (from either the GPU or CPU).
 	 */
 	if (gen >= 8) { /* arbitrary cutoff between ring/execlists submission */
-		r = &relocs[obj[BATCH].relocation_count++];
-
 		/*
 		 * On Sandybridge+ the comparison is a strict greater-than:
 		 * if the value at spin->condition is greater than BB_END,
@@ -334,15 +330,17 @@ emit_recursive_batch(igt_spin_t *spin,
 		r->offset = (cs + 2 - spin->batch) * sizeof(*cs);
 		r->read_domains = I915_GEM_DOMAIN_COMMAND;
 		r->delta = (spin->condition - spin->batch) * sizeof(*cs);
+		igt_assert(r->delta < 4096);
 
 		*cs++ = MI_COND_BATCH_BUFFER_END | MI_DO_COMPARE | 2;
 		*cs++ = MI_BATCH_BUFFER_END;
 		*cs++ = r->presumed_offset + r->delta;
-		*cs++ = 0;
+		*cs++ = r->presumed_offset >> 32;
+
+		r++;
 	}
 
 	/* recurse */
-	r = &relocs[obj[BATCH].relocation_count++];
 	r->target_handle = obj[BATCH].handle;
 	r->presumed_offset = obj[BATCH].offset;
 	r->offset = (cs + 1 - spin->batch) * sizeof(*cs);
@@ -363,11 +361,10 @@ emit_recursive_batch(igt_spin_t *spin,
 		*cs = r->presumed_offset + r->delta;
 		cs++;
 	}
-	obj[BATCH].relocs_ptr = to_user_pointer(relocs);
+	r++;
 
 	execbuf->buffers_ptr =
 	       	to_user_pointer(obj + (2 - execbuf->buffer_count));
-	execbuf->rsvd1 = opts->ctx ? opts->ctx->id : opts->ctx_id;
 
 	if (opts->flags & IGT_SPIN_FENCE_OUT)
 		execbuf->flags |= I915_EXEC_FENCE_OUT;
@@ -382,14 +379,16 @@ emit_recursive_batch(igt_spin_t *spin,
 		execbuf->rsvd2 = opts->fence;
 	}
 
+	/* For allocator we have to rid of relocation_count */
+	if (!ahnd) {
+		obj[BATCH].relocs_ptr = to_user_pointer(relocs);
+		obj[BATCH].relocation_count = r - relocs;
+	}
+
 	for (i = 0; i < nengine; i++) {
 		execbuf->flags &= ~ENGINE_MASK;
 		execbuf->flags |= flags[i];
 
-		/* For allocator we have to rid of relocation_count */
-		for (int j = 0; j < ARRAY_SIZE(spin->obj) && ahnd; j++)
-			spin->obj[j].relocation_count = 0;
-
 		gem_execbuf_wr(fd, execbuf);
 
 		if (opts->flags & IGT_SPIN_FENCE_OUT) {
-- 
2.34.1
