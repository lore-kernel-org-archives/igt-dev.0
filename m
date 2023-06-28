Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 027DE10E371
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jun 2023 17:58:40 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4f86e6e4038so259655e87.0
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jun 2023 10:58:40 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 28 Jun 2023 20:58:29 +0300
Message-Id: <20230628175830.12504-4-juhapekka.heikkila@gmail.com>
In-Reply-To: <20230628175830.12504-1-juhapekka.heikkila@gmail.com>
References: <20230628175830.12504-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/4] lib/igt_fb: fix tiling and blitter to
 require intel instead of i915 device
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

As per introduction of xe driver change device requirements when
using blitter or x- or 4-tile.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/igt_fb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 597f926d9..c1029246e 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -447,7 +447,7 @@ void igt_get_fb_tile_size(int fd, uint64_t modifier, int fb_bpp,
 		*height_ret = 1;
 		break;
 	case I915_FORMAT_MOD_X_TILED:
-		igt_require_i915(fd);
+		igt_require_intel(fd);
 		if (intel_display_ver(intel_get_drm_devid(fd)) == 2) {
 			*width_ret = 128;
 			*height_ret = 16;
@@ -468,7 +468,7 @@ void igt_get_fb_tile_size(int fd, uint64_t modifier, int fb_bpp,
 	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
 	case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
 	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC:
-		igt_require_i915(fd);
+		igt_require_intel(fd);
 		if (intel_display_ver(intel_get_drm_devid(fd)) == 2) {
 			*width_ret = 128;
 			*height_ret = 16;
@@ -2490,7 +2490,7 @@ static bool block_copy_ok(const struct igt_fb *fb)
 
 static bool blitter_ok(const struct igt_fb *fb)
 {
-	if (!is_i915_device(fb->fd))
+	if (!is_intel_device(fb->fd))
 		return false;
 
 	if ((is_ccs_modifier(fb->modifier) &&
-- 
2.25.1
