Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52FB289DC2
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Aug 2021 05:27:25 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 10 Aug 2021 07:26:07 +0200
Message-Id: <20210810052711.7866-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210810052711.7866-1-zbigniew.kempczynski@intel.com>
References: <20210810052711.7866-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v6 01/65] lib/igt_dummyload: Add support of
 using allocator in igt spinner
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
List-ID: <igt-dev@lists.freedesktop.org>

For gens without relocations we need to use softpin with valid offsets
which do not overlap other execbuf objects. As spinner during creation
knows nothing about vm it has to run into allocator handle must be
passed to properly acquire offsets from allocator instance.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/igt_dummyload.c | 74 ++++++++++++++++++++++++++++++++++++---------
 lib/igt_dummyload.h |  3 ++
 2 files changed, 63 insertions(+), 14 deletions(-)

diff --git a/lib/igt_dummyload.c b/lib/igt_dummyload.c
index 8a5ad5ee3..645db9222 100644
--- a/lib/igt_dummyload.c
+++ b/lib/igt_dummyload.c
@@ -35,6 +35,7 @@
 #include "i915/gem_engine_topology.h"
 #include "i915/gem_mman.h"
 #include "i915/gem_submission.h"
+#include "igt_aux.h"
 #include "igt_core.h"
 #include "igt_device.h"
 #include "igt_dummyload.h"
