Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B1006E427
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Aug 2021 07:38:56 +0000 (UTC)
From: Andrzej Turko <andrzej.turko@linux.intel.com>
Date: Tue,  3 Aug 2021 09:38:34 +0200
Message-Id: <20210803073835.2910-2-andrzej.turko@linux.intel.com>
In-Reply-To: <20210803073835.2910-1-andrzej.turko@linux.intel.com>
References: <20210803073835.2910-1-andrzej.turko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/i915/gem_streaming_writes:
 Support gens without relocations
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

Use the allocator to assign offsets to gem objects.
This allows to completely avoid relocations which
is necessary on newer generations.

Signed-off-by: Andrzej Turko <andrzej.turko@linux.intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/i915/gem_streaming_writes.c | 151 ++++++++++++++++++++----------
 1 file changed, 100 insertions(+), 51 deletions(-)

diff --git a/tests/i915/gem_streaming_writes.c b/tests/i915/gem_streaming_writes.c
index c104792bd..806f8ba72 100644
--- a/tests/i915/gem_streaming_writes.c
+++ b/tests/i915/gem_streaming_writes.c
@@ -41,6 +41,7 @@
 #include "i915/gem_create.h"
 #include "igt.h"
 
+#define ALIGNMENT (1 << 24)
 #define OBJECT_SIZE 1024*1024
 #define CHUNK_SIZE 32
 
@@ -62,12 +63,13 @@ IGT_TEST_DESCRIPTION("Test of streaming writes into active GPU sources");
 
 static void test_streaming(int fd, int mode, int sync)
 {
-	const int has_64bit_reloc = intel_gen(intel_get_drm_devid(fd)) >= 8;
+	const bool has_64bit_addresses = intel_gen(intel_get_drm_devid(fd)) >= 8;
+	const bool do_relocs = gem_has_relocations(fd);
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct drm_i915_gem_exec_object2 exec[3];
 	struct drm_i915_gem_relocation_entry reloc[128];
 	uint32_t tmp[] = { MI_BATCH_BUFFER_END };
-	uint64_t __src_offset, __dst_offset;
+	uint64_t __src_offset, __dst_offset, ahnd;
 	uint32_t *s, *d;
 	uint32_t offset;
 	struct {
@@ -76,9 +78,19 @@ static void test_streaming(int fd, int mode, int sync)
 	} *batch;
 	int i, n;
 
+	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_SIMPLE);
+
 	memset(exec, 0, sizeof(exec));
 	exec[SRC].handle = gem_create(fd, OBJECT_SIZE);
+	exec[SRC].offset = intel_allocator_alloc(ahnd, exec[SRC].handle,
+						 OBJECT_SIZE, ALIGNMENT);
+	exec[SRC].offset = CANONICAL(exec[SRC].offset);
+	exec[SRC].flags = EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
 	exec[DST].handle = gem_create(fd, OBJECT_SIZE);
