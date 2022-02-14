Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E1B810E237
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Feb 2022 15:01:21 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
Date: Mon, 14 Feb 2022 20:30:07 +0530
Message-Id: <20220214150009.26815-15-jeevan.b@intel.com>
In-Reply-To: <20220214150009.26815-1-jeevan.b@intel.com>
References: <20220214150009.26815-1-jeevan.b@intel.com>
Subject: [igt-dev] [PATCH i-g-t v2 14/16] tests/kms_draw_crc: Use 4 tiling
 when filling framebuffer
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
Cc: juha-pekka.heikkila@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Mika Kahola <mika.kahola@intel.com>

For platforms with 4 tiling, let's use 4 tiling instead of Y tiling.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/i915/kms_draw_crc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/i915/kms_draw_crc.c b/tests/i915/kms_draw_crc.c
index 8579a55e..e5115c79 100644
--- a/tests/i915/kms_draw_crc.c
+++ b/tests/i915/kms_draw_crc.c
@@ -226,6 +226,7 @@ static void fill_fb_subtest(void)
 	int rc;
 	struct igt_fb fb;
 	igt_crc_t base_crc, crc;
+	bool has_4tile = intel_get_device_info(intel_get_drm_devid(drm_fd))->has_4tile;
 
 	igt_create_fb(drm_fd, ms.mode->hdisplay, ms.mode->vdisplay,
 		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &fb);
@@ -248,7 +249,9 @@ static void fill_fb_subtest(void)
 	igt_assert_crc_equal(&crc, &base_crc);
 
 	if (intel_display_ver(intel_get_drm_devid(drm_fd)) >= 9) {
-		get_fill_crc(I915_FORMAT_MOD_Y_TILED, &crc);
+		get_fill_crc(has_4tile ?
+			     I915_FORMAT_MOD_4_TILED : I915_FORMAT_MOD_Y_TILED,
+			     &crc);
 		igt_assert_crc_equal(&crc, &base_crc);
 	}
 
-- 
2.17.1
