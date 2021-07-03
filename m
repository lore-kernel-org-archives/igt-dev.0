Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FF2189BD5
 for <igt-dev@lists.freedesktop.org>; Sat,  3 Jul 2021 16:02:53 +0000 (UTC)
From: Vidya Srinivas <vidya.srinivas@intel.com>
Date: Sat,  3 Jul 2021 21:22:59 +0530
Message-Id: <1625327579-28710-1-git-send-email-vidya.srinivas@intel.com>
In-Reply-To: <1624898838-23193-1-git-send-email-vidya.srinivas@intel.com>
References: <1624898838-23193-1-git-send-email-vidya.srinivas@intel.com>
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane_alpha_blend: Dont commit
 primary for 6bpc display in coverage-vs-premult-vs-none
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Intel Gen11 6bpc panels are giving CRC mismatch in coverage-vs-premult-vs-none
if primary gray fb is commited before starting alpha tests. Patch removes primar plane
commit if device is intel and 6bpc.

Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
---
 tests/kms_plane_alpha_blend.c | 36 ++++++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index a37cb27c7d62..5f0a8cb070dd 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -25,6 +25,7 @@
  */
 
 #include "igt.h"
+#include <string.h>
 
 IGT_TEST_DESCRIPTION("Test plane alpha and blending mode properties");
 
@@ -442,14 +443,45 @@ static void coverage_7efc(data_t *data, enum pipe pipe, igt_plane_t *plane)
 	igt_pipe_crc_stop(data->pipe_crc);
 }
 
+static bool is_6bpc(igt_display_t *display)
+{
+	char buf[4096];
+	char *str;
+	bool ret;
+	int debugfs_fd;
+
+	if (!is_i915_device(display->drm_fd))
+		return false;
+
+	debugfs_fd = igt_debugfs_dir(display->drm_fd);
+
+	if (debugfs_fd < 0)
+		return false;
+
+	igt_debugfs_simple_read(debugfs_fd, "i915_display_info", buf, sizeof(buf));
+
+	str = strstr(buf, "bpp=");
+	if (strncmp(str, "bpp=18", 6) == 0)
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
 
+
 	/* Set a background color on the primary fb for testing */
-	if (plane->type != DRM_PLANE_TYPE_PRIMARY)
-		igt_plane_set_fb(igt_pipe_get_plane_type(&display->pipes[pipe], DRM_PLANE_TYPE_PRIMARY), &data->gray_fb);
+	if (plane->type != DRM_PLANE_TYPE_PRIMARY) {
+		if (!is_6bpc(display))
+			igt_plane_set_fb(igt_pipe_get_plane_type(&display->pipes[pipe],
+						DRM_PLANE_TYPE_PRIMARY), &data->gray_fb);
+	}
 
 	igt_plane_set_prop_enum(plane, IGT_PLANE_PIXEL_BLEND_MODE, "Coverage");
 	igt_plane_set_fb(plane, &data->argb_fb_cov_7e);
-- 
2.7.4

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