+	exec[DST].offset = intel_allocator_alloc(ahnd, exec[DST].handle,
+						 OBJECT_SIZE, ALIGNMENT);
+	exec[DST].offset = CANONICAL(exec[DST].offset);
+	exec[DST].flags = EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
 
 	switch (mode) {
 	case 0: /* cpu/snoop */
@@ -112,30 +124,37 @@ static void test_streaming(int fd, int mode, int sync)
 	__src_offset = src_offset;
 	__dst_offset = dst_offset;
 
-	memset(reloc, 0, sizeof(reloc));
-	for (i = 0; i < 64; i++) {
-		reloc[2*i+0].offset = 64*i + 4 * sizeof(uint32_t);
-		reloc[2*i+0].delta = 0;
-		reloc[2*i+0].target_handle = execbuf.flags & I915_EXEC_HANDLE_LUT ? DST : dst;
-		reloc[2*i+0].presumed_offset = dst_offset;
-		reloc[2*i+0].read_domains = I915_GEM_DOMAIN_RENDER;
-		reloc[2*i+0].write_domain = I915_GEM_DOMAIN_RENDER;
-
-		reloc[2*i+1].offset = 64*i + 7 * sizeof(uint32_t);
-		if (has_64bit_reloc)
-			reloc[2*i+1].offset +=  sizeof(uint32_t);
-		reloc[2*i+1].delta = 0;
-		reloc[2*i+1].target_handle = execbuf.flags & I915_EXEC_HANDLE_LUT ? SRC : src;
-		reloc[2*i+1].presumed_offset = src_offset;
-		reloc[2*i+1].read_domains = I915_GEM_DOMAIN_RENDER;
-		reloc[2*i+1].write_domain = 0;
+	if (do_relocs) {
+		memset(reloc, 0, sizeof(reloc));
+		for (i = 0; i < 64; i++) {
+			reloc[2*i+0].offset = 64*i + 4 * sizeof(uint32_t);
+			reloc[2*i+0].delta = 0;
+			reloc[2*i+0].target_handle = execbuf.flags & I915_EXEC_HANDLE_LUT ? DST : dst;
+			reloc[2*i+0].presumed_offset = dst_offset;
+			reloc[2*i+0].read_domains = I915_GEM_DOMAIN_RENDER;
+			reloc[2*i+0].write_domain = I915_GEM_DOMAIN_RENDER;
+
+			reloc[2*i+1].offset = 64*i + 7 * sizeof(uint32_t);
+			if (has_64bit_addresses)
+				reloc[2*i+1].offset +=  sizeof(uint32_t);
+			reloc[2*i+1].delta = 0;
+			reloc[2*i+1].target_handle = execbuf.flags & I915_EXEC_HANDLE_LUT ? SRC : src;
+			reloc[2*i+1].presumed_offset = src_offset;
+			reloc[2*i+1].read_domains = I915_GEM_DOMAIN_RENDER;
+			reloc[2*i+1].write_domain = 0;
+		}
 	}
 	gem_execbuf(fd, &execbuf);
 	igt_assert_eq_u64(__src_offset, src_offset);
 	igt_assert_eq_u64(__dst_offset, dst_offset);
 
-	exec[DST].flags = EXEC_OBJECT_WRITE;
-	exec[BATCH].relocation_count = 2;
+	if (do_relocs) {
+		exec[DST].flags |= EXEC_OBJECT_WRITE;
+		exec[BATCH].relocation_count = 2;
+	} else {
+		exec[SRC].flags |= EXEC_OBJECT_PINNED;
+		exec[DST].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE;
+	}
 	execbuf.buffer_count = 3;
 	execbuf.flags |= I915_EXEC_NO_RELOC;
 	if (gem_has_blt(fd))
@@ -146,7 +165,8 @@ static void test_streaming(int fd, int mode, int sync)
 		uint32_t *base;
 
 		batch[i].handle = gem_create(fd, 4096);
-		batch[i].offset = 0;
+		batch[i].offset = intel_allocator_alloc(ahnd, batch[i].handle, 4096, ALIGNMENT);
+		batch[i].offset = CANONICAL(batch[i].offset);
 
 		base = gem_mmap__cpu(fd, batch[i].handle, 0, 4096, PROT_WRITE);
 		gem_set_domain(fd, batch[i].handle,
@@ -159,19 +179,19 @@ static void test_streaming(int fd, int mode, int sync)
 			int k = 0;
 
 			b[k] = COPY_BLT_CMD | BLT_WRITE_ARGB;
-			if (has_64bit_reloc)
+			if (has_64bit_addresses)
 				b[k] += 2;
 			k++;
 			b[k++] = 0xcc << 16 | 1 << 25 | 1 << 24 | 4096;
 			b[k++] = (y << 16) | x;
 			b[k++] = ((y+1) << 16) | (x + (CHUNK_SIZE >> 2));
 			b[k++] = dst_offset;
-			if (has_64bit_reloc)
+			if (has_64bit_addresses)
 				b[k++] = dst_offset >> 32;
 			b[k++] = (y << 16) | x;
 			b[k++] = 4096;
 			b[k++] = src_offset;
-			if (has_64bit_reloc)
+			if (has_64bit_addresses)
 				b[k++] = src_offset >> 32;
 			b[k++] = MI_BATCH_BUFFER_END;
 
@@ -205,10 +225,12 @@ static void test_streaming(int fd, int mode, int sync)
 
 			b = offset / CHUNK_SIZE / 64;
 			n = offset / CHUNK_SIZE % 64;
-			exec[BATCH].relocs_ptr = to_user_pointer((reloc + 2*n));
 			exec[BATCH].handle = batch[b].handle;
 			exec[BATCH].offset = batch[b].offset;
+			exec[BATCH].flags = EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
 			execbuf.batch_start_offset = 64*n;
+			if (do_relocs)
+				exec[BATCH].relocs_ptr = to_user_pointer((reloc + 2*n));
 
 			gem_execbuf(fd, &execbuf);
 			igt_assert_eq_u64(__src_offset, src_offset);
@@ -230,51 +252,73 @@ static void test_streaming(int fd, int mode, int sync)
 	gem_close(fd, src);
 	munmap(d, OBJECT_SIZE);
 	gem_close(fd, dst);
+	intel_allocator_close(ahnd);
 }
 
 static void test_batch(int fd, int mode, int reverse)
 {
-	const int has_64bit_reloc = intel_gen(intel_get_drm_devid(fd)) >= 8;
+	const bool has_64bit_addresses = intel_gen(intel_get_drm_devid(fd)) >= 8;
+	const bool do_relocs = gem_has_relocations(fd);
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct drm_i915_gem_exec_object2 exec[3];
 	struct drm_i915_gem_relocation_entry reloc[2];
 	uint32_t tmp[] = { MI_BATCH_BUFFER_END };
 	uint64_t __src_offset, __dst_offset;
 	bool need_64b_start_offset = true;
-	uint64_t batch_size;
+	uint64_t batch_size, ahnd;
 	uint32_t *s, *d;
 	uint32_t *base;
 	uint32_t offset;
 
+	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_SIMPLE);
+
 	memset(exec, 0, sizeof(exec));
 	exec[DST].handle = gem_create(fd, OBJECT_SIZE);
+	exec[DST].offset = intel_allocator_alloc(ahnd, exec[DST].handle,
+						 OBJECT_SIZE, ALIGNMENT);
+	exec[DST].offset = CANONICAL(exec[DST].offset);
+	exec[DST].flags = EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
 	exec[SRC].handle = gem_create(fd, OBJECT_SIZE);
+	exec[SRC].offset = intel_allocator_alloc(ahnd, exec[SRC].handle,
+						 OBJECT_SIZE, ALIGNMENT);
+	exec[SRC].offset = CANONICAL(exec[SRC].offset);
+	exec[SRC].flags = EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
 
 	s = gem_mmap__wc(fd, src, 0, OBJECT_SIZE, PROT_READ | PROT_WRITE);
 
 	d = gem_mmap__cpu(fd, dst, 0, OBJECT_SIZE, PROT_READ);
 
-	memset(reloc, 0, sizeof(reloc));
-	reloc[0].offset =  4 * sizeof(uint32_t);
-	reloc[0].delta = 0;
-	reloc[0].target_handle = execbuf.flags & I915_EXEC_HANDLE_LUT ? DST : dst;
-	reloc[0].presumed_offset = dst_offset;
-	reloc[0].read_domains = I915_GEM_DOMAIN_RENDER;
-	reloc[0].write_domain = I915_GEM_DOMAIN_RENDER;
-
-	reloc[1].offset = 7 * sizeof(uint32_t);
-	if (has_64bit_reloc)
-		reloc[1].offset +=  sizeof(uint32_t);
-	reloc[1].delta = 0;
-	reloc[1].target_handle = execbuf.flags & I915_EXEC_HANDLE_LUT ? SRC : src;
-	reloc[1].presumed_offset = src_offset;
-	reloc[1].read_domains = I915_GEM_DOMAIN_RENDER;
-	reloc[1].write_domain = 0;
+	if (do_relocs) {
+		memset(reloc, 0, sizeof(reloc));
+		reloc[0].offset =  4 * sizeof(uint32_t);
+		reloc[0].delta = 0;
+		reloc[0].target_handle = execbuf.flags & I915_EXEC_HANDLE_LUT ? DST : dst;
+		reloc[0].presumed_offset = dst_offset;
+		reloc[0].read_domains = I915_GEM_DOMAIN_RENDER;
+		reloc[0].write_domain = I915_GEM_DOMAIN_RENDER;
+
+		reloc[1].offset = 7 * sizeof(uint32_t);
+		if (has_64bit_addresses)
+			reloc[1].offset +=  sizeof(uint32_t);
+		reloc[1].delta = 0;
+		reloc[1].target_handle = execbuf.flags & I915_EXEC_HANDLE_LUT ? SRC : src;
+		reloc[1].presumed_offset = src_offset;
+		reloc[1].read_domains = I915_GEM_DOMAIN_RENDER;
+		reloc[1].write_domain = 0;
+
+		exec[BATCH].relocs_ptr = to_user_pointer(reloc);
+		exec[BATCH].relocation_count = 2;
+	} else {
+		exec[DST].flags |= EXEC_OBJECT_WRITE | EXEC_OBJECT_PINNED;
+		exec[SRC].flags |= EXEC_OBJECT_PINNED;
+	}
 
 	batch_size = ALIGN(OBJECT_SIZE / CHUNK_SIZE * 128, 4096);
-	exec[BATCH].relocs_ptr = to_user_pointer(reloc);
-	exec[BATCH].relocation_count = 2;
 	exec[BATCH].handle = gem_create(fd, batch_size);
+	exec[BATCH].offset = intel_allocator_alloc(ahnd, exec[BATCH].handle,
+						   batch_size, ALIGNMENT);
+	exec[BATCH].offset = CANONICAL(exec[BATCH].offset);
+	exec[BATCH].flags = EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
 
 	switch (mode) {
 	case 0: /* cpu/snoop */
@@ -304,10 +348,14 @@ static void test_batch(int fd, int mode, int reverse)
 		execbuf.flags &= ~I915_EXEC_HANDLE_LUT;
 		gem_execbuf(fd, &execbuf);
 	}
+	/* Even without softpinning we can reuse the offsets
+	 * assigned by the driver and avoid relocations.
+	 */
 	execbuf.flags |= I915_EXEC_NO_RELOC;
-	exec[DST].flags = EXEC_OBJECT_WRITE;
-	/* We assume that the active objects are fixed to avoid relocations */
+	exec[DST].flags |= EXEC_OBJECT_WRITE;
 	exec[BATCH].relocation_count = 0;
+	exec[BATCH].relocs_ptr = 0;
+
 	__src_offset = src_offset;
 	__dst_offset = dst_offset;
 
@@ -334,19 +382,19 @@ static void test_batch(int fd, int mode, int reverse)
 			k = execbuf.batch_start_offset / 4;
 
 			base[k] = COPY_BLT_CMD | BLT_WRITE_ARGB;
-			if (has_64bit_reloc)
+			if (has_64bit_addresses)
 				base[k] += 2;
 			k++;
 			base[k++] = 0xcc << 16 | 1 << 25 | 1 << 24 | 4096;
 			base[k++] = (y << 16) | x;
 			base[k++] = ((y+1) << 16) | (x + (CHUNK_SIZE >> 2));
 			base[k++] = dst_offset;
-			if (has_64bit_reloc)
+			if (has_64bit_addresses)
 				base[k++] = dst_offset >> 32;
 			base[k++] = (y << 16) | x;
 			base[k++] = 4096;
 			base[k++] = src_offset;
-			if (has_64bit_reloc)
+			if (has_64bit_addresses)
 				base[k++] = src_offset >> 32;
 			base[k++] = MI_BATCH_BUFFER_END;
 
@@ -368,6 +416,7 @@ static void test_batch(int fd, int mode, int reverse)
 	gem_close(fd, src);
 	munmap(d, OBJECT_SIZE);
 	gem_close(fd, dst);
+	intel_allocator_close(ahnd);
 }
 
 igt_main
-- 
2.25.1
