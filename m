Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A8E46E563
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Aug 2021 07:47:25 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri, 13 Aug 2021 09:46:59 +0200
Message-Id: <20210813074703.18778-6-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210813074703.18778-1-zbigniew.kempczynski@intel.com>
References: <20210813074703.18778-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 5/9] tests/gem_exec_capture: Support gens
 without relocations
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
Cc: Andrzej Turko <andrzej.turko@linux.intel.com>, =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, Petri Latvala <petri.latvala@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Andrzej Turko <andrzej.turko@linux.intel.com>

With relocations disabled on newer generations tests must assign addresses
to objects by themselves instead of relying on the driver.

Signed-off-by: Andrzej Turko <andrzej.turko@linux.intel.com>
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_exec_capture.c | 98 ++++++++++++++++++++++++++---------
 1 file changed, 74 insertions(+), 24 deletions(-)

diff --git a/tests/i915/gem_exec_capture.c b/tests/i915/gem_exec_capture.c
index f59cb09da..cd6b2f88f 100644
--- a/tests/i915/gem_exec_capture.c
+++ b/tests/i915/gem_exec_capture.c
@@ -61,8 +61,8 @@ static void check_error_state(int dir, struct drm_i915_gem_exec_object2 *obj)
 	igt_assert(found);
 }
 
