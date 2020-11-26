Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1F316E581
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Nov 2020 05:27:13 +0000 (UTC)
From: Karthik B S <karthik.b.s@intel.com>
Date: Thu, 26 Nov 2020 10:33:19 +0530
Message-Id: <20201126050320.2434-2-karthik.b.s@intel.com>
In-Reply-To: <20201126050320.2434-1-karthik.b.s@intel.com>
References: <20201126050320.2434-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v4 1/2] tests/kms_content_protection: Add
 MST subtests
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

Add subtests to verify content protection simultaneously on
multiple outputs on the same MST topology.

v3: -Remove the logging which are no longer required. (Anshuman)
    -Add logic to verify that CP is still enabled on other connectors
     while disabling it on one of the connectors. (Anshuman)

v4: -Rename is_output_support_cp_capable(). (Anshuman, Ram)
    -Rephrase the comment in is_dp_mst_output. (Anshuman)
    -Remove the redundant HDCP check hunk before HDCP disable. (Anshuman)
    -Check the link on the HDCP enabled outputs when one of the outputs
     in the same DP MST topology is disabled. (Anshuman)
    -Revert the change in test_content_protection_cleanup(). (Anshuman)
    -Create fb's in a common function for both MST and SST. (Ram)
    -Rename is_dp_mst_output() to output_is_dp_mst(). (Ram)
    -Remove the redundant igt_debug() before HDCP enable. (Ram)
    -Rephrase the igt_assert statement during HDCP enable. (Ram)
    -Optimize the execution time by checking the link for all MST
     connectors together. (Ram)
    -No need of loop where we disable CP on one of the MST outputs. (Ram)
    -During verification by disabling one of the MST outputs,
     check for the negative case until the required timeout. (Ram)

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/kms_content_protection.c | 280 ++++++++++++++++++++++++++++++---
 1 file changed, 258 insertions(+), 22 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 303ed418..704cf3e9 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -42,6 +42,12 @@ struct data {
 	struct udev_monitor *uevent_monitor;
 } data;
 
+typedef struct {
+	float red;
+	float green;
+	float blue;
+} color_t;
+
 /* Test flags */
 #define CP_DPMS					(1 << 0)
 #define CP_LIC					(1 << 1)
@@ -179,16 +185,10 @@ static void modeset_with_fb(const enum pipe pipe, igt_output_t *output,
 	igt_output_override_mode(output, &mode);
 	igt_output_set_pipe(output, pipe);
 
-	igt_create_color_fb(display->drm_fd, mode.hdisplay, mode.vdisplay,
-			    DRM_FORMAT_XRGB8888, LOCAL_DRM_FORMAT_MOD_NONE,
-			    1.f, 0.f, 0.f, &data.red);
-	igt_create_color_fb(display->drm_fd, mode.hdisplay, mode.vdisplay,
-			    DRM_FORMAT_XRGB8888, LOCAL_DRM_FORMAT_MOD_NONE,
-			    0.f, 1.f, 0.f, &data.green);
-
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_display_commit2(display, s);
 	igt_plane_set_fb(primary, &data.red);
+	igt_fb_set_size(&data.red, primary, mode.hdisplay, mode.vdisplay);
 
 	/* Wait for Flip completion before starting the HDCP authentication */
 	commit_display_and_wait_for_flip(s);
@@ -458,37 +458,83 @@ static bool sink_hdcp2_capable(igt_output_t *output)
 	return strstr(buf, "HDCP2.2");
 }
 
