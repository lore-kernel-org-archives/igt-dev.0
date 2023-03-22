Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EFD010E0C8
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Mar 2023 17:33:49 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 22 Mar 2023 23:00:04 +0530
Message-Id: <20230322173004.19545-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_display_modes: Add negative test
 for extended display
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

Added negative test to validte ENOSPC and EINVAL when two 4k moniters
connected through MST.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/kms_display_modes.c | 159 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 159 insertions(+)

diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
index e4191811e..c5a2aa47e 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -26,6 +26,11 @@
 
 #include "igt.h"
 
+#define HDISPLAY_2K     2560
+#define VDISPLAY_2K     1440
+#define HDISPLAY_4K     3840
+#define VDISPLAY_4K     2160
+
 IGT_TEST_DESCRIPTION("Test Display Modes");
 
 typedef struct {
@@ -34,6 +39,90 @@ typedef struct {
 	int n_pipes;
 } data_t;
 
+static drmModeModeInfo *get_highres_mode(igt_output_t *output)
+{
+	drmModeConnector *connector = output->config.connector;
+	drmModeModeInfo *highest_mode = NULL;
+
+	igt_sort_connector_modes(connector, sort_drm_modes_by_clk_dsc);
+
+	highest_mode = &connector->modes[0];
+
+	return highest_mode;
+}
+
+static drmModeModeInfo *get_2k_mode(igt_output_t *output)
+{
+	drmModeModeInfo *required_mode = NULL;
+	drmModeConnector *connector = output->config.connector;
+	int j;
+
+	for (j = 0; j < connector->count_modes; j++) {
+
+		if (connector->modes[j].vdisplay == VDISPLAY_2K &&
+		    connector->modes[j].hdisplay == HDISPLAY_2K) {
+			required_mode = &connector->modes[j];
+			break;
+		}
+	}
+
+	return required_mode;
+}
+
+static int parse_path_blob(char *blob_data)
+{
+	int connector_id;
+	char *encoder;
+
+	encoder = strtok(blob_data, ":");
+	igt_assert_f(!strcmp(encoder, "mst"), "PATH connector property expected to have 'mst'\n");
+
+	connector_id = atoi(strtok(NULL, "-"));
+
+	return connector_id;
+}
+
+static bool output_is_dp_mst(data_t *data, igt_output_t *output, int i)
+{
+	drmModePropertyBlobPtr path_blob = NULL;
+	uint64_t path_blob_id;
+	drmModeConnector *connector = output->config.connector;
+	struct kmstest_connector_config config;
+	const char *encoder;
+	int connector_id;
+	static int prev_connector_id;
+
+	kmstest_get_connector_config(data->drm_fd, output->config.connector->connector_id,
+				     -1, &config);
+	encoder = kmstest_encoder_type_str(config.encoder->encoder_type);
+
+	if (strcmp(encoder, "DP MST"))
+		return false;
+
+	igt_assert(kmstest_get_property(data->drm_fd, connector->connector_id,
+		   DRM_MODE_OBJECT_CONNECTOR, "PATH", NULL,
+		   &path_blob_id, NULL));
+
+	igt_assert(path_blob = drmModeGetPropertyBlob(data->drm_fd, path_blob_id));
+
+	connector_id = parse_path_blob((char *) path_blob->data);
+
+	/*
+	 * Discarding outputs of other DP MST topology.
+	 * Testing only on outputs on the topology we got previously
+	 */
+	if (i == 0) {
+		prev_connector_id = connector_id;
+	} else {
+		if (connector_id != prev_connector_id)
+			return false;
+	}
+
+	drmModeFreePropertyBlob(path_blob);
+
+	return true;
+}
+
 static void run_extendedmode_basic(data_t *data, int pipe1, int pipe2)
 {
 	struct igt_fb fb, fbs[2];
@@ -129,6 +218,66 @@ static void run_extendedmode_basic(data_t *data, int pipe1, int pipe2)
 	igt_assert_crc_equal(&crc[1], &ref_crc[1]);
 }
 
+static void run_extendedmode_negative(data_t *data, int pipe1, int pipe2)
+{
+	struct igt_fb fbs[2];
+	drmModeModeInfo *mode_mst[2];
+	igt_output_t *output, *mst_output[2];
+	igt_display_t *display = &data->display;
+	igt_plane_t *plane[2];
+	int count = 0, dp_mst_outputs = 0, ret;
+
+	igt_display_reset(display);
+
+	for_each_connected_output(display, output) {
+		mst_output[count++] = output;
+		if (output_is_dp_mst(data, output, dp_mst_outputs))
+			dp_mst_outputs++;
+
+		if (dp_mst_outputs > 1)
+			break;
+	}
+
+	igt_assert_f(dp_mst_outputs > 1, "MST not found more then one\n");
+
+	igt_output_set_pipe(mst_output[0], pipe1);
+	igt_output_set_pipe(mst_output[1], pipe2);
+
+	mode_mst[0] = get_2k_mode(mst_output[0]);
+	mode_mst[1] = get_highres_mode(mst_output[1]);
+
+	igt_create_color_fb(data->drm_fd, mode_mst[0]->hdisplay, mode_mst[0]->vdisplay,
+			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, 1, 0, 0, &fbs[0]);
+	igt_create_color_fb(data->drm_fd, mode_mst[1]->hdisplay, mode_mst[1]->vdisplay,
+			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, 0, 0, 1, &fbs[1]);
+
+	plane[0] = igt_pipe_get_plane_type(&display->pipes[pipe1], DRM_PLANE_TYPE_PRIMARY);
+	plane[1] = igt_pipe_get_plane_type(&display->pipes[pipe2], DRM_PLANE_TYPE_PRIMARY);
+
+	igt_plane_set_fb(plane[0], &fbs[0]);
+	igt_fb_set_size(&fbs[0], plane[0], mode_mst[0]->hdisplay, mode_mst[0]->vdisplay);
+	igt_plane_set_size(plane[0], mode_mst[0]->hdisplay, mode_mst[0]->vdisplay);
+
+	igt_plane_set_fb(plane[1], &fbs[1]);
+	igt_fb_set_size(&fbs[1], plane[1], mode_mst[1]->hdisplay, mode_mst[1]->vdisplay);
+	igt_plane_set_size(plane[1], mode_mst[1]->hdisplay, mode_mst[1]->vdisplay);
+
+	if (mode_mst[0]->hdisplay >= HDISPLAY_2K && mode_mst[0]->vdisplay >= VDISPLAY_2K) {
+		mode_mst[0]->hdisplay = HDISPLAY_4K;
+		mode_mst[0]->vdisplay = VDISPLAY_4K;
+		igt_output_override_mode(mst_output[0], mode_mst[0]);
+	}
+
+	if (mode_mst[1]->hdisplay >= HDISPLAY_4K && mode_mst[1]->vdisplay >= VDISPLAY_4K) {
+		mode_mst[0]->hdisplay = HDISPLAY_4K;
+		mode_mst[0]->vdisplay = VDISPLAY_4K;
+		igt_output_override_mode(mst_output[1], mode_mst[1]);
+	}
+	ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
+	igt_assert(ret != 0 && dp_mst_outputs > 1 && (ENOSPC || EINVAL));
+
+}
+
 igt_main
 {
 	data_t data;
@@ -167,6 +316,16 @@ igt_main
 		}
 	}
 
+	igt_describe("Negative test for validating display extended mode with a pair of connected "
+		     "4k displays");
+	igt_subtest_with_dynamic("extended-mode-negative") {
+		for (i = 0; i < data.n_pipes - 1; i++) {
+			igt_dynamic_f("pipe-%s%s", kmstest_pipe_name(pipe[i]),
+					kmstest_pipe_name(pipe[i+1]));
+			run_extendedmode_negative(&data, pipe[i], pipe[i+1]);
+		}
+	}
+
 	igt_fixture {
 		igt_display_fini(&data.display);
 	}
-- 
2.25.1
