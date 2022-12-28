Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42B8910E1A4
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Dec 2022 02:40:00 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 28 Dec 2022 08:08:23 +0530
Message-Id: <20221228023823.30570-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_multipipe_modeset: Add negative
 test for multiple display config
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

When 3-4 displays are connceted any platform
will only support maximum 5k resolution simulataneously.

If 3 or more displays are connected forcing 8k
resolution on all the displays and check if this
scenario is handled properly or not.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_multipipe_modeset.c | 74 ++++++++++++++++++++++++++---------
 1 file changed, 56 insertions(+), 18 deletions(-)

diff --git a/tests/kms_multipipe_modeset.c b/tests/kms_multipipe_modeset.c
index 1fdfb9a9..46c17235 100644
--- a/tests/kms_multipipe_modeset.c
+++ b/tests/kms_multipipe_modeset.c
@@ -31,10 +31,10 @@ IGT_TEST_DESCRIPTION("Test simultaneous modeset on all the supported pipes");
 typedef struct {
 	int drm_fd;
 	igt_display_t display;
-	struct igt_fb fb;
+	struct igt_fb fb0, fb1;
 } data_t;
 
-static void run_test(data_t *data, int valid_outputs)
+static void run_test(data_t *data, int valid_outputs, bool resolution)
 {
 	igt_output_t *output;
 	igt_pipe_crc_t *pipe_crcs[IGT_MAX_PIPES] = { 0 };
@@ -44,7 +44,8 @@ static void run_test(data_t *data, int valid_outputs)
 	igt_pipe_t *pipe;
 	igt_plane_t *plane;
 	drmModeModeInfo *mode;
-	int i = 0;
+	drmModeModeInfo *mode1;
+	int i = 0, ret = 0;
 
 	for_each_connected_output(display, output) {
 		mode = igt_output_get_mode(output);
@@ -57,10 +58,15 @@ static void run_test(data_t *data, int valid_outputs)
 	}
 
 	igt_create_pattern_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
-			      DRM_FORMAT_MOD_LINEAR, &data->fb);
+				DRM_FORMAT_MOD_LINEAR, &data->fb0);
+	igt_create_pattern_fb(data->drm_fd, 7680, 4320, DRM_FORMAT_XRGB8888,
+				DRM_FORMAT_MOD_LINEAR, &data->fb1);
 
 	/* Collect reference CRC by Committing individually on all outputs*/
 	for_each_connected_output(display, output) {
+		if (resolution == true)
+			break;
+
 		pipe = &display->pipes[i];
 		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
 
@@ -73,8 +79,8 @@ static void run_test(data_t *data, int valid_outputs)
 		mode = igt_output_get_mode(output);
 		igt_assert(mode);
 
-		igt_plane_set_fb(plane, &data->fb);
-		igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
+		igt_plane_set_fb(plane, &data->fb0);
+		igt_fb_set_size(&data->fb0, plane, mode->hdisplay, mode->vdisplay);
 		igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
 
 		igt_display_commit2(display, COMMIT_ATOMIC);
@@ -86,6 +92,8 @@ static void run_test(data_t *data, int valid_outputs)
 	i = 0;
 	/* Simultaneously commit on all outputs */
 	for_each_connected_output(display, output) {
+		if (resolution == true)
+			break;
 		pipe = &display->pipes[i];
 		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
 
@@ -95,25 +103,50 @@ static void run_test(data_t *data, int valid_outputs)
 		mode = igt_output_get_mode(output);
 		igt_assert(mode);
 
-		igt_plane_set_fb(plane, &data->fb);
-		igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
+		igt_plane_set_fb(plane, &data->fb0);
+		igt_fb_set_size(&data->fb0, plane, mode->hdisplay, mode->vdisplay);
 		igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
 		i++;
 	}
 
-	igt_display_commit2(display, COMMIT_ATOMIC);
-
-	/* CRC Verification */
-	for (i = 0; i < valid_outputs; i++) {
-		igt_pipe_crc_collect_crc(pipe_crcs[i], &new_crcs[i]);
-		igt_assert_crc_equal(&ref_crcs[i], &new_crcs[i]);
+	i = 0;
+	/* Simultaneously commit on all outputs with 8k display which should result in fail*/
+	for_each_connected_output(display, output) {
+		if (resolution == false)
+			break;
+		pipe = &display->pipes[i];
+		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+		igt_output_set_pipe(output, i);
+		mode = igt_output_get_mode(output);
+		igt_skip_on_f(mode->hdisplay < 7680, "No suitable resolution was found\n");
+
+		mode1->hdisplay = 7680;
+		mode1->vdisplay = 4320;
+		igt_output_override_mode(output, mode1);
+		igt_plane_set_fb(plane, &data->fb1);
+		igt_fb_set_size(&data->fb1, plane, mode1->hdisplay, mode1->vdisplay);
+		igt_plane_set_size(plane, mode1->hdisplay, mode1->vdisplay);
+		i++;
 	}
 
+	if (resolution == true) {
+		igt_skip_on_f(i >= 3, "Displays connected should be more than 2\n");
+		ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
+		igt_assert(ret == -EINVAL);
+	} else {
+		igt_display_commit2(display, COMMIT_ATOMIC);
+
+		/* CRC Verification */
+		for (i = 0; i < valid_outputs; i++) {
+			igt_pipe_crc_collect_crc(pipe_crcs[i], &new_crcs[i]);
+			igt_assert_crc_equal(&ref_crcs[i], &new_crcs[i]);
+		}
+	}
 	igt_plane_set_fb(plane, NULL);
-	igt_remove_fb(data->drm_fd, &data->fb);
+	igt_remove_fb(data->drm_fd, &data->fb0);
 }
 
-static void test_multipipe(data_t *data, int num_pipes)
+static void test_multipipe(data_t *data, int num_pipes, bool resolution)
 {
 	igt_output_t *output;
 	int valid_outputs = 0;
@@ -125,7 +158,7 @@ static void test_multipipe(data_t *data, int num_pipes)
 		      "Number of connected outputs(%d) not equal to the "
 		      "number of pipes supported(%d)\n", valid_outputs, num_pipes);
 
-	run_test(data, valid_outputs);
+	run_test(data, valid_outputs, resolution);
 }
 
 igt_main
@@ -147,7 +180,12 @@ igt_main
 	igt_describe("Verify if simultaneous modesets on all the supported "
 		     "pipes is successful. Validate using CRC verification");
 	igt_subtest("basic-max-pipe-crc-check")
-		test_multipipe(&data, res->count_crtcs);
+		test_multipipe(&data, res->count_crtcs, false);
+
+	igt_describe("Verify if simulataneous modesets on all the connected"
+		     "displays with invalid resolution should fail");
+	igt_subtest("basic-8k-resolution-check")
+		test_multipipe(&data, res->count_crtcs, true);
 
 	igt_fixture {
 		drmModeFreeResources(res);
-- 
2.25.1
