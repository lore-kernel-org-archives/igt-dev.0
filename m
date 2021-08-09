Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DD2C89ACD
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Aug 2021 13:08:51 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon,  9 Aug 2021 15:04:50 +0200
Message-Id: <20210809130533.27759-23-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210809130533.27759-1-zbigniew.kempczynski@intel.com>
References: <20210809130533.27759-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v5 22/65] tests/gem_exec_store: Support gens
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
Cc: Andrzej Turko <andrzej.turko@linux.intel.com>, =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Andrzej Turko <andrzej.turko@linux.intel.com>

With relocations disabled on newer generations
tests must assign addresses to objects by
themselves instead of relying on the driver.

Signed-off-by: Andrzej Turko <andrzej.turko@linux.intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/i915/gem_exec_store.c | 134 ++++++++++++++++++++++++++++--------
 1 file changed, 106 insertions(+), 28 deletions(-)

diff --git a/tests/i915/gem_exec_store.c b/tests/i915/gem_exec_store.c
index 0798f61d7..38c595e34 100644
--- a/tests/i915/gem_exec_store.c
+++ b/tests/i915/gem_exec_store.c
@@ -37,6 +37,9 @@
 
 #define ENGINE_MASK  (I915_EXEC_RING_MASK | I915_EXEC_BSD_MASK)
 
