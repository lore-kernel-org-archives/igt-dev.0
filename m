Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 942AF10E3C6
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Nov 2022 15:20:58 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  7 Nov 2022 17:20:52 +0200
Message-Id: <20221107152052.29137-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20221107152052.29137-1-ville.syrjala@linux.intel.com>
References: <20221107152052.29137-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] Revert "tests/kms_invalid_mode: Test
 Cleanup"
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

This reverts commit 6725767a84109e934ca138d94df0482386c44532.

This was no cleanup. It does fifteen different things and
in the process flat out breaks the test at least on all
non-atomic drivers/platforms.

Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_invalid_mode.c | 39 ++++++++++++++++++++++++---------------
 1 file changed, 24 insertions(+), 15 deletions(-)

diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
index 8c345766d192..40042d4e81a5 100644
--- a/tests/kms_invalid_mode.c
+++ b/tests/kms_invalid_mode.c
@@ -35,6 +35,7 @@ struct _data {
 	enum pipe pipe;
 	igt_display_t display;
 	igt_output_t *output;
+	drmModeResPtr res;
 	int max_dotclock;
 	bool (*adjust_mode)(data_t *data, drmModeModeInfoPtr mode);
 };
@@ -181,29 +182,35 @@ static void
 test_output(data_t *data)
 {
 	igt_output_t *output = data->output;
+	drmModeModeInfo mode;
 	struct igt_fb fb;
 	int ret;
-	drmModeModeInfo *mode;
+	uint32_t crtc_id;
 
-	igt_output_set_pipe(output, data->pipe);
+	/*
+	 * FIXME test every mode we have to be more
+	 * sure everything is really getting rejected?
+	 */
+	mode = *igt_output_get_mode(output);
+	igt_require(data->adjust_mode(data, &mode));
 
-	igt_create_fb(data->drm_fd, 512, 512, DRM_FORMAT_XRGB8888,
+	igt_create_fb(data->drm_fd,
+		      max_t(uint16_t, mode.hdisplay, 64),
+		      max_t(uint16_t, mode.vdisplay, 64),
+		      DRM_FORMAT_XRGB8888,
 		      DRM_FORMAT_MOD_LINEAR,
 		      &fb);
 
-	for_each_connector_mode(output) {
-		mode = &output->config.connector->modes[j__];
-		igt_require(data->adjust_mode(data, mode));
-		igt_output_override_mode(output, mode);
-		ret = igt_display_try_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
-		igt_assert(ret == -EINVAL);
-	}
+	kmstest_unset_all_crtcs(data->drm_fd, data->res);
+
+	crtc_id = data->display.pipes[data->pipe].crtc_id;
+
+	ret = drmModeSetCrtc(data->drm_fd, crtc_id,
+			     fb.fb_id, 0, 0,
+			     &output->id, 1, &mode);
+	igt_assert_lt(ret, 0);
 
 	igt_remove_fb(data->drm_fd, &fb);
-	igt_output_override_mode(output, NULL);
-	/*unset_all_crtcs*/
-	igt_display_reset(&data->display);
-	igt_display_commit(&data->display);
 }
 
 static int i915_max_dotclock(data_t *data)
@@ -283,10 +290,11 @@ igt_main
 		kmstest_set_vt_graphics_mode();
 
 		igt_display_require(&data.display, data.drm_fd);
+		data.res = drmModeGetResources(data.drm_fd);
+		igt_assert(data.res);
 
 		data.max_dotclock = i915_max_dotclock(&data);
 		igt_info("Max dotclock: %d kHz\n", data.max_dotclock);
-		igt_display_require_output(&data.display);
 	}
 
 	igt_describe("Make sure all modesets are rejected when the requested mode is invalid");
@@ -306,6 +314,7 @@ igt_main
 	igt_fixture {
 		igt_display_fini(&data.display);
 		igt_reset_connectors();
+		drmModeFreeResources(data.res);
 		close(data.drm_fd);
 	}
 }
-- 
2.37.4
