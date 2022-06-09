Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B81B112FAE
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jun 2022 05:38:04 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	swati2.sharma@intel.com
Date: Thu,  9 Jun 2022 11:04:26 +0530
Message-Id: <20220609053427.4061474-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20220609053427.4061474-1-bhanuprakash.modem@intel.com>
References: <20220609053427.4061474-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 2/3] tests/kms_pipe_crc_basic: Test Cleanup
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

Clear the system state before exiting the subtest.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by:  Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_pipe_crc_basic.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index eeeb455d..0f34f807 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -77,7 +77,11 @@ static void test_read_crc(data_t *data, enum pipe pipe,
 	int c, j;
 
 	igt_display_reset(display);
+
 	igt_output_set_pipe(output, pipe);
+	mode = igt_output_get_mode(output);
+
+	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
 	for (c = 0; c < ARRAY_SIZE(colors); c++) {
 		char *crc_str;
@@ -86,7 +90,6 @@ static void test_read_crc(data_t *data, enum pipe pipe,
 		igt_debug("Clearing the fb with color (%.02lf,%.02lf,%.02lf)\n",
 			  colors[c].r, colors[c].g, colors[c].b);
 
-		mode = igt_output_get_mode(output);
 		igt_create_color_fb(data->drm_fd,
 					mode->hdisplay, mode->vdisplay,
 					DRM_FORMAT_XRGB8888,
@@ -96,7 +99,6 @@ static void test_read_crc(data_t *data, enum pipe pipe,
 					colors[c].b,
 					&data->fb);
 
-		primary = igt_output_get_plane(output, 0);
 		igt_plane_set_fb(primary, &data->fb);
 
 		igt_display_commit(display);
@@ -153,6 +155,11 @@ static void test_read_crc(data_t *data, enum pipe pipe,
 		free(crcs);
 		igt_remove_fb(data->drm_fd, &data->fb);
 	}
+
+	/* Clean-up */
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_plane_set_fb(primary, NULL);
+	igt_display_commit(display);
 }
 
 /*
@@ -226,6 +233,7 @@ static void test_disable_crc_after_crtc(data_t *data, enum pipe pipe,
 	igt_pipe_crc_t *pipe_crc;
 	drmModeModeInfo *mode;
 	igt_crc_t crc[2];
+	igt_plane_t *primary;
 
 	pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe, "auto");
 
@@ -238,7 +246,9 @@ static void test_disable_crc_after_crtc(data_t *data, enum pipe pipe,
 			    DRM_FORMAT_XRGB8888,
 			    DRM_FORMAT_MOD_LINEAR,
 			    0.0, 1.0, 0.0, &data->fb);
-	igt_plane_set_fb(igt_output_get_plane(output, 0), &data->fb);
+
+	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+	igt_plane_set_fb(primary, &data->fb);
 	igt_display_commit(display);
 
 	igt_pipe_crc_start(pipe_crc);
@@ -253,7 +263,11 @@ static void test_disable_crc_after_crtc(data_t *data, enum pipe pipe,
 	igt_pipe_crc_collect_crc(pipe_crc, &crc[1]);
 	igt_assert_crc_equal(&crc[0], &crc[1]);
 
+	/* Clean-up */
 	igt_pipe_crc_free(pipe_crc);
+	igt_plane_set_fb(primary, NULL);
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit(display);
 	igt_remove_fb(data->drm_fd, &data->fb);
 }
 
@@ -291,6 +305,8 @@ igt_main
 
 		igt_display_require(&data.display, data.drm_fd);
 		igt_display_require_output(&data.display);
+		igt_require_pipe_crc(data.drm_fd);
+
 		data.debugfs = igt_debugfs_dir(data.drm_fd);
 	}
 
-- 
2.35.1