+/* Without alignment detection we assume the worst-case scenario. */
+#define ALIGNMENT (1 << 21)
+
 static void store_dword(int fd, const intel_ctx_t *ctx,
 			const struct intel_execution_engine2 *e)
 {
@@ -45,6 +48,7 @@ static void store_dword(int fd, const intel_ctx_t *ctx,
 	struct drm_i915_gem_relocation_entry reloc;
 	struct drm_i915_gem_execbuffer2 execbuf;
 	uint32_t batch[16];
+	uint64_t ahnd;
 	int i;
 
 	intel_detect_and_clear_missed_interrupts(fd);
@@ -56,43 +60,63 @@ static void store_dword(int fd, const intel_ctx_t *ctx,
 		execbuf.flags |= I915_EXEC_SECURE;
 	execbuf.rsvd1 = ctx->id;
 
+	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_SIMPLE);
+
 	memset(obj, 0, sizeof(obj));
 	obj[0].handle = gem_create(fd, 4096);
+	obj[0].offset = intel_allocator_alloc(ahnd, obj[0].handle,
+					      4096, ALIGNMENT);
+	obj[0].offset = CANONICAL(obj[0].offset);
+	obj[0].flags = EXEC_OBJECT_SUPPORTS_48B_ADDRESS | EXEC_OBJECT_WRITE;
 	obj[1].handle = gem_create(fd, 4096);
+	obj[1].offset = intel_allocator_alloc(ahnd, obj[1].handle,
+					      4096, ALIGNMENT);
+	obj[1].offset = CANONICAL(obj[1].offset);
+	obj[1].flags = EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
 
 	memset(&reloc, 0, sizeof(reloc));
 	reloc.target_handle = obj[0].handle;
-	reloc.presumed_offset = 0;
+	reloc.presumed_offset = obj[0].offset;
 	reloc.offset = sizeof(uint32_t);
 	reloc.delta = 0;
 	reloc.read_domains = I915_GEM_DOMAIN_INSTRUCTION;
 	reloc.write_domain = I915_GEM_DOMAIN_INSTRUCTION;
-	obj[1].relocs_ptr = to_user_pointer(&reloc);
-	obj[1].relocation_count = 1;
+
+	if (gem_has_relocations(fd)) {
+		obj[1].relocs_ptr = to_user_pointer(&reloc);
+		obj[1].relocation_count = 1;
+	} else {
+		obj[0].flags |= EXEC_OBJECT_PINNED;
+		obj[1].flags |= EXEC_OBJECT_PINNED;
+		execbuf.flags |= I915_EXEC_NO_RELOC;
+	}
 
 	i = 0;
 	batch[i] = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
 	if (gen >= 8) {
-		batch[++i] = 0;
-		batch[++i] = 0;
+		batch[++i] = obj[0].offset;
+		batch[++i] = obj[0].offset >> 32;
 	} else if (gen >= 4) {
 		batch[++i] = 0;
-		batch[++i] = 0;
+		batch[++i] = obj[0].offset;
 		reloc.offset += sizeof(uint32_t);
 	} else {
 		batch[i]--;
-		batch[++i] = 0;
+		batch[++i] = obj[0].offset;
 	}
 	batch[++i] = 0xc0ffee;
 	batch[++i] = MI_BATCH_BUFFER_END;
 	gem_write(fd, obj[1].handle, 0, batch, sizeof(batch));
 	gem_execbuf(fd, &execbuf);
 	gem_close(fd, obj[1].handle);
+	intel_allocator_free(ahnd, obj[1].handle);
 
 	gem_read(fd, obj[0].handle, 0, batch, sizeof(batch));
 	gem_close(fd, obj[0].handle);
+	intel_allocator_free(ahnd, obj[0].handle);
 	igt_assert_eq(*batch, 0xc0ffee);
 	igt_assert_eq(intel_detect_and_clear_missed_interrupts(fd), 0);
+	intel_allocator_close(ahnd);
 }
 
 #define PAGES 1
@@ -106,7 +130,9 @@ static void store_cachelines(int fd, const intel_ctx_t *ctx,
 	struct drm_i915_gem_execbuffer2 execbuf;
 #define NCACHELINES (4096/64)
 	uint32_t *batch;
+	uint64_t ahnd, reloc_value;
 	int i;
+	bool do_relocs = gem_has_relocations(fd);
 
 	reloc = calloc(NCACHELINES, sizeof(*reloc));
 	igt_assert(reloc);
@@ -119,12 +145,25 @@ static void store_cachelines(int fd, const intel_ctx_t *ctx,
 		execbuf.flags |= I915_EXEC_SECURE;
 	execbuf.rsvd1 = ctx->id;
 
+	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_SIMPLE);
 	obj = calloc(execbuf.buffer_count, sizeof(*obj));
 	igt_assert(obj);
-	for (i = 0; i < execbuf.buffer_count; i++)
+	for (i = 0; i < execbuf.buffer_count; i++) {
 		obj[i].handle = gem_create(fd, 4096);
-	obj[i-1].relocs_ptr = to_user_pointer(reloc);
-	obj[i-1].relocation_count = NCACHELINES;
+		obj[i].offset = intel_allocator_alloc(ahnd, obj[i].handle,
+						      4096, ALIGNMENT);
+		obj[i].offset = CANONICAL(obj[i].offset);
+		obj[i].flags = EXEC_OBJECT_SUPPORTS_48B_ADDRESS |
+			       (do_relocs ? 0 : EXEC_OBJECT_PINNED);
+		if (i + 1 < execbuf.buffer_count)
+			obj[i].flags |= EXEC_OBJECT_WRITE;
+	}
+	if (do_relocs) {
+		obj[i-1].relocs_ptr = to_user_pointer(reloc);
+		obj[i-1].relocation_count = NCACHELINES;
+	} else {
+		execbuf.flags |= I915_EXEC_NO_RELOC;
+	}
 	execbuf.buffers_ptr = to_user_pointer(obj);
 
 	batch = gem_mmap__cpu(fd, obj[i-1].handle, 0, 4096, PROT_WRITE);
@@ -132,23 +171,24 @@ static void store_cachelines(int fd, const intel_ctx_t *ctx,
 	i = 0;
 	for (unsigned n = 0; n < NCACHELINES; n++) {
 		reloc[n].target_handle = obj[n % (execbuf.buffer_count-1)].handle;
-		reloc[n].presumed_offset = -1;
+		reloc[n].presumed_offset = obj[n % (execbuf.buffer_count-1)].offset;
 		reloc[n].offset = (i + 1)*sizeof(uint32_t);
 		reloc[n].delta = 4 * (n * 16 + n % 16);
 		reloc[n].read_domains = I915_GEM_DOMAIN_INSTRUCTION;
 		reloc[n].write_domain = I915_GEM_DOMAIN_INSTRUCTION;
+		reloc_value = CANONICAL(reloc[n].presumed_offset + reloc[n].delta);
 
 		batch[i] = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
 		if (gen >= 8) {
-			batch[++i] = 0;
-			batch[++i] = 0;
+			batch[++i] = reloc_value;
+			batch[++i] = reloc_value >> 32;
 		} else if (gen >= 4) {
 			batch[++i] = 0;
-			batch[++i] = 0;
+			batch[++i] = reloc_value;
 			reloc[n].offset += sizeof(uint32_t);
 		} else {
 			batch[i]--;
-			batch[++i] = 0;
+			batch[++i] = reloc_value;
 		}
 		batch[++i] = n | ~n << 16;
 		i++;
@@ -168,11 +208,14 @@ static void store_cachelines(int fd, const intel_ctx_t *ctx,
 	}
 	free(reloc);
 
-	for (unsigned n = 0; n < execbuf.buffer_count; n++)
+	for (unsigned n = 0; n < execbuf.buffer_count; n++) {
 		gem_close(fd, obj[n].handle);
+		intel_allocator_free(ahnd, obj[n].handle);
+	}
 	free(obj);
 
 	igt_assert_eq(intel_detect_and_clear_missed_interrupts(fd), 0);
+	intel_allocator_close(ahnd);
 }
 
 static void store_all(int fd, const intel_ctx_t *ctx)
@@ -184,10 +227,11 @@ static void store_all(int fd, const intel_ctx_t *ctx)
 	struct drm_i915_gem_execbuffer2 execbuf;
 	unsigned *engines, *permuted;
 	uint32_t batch[16];
-	uint64_t offset;
+	uint64_t offset, ahnd, reloc_value;
 	unsigned nengine;
-	int value;
+	int value, address;
 	int i, j;
+	bool do_relocs = gem_has_relocations(fd);
 
 	nengine = 0;
 	for_each_ctx_engine(fd, ctx, engine) {
@@ -213,24 +257,41 @@ static void store_all(int fd, const intel_ctx_t *ctx)
 		execbuf.flags |= I915_EXEC_SECURE;
 	execbuf.rsvd1 = ctx->id;
 
+	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_SIMPLE);
+
 	memset(obj, 0, sizeof(obj));
 	obj[0].handle = gem_create(fd, nengine*sizeof(uint32_t));
+	obj[0].offset = intel_allocator_alloc(ahnd, obj[0].handle,
+					      nengine*sizeof(uint32_t), ALIGNMENT);
+	obj[0].flags = EXEC_OBJECT_SUPPORTS_48B_ADDRESS | EXEC_OBJECT_WRITE;
+	obj[0].offset = CANONICAL(obj[0].offset);
 	obj[1].handle = gem_create(fd, 2*nengine*sizeof(batch));
-	obj[1].relocation_count = 1;
+	obj[1].offset = intel_allocator_alloc(ahnd, obj[1].handle,
+					      nengine*sizeof(uint32_t), ALIGNMENT);
+	obj[1].offset = CANONICAL(obj[1].offset);
+	obj[1].flags |= EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
+
+	if (do_relocs) {
+		obj[1].relocation_count = 1;
+	} else {
+		obj[0].flags |= EXEC_OBJECT_PINNED;
+		obj[1].flags |= EXEC_OBJECT_PINNED;
+		execbuf.flags |= I915_EXEC_NO_RELOC;
+	}
 
 	offset = sizeof(uint32_t);
 	i = 0;
 	batch[i] = MI_STORE_DWORD_IMM | (gen < 6 ? 1 << 22 : 0);
 	if (gen >= 8) {
-		batch[++i] = 0;
+		batch[address = ++i] = 0;
 		batch[++i] = 0;
 	} else if (gen >= 4) {
 		batch[++i] = 0;
-		batch[++i] = 0;
+		batch[address = ++i] = 0;
 		offset += sizeof(uint32_t);
 	} else {
 		batch[i]--;
-		batch[++i] = 0;
+		batch[address = ++i] = 0;
 	}
 	batch[value = ++i] = 0xc0ffee;
 	batch[++i] = MI_BATCH_BUFFER_END;
@@ -246,12 +307,17 @@ static void store_all(int fd, const intel_ctx_t *ctx)
 
 		j = 2*nengine;
 		reloc[j].target_handle = obj[0].handle;
-		reloc[j].presumed_offset = ~0;
+		reloc[j].presumed_offset = obj[0].offset;
 		reloc[j].offset = j*sizeof(batch) + offset;
 		reloc[j].delta = nengine*sizeof(uint32_t);
 		reloc[j].read_domains = I915_GEM_DOMAIN_INSTRUCTION;
 		reloc[j].write_domain = I915_GEM_DOMAIN_INSTRUCTION;
-		obj[1].relocs_ptr = to_user_pointer(&reloc[j]);
+		reloc_value = CANONICAL(obj[0].offset + nengine*sizeof(uint32_t));
+		batch[address] = reloc_value;
+		if (gen >= 8)
+			batch[address + 1] = reloc_value >> 32;
+		if (do_relocs)
+			obj[1].relocs_ptr = to_user_pointer(&reloc[j]);
 
 		batch[value] = 0xdeadbeef;
 		gem_write(fd, obj[1].handle, j*sizeof(batch),
@@ -261,12 +327,17 @@ static void store_all(int fd, const intel_ctx_t *ctx)
 
 		j = 2*nengine + 1;
 		reloc[j].target_handle = obj[0].handle;
-		reloc[j].presumed_offset = ~0;
+		reloc[j].presumed_offset = obj[0].offset;
 		reloc[j].offset = j*sizeof(batch) + offset;
 		reloc[j].delta = nengine*sizeof(uint32_t);
 		reloc[j].read_domains = I915_GEM_DOMAIN_INSTRUCTION;
 		reloc[j].write_domain = I915_GEM_DOMAIN_INSTRUCTION;
-		obj[1].relocs_ptr = to_user_pointer(&reloc[j]);
+		reloc_value = CANONICAL(obj[0].offset + nengine*sizeof(uint32_t));
+		batch[address] = reloc_value;
+		if (gen >= 8)
+			batch[address + 1] = reloc_value >> 32;
+		if (do_relocs)
+			obj[1].relocs_ptr = to_user_pointer(&reloc[j]);
 
 		batch[value] = nengine;
 		gem_write(fd, obj[1].handle, j*sizeof(batch),
@@ -279,30 +350,37 @@ static void store_all(int fd, const intel_ctx_t *ctx)
 	gem_sync(fd, obj[1].handle);
 
 	for (i = 0; i < nengine; i++) {
-		obj[1].relocs_ptr = to_user_pointer(&reloc[2*i]);
 		execbuf.batch_start_offset = 2*i*sizeof(batch);
 		memcpy(permuted, engines, nengine*sizeof(engines[0]));
 		igt_permute_array(permuted, nengine, igt_exchange_int);
+		if (do_relocs)
+			obj[1].relocs_ptr = to_user_pointer(&reloc[2*i]);
+
 		for (j = 0; j < nengine; j++) {
 			execbuf.flags &= ~ENGINE_MASK;
 			execbuf.flags |= permuted[j];
 			gem_execbuf(fd, &execbuf);
 		}
-		obj[1].relocs_ptr = to_user_pointer(&reloc[2*i+1]);
 		execbuf.batch_start_offset = (2*i+1)*sizeof(batch);
 		execbuf.flags &= ~ENGINE_MASK;
 		execbuf.flags |= engines[i];
+		if (do_relocs)
+			obj[1].relocs_ptr = to_user_pointer(&reloc[2*i+1]);
+
 		gem_execbuf(fd, &execbuf);
 	}
 	gem_close(fd, obj[1].handle);
+	intel_allocator_free(ahnd, obj[1].handle);
 
 	gem_read(fd, obj[0].handle, 0, engines, nengine*sizeof(engines[0]));
 	gem_close(fd, obj[0].handle);
+	intel_allocator_free(ahnd, obj[0].handle);
 
 	for (i = 0; i < nengine; i++)
 		igt_assert_eq_u32(engines[i], i);
 	igt_assert_eq(intel_detect_and_clear_missed_interrupts(fd), 0);
 
+	intel_allocator_close(ahnd);
 	free(permuted);
 	free(engines);
 	free(reloc);
-- 
2.26.0
