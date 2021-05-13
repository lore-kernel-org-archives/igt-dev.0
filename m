Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E507A6E09E
 for <igt-dev@lists.freedesktop.org>; Thu, 13 May 2021 09:30:34 +0000 (UTC)
From: Karthik B S <karthik.b.s@intel.com>
Date: Thu, 13 May 2021 14:37:00 +0530
Message-Id: <20210513090700.7271-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_dp_dsc: Bug fix for DP on Pipe A
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

DSC is not supported on Pipe A for external DP on Gen11 platforms.
But as this check is within update_display(), we still call test_cleanup().
This bug is seen here as the pipe wasn't set properly for this output.

To fix this, moving the check outside update_display() so that we do not
call test_cleanup if we didn't even run the test.

Also, moved the fb creation and removal outside the loop for_each_pipe(),
since it seems redundant within the loop.

Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/3466

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_dp_dsc.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/tests/kms_dp_dsc.c b/tests/kms_dp_dsc.c
index 60ed3855..2446fd82 100644
--- a/tests/kms_dp_dsc.c
+++ b/tests/kms_dp_dsc.c
@@ -168,7 +168,6 @@ static void test_cleanup(data_t *data)
 						    DRM_PLANE_TYPE_PRIMARY);
 		igt_plane_set_fb(primary, NULL);
 		igt_display_commit(&data->display);
-		igt_remove_fb(data->drm_fd, &data->fb_test_pattern);
 	}
 }
 
@@ -185,15 +184,8 @@ static void kms_dp_dsc_exit_handler(int sig)
 static void update_display(data_t *data, enum dsc_test_type test_type)
 {
 	igt_plane_t *primary;
-	data->mode = igt_output_get_mode(data->output);
 	data->connector = data->output->config.connector;
 
-	if (data->connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort &&
-	    data->pipe == PIPE_A) {
-		igt_debug("DSC not supported on Pipe A on external DP\n");
-		return;
-	}
-
 	/* Disable the output first */
 	igt_output_set_pipe(data->output, PIPE_NONE);
 	igt_display_commit(&data->display);
@@ -206,11 +198,6 @@ static void update_display(data_t *data, enum dsc_test_type test_type)
 		force_dp_dsc_enable(data);
 
 		igt_output_set_pipe(data->output, data->pipe);
-		igt_create_pattern_fb(data->drm_fd, data->mode->hdisplay,
-				      data->mode->vdisplay,
-				      DRM_FORMAT_XRGB8888,
-				      LOCAL_DRM_FORMAT_MOD_NONE,
-				      &data->fb_test_pattern);
 		primary = igt_output_get_plane_type(data->output,
 						    DRM_PLANE_TYPE_PRIMARY);
 
@@ -241,7 +228,23 @@ static void run_test(data_t *data, igt_output_t *output,
 {
 	enum pipe pipe;
 
+	data->mode = igt_output_get_mode(data->output);
+	igt_create_pattern_fb(data->drm_fd, data->mode->hdisplay,
+			      data->mode->vdisplay,
+			      DRM_FORMAT_XRGB8888,
+			      LOCAL_DRM_FORMAT_MOD_NONE,
+			      &data->fb_test_pattern);
+
 	for_each_pipe(&data->display, pipe) {
+		if (is_i915_device(data->drm_fd)) {
+			uint32_t devid = intel_get_drm_devid(data->drm_fd);
+
+			if (data->connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort &&
+			    data->pipe == PIPE_A && IS_GEN11(devid)) {
+				igt_debug("DSC not supported on Pipe A on external DP in Gen11 platforms\n");
+				continue;
+			}
+		}
 
 		if (igt_pipe_connector_valid(pipe, output)) {
 			data->pipe = pipe;
@@ -250,6 +253,8 @@ static void run_test(data_t *data, igt_output_t *output,
 			test_cleanup(data);
 		}
 	}
+
+	igt_remove_fb(data->drm_fd, &data->fb_test_pattern);
 }
 
 igt_main
-- 
2.22.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
