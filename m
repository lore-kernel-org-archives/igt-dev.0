Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 653BA6EB9B
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Aug 2021 13:42:30 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri,  6 Aug 2021 15:41:09 +0200
Message-Id: <20210806134145.24634-21-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210806134145.24634-1-zbigniew.kempczynski@intel.com>
References: <20210806134145.24634-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 20/56] tests/gem_exec_capture: Support
 gens without relocations
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
Cc: Andrzej Turko <andrzej.turko@linux.intel.com>, =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Andrzej Turko <andrzej.turko@linux.intel.com>

With relocations disabled on newer generations tests must assign addresses
to objects by themselves instead of relying on the driver.

Signed-off-by: Andrzej Turko <andrzej.turko@linux.intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/i915/gem_exec_capture.c | 131 ++++++++++++++++++++++++++--------
 1 file changed, 101 insertions(+), 30 deletions(-)

diff --git a/tests/i915/gem_exec_capture.c b/tests/i915/gem_exec_capture.c
index f59cb09da..6e817c46c 100644
--- a/tests/i915/gem_exec_capture.c
+++ b/tests/i915/gem_exec_capture.c
@@ -33,6 +33,8 @@
 
 IGT_TEST_DESCRIPTION("Check that we capture the user specified objects on a hang");
 
+#define ALIGNMENT (1 << 12)
+
 static void check_error_state(int dir, struct drm_i915_gem_exec_object2 *obj)
 {
 	char *error, *str;
@@ -53,7 +55,7 @@ static void check_error_state(int dir, struct drm_i915_gem_exec_object2 *obj)
 		addr = hi;
 		addr <<= 32;
 		addr |= lo;
-		igt_assert_eq_u64(addr, obj->offset);
+		igt_assert_eq_u64(addr, DECANONICAL(obj->offset));
 		found = true;
 	}
 
@@ -61,8 +63,8 @@ static void check_error_state(int dir, struct drm_i915_gem_exec_object2 *obj)
 	igt_assert(found);
 }
 
