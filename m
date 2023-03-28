Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5788010E4A4
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Mar 2023 18:30:50 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id c9so6599275lfb.1
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Mar 2023 11:30:50 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 28 Mar 2023 21:30:41 +0300
Message-Id: <20230328183043.16258-2-juhapekka.heikkila@gmail.com>
In-Reply-To: <20230328183043.16258-1-juhapekka.heikkila@gmail.com>
References: <20230328183043.16258-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] lib/i915/i915_blt: Add offset to block
 and fast copy
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

Add offset to src and dst blits, this allow to use i915_blt with multiplane
framebuffers.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/i915/i915_blt.c | 12 ++++++++----
 lib/i915/i915_blt.h |  1 +
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/lib/i915/i915_blt.c b/lib/i915/i915_blt.c
index ef67fe26f..ffaa97b42 100644
--- a/lib/i915/i915_blt.c
+++ b/lib/i915/i915_blt.c
@@ -708,8 +708,10 @@ uint64_t emit_blt_block_copy(int i915,
 	igt_assert_f(blt, "block-copy requires data to do blit\n");
 
 	alignment = gem_detect_safe_alignment(i915);
-	src_offset = get_offset(ahnd, blt->src.handle, blt->src.size, alignment);
-	dst_offset = get_offset(ahnd, blt->dst.handle, blt->dst.size, alignment);
+	src_offset = get_offset(ahnd, blt->src.handle, blt->src.size, alignment)
+		     + blt->src.offset;
+	dst_offset = get_offset(ahnd, blt->dst.handle, blt->dst.size, alignment)
+		     + blt->dst.offset;
 	bb_offset = get_offset(ahnd, blt->bb.handle, blt->bb.size, alignment);
 
 	fill_data(&data, blt, src_offset, dst_offset, ext);
@@ -1179,8 +1181,10 @@ uint64_t emit_blt_fast_copy(int i915,
 	data.dw03.dst_x2 = blt->dst.x2;
 	data.dw03.dst_y2 = blt->dst.y2;
 
-	src_offset = get_offset(ahnd, blt->src.handle, blt->src.size, alignment);
-	dst_offset = get_offset(ahnd, blt->dst.handle, blt->dst.size, alignment);
+	src_offset = get_offset(ahnd, blt->src.handle, blt->src.size, alignment)
+		     + blt->src.offset;
+	dst_offset = get_offset(ahnd, blt->dst.handle, blt->dst.size, alignment)
+		     + blt->dst.offset;
 	bb_offset = get_offset(ahnd, blt->bb.handle, blt->bb.size, alignment);
 
 	data.dw04.dst_address_lo = dst_offset;
diff --git a/lib/i915/i915_blt.h b/lib/i915/i915_blt.h
index a5f0edd15..3e5bec496 100644
--- a/lib/i915/i915_blt.h
+++ b/lib/i915/i915_blt.h
@@ -80,6 +80,7 @@ struct blt_copy_object {
 	enum blt_compression compression;  /* BC only */
 	enum blt_compression_type compression_type; /* BC only */
 	uint32_t pitch;
+	uint32_t offset;
 	uint16_t x_offset, y_offset;
 	int16_t x1, y1, x2, y2;
 
-- 
2.39.0
