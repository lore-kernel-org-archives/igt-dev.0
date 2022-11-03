Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8350A10E56B
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Nov 2022 03:20:48 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  3 Nov 2022 08:54:58 +0530
Message-Id: <1667445898-20552-1-git-send-email-nidhi1.gupta@intel.com>
Subject: [igt-dev] [PATCH i-g-t] tests/kms_invalid_mode: Fix the test for
 legacy platform
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

-Cleanup up the display state before starting the subtest.
-Execute the tests only for 5 modes.
-Use primary plane to set the framebuffer.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_invalid_mode.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
index f1c3866..492c92c 100644
--- a/tests/kms_invalid_mode.c
+++ b/tests/kms_invalid_mode.c
@@ -184,6 +184,7 @@ test_output(data_t *data)
 	struct igt_fb fb;
 	int ret;
 	drmModeModeInfo *mode;
+	igt_plane_t *primary;
 
 	igt_display_reset(&data->display);
 	igt_output_set_pipe(output, data->pipe);
@@ -192,7 +193,14 @@ test_output(data_t *data)
 		      DRM_FORMAT_MOD_LINEAR,
 		      &fb);
 
+	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+	igt_plane_set_fb(primary, &fb);
+
 	for_each_connector_mode(output) {
+		igt_output_override_mode(output, NULL);
+		igt_display_commit(&data->display);
+		if (j__ > 5)
+			break;
 		mode = &output->config.connector->modes[j__];
 		igt_require(data->adjust_mode(data, mode));
 		igt_output_override_mode(output, mode);
@@ -200,9 +208,11 @@ test_output(data_t *data)
 		igt_assert(ret == -EINVAL);
 	}
 
+	/* Cleanup */
 	igt_remove_fb(data->drm_fd, &fb);
+	igt_plane_set_fb(primary, NULL);
 	igt_output_override_mode(output, NULL);
-	/*unset_all_crtcs*/
+	igt_output_set_pipe(output, PIPE_NONE);
 	igt_display_commit(&data->display);
 }
 
-- 
1.9.1
