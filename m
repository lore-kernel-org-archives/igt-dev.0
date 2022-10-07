Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71D3810E96F
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Oct 2022 15:47:07 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  7 Oct 2022 21:16:30 +0530
Message-Id: <20221007154630.2865264-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t] tests/kms_invalid_mode: Use primary plane to set
 the framebuffer
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

Use primary plane to set the framebuffer.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_invalid_mode.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
index f1c38669..aa7f2b15 100644
--- a/tests/kms_invalid_mode.c
+++ b/tests/kms_invalid_mode.c
@@ -184,6 +184,7 @@ test_output(data_t *data)
 	struct igt_fb fb;
 	int ret;
 	drmModeModeInfo *mode;
+	igt_plane_t *primary;
 
 	igt_display_reset(&data->display);
 	igt_output_set_pipe(output, data->pipe);
@@ -192,6 +193,9 @@ test_output(data_t *data)
 		      DRM_FORMAT_MOD_LINEAR,
 		      &fb);
 
+	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+	igt_plane_set_fb(primary, &fb);
+
 	for_each_connector_mode(output) {
 		mode = &output->config.connector->modes[j__];
 		igt_require(data->adjust_mode(data, mode));
@@ -200,9 +204,11 @@ test_output(data_t *data)
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
2.37.3
