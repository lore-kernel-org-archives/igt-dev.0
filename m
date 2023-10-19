Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04D9B10E51E
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Oct 2023 14:42:01 +0000 (UTC)
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 19 Oct 2023 15:41:03 +0100
Message-ID: <20231019144106.560624-13-matthew.auld@intel.com>
In-Reply-To: <20231019144106.560624-1-matthew.auld@intel.com>
References: <20231019144106.560624-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v4 12/15] lib/intel_blt: tidy up alignment
 usage
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

No need to select get_default_alignment() all over the place; the
allocator should know the required default alignment. If we need
something specific like in the case of the ctrl surf we can now just set
whatever, safe in the knowledge that the allocator will already consider
the default allocator alignment as the min.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Pallavi Mishra <pallavi.mishra@intel.com>
---
 lib/intel_blt.c | 78 +++++++++++++++++++------------------------------
 1 file changed, 30 insertions(+), 48 deletions(-)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index 2e9074eaf..a25f0a814 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -783,14 +783,6 @@ static void dump_bb_ext(struct gen12_block_copy_data_ext *data)
 		 data->dw21.src_array_index);
 }
 
-static uint64_t get_default_alignment(int fd, enum intel_driver driver)
-{
-	if (driver == INTEL_DRIVER_XE)
-		return xe_get_default_alignment(fd);
-
-	return gem_detect_safe_alignment(fd);
-}
-
 static void *bo_map(int fd, uint32_t handle, uint64_t size,
 		    enum intel_driver driver)
 {
@@ -842,21 +834,20 @@ uint64_t emit_blt_block_copy(int fd,
 	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
 	struct gen12_block_copy_data data = {};
 	struct gen12_block_copy_data_ext dext = {};
-	uint64_t dst_offset, src_offset, bb_offset, alignment;
+	uint64_t dst_offset, src_offset, bb_offset;
 	uint32_t bbe = MI_BATCH_BUFFER_END;
 	uint8_t *bb;
 
 	igt_assert_f(ahnd, "block-copy supports softpin only\n");
 	igt_assert_f(blt, "block-copy requires data to do blit\n");
 
-	alignment = get_default_alignment(fd, blt->driver);
 	src_offset = get_offset_pat_index(ahnd, blt->src.handle, blt->src.size,
-					  alignment, blt->src.pat_index);
+					  0, blt->src.pat_index);
 	src_offset += blt->src.plane_offset;
 	dst_offset = get_offset_pat_index(ahnd, blt->dst.handle, blt->dst.size,
-					  alignment, blt->dst.pat_index);
+					  0, blt->dst.pat_index);
 	dst_offset += blt->dst.plane_offset;
-	bb_offset = get_offset(ahnd, blt->bb.handle, blt->bb.size, alignment);
+	bb_offset = get_offset(ahnd, blt->bb.handle, blt->bb.size, 0);
 
 	fill_data(&data, blt, src_offset, dst_offset, ext, ip_ver);
 
@@ -918,19 +909,18 @@ int blt_block_copy(int fd,
 {
 	struct drm_i915_gem_execbuffer2 execbuf = {};
 	struct drm_i915_gem_exec_object2 obj[3] = {};
-	uint64_t dst_offset, src_offset, bb_offset, alignment;
+	uint64_t dst_offset, src_offset, bb_offset;
 	int ret;
 
 	igt_assert_f(ahnd, "block-copy supports softpin only\n");
 	igt_assert_f(blt, "block-copy requires data to do blit\n");
 	igt_assert_neq(blt->driver, 0);
 
-	alignment = get_default_alignment(fd, blt->driver);
 	src_offset = get_offset_pat_index(ahnd, blt->src.handle, blt->src.size,
-					  alignment, blt->src.pat_index);
+					  0, blt->src.pat_index);
 	dst_offset = get_offset_pat_index(ahnd, blt->dst.handle, blt->dst.size,
-					  alignment, blt->dst.pat_index);
-	bb_offset = get_offset(ahnd, blt->bb.handle, blt->bb.size, alignment);
+					  0, blt->dst.pat_index);
+	bb_offset = get_offset(ahnd, blt->bb.handle, blt->bb.size, 0);
 
 	emit_blt_block_copy(fd, ahnd, blt, ext, 0, true);
 
