Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B60C72AD7
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jan 2020 14:36:37 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
Date: Fri, 24 Jan 2020 19:54:34 +0530
Message-Id: <20200124142435.14506-7-swati2.sharma@intel.com>
In-Reply-To: <20200124142435.14506-1-swati2.sharma@intel.com>
References: <20200124142435.14506-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 6/7] tests/kms_hdr: Add static toggle
 SDR->HDR mode subtests
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
Cc: petri.latvala@intel.com, maarten.lankhorst@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

Add subtests to toggle between SDR to HDR mode with suspend
and dpms scenarios. Tests are made compatible for both amd
and intel drivers.

v2: Added additional check to validate whether panel is
    HDR or not. If it's a non-HDR panel, test will skip [Uma]

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
Acked-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
---
 tests/kms_hdr.c | 163 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 163 insertions(+)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index 7e48f5a2..414aafdf 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -34,6 +34,10 @@ IGT_TEST_DESCRIPTION("Test HDR metadata interfaces and bpc switch");
 #define USE_EXTENDED_TAG		0x07
 
 /* DRM HDR definitions. Not in the UAPI header, unfortunately. */
+enum hdmi_metadata_type {
+	HDMI_STATIC_METADATA_TYPE1 = 1,
+};
+
 enum hdmi_eotf {
 	HDMI_EOTF_TRADITIONAL_GAMMA_SDR,
 	HDMI_EOTF_TRADITIONAL_GAMMA_HDR,
@@ -355,6 +359,158 @@ static bool is_panel_hdr(data_t *data, igt_output_t *output)
 	return ret;
 }
 
