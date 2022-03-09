Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE56D10E429
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Mar 2022 16:50:12 +0000 (UTC)
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  9 Mar 2022 22:14:52 +0530
Message-Id: <20220309164452.8240-6-jeevan.b@intel.com>
In-Reply-To: <20220309164452.8240-1-jeevan.b@intel.com>
References: <20220309164452.8240-1-jeevan.b@intel.com>
Subject: [igt-dev] [PATCH i-g-t 5/5] tests/kms_plane_scaling: Adding Tile-4
 support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: juha-pekka.heikkila@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Adding subtest to test new tiling format

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_plane_scaling.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index b91039b0..73975480 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -40,6 +40,7 @@ typedef struct {
 	igt_display_t display;
 	struct igt_fb fb[4];
 	bool extended;
+	bool has_4tile;
 } data_t;
 
 const struct {
@@ -331,7 +332,8 @@ static const uint64_t modifiers[] = {
 	DRM_FORMAT_MOD_LINEAR,
 	I915_FORMAT_MOD_X_TILED,
 	I915_FORMAT_MOD_Y_TILED,
-	I915_FORMAT_MOD_Yf_TILED
+	I915_FORMAT_MOD_Yf_TILED,
+	I915_FORMAT_MOD_4_TILED
 };
 
 static void test_scaler_with_pixel_format_pipe(data_t *d, int width, int height, bool is_upscale,
@@ -350,6 +352,10 @@ static void test_scaler_with_pixel_format_pipe(data_t *d, int width, int height,
 
 		for (int i = 0; i < ARRAY_SIZE(modifiers); i++) {
 			uint64_t modifier = modifiers[i];
+
+			if (modifier == I915_FORMAT_MOD_4_TILED)
+				igt_require(d->has_4tile);
+
 			struct igt_vec tested_formats;
 
 			igt_vec_init(&tested_formats, sizeof(uint32_t));
@@ -682,6 +688,9 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		data.devid = is_i915_device(data.drm_fd) ?
 			intel_get_drm_devid(data.drm_fd) : 0;
 		igt_require(data.display.is_atomic);
+
+		data.has_4tile = is_i915_device(data.drm_fd) &&
+				 intel_get_device_info(intel_get_drm_devid(data.drm_fd))->has_4tile;
 	}
 
 	igt_subtest_group {
-- 
2.17.1
