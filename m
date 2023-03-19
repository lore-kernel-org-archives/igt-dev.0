Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB5B10E055
 for <igt-dev@lists.freedesktop.org>; Sun, 19 Mar 2023 18:17:43 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sun, 19 Mar 2023 23:43:57 +0530
Message-Id: <20230319181357.22496-1-mohammed.thasleem@intel.com>
In-Reply-To: <20220808093622.193800-1-mohammed.thasleem@intel.com>
References: <20220808093622.193800-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_display_modes: Fixed mode
 selection for extended mode tests
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

Added check on DP-MST and 4k panels when two moniters connected
through MST.
This will find the connector mode combo that fits into the
bandwidth when more than one monitor is connected.

Example:
  When two monitors connected through MST, the second monitor
  also tries to use the same mode. So two such modes may not
  fit into the link bandwidth. So, iterate through connected
  outputs & modes and find a combination of modes those fit
  into the link BW.

v2: -Updated commit msg and description. (Bhanu)
    -Renamed restart with retry. (Bhanu)
    -Moved igt_pipe_crc_new before retry. (Bhanu)
    -Removed unrelated changes and new line. (Bhanu)
    -Minor changes.
v3: Updated discription and added EINVAL check.
v4: Removed EINVAL and ENOSPC checks.
    Added check for DP-MST and 4k panels.
    Updated discription.
v5: Defined 4k display modes globally.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/kms_display_modes.c | 92 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 87 insertions(+), 5 deletions(-)

diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c
index e4191811e..fea8769a4 100644
--- a/tests/kms_display_modes.c
+++ b/tests/kms_display_modes.c
@@ -26,6 +26,9 @@
 
 #include "igt.h"
 
+#define HDISPLAY_4K     3840
+#define VDISPLAY_4K     2160
+
 IGT_TEST_DESCRIPTION("Test Display Modes");
 
 typedef struct {
@@ -34,16 +37,71 @@ typedef struct {
 	int n_pipes;
 } data_t;
 
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
 	drmModeModeInfo *mode[2];
+	drmModeModeInfo *mode_mst;
 	igt_output_t *output, *extended_output[2];
 	igt_display_t *display = &data->display;
 	igt_plane_t *plane[2];
 	igt_pipe_crc_t *pipe_crc[2] = { 0 };
 	igt_crc_t ref_crc[2], crc[2];
-	int count = 0, width, height;
+	int count = 0, width, height, ret, dp_mst_outputs = 0;
 	cairo_t *cr;
 
 	for_each_connected_output(display, output) {
@@ -54,15 +112,16 @@ static void run_extendedmode_basic(data_t *data, int pipe1, int pipe2)
 			break;
 	}
 
+	pipe_crc[0] = igt_pipe_crc_new(data->drm_fd, pipe1, IGT_PIPE_CRC_SOURCE_AUTO);
+	pipe_crc[1] = igt_pipe_crc_new(data->drm_fd, pipe2, IGT_PIPE_CRC_SOURCE_AUTO);
+
+retry:
 	igt_output_set_pipe(extended_output[0], pipe1);
 	igt_output_set_pipe(extended_output[1], pipe2);
 
 	mode[0] = igt_output_get_mode(extended_output[0]);
 	mode[1] = igt_output_get_mode(extended_output[1]);
 
-	pipe_crc[0] = igt_pipe_crc_new(data->drm_fd, pipe1, IGT_PIPE_CRC_SOURCE_AUTO);
-	pipe_crc[1] = igt_pipe_crc_new(data->drm_fd, pipe2, IGT_PIPE_CRC_SOURCE_AUTO);
-
 	igt_create_color_fb(data->drm_fd, mode[0]->hdisplay, mode[0]->vdisplay,
 			     DRM_FORMAT_XRGB8888, 0, 1, 0, 0, &fbs[0]);
 	igt_create_color_fb(data->drm_fd, mode[1]->hdisplay, mode[1]->vdisplay,
@@ -79,7 +138,30 @@ static void run_extendedmode_basic(data_t *data, int pipe1, int pipe2)
 	igt_fb_set_size(&fbs[1], plane[1], mode[1]->hdisplay, mode[1]->vdisplay);
 	igt_plane_set_size(plane[1], mode[1]->hdisplay, mode[1]->vdisplay);
 
-	igt_display_commit2(display, COMMIT_ATOMIC);
+	for_each_connected_output(display, output) {
+		mode_mst = igt_output_get_mode(output);
+		if (output_is_dp_mst(data, output, dp_mst_outputs) &&
+		   (mode_mst->hdisplay >= HDISPLAY_4K && mode_mst->vdisplay >= VDISPLAY_4K))
+			dp_mst_outputs++;
+	}
+
+	ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
+	/* In case of DP-MST find suitable mode(s) to fit into the link BW. */
+	if (ret != 0 && dp_mst_outputs > 1) {
+		bool found = igt_override_all_active_output_modes_to_fit_bw(display);
+
+		igt_require_f(found, "No valid mode combo found for MST modeset.\n");
+
+		for_each_connected_output(display, output)
+			igt_output_set_pipe(output, PIPE_NONE);
+
+		igt_remove_fb(data->drm_fd, &fbs[0]);
+		igt_remove_fb(data->drm_fd, &fbs[1]);
+
+		goto retry;
+	}
+
+	igt_assert(!ret);
 
 	igt_pipe_crc_collect_crc(pipe_crc[0], &ref_crc[0]);
 	igt_pipe_crc_collect_crc(pipe_crc[1], &ref_crc[1]);
-- 
2.25.1
