Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EBA510E11C
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jun 2023 19:57:32 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4f867700f36so5119207e87.0
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jun 2023 12:57:32 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 26 Jun 2023 22:57:23 +0300
Message-Id: <20230626195725.3993-2-juhapekka.heikkila@gmail.com>
In-Reply-To: <20230626195725.3993-1-juhapekka.heikkila@gmail.com>
References: <20230626195725.3993-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] lib/intel_blt: Add offset to block and
 fast copy
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

Add offset to src and dst blits, this allow to use intel_blt with multiplane
framebuffers.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_blt.c | 12 ++++++++----
 lib/intel_blt.h |  3 +++
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index 28a740094..998c16939 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -708,8 +708,10 @@ uint64_t emit_blt_block_copy(int fd,
 	igt_assert_f(blt, "block-copy requires data to do blit\n");
 
 	alignment = gem_detect_safe_alignment(fd);
-	src_offset = get_offset(ahnd, blt->src.handle, blt->src.size, alignment);
-	dst_offset = get_offset(ahnd, blt->dst.handle, blt->dst.size, alignment);
+	src_offset = get_offset(ahnd, blt->src.handle, blt->src.size, alignment)
+		     + blt->src.plane_offset;
+	dst_offset = get_offset(ahnd, blt->dst.handle, blt->dst.size, alignment)
+		     + blt->dst.plane_offset;
 	bb_offset = get_offset(ahnd, blt->bb.handle, blt->bb.size, alignment);
 
 	fill_data(&data, blt, src_offset, dst_offset, ext);
@@ -1179,8 +1181,10 @@ uint64_t emit_blt_fast_copy(int fd,
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
diff --git a/lib/intel_blt.h b/lib/intel_blt.h
index 0cbe881f4..62cc835fd 100644
--- a/lib/intel_blt.h
+++ b/lib/intel_blt.h
@@ -88,6 +88,9 @@ struct blt_copy_object {
 
 	/* mapping or null */
 	uint32_t *ptr;
+
+	/* enable to use multiplane framebuffers */
+	uint32_t plane_offset;
 };
 
 struct blt_copy_batch {
-- 
2.25.1
