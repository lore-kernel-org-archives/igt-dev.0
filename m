Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E248610E124
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Oct 2023 18:25:14 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2c131ddfc95so60584611fa.0
 for <igt-dev@lists.freedesktop.org>; Mon, 09 Oct 2023 11:25:14 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  9 Oct 2023 21:25:07 +0300
Message-Id: <20231009182507.390403-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane: test odd size planar yuv
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

Test odd size planar yuv formats are allowed on graphics ver >= 20

Rename invalid pixel format settings test to planar pixel format settings
test to refect the changes.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_plane.c | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 9a515559c..268776c04 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -1242,14 +1242,17 @@ static void test_invalid_settings(data_t *data)
 	igt_output_t *output;
 	igt_fb_t fb;
 	igt_plane_t *primary;
+	int devid;
 	int rval;
 
 	/*
 	 * If here is added non-intel tests below require will need to be
 	 * changed to if(..)
 	 */
+	igt_require(data->display.is_atomic);
 	igt_require_intel(data->drm_fd);
-	igt_require(intel_display_ver(intel_get_drm_devid(data->drm_fd)) >= 9);
+	devid = intel_get_drm_devid(data->drm_fd);
+	igt_require(intel_display_ver(devid) >= 9);
 
 	output = igt_get_single_output_for_pipe(&data->display, pipe);
 	igt_require(output);
@@ -1257,17 +1260,26 @@ static void test_invalid_settings(data_t *data)
 	igt_output_set_pipe(output, pipe);
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
-	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
+	igt_display_commit_atomic(&data->display,
+				  DRM_MODE_ATOMIC_ALLOW_MODESET,
+				  NULL);
 
 	/* test against intel_plane_check_src_coordinates() in i915 */
 	if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
 				     DRM_FORMAT_MOD_LINEAR)) {
+		int expected_rval = -EINVAL;
+
+		if (intel_display_ver(devid) >= 20)
+			expected_rval = 0;
+
 		igt_create_fb(data->drm_fd, 257, 256,
 			      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb);
 		igt_plane_set_fb(primary, &fb);
-		rval = igt_display_try_commit_atomic(&data->display, 0, NULL);
+		rval = igt_display_try_commit_atomic(&data->display,
+						     DRM_MODE_ATOMIC_ALLOW_MODESET,
+						     NULL);
 		igt_remove_fb(data->drm_fd, &fb);
-		igt_assert_f(rval == -EINVAL, "Odd width NV12 framebuffer\n");
+		igt_assert_f(rval == expected_rval, "Odd width NV12 framebuffer\n");
 	} else {
 		igt_debug("Odd width NV12 framebuffer test skipped\n");
 	}
@@ -1275,12 +1287,19 @@ static void test_invalid_settings(data_t *data)
 	/* test against intel_plane_check_src_coordinates() in i915 */
 	if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
 				     DRM_FORMAT_MOD_LINEAR)) {
+		int expected_rval = -EINVAL;
+
+		if (intel_display_ver(devid) >= 20)
+			expected_rval = 0;
+
 		igt_create_fb(data->drm_fd, 256, 257,
 			      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb);
 		igt_plane_set_fb(primary, &fb);
-		rval = igt_display_try_commit_atomic(&data->display, 0, NULL);
+		rval = igt_display_try_commit_atomic(&data->display,
+						     DRM_MODE_ATOMIC_ALLOW_MODESET,
+						     NULL);
 		igt_remove_fb(data->drm_fd, &fb);
-		igt_assert_f(rval == -EINVAL, "Odd height NV12 framebuffer\n");
+		igt_assert_f(rval == expected_rval, "Odd height NV12 framebuffer\n");
 	} else {
 		igt_debug("Odd height NV12 framebuffer test skipped\n");
 	}
-- 
2.34.1
