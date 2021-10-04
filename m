Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 676686E8EC
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Oct 2021 05:41:09 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon,  4 Oct 2021 07:40:55 +0200
Message-Id: <20211004054056.24346-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20211004054056.24346-1-zbigniew.kempczynski@intel.com>
References: <20211004054056.24346-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/intel_bufops: Rename
 intel_buf_bo_size() -> intel_buf_size()
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

To avoid confusion with intel_buf_bo_size() which for some buffers
can return size not equal to underlying gem bo size rename it to
intel_buf_size().

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/intel_aux_pgtable.c            |  2 +-
 lib/intel_batchbuffer.c            |  4 ++--
 lib/intel_bufops.c                 | 10 +++++-----
 lib/intel_bufops.h                 |  2 +-
 tests/i915/api_intel_bb.c          | 22 +++++++++++-----------
 tests/i915/gem_render_copy.c       | 14 +++++++-------
 tests/i915/gem_set_tiling_vs_blt.c |  2 +-
 7 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/lib/intel_aux_pgtable.c b/lib/intel_aux_pgtable.c
index fcc337b8d..6346053de 100644
--- a/lib/intel_aux_pgtable.c
+++ b/lib/intel_aux_pgtable.c
@@ -97,7 +97,7 @@ pgt_table_count(int address_bits, struct intel_buf **bufs, int buf_count)
 		/* We require bufs to be sorted. */
 		igt_assert(i == 0 ||
 			   buf->addr.offset >= bufs[i - 1]->addr.offset +
-				intel_buf_bo_size(bufs[i - 1]));
+				intel_buf_size(bufs[i - 1]));
 		start = ALIGN_DOWN(buf->addr.offset, 1UL << address_bits);
 
 		/* Avoid double counting for overlapping aligned bufs. */
diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index e3e649ca3..5f41eefdb 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -2016,7 +2016,7 @@ __intel_bb_add_intel_buf(struct intel_bb *ibb, struct intel_buf *buf,
 		}
 	}
 
