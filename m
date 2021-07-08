Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E530D6E89C
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Jul 2021 09:40:57 +0000 (UTC)
From: Vidya Srinivas <vidya.srinivas@intel.com>
Date: Thu,  8 Jul 2021 15:00:57 +0530
Message-Id: <20210708093057.31324-1-vidya.srinivas@intel.com>
In-Reply-To: <20210708090439.4453-1-vidya.srinivas@intel.com>
References: <20210708090439.4453-1-vidya.srinivas@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane_alpha_blend: Skip crc
 assertion in coverage-vs-premult-vs-none for 6bpc panels
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Intel Gen11 platforms using 6bpc panels have dithering ON
and show CRC mismatch in coverage-vs-premult-vs-none
Doing a crc based test with dithering is not a great idea as pixels
will change due to the 8bit to 6bits truncation with dithering.

This patch skips the CRC assertion for 6bpc panels. Currently, there is no better
way of fetching the bpc info other than EDID or display_info. Currently using
i915_display_info for the same. Hence restricting the check to i915 devices only.

Credits-to: Uma Shankar <uma.shankar@intel.com>
Credits-to: Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>
Credits-to: Modem Bhanuprakash <Bhanuprakash.Modem@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
---
 tests/kms_plane_alpha_blend.c | 43 +++++++++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index a37cb27c7d62..e450e64cb105 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -442,10 +442,42 @@ static void coverage_7efc(data_t *data, enum pipe pipe, igt_plane_t *plane)
 	igt_pipe_crc_stop(data->pipe_crc);
 }
 
+static bool is_6bpc(igt_display_t *display, enum pipe pipe) {
+	char buf[4096];
+	char *str;
+	bool ret;
+	int debugfs_fd;
+	drmModeConnector *c;
+	igt_output_t *output = igt_get_single_output_for_pipe(display, pipe);
+
+	if (!is_i915_device(display->drm_fd))
+		return false;
+
+	c = output->config.connector;
+	if (c->connector_type != DRM_MODE_CONNECTOR_eDP)
+		return false;
+
+	debugfs_fd = igt_debugfs_dir(display->drm_fd);
+	if (debugfs_fd < 0)
+		return false;
+
+	igt_debugfs_simple_read(debugfs_fd, "i915_display_info", buf, sizeof(buf));
+
+	str = strstr(buf, "bpp=");
+	if (str && (strncmp(str, "bpp=18", 6) == 0))
+		ret = true;
+	else
+		ret = false;
+
+	close(debugfs_fd);
+	return ret;
+}
+
 static void coverage_premult_constant(data_t *data, enum pipe pipe, igt_plane_t *plane)
 {
 	igt_display_t *display = &data->display;
 	igt_crc_t ref_crc = {}, crc = {};
+	bool is6bpc = false;
 
 	/* Set a background color on the primary fb for testing */
 	if (plane->type != DRM_PLANE_TYPE_PRIMARY)
@@ -461,14 +493,21 @@ static void coverage_premult_constant(data_t *data, enum pipe pipe, igt_plane_t
 	igt_plane_set_fb(plane, &data->argb_fb_7e);
 	igt_display_commit2(display, COMMIT_ATOMIC);
 	igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &crc);
-	igt_assert_crc_equal(&ref_crc, &crc);
+
+	/* 6bpc panels have dithering ON and CRC might fail, hence skip crc check */
+	is6bpc = is_6bpc(display, pipe);
+	if (is6bpc == false)
+		igt_assert_crc_equal(&ref_crc, &crc);
 
 	igt_plane_set_prop_enum(plane, IGT_PLANE_PIXEL_BLEND_MODE, "None");
 	igt_plane_set_prop_value(plane, IGT_PLANE_ALPHA, 0x7e7e);
 	igt_plane_set_fb(plane, &data->argb_fb_cov_7e);
 	igt_display_commit2(display, COMMIT_ATOMIC);
 	igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &crc);
-	igt_assert_crc_equal(&ref_crc, &crc);
+
+	/* 6bpc panels have dithering ON and CRC might fail, hence skip crc check */
+	if (is6bpc == false)
+		igt_assert_crc_equal(&ref_crc, &crc);
 
 	igt_pipe_crc_stop(data->pipe_crc);
 }
-- 
2.32.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
