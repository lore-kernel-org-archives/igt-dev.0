Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E96310E3CA
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jun 2023 16:21:11 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4f642a24555so7218776e87.3
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jun 2023 09:21:11 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 13 Jun 2023 19:21:03 +0300
Message-Id: <20230613162105.2757-2-juhapekka.heikkila@gmail.com>
In-Reply-To: <20230613162105.2757-1-juhapekka.heikkila@gmail.com>
References: <20230613162105.2757-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/i915/i915_blt.c | 12 ++++++++----
 lib/i915/i915_blt.h |  3 +++
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/lib/i915/i915_blt.c b/lib/i915/i915_blt.c
index ef67fe26..f18b6326 100644
--- a/lib/i915/i915_blt.c
+++ b/lib/i915/i915_blt.c
@@ -708,8 +708,10 @@ uint64_t emit_blt_block_copy(int i915,
 	igt_assert_f(blt, "block-copy requires data to do blit\n");
 
 	alignment = gem_detect_safe_alignment(i915);
-	src_offset = get_offset(ahnd, blt->src.handle, blt->src.size, alignment);
-	dst_offset = get_offset(ahnd, blt->dst.handle, blt->dst.size, alignment);
+	src_offset = get_offset(ahnd, blt->src.handle, blt->src.size, alignment)
+		     + blt->src.plane_offset;
+	dst_offset = get_offset(ahnd, blt->dst.handle, blt->dst.size, alignment)
+		     + blt->dst.plane_offset;
 	bb_offset = get_offset(ahnd, blt->bb.handle, blt->bb.size, alignment);
 
 	fill_data(&data, blt, src_offset, dst_offset, ext);
@@ -1179,8 +1181,10 @@ uint64_t emit_blt_fast_copy(int i915,
 	data.dw03.dst_x2 = blt->dst.x2;
 	data.dw03.dst_y2 = blt->dst.y2;
 
-	src_offset = get_offset(ahnd, blt->src.handle, blt->src.size, alignment);
-	dst_offset = get_offset(ahnd, blt->dst.handle, blt->dst.size, alignment);
+	src_offset = get_offset(ahnd, blt->src.handle, blt->src.size, alignment)
+		     + blt->src.plane_offset;
+	dst_offset = get_offset(ahnd, blt->dst.handle, blt->dst.size, alignment)
+		     + blt->dst.plane_offset;
 	bb_offset = get_offset(ahnd, blt->bb.handle, blt->bb.size, alignment);
 
 	data.dw04.dst_address_lo = dst_offset;
diff --git a/lib/i915/i915_blt.h b/lib/i915/i915_blt.h
index a5f0edd1..05a80ce6 100644
--- a/lib/i915/i915_blt.h
+++ b/lib/i915/i915_blt.h
@@ -85,6 +85,9 @@ struct blt_copy_object {
 
 	/* mapping or null */
 	uint32_t *ptr;
+
+	/* enable to use multiplane framebuffers */
+	uint32_t plane_offset;
 };
 
 struct blt_copy_batch {
-- 
2.25.1