@@ -101,7 +102,7 @@ emit_recursive_batch(igt_spin_t *spin,
 	unsigned int flags[GEM_MAX_ENGINES];
 	unsigned int nengine;
 	int fence_fd = -1;
-	uint64_t addr;
+	uint64_t addr, addr_scratch, ahnd = opts->ahnd, objflags = 0;
 	uint32_t *cs;
 	int i;
 
@@ -119,11 +120,17 @@ emit_recursive_batch(igt_spin_t *spin,
 	 * are not allowed in the first 256KiB, for fear of negative relocations
 	 * that wrap.
 	 */
-	addr = gem_aperture_size(fd) / 2;
-	if (addr >> 31)
-		addr = 1u << 31;
-	addr += random() % addr / 2;
-	addr &= -4096;
+
+	if (!ahnd) {
+		addr = gem_aperture_size(fd) / 2;
+		if (addr >> 31)
+			addr = 1u << 31;
+		addr += random() % addr / 2;
+		addr &= -4096;
+	} else {
+		spin->ahnd = ahnd;
+		objflags |= EXEC_OBJECT_PINNED;
+	}
 
 	igt_assert(!(opts->ctx && opts->ctx_id));
 
@@ -164,16 +171,34 @@ emit_recursive_batch(igt_spin_t *spin,
 	execbuf->buffer_count++;
 	cs = spin->batch;
 
-	obj[BATCH].offset = addr;
+	if (ahnd)
+		addr = intel_allocator_alloc_with_strategy(ahnd, obj[BATCH].handle,
+							   BATCH_SIZE, 0,
+							   ALLOC_STRATEGY_LOW_TO_HIGH);
+	obj[BATCH].offset = CANONICAL(addr);
+	obj[BATCH].flags |= objflags;
+	if (obj[BATCH].offset >= (1ull << 32))
+		obj[BATCH].flags |= EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
+
 	addr += BATCH_SIZE;
 
 	if (opts->dependency) {
 		igt_assert(!(opts->flags & IGT_SPIN_POLL_RUN));
+		if (ahnd)
+			addr_scratch = intel_allocator_alloc_with_strategy(ahnd, opts->dependency,
+									   BATCH_SIZE, 0,
+									   ALLOC_STRATEGY_LOW_TO_HIGH);
+		else
+			addr_scratch = addr;
 
 		obj[SCRATCH].handle = opts->dependency;
-		obj[SCRATCH].offset = addr;
+		obj[SCRATCH].offset = CANONICAL(addr_scratch);
+		obj[SCRATCH].flags |= objflags;
+		if (obj[SCRATCH].offset >= (1ull << 32))
+			obj[SCRATCH].flags |= EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
+
 		if (!(opts->flags & IGT_SPIN_SOFTDEP)) {
-			obj[SCRATCH].flags = EXEC_OBJECT_WRITE;
+			obj[SCRATCH].flags |= EXEC_OBJECT_WRITE;
 
 			/* dummy write to dependency */
 			r = &relocs[obj[BATCH].relocation_count++];
@@ -212,8 +237,14 @@ emit_recursive_batch(igt_spin_t *spin,
 								       0, 4096,
 								       PROT_READ | PROT_WRITE);
 		}
+
+		if (ahnd)
+			addr = intel_allocator_alloc_with_strategy(ahnd,
+								   spin->poll_handle,
+								   BATCH_SIZE * 3, 0,
+								   ALLOC_STRATEGY_LOW_TO_HIGH);
 		addr += 4096; /* guard page */
-		obj[SCRATCH].offset = addr;
+		obj[SCRATCH].offset = CANONICAL(addr);
 		addr += 4096;
 
 		igt_assert_eq(spin->poll[SPIN_POLL_START_IDX], 0);
@@ -223,11 +254,15 @@ emit_recursive_batch(igt_spin_t *spin,
 		r->offset = sizeof(uint32_t) * 1;
 		r->delta = sizeof(uint32_t) * SPIN_POLL_START_IDX;
 
+		obj[SCRATCH].flags |= objflags;
+		if (obj[SCRATCH].offset >= (1ull << 32))
+			obj[SCRATCH].flags |= EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
+
 		*cs++ = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
 
 		if (gen >= 8) {
 			*cs++ = r->presumed_offset + r->delta;
-			*cs++ = 0;
+			*cs++ = (r->presumed_offset + r->delta) >> 32;
 		} else if (gen >= 4) {
 			*cs++ = 0;
 			*cs++ = r->presumed_offset + r->delta;
@@ -314,10 +349,11 @@ emit_recursive_batch(igt_spin_t *spin,
 	r->offset = (cs + 1 - spin->batch) * sizeof(*cs);
 	r->read_domains = I915_GEM_DOMAIN_COMMAND;
 	r->delta = LOOP_START_OFFSET;
+
 	if (gen >= 8) {
 		*cs++ = MI_BATCH_BUFFER_START | 1 << 8 | 1;
 		*cs++ = r->presumed_offset + r->delta;
-		*cs++ = 0;
+		*cs++ = (r->presumed_offset + r->delta) >> 32;
 	} else if (gen >= 6) {
 		*cs++ = MI_BATCH_BUFFER_START | 1 << 8;
 		*cs++ = r->presumed_offset + r->delta;
@@ -351,6 +387,10 @@ emit_recursive_batch(igt_spin_t *spin,
 		execbuf->flags &= ~ENGINE_MASK;
 		execbuf->flags |= flags[i];
 
+		/* For allocator we have to rid of relocation_count */
+		for (int j = 0; j < ARRAY_SIZE(spin->obj) && ahnd; j++)
+			spin->obj[j].relocation_count = 0;
+
 		gem_execbuf_wr(fd, execbuf);
 
 		if (opts->flags & IGT_SPIN_FENCE_OUT) {
@@ -569,11 +609,17 @@ static void __igt_spin_free(int fd, igt_spin_t *spin)
 	if (spin->batch)
 		gem_munmap(spin->batch, BATCH_SIZE);
 
-	if (spin->poll_handle)
+	if (spin->poll_handle) {
 		gem_close(fd, spin->poll_handle);
+		if (spin->ahnd)
+			intel_allocator_free(spin->ahnd, spin->poll_handle);
+	}
 
-	if (spin->handle)
+	if (spin->handle) {
 		gem_close(fd, spin->handle);
+		if (spin->ahnd)
+			intel_allocator_free(spin->ahnd, spin->handle);
+	}
 
 	if (spin->out_fence >= 0)
 		close(spin->out_fence);
diff --git a/lib/igt_dummyload.h b/lib/igt_dummyload.h
index 67e1a08ed..f02052614 100644
--- a/lib/igt_dummyload.h
+++ b/lib/igt_dummyload.h
@@ -58,6 +58,8 @@ typedef struct igt_spin {
 
 	unsigned int flags;
 #define SPIN_CLFLUSH (1 << 0)
+
+	uint64_t ahnd;
 } igt_spin_t;
 
 /**
@@ -78,6 +80,7 @@ typedef struct igt_spin_factory {
 	unsigned int engine;
 	unsigned int flags;
 	int fence;
+	uint64_t ahnd;
 } igt_spin_factory_t;
 
 #define IGT_SPIN_FENCE_IN      (1 << 0)
-- 
2.26.0
