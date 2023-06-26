Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C81D10E248
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jun 2023 19:57:34 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2b6a0e36d42so17187991fa.0
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jun 2023 12:57:34 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 26 Jun 2023 22:57:25 +0300
Message-Id: <20230626195725.3993-4-juhapekka.heikkila@gmail.com>
In-Reply-To: <20230626195725.3993-1-juhapekka.heikkila@gmail.com>
References: <20230626195725.3993-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] lib/igt_fb: On blitter path take clear
 color modifier into account
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

On blitter path take clear color modifier into account so rc ccs cc will
pass correctly.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/igt_fb.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index fba605f89..3034b5092 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2834,9 +2834,12 @@ static void blitcopy(const struct igt_fb *dst_fb,
 	struct blt_block_copy_data_ext ext = {}, *pext = NULL;
 	uint32_t mem_region = HAS_FLATCCS(intel_get_drm_devid(src_fb->fd))
 			   ? REGION_LMEM(0) : REGION_SMEM;
+	/* To ignore CC plane */
+	uint32_t src_cc = src_fb->modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC ? 1 : 0;
+	uint32_t dst_cc = dst_fb->modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC ? 1 : 0;
 
 	igt_assert_eq(dst_fb->fd, src_fb->fd);
-	igt_assert_eq(dst_fb->num_planes, src_fb->num_planes);
+	igt_assert_eq(dst_fb->num_planes - dst_cc, src_fb->num_planes - src_cc);
 
 	src_tiling = igt_fb_mod_to_tiling(src_fb->modifier);
 	dst_tiling = igt_fb_mod_to_tiling(dst_fb->modifier);
@@ -2853,7 +2856,7 @@ static void blitcopy(const struct igt_fb *dst_fb,
 							  mem_region) == 0);
 	}
 
-	for (int i = 0; i < dst_fb->num_planes; i++) {
+	for (int i = 0; i < dst_fb->num_planes - dst_cc; i++) {
 		igt_assert_eq(dst_fb->plane_bpp[i], src_fb->plane_bpp[i]);
 		igt_assert_eq(dst_fb->plane_width[i], src_fb->plane_width[i]);
 		igt_assert_eq(dst_fb->plane_height[i], src_fb->plane_height[i]);
-- 
2.25.1