-	obj = intel_bb_add_object(ibb, buf->handle, intel_buf_bo_size(buf),
+	obj = intel_bb_add_object(ibb, buf->handle, intel_buf_size(buf),
 				  buf->addr.offset, alignment, write);
 	buf->addr.offset = obj->offset;
 
@@ -2056,7 +2056,7 @@ bool intel_bb_remove_intel_buf(struct intel_bb *ibb, struct intel_buf *buf)
 
 	removed = intel_bb_remove_object(ibb, buf->handle,
 					 buf->addr.offset,
-					 intel_buf_bo_size(buf));
+					 intel_buf_size(buf));
 	if (removed) {
 		buf->addr.offset = INTEL_BUF_INVALID_ADDRESS;
 		buf->ibb = NULL;
diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index 52794c1ac..7199723bb 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -1096,10 +1096,10 @@ void intel_buf_print(const struct intel_buf *buf)
 {
 	igt_info("[name: %s]\n", buf->name);
 	igt_info("[%u]: w: %u, h: %u, stride: %u, size: %" PRIx64
-		 ", bo-size: %" PRIx64 ", bpp: %u, tiling: %u, compress: %u\n",
+		 ", buf-size: %" PRIx64 ", bpp: %u, tiling: %u, compress: %u\n",
 		 buf->handle, intel_buf_width(buf), intel_buf_height(buf),
 		 buf->surface[0].stride, buf->surface[0].size,
-		 intel_buf_bo_size(buf), buf->bpp,
+		 intel_buf_size(buf), buf->bpp,
 		 buf->tiling, buf->compression);
 	igt_info(" ccs <offset: %u, stride: %u, w: %u, h: %u> cc <offset: %u>\n",
 		 buf->ccs[0].offset,
@@ -1113,7 +1113,7 @@ void intel_buf_print(const struct intel_buf *buf)
 void intel_buf_dump(const struct intel_buf *buf, const char *filename)
 {
 	int i915 = buf_ops_get_fd(buf->bops);
-	uint64_t size = intel_buf_bo_size(buf);
+	uint64_t size = intel_buf_size(buf);
 	FILE *out;
 	void *ptr;
 
@@ -1141,7 +1141,7 @@ static void __intel_buf_write_to_png(struct buf_ops *bops,
 	int format, width, height, stride, offset;
 	int gen = bops->intel_gen;
 
-	igt_assert_eq(posix_memalign(&linear, 16, intel_buf_bo_size(buf)), 0);
+	igt_assert_eq(posix_memalign(&linear, 16, intel_buf_size(buf)), 0);
 
 	format = write_ccs ? CAIRO_FORMAT_A8 : CAIRO_FORMAT_RGB24;
 	width = write_ccs ? intel_buf_ccs_width(gen, buf) : intel_buf_width(buf);
@@ -1302,7 +1302,7 @@ static void idempotency_selftest(struct buf_ops *bops, uint32_t tiling)
 	buf_ops_set_software_tiling(bops, tiling, false);
 }
 
-uint64_t intel_buf_bo_size(const struct intel_buf *buf)
+uint64_t intel_buf_size(const struct intel_buf *buf)
 {
 	return buf->size;
 }
diff --git a/lib/intel_bufops.h b/lib/intel_bufops.h
index 54f2ce45e..e09b21b2a 100644
--- a/lib/intel_bufops.h
+++ b/lib/intel_bufops.h
@@ -97,7 +97,7 @@ intel_buf_ccs_height(int gen, const struct intel_buf *buf)
 	return DIV_ROUND_UP(intel_buf_height(buf), 512) * 32;
 }
 
-uint64_t intel_buf_bo_size(const struct intel_buf *buf);
+uint64_t intel_buf_size(const struct intel_buf *buf);
 
 struct buf_ops *buf_ops_create(int fd);
 struct buf_ops *buf_ops_create_with_selftest(int fd);
diff --git a/tests/i915/api_intel_bb.c b/tests/i915/api_intel_bb.c
index 74cb18417..492cedefd 100644
--- a/tests/i915/api_intel_bb.c
+++ b/tests/i915/api_intel_bb.c
@@ -1055,11 +1055,11 @@ static void offset_control(struct buf_ops *bops)
 	dst1 = create_buf(bops, WIDTH, HEIGHT, COLOR_00);
 	dst2 = create_buf(bops, WIDTH, HEIGHT, COLOR_77);
 
-	intel_bb_add_object(ibb, src->handle, intel_buf_bo_size(src),
+	intel_bb_add_object(ibb, src->handle, intel_buf_size(src),
 			    src->addr.offset, 0, false);
-	intel_bb_add_object(ibb, dst1->handle, intel_buf_bo_size(dst1),
+	intel_bb_add_object(ibb, dst1->handle, intel_buf_size(dst1),
 			    dst1->addr.offset, 0, true);
-	intel_bb_add_object(ibb, dst2->handle, intel_buf_bo_size(dst2),
+	intel_bb_add_object(ibb, dst2->handle, intel_buf_size(dst2),
 			    dst2->addr.offset, 0, true);
 
 	intel_bb_out(ibb, MI_BATCH_BUFFER_END);
@@ -1080,13 +1080,13 @@ static void offset_control(struct buf_ops *bops)
 	intel_bb_reset(ibb, true);
 
 	dst3 = create_buf(bops, WIDTH, HEIGHT, COLOR_33);
-	intel_bb_add_object(ibb, dst3->handle, intel_buf_bo_size(dst3),
+	intel_bb_add_object(ibb, dst3->handle, intel_buf_size(dst3),
 			    dst3->addr.offset, 0, true);
-	intel_bb_add_object(ibb, src->handle, intel_buf_bo_size(src),
+	intel_bb_add_object(ibb, src->handle, intel_buf_size(src),
 			    src->addr.offset, 0, false);
-	intel_bb_add_object(ibb, dst1->handle, intel_buf_bo_size(dst1),
+	intel_bb_add_object(ibb, dst1->handle, intel_buf_size(dst1),
 			    dst1->addr.offset, 0, true);
-	intel_bb_add_object(ibb, dst2->handle, intel_buf_bo_size(dst2),
+	intel_bb_add_object(ibb, dst2->handle, intel_buf_size(dst2),
 			    dst2->addr.offset, 0, true);
 
 	intel_bb_out(ibb, MI_BATCH_BUFFER_END);
@@ -1140,7 +1140,7 @@ static void delta_check(struct buf_ops *bops)
 
 	buf = create_buf(bops, 0x1000, 0x10, COLOR_CC);
 	buf->addr.offset = 0xfffff000;
-	intel_bb_add_object(ibb, buf->handle, intel_buf_bo_size(buf),
+	intel_bb_add_object(ibb, buf->handle, intel_buf_size(buf),
 			    buf->addr.offset, 0, false);
 
 	intel_bb_out(ibb, MI_STORE_DWORD_IMM);
@@ -1166,7 +1166,7 @@ static void delta_check(struct buf_ops *bops)
 	gem_munmap(ptr, ibb->size);
 
 	ptr = gem_mmap__device_coherent(i915, buf->handle, 0,
-					intel_buf_bo_size(buf), PROT_READ);
+					intel_buf_size(buf), PROT_READ);
 	val = ptr[0x2000 / sizeof(uint32_t)];
 	gem_munmap(ptr, ibb->size);
 
@@ -1299,7 +1299,7 @@ static uint32_t count_compressed(int gen, struct intel_buf *buf)
 	int i915 = buf_ops_get_fd(buf->bops);
 	int ccs_size = intel_buf_ccs_width(gen, buf) * intel_buf_ccs_height(gen, buf);
 	uint8_t *ptr = gem_mmap__device_coherent(i915, buf->handle, 0,
-						 intel_buf_bo_size(buf),
+						 intel_buf_size(buf),
 						 PROT_READ);
 	uint32_t compressed = 0;
 	int i;
@@ -1308,7 +1308,7 @@ static uint32_t count_compressed(int gen, struct intel_buf *buf)
 		if (ptr[buf->ccs[0].offset + i])
 			compressed++;
 
-	munmap(ptr, intel_buf_bo_size(buf));
+	munmap(ptr, intel_buf_size(buf));
 
 	return compressed;
 }
diff --git a/tests/i915/gem_render_copy.c b/tests/i915/gem_render_copy.c
index 3aac1628a..d485e3415 100644
--- a/tests/i915/gem_render_copy.c
+++ b/tests/i915/gem_render_copy.c
@@ -103,11 +103,11 @@ static void *linear_copy_ccs(data_t *data, struct intel_buf *buf)
 	unsigned int gen = intel_gen(data->devid);
 	int ccs_size = intel_buf_ccs_width(gen, buf) *
 		intel_buf_ccs_height(gen, buf);
-	int bo_size = intel_buf_bo_size(buf);
+	int buf_size = intel_buf_size(buf);
 
 	ccs_data = alloc_aligned(ccs_size);
-	linear = alloc_aligned(bo_size);
-	memset(linear, 0, bo_size);
+	linear = alloc_aligned(buf_size);
+	memset(linear, 0, buf_size);
 
 	intel_buf_to_linear(data->bops, buf, linear);
 	igt_memcpy_from_wc(ccs_data, linear + buf->ccs[0].offset, ccs_size);
@@ -185,7 +185,7 @@ scratch_buf_copy(data_t *data,
 
 	igt_assert_eq(intel_buf_width(dst), intel_buf_width(src));
 	igt_assert_eq(intel_buf_height(dst), intel_buf_height(src));
-	igt_assert_eq(intel_buf_bo_size(dst), intel_buf_bo_size(src));
+	igt_assert_eq(intel_buf_size(dst), intel_buf_size(src));
 	igt_assert_eq(dst->bpp, src->bpp);
 
 	w = min(w, width - sx);
@@ -194,8 +194,8 @@ scratch_buf_copy(data_t *data,
 	h = min(h, height - sy);
 	h = min(h, height - dy);
 
-	linear_dst = alloc_aligned(intel_buf_bo_size(dst));
-	linear_src = alloc_aligned(intel_buf_bo_size(src));
+	linear_dst = alloc_aligned(intel_buf_size(dst));
+	linear_src = alloc_aligned(intel_buf_size(src));
 	intel_buf_to_linear(data->bops, src, linear_src);
 	intel_buf_to_linear(data->bops, dst, linear_dst);
 
@@ -319,7 +319,7 @@ dump_intel_buf_to_file(data_t *data, struct intel_buf *buf, const char *filename
 {
 	FILE *out;
 	void *ptr;
-	uint32_t size = intel_buf_bo_size(buf);
+	uint32_t size = intel_buf_size(buf);
 
 	gem_set_domain(data->drm_fd, buf->handle,
 		       I915_GEM_DOMAIN_CPU, 0);
diff --git a/tests/i915/gem_set_tiling_vs_blt.c b/tests/i915/gem_set_tiling_vs_blt.c
index ff600f942..bf274be98 100644
--- a/tests/i915/gem_set_tiling_vs_blt.c
+++ b/tests/i915/gem_set_tiling_vs_blt.c
@@ -126,7 +126,7 @@ static void do_test(struct buf_ops *bops, uint32_t tiling, unsigned stride,
 	intel_buf_init_using_handle(bops, test_buf->handle, test_buf,
 				    TEST_WIDTH(stride), TEST_HEIGHT(stride), 32,
 				    0, tiling, I915_COMPRESSION_NONE);
-	igt_assert_eq_u32(intel_buf_bo_size(test_buf), TEST_SIZE);
+	igt_assert_eq_u32(intel_buf_size(test_buf), TEST_SIZE);
 	intel_buf_set_ownership(test_buf, true);
 	intel_bb_add_intel_buf(ibb, test_buf, false);
 
-- 
2.26.0
