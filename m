Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45EC510E7C5
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Nov 2022 09:12:36 +0000 (UTC)
From: Alaa Emad <aemad@igalia.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 11 Nov 2022 10:29:29 +0200
Message-Id: <642d6098c79fec4d1faaa1daf8209543b042d242.1668154709.git.aemad@igalia.com>
In-Reply-To: <cover.1668154709.git.aemad@igalia.com>
References: <cover.1668154709.git.aemad@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH RFC i-g-t 6/8] tests/kms_universal_plane: decouple
 verification of ablity to move the primary plane completely offscreen
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

decouple verification of ablity to move the primary plane completely offscreen
in a separated subtests to be able to run it individually, creating the function.

Signed-off-by: Alaa Emad <aemad@igalia.com>
---
 tests/kms_universal_plane.c | 90 +++++++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index 89ca5a2b..0f7202d1 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -451,7 +451,92 @@ test_legacy_modeset_to_yellow_fb(data_t *data, enum pipe pipe, igt_output_t *out
 	functional_test_fini(&test, output);
 }
 
+static void
+test_set_primary_completely_offscreen(data_t *data, enum pipe pipe, igt_output_t *output)
+{
+	functional_test_t test = { .data = data };
+	igt_display_t *display = &data->display;
+	igt_plane_t *primary, *sprite;
+	int num_primary = 0, num_cursor = 0;
+	int i;
+
+	igt_require_pipe(display, pipe);
+
+	igt_info("Testing connector %s using pipe %s\n", igt_output_name(output),
+		 kmstest_pipe_name(pipe));
+
+	functional_test_init(&test, output, pipe);
+
+	/*
+	 * Make sure we have no more than one primary or cursor plane per crtc.
+	 * If the kernel accidentally calls drm_plane_init() rather than
+	 * drm_universal_plane_init(), the type enum can get interpreted as a
+	 * boolean and show up in userspace as the wrong type.
+	 */
+	for (i = 0; i < display->pipes[pipe].n_planes; i++)
+		if (display->pipes[pipe].planes[i].type == DRM_PLANE_TYPE_PRIMARY)
+			num_primary++;
+		else if (display->pipes[pipe].planes[i].type == DRM_PLANE_TYPE_CURSOR)
+			num_cursor++;
+
+	igt_warn_on(num_primary != 1);
+	igt_warn_on(num_cursor > 1);
+
+	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+	sprite = igt_output_get_plane_type(output, DRM_PLANE_TYPE_OVERLAY);
+	if (!sprite) {
+		functional_test_fini(&test, output);
+		igt_skip("No sprite plane available\n");
+	}
+
+	igt_plane_set_position(sprite, 100, 100);
+
+	/* Step 3: Legacy API's, yellow primary (CRC 3) */
+	igt_plane_set_fb(primary, &test.yellow_fb);
+	igt_display_commit2(display, COMMIT_LEGACY);
+	igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_3);
 
+	/* Step 4: Universal API's, blue primary, red sprite (CRC 4) */
+	igt_plane_set_fb(primary, &test.blue_fb);
+	igt_plane_set_fb(sprite, &test.red_fb);
+	igt_display_commit2(display, COMMIT_UNIVERSAL);
+	igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_4);
+
+	/* Step 5: Universal API's, disable primary plane (CRC 5) */
+	igt_plane_set_fb(primary, NULL);
+	igt_display_commit2(display, COMMIT_UNIVERSAL);
+	igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_5);
+
+	/*
+	 * Step 14: Universal API, set primary completely offscreen (CRC 9).
+	 * Skip on amdgpu which rejects offscreen planes.
+	 */
+	if (!is_amdgpu_device(data->drm_fd)) {
+		igt_assert(drmModeSetPlane(data->drm_fd, primary->drm_plane->plane_id,
+					   output->config.crtc->crtc_id,
+					   test.blue_fb.fb_id, 0,
+					   9000, 9000,
+					   test.mode->hdisplay,
+					   test.mode->vdisplay,
+					   IGT_FIXED(0,0), IGT_FIXED(0,0),
+					   IGT_FIXED(test.mode->hdisplay,0),
+					   IGT_FIXED(test.mode->vdisplay,0)) == 0);
+		igt_pipe_crc_collect_crc(test.pipe_crc, &test.crc_9);
+	}
+
+	/*
+	 * We should be able to move the primary plane completely offscreen
+	 * and have it disable successfully. Skip on amdgpu since crc_9 was
+	 * skipped with offscreen planes previously.
+	 */
+	if (!is_amdgpu_device(data->drm_fd))
+		igt_assert_crc_equal(&test.crc_5, &test.crc_9);
+
+	igt_plane_set_fb(primary, NULL);
+	igt_plane_set_fb(sprite, NULL);
+
+	functional_test_fini(&test, output);
+}
 /*
  * Universal plane functional testing.
  *   - Black primary plane via traditional interfaces, red sprite, grab CRC:1.
@@ -1149,6 +1234,11 @@ run_tests_for_pipe(data_t *data, enum pipe pipe)
 		for_each_valid_output_on_pipe(&data->display, pipe, output)
 			test_legacy_modeset_to_yellow_fb(data, pipe, output);
 
+	igt_subtest_f("set-primary-completely-offscreen-%s",
+		      kmstest_pipe_name(pipe))
+		for_each_valid_output_on_pipe(&data->display, pipe, output)
+			test_set_primary_completely_offscreen(data, pipe, output);
+
 	igt_describe("Check the switching between different primary plane fbs with CRTC off");
 	igt_subtest_f("universal-plane-pipe-%s-functional",
 		      kmstest_pipe_name(pipe))
-- 
2.34.1