@@ -1132,7 +1122,7 @@ uint64_t emit_blt_ctrl_surf_copy(int fd,
 	igt_assert_f(ahnd, "ctrl-surf-copy supports softpin only\n");
 	igt_assert_f(surf, "ctrl-surf-copy requires data to do ctrl-surf-copy blit\n");
 
-	alignment = max_t(uint64_t, get_default_alignment(fd, surf->driver), 1ull << 16);
+	alignment = 1ull << 16;
 	src_offset = get_offset_pat_index(ahnd, surf->src.handle, surf->src.size,
 					  alignment, surf->src.pat_index);
 	dst_offset = get_offset_pat_index(ahnd, surf->dst.handle, surf->dst.size,
@@ -1236,7 +1226,7 @@ int blt_ctrl_surf_copy(int fd,
 	igt_assert_f(surf, "ctrl-surf-copy requires data to do ctrl-surf-copy blit\n");
 	igt_assert_neq(surf->driver, 0);
 
-	alignment = max_t(uint64_t, get_default_alignment(fd, surf->driver), 1ull << 16);
+	alignment = 1ull << 16;
 	src_offset = get_offset_pat_index(ahnd, surf->src.handle, surf->src.size,
 					  alignment, surf->src.pat_index);
 	dst_offset = get_offset_pat_index(ahnd, surf->dst.handle, surf->dst.size,
@@ -1443,13 +1433,10 @@ uint64_t emit_blt_fast_copy(int fd,
 {
 	unsigned int ip_ver = intel_graphics_ver(intel_get_drm_devid(fd));
 	struct gen12_fast_copy_data data = {};
-	uint64_t dst_offset, src_offset, bb_offset, alignment;
+	uint64_t dst_offset, src_offset, bb_offset;
 	uint32_t bbe = MI_BATCH_BUFFER_END;
 	uint32_t *bb;
 
-
-	alignment = get_default_alignment(fd, blt->driver);
-
 	data.dw00.client = 0x2;
 	data.dw00.opcode = 0x42;
 	data.dw00.dst_tiling = __fast_tiling(blt->dst.tiling);
@@ -1480,12 +1467,12 @@ uint64_t emit_blt_fast_copy(int fd,
 	data.dw03.dst_y2 = blt->dst.y2;
 
 	src_offset = get_offset_pat_index(ahnd, blt->src.handle, blt->src.size,
-					  alignment, blt->src.pat_index);
+					  0, blt->src.pat_index);
 	src_offset += blt->src.plane_offset;
-	dst_offset = get_offset_pat_index(ahnd, blt->dst.handle, blt->dst.size, alignment,
+	dst_offset = get_offset_pat_index(ahnd, blt->dst.handle, blt->dst.size, 0,
 					  blt->dst.pat_index);
 	dst_offset += blt->dst.plane_offset;
-	bb_offset = get_offset(ahnd, blt->bb.handle, blt->bb.size, alignment);
+	bb_offset = get_offset(ahnd, blt->bb.handle, blt->bb.size, 0);
 
 	data.dw04.dst_address_lo = dst_offset;
 	data.dw05.dst_address_hi = dst_offset >> 32;
@@ -1550,19 +1537,18 @@ int blt_fast_copy(int fd,
 {
 	struct drm_i915_gem_execbuffer2 execbuf = {};
 	struct drm_i915_gem_exec_object2 obj[3] = {};
-	uint64_t dst_offset, src_offset, bb_offset, alignment;
+	uint64_t dst_offset, src_offset, bb_offset;
 	int ret;
 
 	igt_assert_f(ahnd, "fast-copy supports softpin only\n");
 	igt_assert_f(blt, "fast-copy requires data to do fast-copy blit\n");
 	igt_assert_neq(blt->driver, 0);
 
-	alignment = get_default_alignment(fd, blt->driver);
 	src_offset = get_offset_pat_index(ahnd, blt->src.handle, blt->src.size,
-					  alignment, blt->src.pat_index);
+					  0, blt->src.pat_index);
 	dst_offset = get_offset_pat_index(ahnd, blt->dst.handle, blt->dst.size,
-					  alignment, blt->dst.pat_index);
-	bb_offset = get_offset(ahnd, blt->bb.handle, blt->bb.size, alignment);
+					  0, blt->dst.pat_index);
+	bb_offset = get_offset(ahnd, blt->bb.handle, blt->bb.size, 0);
 
 	emit_blt_fast_copy(fd, ahnd, blt, 0, true);
 
@@ -1610,16 +1596,15 @@ void blt_mem_init(int fd, struct blt_mem_data *mem)
 
 static void emit_blt_mem_copy(int fd, uint64_t ahnd, const struct blt_mem_data *mem)
 {
-	uint64_t dst_offset, src_offset, alignment;
+	uint64_t dst_offset, src_offset;
 	int i;
 	uint32_t *batch;
 	uint32_t optype;
 
-	alignment = get_default_alignment(fd, mem->driver);
 	src_offset = get_offset_pat_index(ahnd, mem->src.handle, mem->src.size,
-					  alignment, mem->src.pat_index);
+					  0, mem->src.pat_index);
 	dst_offset = get_offset_pat_index(ahnd, mem->dst.handle, mem->dst.size,
-					  alignment, mem->dst.pat_index);
+					  0, mem->dst.pat_index);
 
 	batch = bo_map(fd, mem->bb.handle, mem->bb.size, mem->driver);
 	optype = mem->src.type == M_MATRIX ? 1 << 17 : 0;
@@ -1660,15 +1645,14 @@ int blt_mem_copy(int fd, const intel_ctx_t *ctx,
 {
 	struct drm_i915_gem_execbuffer2 execbuf = {};
 	struct drm_i915_gem_exec_object2 obj[3] = {};
-	uint64_t dst_offset, src_offset, bb_offset, alignment;
+	uint64_t dst_offset, src_offset, bb_offset;
 	int ret;
 
-	alignment = get_default_alignment(fd, mem->driver);
 	src_offset = get_offset_pat_index(ahnd, mem->src.handle, mem->src.size,
-					  alignment, mem->src.pat_index);
+					  0, mem->src.pat_index);
 	dst_offset = get_offset_pat_index(ahnd, mem->dst.handle, mem->dst.size,
-					  alignment, mem->dst.pat_index);
-	bb_offset = get_offset(ahnd, mem->bb.handle, mem->bb.size, alignment);
+					  0, mem->dst.pat_index);
+	bb_offset = get_offset(ahnd, mem->bb.handle, mem->bb.size, 0);
 
 	emit_blt_mem_copy(fd, ahnd, mem);
 
@@ -1701,14 +1685,13 @@ int blt_mem_copy(int fd, const intel_ctx_t *ctx,
 static void emit_blt_mem_set(int fd, uint64_t ahnd, const struct blt_mem_data *mem,
 			     uint8_t fill_data)
 {
-	uint64_t dst_offset, alignment;
+	uint64_t dst_offset;
 	int b;
 	uint32_t *batch;
 	uint32_t value;
 
-	alignment = get_default_alignment(fd, mem->driver);
 	dst_offset = get_offset_pat_index(ahnd, mem->dst.handle, mem->dst.size,
-					  alignment, mem->dst.pat_index);
+					  0, mem->dst.pat_index);
 
 	batch = bo_map(fd, mem->bb.handle, mem->bb.size, mem->driver);
 	value = (uint32_t)fill_data << 24;
@@ -1747,13 +1730,12 @@ int blt_mem_set(int fd, const intel_ctx_t *ctx,
 {
 	struct drm_i915_gem_execbuffer2 execbuf = {};
 	struct drm_i915_gem_exec_object2 obj[2] = {};
-	uint64_t dst_offset, bb_offset, alignment;
+	uint64_t dst_offset, bb_offset;
 	int ret;
 
-	alignment = get_default_alignment(fd, mem->driver);
 	dst_offset = get_offset_pat_index(ahnd, mem->dst.handle, mem->dst.size,
-					  alignment, mem->dst.pat_index);
-	bb_offset = get_offset(ahnd, mem->bb.handle, mem->bb.size, alignment);
+					  0, mem->dst.pat_index);
+	bb_offset = get_offset(ahnd, mem->bb.handle, mem->bb.size, 0);
 
 	emit_blt_mem_set(fd, ahnd, mem, fill_data);
 
-- 
2.41.0
