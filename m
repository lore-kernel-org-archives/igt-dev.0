Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C775510F7FA
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Feb 2022 18:23:00 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
Date: Mon,  7 Feb 2022 23:51:50 +0530
Message-Id: <20220207182152.31211-16-jeevan.b@intel.com>
In-Reply-To: <20220207182152.31211-1-jeevan.b@intel.com>
References: <20220207182152.31211-1-jeevan.b@intel.com>
Subject: [igt-dev] [PATCH i-g-t 15/17] tests/kms_draw_crc: Use 4 tiling when
 filling framebuffer
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
List-ID: <igt-dev@lists.freedesktop.org>

From: Mika Kahola <mika.kahola@intel.com>

For platforms with 4 tiling, let's use 4 tiling instead of Y tiling.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/i915/kms_draw_crc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/i915/kms_draw_crc.c b/tests/i915/kms_draw_crc.c
index 6348e803..d34cd46b 100644
--- a/tests/i915/kms_draw_crc.c
+++ b/tests/i915/kms_draw_crc.c
@@ -223,6 +223,7 @@ static void fill_fb_subtest(void)
 	int rc;
 	struct igt_fb fb;
 	igt_crc_t base_crc, crc;
+	bool has_4tile = intel_get_device_info(intel_get_drm_devid(drm_fd))->has_4tile;
 
 	igt_create_fb(drm_fd, ms.mode->hdisplay, ms.mode->vdisplay,
 		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &fb);
@@ -245,7 +246,9 @@ static void fill_fb_subtest(void)
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
