Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F307B10E25B
 for <igt-dev@lists.freedesktop.org>; Tue, 16 May 2023 15:44:03 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2ac7f53ae44so153208461fa.2
 for <igt-dev@lists.freedesktop.org>; Tue, 16 May 2023 08:44:03 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 16 May 2023 18:43:29 +0300
Message-Id: <20230516154329.9002-5-juhapekka.heikkila@gmail.com>
In-Reply-To: <20230516154329.9002-1-juhapekka.heikkila@gmail.com>
References: <20230516154329.9002-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/4] tests/kms_getfb: Add meteorlake related
 ccs modifiers
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

Add meteorlake related ccs modifiers for getfb2-accept-ccs and
getfb-reject-ccs subtests to allow them to run without skipping.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_getfb.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/tests/kms_getfb.c b/tests/kms_getfb.c
index 4adc7eee..f44f4255 100644
--- a/tests/kms_getfb.c
+++ b/tests/kms_getfb.c
@@ -100,10 +100,15 @@ static void get_ccs_fb(int fd, struct drm_mode_fb_cmd2 *ret)
 		size = add.pitches[0] * ALIGN(add.height, 8);
 		size = ALIGN(size, 4096);
 	} else if ((intel_display_ver(devid)) >= 12) {
-		add.modifier[0] = I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS;
-		add.modifier[1] = I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS;
+		add.modifier[0] = IS_METEORLAKE(devid) ?
+			I915_FORMAT_MOD_4_TILED_MTL_RC_CCS :
+			I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS;
 
-		/* The main surface for TGL is 4x4 tiles aligned
+		add.modifier[1] = IS_METEORLAKE(devid) ?
+			I915_FORMAT_MOD_4_TILED_MTL_RC_CCS :
+			I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS;
+
+		/* The main surface for Gen12+ is 4x4 tiles aligned
 		 * For 32bpp the pitch is 4*4*32 bytes i.e. 512 bytes
 		 */
 		add.pitches[0] = ALIGN(add.width * 4, 4 * 128);
@@ -138,7 +143,7 @@ static void get_ccs_fb(int fd, struct drm_mode_fb_cmd2 *ret)
 	add.handles[0] = gem_buffer_create_fb_obj(fd, size);
 	igt_require(add.handles[0] != 0);
 
-	if (!HAS_FLATCCS(intel_get_drm_devid(fd)))
+	if (!HAS_FLATCCS(devid))
 		add.handles[1] = add.handles[0];
 
 	if (drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &add) == 0)
-- 
2.25.1