-static void
-test_content_protection(enum igt_commit_style s, int content_type)
+static void prepare_modeset_on_mst_output(igt_output_t *output, enum pipe pipe)
 {
-	igt_display_t *display = &data.display;
-	igt_output_t *output;
-	int valid_tests = 0;
+	drmModeConnectorPtr c = output->config.connector;
+	drmModeModeInfo *mode;
+	igt_plane_t *primary;
+	int i, width, height;
 
-	if (data.cp_tests & CP_MEI_RELOAD)
-		igt_require_f(igt_kmod_is_loaded("mei_hdcp"),
-			      "mei_hdcp module is not loaded\n");
+	mode = igt_output_get_mode(output);
 
-	for_each_connected_output(display, output) {
+	/*
+	 * TODO: Add logic to use the highest possible modes on each output.
+	 * Currently using 2k modes by default on all the outputs.
+	 */
+	igt_debug("Before mode override: Output %s Mode hdisplay %d Mode vdisplay %d\n",
+		   output->name, mode->hdisplay, mode->vdisplay);
+
+	if (mode->hdisplay > 1920 && mode->vdisplay > 1080) {
+		for (i = 0; i < c->count_modes; i++) {
+			if (c->modes[i].hdisplay <= 1920 && c->modes[i].vdisplay <= 1080) {
+				mode = &c->modes[i];
+				igt_output_override_mode(output, mode);
+				break;
+			}
+		}
+	}
+
+	igt_debug("After mode overide: Output %s Mode hdisplay %d Mode vdisplay %d\n",
+		   output->name, mode->hdisplay, mode->vdisplay);
+
+	width = mode->hdisplay;
+	height = mode->vdisplay;
+
+	igt_output_set_pipe(output, pipe);
+	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+	igt_plane_set_fb(primary, NULL);
+	igt_plane_set_fb(primary, pipe % 2 ? &data.red : &data.green);
+	igt_fb_set_size(pipe % 2 ? &data.red : &data.green, primary, width, height);
+	igt_plane_set_size(primary, width, height);
+}
+
+static bool output_hdcp_capable(igt_output_t *output, int content_type)
+{
 		if (!output->props[IGT_CONNECTOR_CONTENT_PROTECTION])
-			continue;
+			return false;
 
 		if (!output->props[IGT_CONNECTOR_HDCP_CONTENT_TYPE] &&
 		    content_type)
-			continue;
-
-		igt_info("CP Test execution on %s\n", output->name);
+			return false;
 
 		if (content_type && !sink_hdcp2_capable(output)) {
 			igt_info("\tSkip %s (Sink has no HDCP2.2 support)\n",
 				 output->name);
-			continue;
+			return false;
 		} else if (!sink_hdcp_capable(output)) {
 			igt_info("\tSkip %s (Sink has no HDCP support)\n",
 				 output->name);
-			continue;
+			return false;
 		}
 
+		return true;
+}
+
+static void
+test_content_protection(enum igt_commit_style s, int content_type)
+{
+	igt_display_t *display = &data.display;
+	igt_output_t *output;
+	int valid_tests = 0;
+
+	if (data.cp_tests & CP_MEI_RELOAD)
+		igt_require_f(igt_kmod_is_loaded("mei_hdcp"),
+			      "mei_hdcp module is not loaded\n");
+
+	for_each_connected_output(display, output) {
+		if (!output_hdcp_capable(output, content_type))
+			continue;
+
 		test_content_protection_on_output(output, s, content_type);
 		valid_tests++;
 	}
@@ -496,6 +542,147 @@ test_content_protection(enum igt_commit_style s, int content_type)
 	igt_require_f(valid_tests, "No connector found with HDCP capability\n");
 }
 
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
+static bool output_is_dp_mst(igt_output_t *output, int i)
+{
+	drmModePropertyBlobPtr path_blob = NULL;
+	uint64_t path_blob_id;
+	drmModeConnector *connector = output->config.connector;
+	struct kmstest_connector_config config;
+	const char *encoder;
+	int connector_id;
+	static int prev_connector_id;
+
+	kmstest_get_connector_config(data.drm_fd, output->config.connector->connector_id, -1, &config);
+	encoder = kmstest_encoder_type_str(config.encoder->encoder_type);
+
+	if (strcmp(encoder, "DP MST"))
+		return false;
+
+	igt_assert(kmstest_get_property(data.drm_fd, connector->connector_id,
+		   DRM_MODE_OBJECT_CONNECTOR, "PATH", NULL,
+		   &path_blob_id, NULL));
+
+	igt_assert(path_blob = drmModeGetPropertyBlob(data.drm_fd, path_blob_id));
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
+static void test_cp_lic_on_mst(igt_output_t *mst_outputs[], int valid_outputs)
+{
+	int ret, count;
+	uint64_t val;
+
+	/* Only wait for the first output, this optimizes the test execution time */
+	ret = wait_for_prop_value(mst_outputs[0], CP_DESIRED, LIC_PERIOD_MSEC);
+	igt_assert_f(!ret, "Content Protection LIC Failed on %s\n", mst_outputs[0]->name);
+
+	for (count = 1; count < valid_outputs; count++) {
+		val = igt_output_get_prop(mst_outputs[count], IGT_CONNECTOR_CONTENT_PROTECTION);
+		igt_assert_f(val != CP_DESIRED, "Content Protection LIC Failed on %s\n", mst_outputs[count]->name);
+	}
+}
+
+static void
+test_content_protection_mst(int content_type)
+{
+	igt_display_t *display = &data.display;
+	igt_output_t *output;
+	int valid_outputs = 0, ret, count, max_pipe = 0, i;
+	enum pipe pipe;
+	igt_output_t *mst_output[IGT_MAX_PIPES];
+
+	for_each_connected_output(display, output) {
+		if (!output_is_dp_mst(output, valid_outputs))
+			continue;
+
+		if (!output_hdcp_capable(output, content_type))
+			continue;
+
+		mst_output[valid_outputs] = output;
+		valid_outputs++;
+	}
+
+	igt_require_f(valid_outputs > 1, "No DP MST set up with >= 2 outputs found in a single topology\n");
+
+	for_each_pipe(display, pipe)
+		max_pipe++;
+
+	if (valid_outputs > max_pipe)
+		valid_outputs = max_pipe;
+
+	pipe = PIPE_A;
+
+	for (count = 0; count < valid_outputs; count++) {
+		igt_assert_f(igt_pipe_connector_valid(pipe, mst_output[count]), "Output-pipe combination invalid\n");
+
+		prepare_modeset_on_mst_output(mst_output[count], pipe);
+		pipe++;
+	}
+
+	igt_display_commit2(display, COMMIT_ATOMIC);
+
+	for (count = 0; count < valid_outputs; count++) {
+		igt_output_set_prop_value(mst_output[count], IGT_CONNECTOR_CONTENT_PROTECTION, CP_DESIRED);
+
+		if (output->props[IGT_CONNECTOR_HDCP_CONTENT_TYPE])
+			igt_output_set_prop_value(mst_output[count], IGT_CONNECTOR_HDCP_CONTENT_TYPE, content_type);
+	}
+
+	igt_display_commit2(display, COMMIT_ATOMIC);
+
+	for (count = 0; count < valid_outputs; count++) {
+		ret = wait_for_prop_value(mst_output[count], CP_ENABLED, KERNEL_AUTH_TIME_ALLOWED_MSEC);
+		igt_assert_f(ret, "Content Protection not enabled on %s\n", mst_output[count]->name);
+	}
+
+	if (data.cp_tests & CP_LIC)
+		test_cp_lic_on_mst(mst_output, valid_outputs);
+
+	/*
+	 * Verify if CP is still enabled on other outputs by disabling CP on the first output.
+	 */
+	igt_debug("CP Prop being UNDESIRED on %s\n", mst_output[0]->name);
+	test_cp_disable(mst_output[0], COMMIT_ATOMIC);
+
+	/* CP is expected to be still enabled on other outputs*/
+	for (i = 1; i < valid_outputs; i++) {
+		/* Wait for the timeout to verify CP is not disabled */
+		ret = wait_for_prop_value(mst_output[i], CP_UNDESIRED, KERNEL_DISABLE_TIME_ALLOWED_MSEC);
+		igt_assert_f(!ret, "Content Protection not enabled on %s\n", mst_output[i]->name);
+
+		if (data.cp_tests & CP_LIC)
+			test_cp_lic(mst_output[i]);
+	}
+}
+
 static void test_content_protection_cleanup(void)
 {
 	igt_display_t *display = &data.display;
@@ -514,6 +701,31 @@ static void test_content_protection_cleanup(void)
 		igt_info("CP Prop being UNDESIRED on %s\n", output->name);
 		test_cp_disable(output, COMMIT_ATOMIC);
 	}
+
+	igt_remove_fb(data.drm_fd, &data.red);
+	igt_remove_fb(data.drm_fd, &data.green);
+}
+
+static void create_fbs(void)
+{
+	igt_output_t *output;
+	int width, height;
+	drmModeModeInfo *mode;
+
+	for_each_connected_output(&data.display, output) {
+		mode = igt_output_get_mode(output);
+		igt_assert(mode);
+
+		width = max(width, mode->hdisplay);
+		height = max(height, mode->vdisplay);
+	}
+
+	igt_create_color_fb(data.drm_fd, width, height,
+			    DRM_FORMAT_XRGB8888, LOCAL_DRM_FORMAT_MOD_NONE,
+			    1.f, 0.f, 0.f, &data.red);
+	igt_create_color_fb(data.drm_fd, width, height,
+			    DRM_FORMAT_XRGB8888, LOCAL_DRM_FORMAT_MOD_NONE,
+			    0.f, 1.f, 0.f, &data.green);
 }
 
 igt_main
@@ -522,6 +734,8 @@ igt_main
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 
 		igt_display_require(&data.display, data.drm_fd);
+
+		create_fbs();
 	}
 
 	igt_subtest("legacy") {
@@ -592,6 +806,28 @@ igt_main
 		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_0);
 	}
 
+	igt_describe("Test Content protection over DP MST");
+	igt_subtest("dp-mst-type-0") {
+		test_content_protection_mst(HDCP_CONTENT_TYPE_0);
+	}
+
+	igt_describe("Test Content protection over DP MST with LIC");
+	igt_subtest("dp-mst-lic-type-0") {
+		data.cp_tests = CP_LIC;
+		test_content_protection_mst(HDCP_CONTENT_TYPE_0);
+	}
+
+	igt_describe("Test Content protection over DP MST");
+	igt_subtest("dp-mst-type-1") {
+		test_content_protection_mst(HDCP_CONTENT_TYPE_1);
+	}
+
+	igt_describe("Test Content protection over DP MST with LIC");
+	igt_subtest("dp-mst-lic-type-1") {
+		data.cp_tests = CP_LIC;
+		test_content_protection_mst(HDCP_CONTENT_TYPE_1);
+	}
+
 	igt_fixture {
 		test_content_protection_cleanup();
 		igt_display_fini(&data.display);
-- 
2.22.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
