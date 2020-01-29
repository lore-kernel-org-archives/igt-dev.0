Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A105A6F573
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2020 14:06:26 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
Date: Wed, 29 Jan 2020 19:25:20 +0530
Message-Id: <20200129135520.20336-8-swati2.sharma@intel.com>
In-Reply-To: <20200129135520.20336-1-swati2.sharma@intel.com>
References: <20200129135520.20336-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH 7/7] tests/kms_hdr: Add subtest to swap static HDR
 metadata
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
Cc: petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

Add subtest to enable fast static metadata switches.

v2: Allow modeset for intel driver [Uma]

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_hdr.c | 120 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index 6680a6c6..9339dce8 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -49,6 +49,7 @@ enum {
 	TEST_NONE = 1 << 0,
 	TEST_DPMS = 1 << 1,
 	TEST_SUSPEND = 1 << 2,
+	TEST_SWAP = 1 << 3,
 };
 
 /* BPC connector state. */
@@ -475,6 +476,120 @@ static void test_static_toggle(data_t *data, igt_output_t *output,
 	}
 }
 
+/* Fills some test values for HDR metadata targeting SDR. */
+static void fill_hdr_output_metadata_sdr(struct hdr_output_metadata *meta)
+{
+	memset(meta, 0, sizeof(*meta));
+
+	meta->metadata_type = HDMI_STATIC_METADATA_TYPE1;
+	meta->hdmi_metadata_type1.eotf = HDMI_EOTF_TRADITIONAL_GAMMA_SDR;
+
+	/* Rec. 709 */
+	meta->hdmi_metadata_type1.display_primaries[0].x =
+		calc_hdr_float(0.640); /* Red */
+	meta->hdmi_metadata_type1.display_primaries[0].y =
+		calc_hdr_float(0.330);
+	meta->hdmi_metadata_type1.display_primaries[1].x =
+		calc_hdr_float(0.300); /* Green */
+	meta->hdmi_metadata_type1.display_primaries[1].y =
+		calc_hdr_float(0.600);
+	meta->hdmi_metadata_type1.display_primaries[2].x =
+		calc_hdr_float(0.150); /* Blue */
+	meta->hdmi_metadata_type1.display_primaries[2].y =
+		calc_hdr_float(0.006);
+	meta->hdmi_metadata_type1.white_point.x = calc_hdr_float(0.3127);
+	meta->hdmi_metadata_type1.white_point.y = calc_hdr_float(0.3290);
+
+	meta->hdmi_metadata_type1.max_display_mastering_luminance = 0;
+	meta->hdmi_metadata_type1.min_display_mastering_luminance = 0;
+	meta->hdmi_metadata_type1.max_fall = 0;
+	meta->hdmi_metadata_type1.max_cll = 0;
+}
+
+static void test_static_swap(data_t *data, igt_output_t *output)
+{
+	igt_display_t *display = &data->display;
+	igt_crc_t ref_crc, new_crc;
+	enum pipe pipe;
+	igt_fb_t afb;
+	int afb_id;
+	struct hdr_output_metadata hdr;
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
+		/* Start in SDR. */
+		igt_plane_set_fb(data->primary, &afb);
+		igt_plane_set_size(data->primary, data->w, data->h);
+		igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
+		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+		if (is_amdgpu_device(data->fd))
+			assert_output_bpc(data, 8);
+
+		/* Enter HDR, a modeset is allowed here. */
+		fill_hdr_output_metadata_st2048(&hdr);
+		set_hdr_output_metadata(data, &hdr);
+		igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
+		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+		if (is_amdgpu_device(data->fd))
+			assert_output_bpc(data, 10);
+
+		igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);
+
+		/* Change the mastering information, no modeset allowed
+		 * for amd driver, whereas a modeset is required for i915
+		 * driver. */
+		hdr.hdmi_metadata_type1.max_display_mastering_luminance = 200;
+		hdr.hdmi_metadata_type1.max_fall = 200;
+		hdr.hdmi_metadata_type1.max_cll = 100;
+
+		set_hdr_output_metadata(data, &hdr);
+		if (is_amdgpu_device(data->fd))
+			igt_display_commit_atomic(display, 0, NULL);
+		else
+			igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+
+		/* Enter SDR via metadata, no modeset allowed for
+		 * amd driver, whereas a modeset is required for
+		 * i915 driver. */
+		fill_hdr_output_metadata_sdr(&hdr);
+		set_hdr_output_metadata(data, &hdr);
+		if (is_amdgpu_device(data->fd))
+			igt_display_commit_atomic(display, 0, NULL);
+		else
+			igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+
+		igt_pipe_crc_collect_crc(data->pipe_crc, &new_crc);
+
+		/* Exit SDR and enter 8bpc, cleanup. */
+		set_hdr_output_metadata(data, NULL);
+		igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
+		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+		if (is_amdgpu_device(data->fd))
+			assert_output_bpc(data, 8);
+
+		/* Verify that the CRC didn't change while cycling metadata. */
+		igt_assert_crc_equal(&ref_crc, &new_crc);
+
+		test_fini(data);
+		igt_remove_fb(data->fd, &afb);
+
+		break;
+	}
+}
+
 /* Returns true if an output supports HDR metadata property. */
 static bool has_hdr(igt_output_t *output)
 {
@@ -503,6 +618,8 @@ static void test_hdr(data_t *data, const char *test_name, uint32_t flags)
 		igt_info("HDR %s test execution on %s\n", test_name, output->name);
 		if (flags & TEST_NONE || flags & TEST_DPMS || flags & TEST_SUSPEND)
 			test_static_toggle(data, output, flags);
+		if (flags & TEST_SWAP)
+			test_static_swap(data, output);
 		valid_tests++;
 	}
 
@@ -538,6 +655,9 @@ igt_main
 	igt_describe("Tests static toggle with suspend");
 	igt_subtest("static-toggle-suspend") test_hdr(&data, "static-toggle-suspend", TEST_SUSPEND);
 
+	igt_describe("Tests swapping static HDR metadata");
+	igt_subtest("static-swap") test_hdr(&data, "static-swap", TEST_SWAP);
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