+/* Sets the HDR output metadata prop. */
+static void set_hdr_output_metadata(data_t *data,
+				    struct hdr_output_metadata const *meta)
+{
+	igt_output_replace_prop_blob(data->output,
+				     IGT_CONNECTOR_HDR_OUTPUT_METADATA, meta,
+				     meta ? sizeof(*meta) : 0);
+}
+
+/* Converts a double to 861-G spec FP format. */
+static uint16_t calc_hdr_float(double val)
+{
+	return (uint16_t)(val * 50000.0);
+}
+
+/* Fills some test values for ST2048 HDR output metadata.
+ *
+ * Note: there isn't really a standard for what the metadata is supposed
+ * to do on the display side of things. The display is free to ignore it
+ * and clip the output, use it to help tonemap to the content range,
+ * or do anything they want, really.
+ */
+static void fill_hdr_output_metadata_st2048(struct hdr_output_metadata *meta)
+{
+	memset(meta, 0, sizeof(*meta));
+
+	meta->metadata_type = HDMI_STATIC_METADATA_TYPE1;
+	meta->hdmi_metadata_type1.eotf = HDMI_EOTF_SMPTE_ST2084;
+
+	/* Rec. 2020 */
+	meta->hdmi_metadata_type1.display_primaries[0].x =
+		calc_hdr_float(0.708); /* Red */
+	meta->hdmi_metadata_type1.display_primaries[0].y =
+		calc_hdr_float(0.292);
+	meta->hdmi_metadata_type1.display_primaries[1].x =
+		calc_hdr_float(0.170); /* Green */
+	meta->hdmi_metadata_type1.display_primaries[1].y =
+		calc_hdr_float(0.797);
+	meta->hdmi_metadata_type1.display_primaries[2].x =
+		calc_hdr_float(0.131); /* Blue */
+	meta->hdmi_metadata_type1.display_primaries[2].y =
+		calc_hdr_float(0.046);
+	meta->hdmi_metadata_type1.white_point.x = calc_hdr_float(0.3127);
+	meta->hdmi_metadata_type1.white_point.y = calc_hdr_float(0.3290);
+
+	meta->hdmi_metadata_type1.max_display_mastering_luminance =
+		1000; /* 1000 nits */
+	meta->hdmi_metadata_type1.min_display_mastering_luminance =
+		500;				   /* 0.05 nits */
+	meta->hdmi_metadata_type1.max_fall = 1000; /* 1000 nits */
+	meta->hdmi_metadata_type1.max_cll = 500;   /* 500 nits */
+}
+
+static void test_static_toggle(data_t *data, igt_output_t *output,
+			       uint32_t flags)
+{
+	igt_display_t *display = &data->display;
+	struct hdr_output_metadata hdr;
+	igt_crc_t ref_crc, new_crc;
+	enum pipe pipe;
+	igt_fb_t afb;
+	int afb_id;
+
+	for_each_pipe(display, pipe) {
+		if (!igt_pipe_connector_valid(pipe, output))
+			continue;
+
+		if (!igt_pipe_is_free(display, pipe))
+			continue;
+
+		prepare_test(data, output, pipe);
+
+		/* 10-bit formats are slow, so limit the size. */
+		afb_id = igt_create_fb(data->fd, 512, 512, DRM_FORMAT_XRGB2101010, 0, &afb);
+		igt_assert(afb_id);
+
+		draw_hdr_pattern(&afb);
+
+		fill_hdr_output_metadata_st2048(&hdr);
+
+		/* Start with no metadata. */
+		igt_plane_set_fb(data->primary, &afb);
+		igt_plane_set_size(data->primary, data->w, data->h);
+		set_hdr_output_metadata(data, NULL);
+		igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
+		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+		if (is_amdgpu_device(data->fd))
+			assert_output_bpc(data, 8);
+
+		/* Apply HDR metadata and 10bpc. We expect a modeset for entering. */
+		set_hdr_output_metadata(data, &hdr);
+		igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
+		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+		if (is_amdgpu_device(data->fd))
+			assert_output_bpc(data, 10);
+
+		/* Verify that the CRC are equal after DPMS or suspend. */
+		igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);
+		test_cycle_flags(data, flags);
+		igt_pipe_crc_collect_crc(data->pipe_crc, &new_crc);
+
+		/* Disable HDR metadata and drop back to 8bpc. We expect a modeset for exiting. */
+		set_hdr_output_metadata(data, NULL);
+		igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
+		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+		if (is_amdgpu_device(data->fd))
+			assert_output_bpc(data, 8);
+
+		igt_assert_crc_equal(&ref_crc, &new_crc);
+
+		test_fini(data);
+		igt_remove_fb(data->fd, &afb);
+
+		break;
+	}
+}
+
+/* Returns true if an output supports hdr metadata property */
+static bool has_hdr(igt_output_t *output)
+{
+	return igt_output_has_prop(output, IGT_CONNECTOR_HDR_OUTPUT_METADATA);
+}
+
+static void test_hdr(data_t *data, const char *test_name, uint32_t flags)
+{
+	igt_output_t *output;
+	int valid_tests = 0;
+
+	for_each_connected_output(&data->display, output) {
+		/* To test HDR, 10 bpc is required, so we need to
+		 * set MAX_BPC property to 10bpc prior to setting
+		 * HDR metadata property. Therefore, checking.
+		 */
+		if (!has_max_bpc(output))
+			continue;
+
+		if (!has_hdr(output))
+			continue;
+
+		if (!is_panel_hdr(data, output))
+			continue;
+
+		igt_info("HDR %s test execution on %s\n", test_name, output->name);
+		if (flags & TEST_NONE || flags & TEST_DPMS || flags & TEST_SUSPEND)
+			test_static_toggle(data, output, flags);
+		valid_tests++;
+	}
+
+	igt_require_f(valid_tests, "No connector found with HDR metadata/MAX BPC\
+				    connector property/panel is Non-HDR\n");
+}
+
 igt_main
 {
 	data_t data = { 0 };
@@ -377,6 +533,13 @@ igt_main
 	igt_describe("Tests bpc switch with suspend");
 	igt_subtest("bpc-switch-suspend") test_bpc_switch(&data, TEST_SUSPEND);
 
+	igt_describe("Tests entering and exiting HDR mode");
+	igt_subtest("static-toggle") test_hdr(&data, "static-toggle", TEST_NONE);
+	igt_describe("Tests static toggle with dpms");
+	igt_subtest("static-toggle-dpms") test_hdr(&data, "static-toggle-dpms", TEST_DPMS);
+	igt_describe("Tests static toggle with suspend");
+	igt_subtest("static-toggle-suspend") test_hdr(&data, "static-toggle-suspend", TEST_SUSPEND);
+
 	igt_fixture {
 		igt_display_fini(&data.display);
 	}
-- 
2.24.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