-static void __capture1(int fd, int dir, const intel_ctx_t *ctx,
-		       unsigned ring, uint32_t target)
+static void __capture1(int fd, int dir, uint64_t ahnd, const intel_ctx_t *ctx,
+		       unsigned ring, uint32_t target, uint64_t target_size)
 {
 	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
 	struct drm_i915_gem_exec_object2 obj[4];
@@ -77,24 +77,31 @@ static void __capture1(int fd, int dir, const intel_ctx_t *ctx,
 
 	memset(obj, 0, sizeof(obj));
 	obj[SCRATCH].handle = gem_create(fd, 4096);
+	obj[SCRATCH].flags = EXEC_OBJECT_WRITE;
 	obj[CAPTURE].handle = target;
 	obj[CAPTURE].flags = EXEC_OBJECT_CAPTURE;
 	obj[NOCAPTURE].handle = gem_create(fd, 4096);
 
 	obj[BATCH].handle = gem_create(fd, 4096);
 	obj[BATCH].relocs_ptr = (uintptr_t)reloc;
-	obj[BATCH].relocation_count = ARRAY_SIZE(reloc);
+	obj[BATCH].relocation_count = !ahnd ? ARRAY_SIZE(reloc) : 0;
+
+	for (i = 0; i < ARRAY_SIZE(obj); i++) {
+		obj[i].offset = get_offset(ahnd, obj[i].handle,
+					   i == CAPTURE ? target_size : 4096, 0);
+		obj[i].flags |= ahnd ? EXEC_OBJECT_PINNED : 0;
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
@@ -111,8 +118,8 @@ static void __capture1(int fd, int dir, const intel_ctx_t *ctx,
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
@@ -128,8 +135,8 @@ static void __capture1(int fd, int dir, const intel_ctx_t *ctx,
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
@@ -165,6 +172,8 @@ static void __capture1(int fd, int dir, const intel_ctx_t *ctx,
 
 	gem_sync(fd, obj[BATCH].handle);
 
+	for (i = 0; i < ARRAY_SIZE(obj); i++)
+		put_offset(ahnd, obj[i].handle);
 	gem_close(fd, obj[BATCH].handle);
 	gem_close(fd, obj[NOCAPTURE].handle);
 	gem_close(fd, obj[SCRATCH].handle);
@@ -173,10 +182,15 @@ static void __capture1(int fd, int dir, const intel_ctx_t *ctx,
 static void capture(int fd, int dir, const intel_ctx_t *ctx, unsigned ring)
 {
 	uint32_t handle;
+	uint64_t ahnd;
 
 	handle = gem_create(fd, 4096);
-	__capture1(fd, dir, ctx, ring, handle);
+	ahnd = get_reloc_ahnd(fd, ctx->id);
+
+	__capture1(fd, dir, ahnd, ctx, ring, handle, 4096);
+
 	gem_close(fd, handle);
+	put_ahnd(ahnd);
 }
 
 static int cmp(const void *A, const void *B)
@@ -195,7 +209,7 @@ static int cmp(const void *A, const void *B)
 static struct offset {
 	uint64_t addr;
 	unsigned long idx;
-} *__captureN(int fd, int dir, unsigned ring,
+} *__captureN(int fd, int dir, uint64_t ahnd, unsigned ring,
 	      unsigned int size, int count,
 	      unsigned int flags)
 #define INCREMENTAL 0x1
@@ -209,17 +223,24 @@ static struct offset {
 	struct offset *offsets;
 	int i;
 
-	offsets = calloc(count , sizeof(*offsets));
+	offsets = calloc(count, sizeof(*offsets));
 	igt_assert(offsets);
 
 	obj = calloc(count + 2, sizeof(*obj));
 	igt_assert(obj);
 
 	obj[0].handle = gem_create(fd, 4096);
+	obj[0].offset = get_offset(ahnd, obj[0].handle, 4096, 0);
+	obj[0].flags = EXEC_OBJECT_WRITE | ahnd ? EXEC_OBJECT_PINNED : 0;
+
 	for (i = 0; i < count; i++) {
 		obj[i + 1].handle = gem_create(fd, size);
+		obj[i + 1].offset = get_offset(ahnd, obj[i + 1].handle, size, 0);
 		obj[i + 1].flags =
 			EXEC_OBJECT_CAPTURE | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
+		if (ahnd)
+			obj[i + 1].flags |= EXEC_OBJECT_PINNED;
+
 		if (flags & INCREMENTAL) {
 			uint32_t *ptr;
 
@@ -233,23 +254,30 @@ static struct offset {
 
 	obj[count + 1].handle = gem_create(fd, 4096);
 	obj[count + 1].relocs_ptr = (uintptr_t)reloc;
-	obj[count + 1].relocation_count = ARRAY_SIZE(reloc);
+	obj[count + 1].relocation_count = !ahnd ? ARRAY_SIZE(reloc) : 0;
+	obj[count + 1].offset = get_offset(ahnd, obj[count + 1].handle, 4096, 0);
+	obj[count + 1].flags = ahnd ? EXEC_OBJECT_PINNED : 0;
 
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
 
+	if (!ahnd) {
+		obj[count + 1].relocs_ptr = (uintptr_t)reloc;
+		obj[count + 1].relocation_count = ARRAY_SIZE(reloc);
+	}
+
 	seqno = gem_mmap__wc(fd, obj[0].handle, 0, 4096, PROT_READ);
 	gem_set_domain(fd, obj[0].handle,
 			I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
@@ -261,8 +289,8 @@ static struct offset {
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
@@ -278,8 +306,8 @@ static struct offset {
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
@@ -314,12 +342,15 @@ static struct offset {
 	}
 
 	gem_close(fd, obj[count + 1].handle);
+	put_offset(ahnd, obj[count + 1].handle);
 	for (i = 0; i < count; i++) {
 		offsets[i].addr = obj[i + 1].offset;
 		offsets[i].idx = i;
 		gem_close(fd, obj[i + 1].handle);
+		put_offset(ahnd, obj[i + 1].handle);
 	}
 	gem_close(fd, obj[0].handle);
+	put_offset(ahnd, obj[0].handle);
 
 	qsort(offsets, count, sizeof(*offsets), cmp);
 	igt_assert(offsets[0].addr <= offsets[count-1].addr);
@@ -414,7 +445,7 @@ ascii85_decode(char *in, uint32_t **out, bool inflate, char **end)
 
 static void many(int fd, int dir, uint64_t size, unsigned int flags)
 {
-	uint64_t ram, gtt;
+	uint64_t ram, gtt, ahnd;
 	unsigned long count, blobs;
 	struct offset *offsets;
 	char *error, *str;
@@ -428,8 +459,9 @@ static void many(int fd, int dir, uint64_t size, unsigned int flags)
 	igt_require(count > 1);
 
 	intel_require_memory(count, size, CHECK_RAM);
+	ahnd = get_reloc_ahnd(fd, 0);
 
-	offsets = __captureN(fd, dir, 0, size, count, flags);
+	offsets = __captureN(fd, dir, ahnd, 0, size, count, flags);
 
 	error = igt_sysfs_get(dir, "error");
 	igt_sysfs_set(dir, "error", "Begone!");
@@ -496,6 +528,7 @@ static void many(int fd, int dir, uint64_t size, unsigned int flags)
 
 	free(error);
 	free(offsets);
+	put_ahnd(ahnd);
 }
 
 static void prioinv(int fd, int dir, const intel_ctx_t *ctx,
@@ -512,10 +545,13 @@ static void prioinv(int fd, int dir, const intel_ctx_t *ctx,
 		.rsvd1 = ctx->id,
 	};
 	int64_t timeout = NSEC_PER_SEC; /* 1s, feeling generous, blame debug */
-	uint64_t ram, gtt, size = 4 << 20;
+	uint64_t ram, gtt, ahnd, size = 4 << 20;
 	unsigned long count;
 	int link[2], dummy;
 
+	ahnd = get_reloc_ahnd(fd, ctx->id);
+	obj.offset = get_offset(ahnd, obj.handle, 4096, 0);
+
 	igt_require(gem_scheduler_enabled(fd));
 	igt_require(igt_params_set(fd, "reset", "%u", -1)); /* engine resets! */
 	igt_require(gem_gpu_reset_type(fd) > 1);
@@ -544,7 +580,14 @@ static void prioinv(int fd, int dir, const intel_ctx_t *ctx,
 		fd = gem_reopen_driver(fd);
 		igt_debug("Submitting large capture [%ld x %dMiB objects]\n",
 			  count, (int)(size >> 20));
-		free(__captureN(fd, dir, ring, size, count, ASYNC));
+
+		intel_allocator_init();
+		/* Reopen the allocator in the new process. */
+		ahnd = get_reloc_ahnd(fd, 0);
+
+		free(__captureN(fd, dir, ahnd, ring, size, count, ASYNC));
+		put_ahnd(ahnd);
+
 		write(link[1], &fd, sizeof(fd)); /* wake the parent up */
 		igt_force_gpu_reset(fd);
 		write(link[1], &fd, sizeof(fd)); /* wake the parent up */
@@ -567,19 +610,26 @@ static void prioinv(int fd, int dir, const intel_ctx_t *ctx,
 	close(link[1]);
 
 	gem_quiescent_gpu(fd);
+	put_offset(ahnd, obj.handle);
+	put_ahnd(ahnd);
+	intel_allocator_multiprocess_stop();
 }
 
 static void userptr(int fd, int dir)
 {
+	const intel_ctx_t *ctx = intel_ctx_0(fd);
 	uint32_t handle;
+	uint64_t ahnd;
 	void *ptr;
 
 	igt_assert(posix_memalign(&ptr, 4096, 4096) == 0);
 	igt_require(__gem_userptr(fd, ptr, 4096, 0, 0, &handle) == 0);
+	ahnd = get_reloc_ahnd(fd, ctx->id);
 
-	__capture1(fd, dir, intel_ctx_0(fd), 0, handle);
+	__capture1(fd, dir, ahnd, intel_ctx_0(fd), 0, handle, 4096);
 
 	gem_close(fd, handle);
+	put_ahnd(ahnd);
 	free(ptr);
 }
 
-- 
2.26.0
