Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0DEA89C80
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Dec 2019 03:41:14 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Mon, 30 Dec 2019 05:40:31 +0200
Message-Id: <20191230034040.21943-2-imre.deak@intel.com>
In-Reply-To: <20191230034040.21943-1-imre.deak@intel.com>
References: <20191230034040.21943-1-imre.deak@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 01/10] lib/igt_buf: Use compression type
 consistently
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Use the igt_buf compression field to determine the compression type for
a buffer, instead of the fact that AUX stride is set. We need to look at
the former one anyway to distinguish between compression types.

Cc: Mika Kahola <mika.kahola@intel.com>
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 lib/igt_fb.c            | 5 +++++
 lib/intel_aux_pgtable.c | 8 ++++----
 lib/intel_batchbuffer.h | 5 +++++
 lib/rendercopy_gen9.c   | 6 +++++-
 4 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index e6eb39ac..7e99abb3 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -1989,6 +1989,11 @@ static void init_buf(struct fb_blit_upload *blit,
 		else
 			igt_assert_eq(fb->strides[1] & 127, 0);
 
+		if (is_gen12_mc_ccs_modifier(fb->modifier))
+			buf->compression = I915_COMPRESSION_MEDIA;
+		else
+			buf->compression = I915_COMPRESSION_RENDER;
+
 		buf->aux.offset = fb->offsets[1];
 		buf->aux.stride = fb->strides[1];
 	}
diff --git a/lib/intel_aux_pgtable.c b/lib/intel_aux_pgtable.c
index cbb3c320..f8ce6754 100644
--- a/lib/intel_aux_pgtable.c
+++ b/lib/intel_aux_pgtable.c
@@ -434,7 +434,7 @@ aux_pgtable_reserve_range(const struct igt_buf **bufs, int buf_count,
 {
 	int i;
 
-	if (new_buf->aux.stride) {
+	if (igt_buf_compressed(new_buf)) {
 		uint64_t pin_offset = new_buf->bo->offset64;
 
 		if (!pin_offset)
@@ -465,7 +465,7 @@ gen12_aux_pgtable_init(struct aux_pgtable_info *info,
 	int reserved_buf_count;
 	int i;
 
-	if (!src_buf->aux.stride && !dst_buf->aux.stride)
+	if (!igt_buf_compressed(src_buf) && !igt_buf_compressed(dst_buf))
 		return;
 
 	bufs[0] = src_buf;
@@ -492,7 +492,7 @@ gen12_aux_pgtable_init(struct aux_pgtable_info *info,
 
 	/* Next, reserve space for unbound bufs with an AUX surface. */
 	for (i = 0; i < ARRAY_SIZE(bufs); i++)
-		if (!bufs[i]->bo->offset64 && bufs[i]->aux.stride)
+		if (!bufs[i]->bo->offset64 && igt_buf_compressed(bufs[i]))
 			aux_pgtable_reserve_range(reserved_bufs,
 						  reserved_buf_count++,
 						  bufs[i]);
@@ -500,7 +500,7 @@ gen12_aux_pgtable_init(struct aux_pgtable_info *info,
 	/* Create AUX pgtable entries only for bufs with an AUX surface */
 	info->buf_count = 0;
 	for (i = 0; i < reserved_buf_count; i++) {
-		if (!reserved_bufs[i]->aux.stride)
+		if (!igt_buf_compressed(reserved_bufs[i]))
 			continue;
 
 		info->bufs[info->buf_count] = reserved_bufs[i];
diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
index 37e3affe..c3028343 100644
--- a/lib/intel_batchbuffer.h
+++ b/lib/intel_batchbuffer.h
@@ -249,6 +249,11 @@ struct igt_buf {
 	unsigned num_tiles;
 };
 
+static inline bool igt_buf_compressed(const struct igt_buf *buf)
+{
+	return buf->compression != I915_COMPRESSION_NONE;
+}
+
 unsigned igt_buf_width(const struct igt_buf *buf);
 unsigned igt_buf_height(const struct igt_buf *buf);
 
diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index 63b1023d..88a94cbe 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -259,7 +259,9 @@ gen8_bind_buf(struct intel_batchbuffer *batch, const struct igt_buf *buf,
 
 	if (buf->compression == I915_COMPRESSION_MEDIA)
 		ss->ss7.tgl.media_compression = 1;
-	else if (buf->aux.stride) {
+	else if (buf->compression == I915_COMPRESSION_RENDER) {
+		igt_assert(buf->aux.stride);
+
 		ss->ss6.aux_mode = 0x5; /* AUX_CCS_E */
 		ss->ss6.aux_pitch = (buf->aux.stride / 128) - 1;
 
@@ -274,6 +276,8 @@ gen8_bind_buf(struct intel_batchbuffer *batch, const struct igt_buf *buf,
 	}
 
 	if (buf->cc.offset) {
+		igt_assert(buf->compression == I915_COMPRESSION_RENDER);
+
 		ss->ss12.clear_address = buf->bo->offset64 + buf->cc.offset;
 		ss->ss13.clear_address_hi = (buf->bo->offset64 + buf->cc.offset) >> 32;
 
-- 
2.23.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
