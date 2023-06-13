Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32AD110E3CA
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jun 2023 16:21:12 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4f62d93f38aso7240956e87.0
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jun 2023 09:21:12 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 13 Jun 2023 19:21:05 +0300
Message-Id: <20230613162105.2757-4-juhapekka.heikkila@gmail.com>
In-Reply-To: <20230613162105.2757-1-juhapekka.heikkila@gmail.com>
References: <20230613162105.2757-1-juhapekka.heikkila@gmail.com>
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
index a2fd9050..84ab7826 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2833,9 +2833,12 @@ static void blitcopy(const struct igt_fb *dst_fb,
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
@@ -2852,7 +2855,7 @@ static void blitcopy(const struct igt_fb *dst_fb,
 							  mem_region) == 0);
 	}
 
-	for (int i = 0; i < dst_fb->num_planes; i++) {
+	for (int i = 0; i < dst_fb->num_planes - dst_cc; i++) {
 		igt_assert_eq(dst_fb->plane_bpp[i], src_fb->plane_bpp[i]);
 		igt_assert_eq(dst_fb->plane_width[i], src_fb->plane_width[i]);
 		igt_assert_eq(dst_fb->plane_height[i], src_fb->plane_height[i]);
-- 
2.25.1