-static void __capture1(int fd, int dir, const intel_ctx_t *ctx,
-		       unsigned ring, uint32_t target)
+static void __capture1(int fd, int dir, uint64_t ahnd, const intel_ctx_t *ctx,
+		       unsigned ring, uint32_t target, uint64_t target_size)
 {
 	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
 	struct drm_i915_gem_exec_object2 obj[4];
@@ -74,32 +76,46 @@ static void __capture1(int fd, int dir, const intel_ctx_t *ctx,
 	struct drm_i915_gem_execbuffer2 execbuf;
 	uint32_t *batch, *seqno;
 	int i;
+	bool do_relocs = gem_has_relocations(fd);
 
 	memset(obj, 0, sizeof(obj));
 	obj[SCRATCH].handle = gem_create(fd, 4096);
+	obj[SCRATCH].flags = EXEC_OBJECT_WRITE;
 	obj[CAPTURE].handle = target;
 	obj[CAPTURE].flags = EXEC_OBJECT_CAPTURE;
 	obj[NOCAPTURE].handle = gem_create(fd, 4096);
 
 	obj[BATCH].handle = gem_create(fd, 4096);
-	obj[BATCH].relocs_ptr = (uintptr_t)reloc;
-	obj[BATCH].relocation_count = ARRAY_SIZE(reloc);
+
+	for (i = 0; i < 4; i++) {
+		obj[i].offset = intel_allocator_alloc(ahnd, obj[i].handle,
+						      i == CAPTURE ? target_size : 4096,
+						      ALIGNMENT);
+		obj[i].offset = CANONICAL(obj[i].offset);
+		obj[i].flags |= EXEC_OBJECT_SUPPORTS_48B_ADDRESS |
+				(do_relocs ? 0 : EXEC_OBJECT_PINNED);
+	}
 
 	memset(reloc, 0, sizeof(reloc));
 	reloc[0].target_handle = obj[BATCH].handle; /* recurse */
-	reloc[0].presumed_offset = 0;
+	reloc[0].presumed_offset = obj[BATCH].offset;
 	reloc[0].offset = 5*sizeof(uint32_t);
 	reloc[0].delta = 0;
 	reloc[0].read_domains = I915_GEM_DOMAIN_COMMAND;
 	reloc[0].write_domain = 0;
 
 	reloc[1].target_handle = obj[SCRATCH].handle; /* breadcrumb */
-	reloc[1].presumed_offset = 0;
+	reloc[1].presumed_offset = obj[SCRATCH].offset;
 	reloc[1].offset = sizeof(uint32_t);
 	reloc[1].delta = 0;
 	reloc[1].read_domains = I915_GEM_DOMAIN_RENDER;
 	reloc[1].write_domain = I915_GEM_DOMAIN_RENDER;
 
+	if (do_relocs) {
+		obj[BATCH].relocs_ptr = (uintptr_t)reloc;
+		obj[BATCH].relocation_count = ARRAY_SIZE(reloc);
+	}
+
 	seqno = gem_mmap__wc(fd, obj[SCRATCH].handle, 0, 4096, PROT_READ);
 	gem_set_domain(fd, obj[SCRATCH].handle,
 			I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
@@ -111,8 +127,8 @@ static void __capture1(int fd, int dir, const intel_ctx_t *ctx,
 	i = 0;
 	batch[i] = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
 	if (gen >= 8) {
-		batch[++i] = 0;
-		batch[++i] = 0;
+		batch[++i] = obj[SCRATCH].offset;
+		batch[++i] = obj[SCRATCH].offset >> 32;
 	} else if (gen >= 4) {
 		batch[++i] = 0;
 		batch[++i] = 0;
@@ -128,8 +144,8 @@ static void __capture1(int fd, int dir, const intel_ctx_t *ctx,
 	batch[++i] = MI_BATCH_BUFFER_START; /* not crashed? try again! */
 	if (gen >= 8) {
 		batch[i] |= 1 << 8 | 1;
-		batch[++i] = 0;
-		batch[++i] = 0;
+		batch[++i] = obj[BATCH].offset;
+		batch[++i] = obj[BATCH].offset >> 32;
 	} else if (gen >= 6) {
 		batch[i] |= 1 << 8;
 		batch[++i] = 0;
@@ -165,6 +181,9 @@ static void __capture1(int fd, int dir, const intel_ctx_t *ctx,
 
 	gem_sync(fd, obj[BATCH].handle);
 
+	intel_allocator_free(ahnd, obj[BATCH].handle);
+	intel_allocator_free(ahnd, obj[NOCAPTURE].handle);
+	intel_allocator_free(ahnd, obj[SCRATCH].handle);
 	gem_close(fd, obj[BATCH].handle);
 	gem_close(fd, obj[NOCAPTURE].handle);
 	gem_close(fd, obj[SCRATCH].handle);
@@ -173,10 +192,16 @@ static void __capture1(int fd, int dir, const intel_ctx_t *ctx,
 static void capture(int fd, int dir, const intel_ctx_t *ctx, unsigned ring)
 {
 	uint32_t handle;
+	uint64_t ahnd;
 
 	handle = gem_create(fd, 4096);
-	__capture1(fd, dir, ctx, ring, handle);
+	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_SIMPLE);
+
+	__capture1(fd, dir, ahnd, ctx, ring, handle, 4096);
+
 	gem_close(fd, handle);
+	intel_allocator_free(ahnd, handle);
+	intel_allocator_close(ahnd);
 }
 
 static int cmp(const void *A, const void *B)
@@ -195,7 +220,7 @@ static int cmp(const void *A, const void *B)
 static struct offset {
 	uint64_t addr;
 	unsigned long idx;
-} *__captureN(int fd, int dir, unsigned ring,
+} *__captureN(int fd, int dir, uint64_t ahnd, unsigned ring,
 	      unsigned int size, int count,
 	      unsigned int flags)
 #define INCREMENTAL 0x1
@@ -208,18 +233,30 @@ static struct offset {
 	uint32_t *batch, *seqno;
 	struct offset *offsets;
 	int i;
+	bool do_relocs = gem_has_relocations(fd);
 
-	offsets = calloc(count , sizeof(*offsets));
+	offsets = calloc(count, sizeof(*offsets));
 	igt_assert(offsets);
 
 	obj = calloc(count + 2, sizeof(*obj));
 	igt_assert(obj);
 
 	obj[0].handle = gem_create(fd, 4096);
+	obj[0].offset = intel_allocator_alloc(ahnd, obj[0].handle,
+					      4096, ALIGNMENT);
+	obj[0].offset = CANONICAL(obj[0].offset);
+	obj[0].flags = EXEC_OBJECT_WRITE | EXEC_OBJECT_SUPPORTS_48B_ADDRESS |
+		       (do_relocs ? 0 : EXEC_OBJECT_PINNED);
+
 	for (i = 0; i < count; i++) {
 		obj[i + 1].handle = gem_create(fd, size);
-		obj[i + 1].flags =
-			EXEC_OBJECT_CAPTURE | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
+		obj[i + 1].offset = intel_allocator_alloc(ahnd, obj[i + 1].handle,
+							  size, ALIGNMENT);
+		obj[i + 1].offset = CANONICAL(obj[i + 1].offset);
+		obj[i + 1].flags = EXEC_OBJECT_CAPTURE |
+				   EXEC_OBJECT_SUPPORTS_48B_ADDRESS |
+				   (do_relocs ? 0 : EXEC_OBJECT_PINNED);
+
 		if (flags & INCREMENTAL) {
 			uint32_t *ptr;
 
@@ -232,23 +269,32 @@ static struct offset {
 	}
 
 	obj[count + 1].handle = gem_create(fd, 4096);
-	obj[count + 1].relocs_ptr = (uintptr_t)reloc;
-	obj[count + 1].relocation_count = ARRAY_SIZE(reloc);
+	obj[count + 1].offset = intel_allocator_alloc(ahnd, obj[count + 1].handle,
+						      4096, ALIGNMENT);
+	obj[count + 1].offset = CANONICAL(obj[count + 1].offset);
+	obj[count + 1].flags = EXEC_OBJECT_SUPPORTS_48B_ADDRESS |
+			       (do_relocs ? 0 : EXEC_OBJECT_PINNED);
 
 	memset(reloc, 0, sizeof(reloc));
 	reloc[0].target_handle = obj[count + 1].handle; /* recurse */
-	reloc[0].presumed_offset = 0;
+	reloc[0].presumed_offset = obj[count + 1].offset;
 	reloc[0].offset = 5*sizeof(uint32_t);
 	reloc[0].delta = 0;
 	reloc[0].read_domains = I915_GEM_DOMAIN_COMMAND;
 	reloc[0].write_domain = 0;
 
 	reloc[1].target_handle = obj[0].handle; /* breadcrumb */
-	reloc[1].presumed_offset = 0;
+	reloc[1].presumed_offset = obj[0].offset;
 	reloc[1].offset = sizeof(uint32_t);
 	reloc[1].delta = 0;
 	reloc[1].read_domains = I915_GEM_DOMAIN_RENDER;
 	reloc[1].write_domain = I915_GEM_DOMAIN_RENDER;
+	if (do_relocs) {
+		obj[count + 1].relocs_ptr = (uintptr_t)reloc;
+		obj[count + 1].relocation_count = ARRAY_SIZE(reloc);
+	} else {
+		execbuf.flags = I915_EXEC_NO_RELOC;
+	}
 
 	seqno = gem_mmap__wc(fd, obj[0].handle, 0, 4096, PROT_READ);
 	gem_set_domain(fd, obj[0].handle,
@@ -261,8 +307,8 @@ static struct offset {
 	i = 0;
 	batch[i] = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
 	if (gen >= 8) {
-		batch[++i] = 0;
-		batch[++i] = 0;
+		batch[++i] = obj[0].offset;
+		batch[++i] = obj[0].offset >> 32;
 	} else if (gen >= 4) {
 		batch[++i] = 0;
 		batch[++i] = 0;
@@ -278,8 +324,8 @@ static struct offset {
 	batch[++i] = MI_BATCH_BUFFER_START; /* not crashed? try again! */
 	if (gen >= 8) {
 		batch[i] |= 1 << 8 | 1;
-		batch[++i] = 0;
-		batch[++i] = 0;
+		batch[++i] = obj[count + 1].offset;
+		batch[++i] = obj[count + 1].offset >> 32;
 	} else if (gen >= 6) {
 		batch[i] |= 1 << 8;
 		batch[++i] = 0;
@@ -315,12 +361,16 @@ static struct offset {
 
 	gem_close(fd, obj[count + 1].handle);
 	for (i = 0; i < count; i++) {
-		offsets[i].addr = obj[i + 1].offset;
+		offsets[i].addr = DECANONICAL(obj[i + 1].offset);
 		offsets[i].idx = i;
 		gem_close(fd, obj[i + 1].handle);
+		intel_allocator_free(ahnd, obj[i + 1].handle);
 	}
 	gem_close(fd, obj[0].handle);
 
+	intel_allocator_free(ahnd, obj[0].handle);
+	intel_allocator_free(ahnd, obj[count + 1].handle);
+
 	qsort(offsets, count, sizeof(*offsets), cmp);
 	igt_assert(offsets[0].addr <= offsets[count-1].addr);
 	return offsets;
@@ -414,7 +464,7 @@ ascii85_decode(char *in, uint32_t **out, bool inflate, char **end)
 
 static void many(int fd, int dir, uint64_t size, unsigned int flags)
 {
-	uint64_t ram, gtt;
+	uint64_t ram, gtt, ahnd;
 	unsigned long count, blobs;
 	struct offset *offsets;
 	char *error, *str;
@@ -428,8 +478,9 @@ static void many(int fd, int dir, uint64_t size, unsigned int flags)
 	igt_require(count > 1);
 
 	intel_require_memory(count, size, CHECK_RAM);
+	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_SIMPLE);
 
-	offsets = __captureN(fd, dir, 0, size, count, flags);
+	offsets = __captureN(fd, dir, ahnd, 0, size, count, flags);
 
 	error = igt_sysfs_get(dir, "error");
 	igt_sysfs_set(dir, "error", "Begone!");
@@ -496,6 +547,7 @@ static void many(int fd, int dir, uint64_t size, unsigned int flags)
 
 	free(error);
 	free(offsets);
+	intel_allocator_close(ahnd);
 }
 
 static void prioinv(int fd, int dir, const intel_ctx_t *ctx,
@@ -512,10 +564,16 @@ static void prioinv(int fd, int dir, const intel_ctx_t *ctx,
 		.rsvd1 = ctx->id,
 	};
 	int64_t timeout = NSEC_PER_SEC; /* 1s, feeling generous, blame debug */
-	uint64_t ram, gtt, size = 4 << 20;
+	uint64_t ram, gtt, ahnd, size = 4 << 20;
 	unsigned long count;
 	int link[2], dummy;
 
+	intel_allocator_multiprocess_start();
+	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_SIMPLE);
+	obj.offset = intel_allocator_alloc(ahnd, obj.handle, 4096, ALIGNMENT);
+	obj.offset = CANONICAL(obj.offset);
+	obj.flags = EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
+
 	igt_require(gem_scheduler_enabled(fd));
 	igt_require(igt_params_set(fd, "reset", "%u", -1)); /* engine resets! */
 	igt_require(gem_gpu_reset_type(fd) > 1);
@@ -544,7 +602,13 @@ static void prioinv(int fd, int dir, const intel_ctx_t *ctx,
 		fd = gem_reopen_driver(fd);
 		igt_debug("Submitting large capture [%ld x %dMiB objects]\n",
 			  count, (int)(size >> 20));
-		free(__captureN(fd, dir, ring, size, count, ASYNC));
+
+		/* Reopen the allocator in the new process. */
+		ahnd = intel_allocator_open(fd, child + 1, INTEL_ALLOCATOR_SIMPLE);
+
+		free(__captureN(fd, dir, ahnd, ring, size, count, ASYNC));
+		intel_allocator_close(ahnd);
+
 		write(link[1], &fd, sizeof(fd)); /* wake the parent up */
 		igt_force_gpu_reset(fd);
 		write(link[1], &fd, sizeof(fd)); /* wake the parent up */
@@ -567,19 +631,26 @@ static void prioinv(int fd, int dir, const intel_ctx_t *ctx,
 	close(link[1]);
 
 	gem_quiescent_gpu(fd);
+	intel_allocator_free(ahnd, obj.handle);
+	intel_allocator_close(ahnd);
+	intel_allocator_multiprocess_stop();
 }
 
 static void userptr(int fd, int dir)
 {
 	uint32_t handle;
+	uint64_t ahnd;
 	void *ptr;
 
 	igt_assert(posix_memalign(&ptr, 4096, 4096) == 0);
 	igt_require(__gem_userptr(fd, ptr, 4096, 0, 0, &handle) == 0);
+	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_SIMPLE);
 
-	__capture1(fd, dir, intel_ctx_0(fd), 0, handle);
+	__capture1(fd, dir, ahnd, intel_ctx_0(fd), 0, handle, 4096);
 
 	gem_close(fd, handle);
+	intel_allocator_free(ahnd, handle);
+	intel_allocator_close(ahnd);
 	free(ptr);
 }
 
-- 
2.26.0
