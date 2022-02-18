Return-path: <SRS0=2yIq=TB=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A032810EF41
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Feb 2022 09:10:45 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 18 Feb 2022 14:39:34 +0530
Message-Id: <20220218090936.15857-15-jeevan.b@intel.com>
In-Reply-To: <20220218090936.15857-1-jeevan.b@intel.com>
References: <20220218090936.15857-1-jeevan.b@intel.com>
Subject: [igt-dev] [PATCH i-g-t v4 14/16] tests/kms_draw_crc: Use 4 tiling
 when filling framebuffer
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: juha-pekka.heikkila@intel.com, petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mika Kahola <mika.kahola@intel.com>

For platforms with 4 tiling, let's use 4 tiling instead of Y tiling.

Signed-off-by: Mika Kahola <mika.kahola@intel.com>
Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/i915/kms_draw_crc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/i915/kms_draw_crc.c b/tests/i915/kms_draw_crc.c
index 33b7bdf4..33fefed4 100644
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
