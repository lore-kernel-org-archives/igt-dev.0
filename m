Return-path: <SRS0=u8tb=S7=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1790810E7EC
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Feb 2022 14:00:59 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 16 Feb 2022 19:45:06 +0530
Message-Id: <20220216141506.20347-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [v2] tests/kms_hdr: Test cleanup
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

Test is updated with
    *Dynamic subtests
    *Subtests renaming
    *Removal of valid_test check
    *Code indentation
    *Addition of igt_display_reset()
    *Restricting tests for #pipes=1 at one stage early

v2: -removal of redundant igt_display_reset() (Bhanu)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_hdr.c | 427 ++++++++++++++++++++++--------------------------
 1 file changed, 198 insertions(+), 229 deletions(-)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index 35e25f4d..d489e686 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -173,106 +173,75 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 	data->h = data->mode->vdisplay;
 }
 
-static bool igt_pipe_is_free(igt_display_t *display, enum pipe pipe)
-{
-	int i;
-
-	for (i = 0; i < display->n_outputs; i++)
-		if (display->outputs[i].pending_pipe == pipe)
-			return false;
-
-	return true;
-}
-
-static void test_bpc_switch_on_output(data_t *data, igt_output_t *output,
+static void test_bpc_switch_on_output(data_t *data, enum pipe pipe,
+				      igt_output_t *output,
 				      uint32_t flags)
 {
 	igt_display_t *display = &data->display;
 	igt_crc_t ref_crc, new_crc;
-	enum pipe pipe;
 	igt_fb_t afb;
 	int afb_id, ret;
 
-	for_each_pipe(display, pipe) {
-		if (!igt_pipe_connector_valid(pipe, output))
-			continue;
-		/*
-		 * If previous subtest of connector failed, pipe
-		 * attached to that connector is not released.
-		 * Because of that we have to choose the non
-		 * attached pipe for this subtest.
-		 */
-		if (!igt_pipe_is_free(display, pipe))
-			continue;
-
-		prepare_test(data, output, pipe);
-
-		/* 10-bit formats are slow, so limit the size. */
-		afb_id = igt_create_fb(data->fd, 512, 512, DRM_FORMAT_XRGB2101010, 0, &afb);
-		igt_assert(afb_id);
-
-		draw_hdr_pattern(&afb);
-
-		/* Plane may be required to fit fullscreen. Check it here and allow
-		 * smaller plane size in following tests.
-		 */
-		igt_plane_set_fb(data->primary, &afb);
-		igt_plane_set_size(data->primary, data->w, data->h);
-		ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST_ONLY, NULL);
-		if (!ret) {
-			data->w = afb.width;
-			data->h = afb.height;
-		}
-
-		/* Start in 8bpc. */
-		igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
-		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-		/*
-		 * i915 driver doesn't expose max bpc as debugfs entry,
-		 * so limiting assert only for amd driver.
-		 */
-		if (is_amdgpu_device(data->fd))
-			assert_output_bpc(data, 8);
-
-		/*
-		 * amdgpu requires a primary plane when the CRTC is enabled.
-		 * However, some older Intel hardware (hsw) have scaling
-		 * requirements that are not met by the plane, so remove it
-		 * for non-AMD devices.
-		 */
-		if (!is_amdgpu_device(data->fd))
-			igt_plane_set_fb(data->primary, NULL);
-
-		/* Switch to 10bpc. */
-		igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
-		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-		if (is_amdgpu_device(data->fd))
-			assert_output_bpc(data, 10);
+	prepare_test(data, output, pipe);
 
-		/* Verify that the CRC are equal after DPMS or suspend. */
-		igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);
-		test_cycle_flags(data, flags);
-		igt_pipe_crc_collect_crc(data->pipe_crc, &new_crc);
+	/* 10-bit formats are slow, so limit the size. */
+	afb_id = igt_create_fb(data->fd, 512, 512, DRM_FORMAT_XRGB2101010, 0, &afb);
+	igt_assert(afb_id);
 
-		/* Drop back to 8bpc. */
-		igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
-		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-		if (is_amdgpu_device(data->fd))
-			assert_output_bpc(data, 8);
+	draw_hdr_pattern(&afb);
 
-		/* CRC capture is clamped to 8bpc, so capture should match. */
-		igt_assert_crc_equal(&ref_crc, &new_crc);
+	/* Plane may be required to fit fullscreen. Check it here and allow
+	 * smaller plane size in following tests.
+	 */
+	igt_plane_set_fb(data->primary, &afb);
+	igt_plane_set_size(data->primary, data->w, data->h);
+	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST_ONLY, NULL);
+	if (!ret) {
+		data->w = afb.width;
+		data->h = afb.height;
+	}
 
-		test_fini(data);
-		igt_remove_fb(data->fd, &afb);
+	/* Start in 8bpc. */
+	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	/*
+	 * i915 driver doesn't expose max bpc as debugfs entry,
+	 * so limiting assert only for amd driver.
+	 */
+	if (is_amdgpu_device(data->fd))
+		assert_output_bpc(data, 8);
 
-		/*
-		 * Testing a output with a pipe is enough for HDR
-		 * testing. No ROI in testing the connector with other
-		 * pipes. So break the loop on pipe.
-		 */
-		break;
-	}
+	/*
+	 * amdgpu requires a primary plane when the CRTC is enabled.
+	 * However, some older Intel hardware (hsw) have scaling
+	 * requirements that are not met by the plane, so remove it
+	 * for non-AMD devices.
+	 */
+	if (!is_amdgpu_device(data->fd))
+		igt_plane_set_fb(data->primary, NULL);
+
+	/* Switch to 10bpc. */
+	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	if (is_amdgpu_device(data->fd))
+		assert_output_bpc(data, 10);
+
+	/* Verify that the CRC are equal after DPMS or suspend. */
+	igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);
+	test_cycle_flags(data, flags);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &new_crc);
+
+	/* Drop back to 8bpc. */
+	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	if (is_amdgpu_device(data->fd))
+		assert_output_bpc(data, 8);
+
+	/* CRC capture is clamped to 8bpc, so capture should match. */
+	igt_assert_crc_equal(&ref_crc, &new_crc);
+
+	test_fini(data);
+	igt_remove_fb(data->fd, &afb);
 }
 
 /* Returns true if an output supports max bpc property. */
@@ -282,21 +251,29 @@ static bool has_max_bpc(igt_output_t *output)
 	       igt_output_get_prop(output, IGT_CONNECTOR_MAX_BPC);
 }
 
-static void test_bpc_switch(data_t *data, uint32_t flags)
+static void test_bpc_switch(data_t *data, const char *test_name, uint32_t flags)
 {
+	igt_display_t *display = &data->display;
 	igt_output_t *output;
-	int valid_tests = 0;
 
-	for_each_connected_output(&data->display, output) {
-		if (!has_max_bpc(output))
+	for_each_connected_output(display, output) {
+		enum pipe pipe;
+
+		if (!has_max_bpc(output)) {
+			igt_info("%s connector not found with max_bpc connector property\n", output->name);
 			continue;
+		}
 
-		igt_info("BPC switch test execution on %s\n", output->name);
-		test_bpc_switch_on_output(data, output, flags);
-		valid_tests++;
+		for_each_pipe(display, pipe) {
+			if (igt_pipe_connector_valid(pipe, output)) {
+				 igt_dynamic_f("%s-%s-pipe-%s",
+					        test_name, output->name, kmstest_pipe_name(pipe))
+					test_bpc_switch_on_output(data, pipe, output, flags);
+			/* One pipe is enough */
+				break;
+			}
+		}
 	}
-
-	igt_require_f(valid_tests, "No connector found with max_bpc connector property\n");
 }
 
 static bool cta_block(const char *edid_ext)
@@ -426,68 +403,58 @@ static void fill_hdr_output_metadata_st2048(struct hdr_output_metadata *meta)
 	meta->hdmi_metadata_type1.max_cll = 500;   /* 500 nits */
 }
 
-static void test_static_toggle(data_t *data, igt_output_t *output,
+static void test_static_toggle(data_t *data, enum pipe pipe,
+			       igt_output_t *output,
 			       uint32_t flags)
 {
 	igt_display_t *display = &data->display;
 	struct hdr_output_metadata hdr;
 	igt_crc_t ref_crc, new_crc;
-	enum pipe pipe;
 	igt_fb_t afb;
 	int afb_id;
 
-	for_each_pipe(display, pipe) {
-		if (!igt_pipe_connector_valid(pipe, output))
-			continue;
+	prepare_test(data, output, pipe);
 
-		if (!igt_pipe_is_free(display, pipe))
-			continue;
+	/* 10-bit formats are slow, so limit the size. */
+	afb_id = igt_create_fb(data->fd, 512, 512, DRM_FORMAT_XRGB2101010, 0, &afb);
+	igt_assert(afb_id);
 
-		prepare_test(data, output, pipe);
+	draw_hdr_pattern(&afb);
 
-		/* 10-bit formats are slow, so limit the size. */
-		afb_id = igt_create_fb(data->fd, 512, 512, DRM_FORMAT_XRGB2101010, 0, &afb);
-		igt_assert(afb_id);
+	fill_hdr_output_metadata_st2048(&hdr);
 
-		draw_hdr_pattern(&afb);
+	/* Start with no metadata. */
+	igt_plane_set_fb(data->primary, &afb);
+	igt_plane_set_size(data->primary, data->w, data->h);
+	set_hdr_output_metadata(data, NULL);
+	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	if (is_amdgpu_device(data->fd))
+		assert_output_bpc(data, 8);
 
-		fill_hdr_output_metadata_st2048(&hdr);
+	/* Apply HDR metadata and 10bpc. We expect a modeset for entering. */
+	set_hdr_output_metadata(data, &hdr);
+	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	if (is_amdgpu_device(data->fd))
+		assert_output_bpc(data, 10);
 
-		/* Start with no metadata. */
-		igt_plane_set_fb(data->primary, &afb);
-		igt_plane_set_size(data->primary, data->w, data->h);
-		set_hdr_output_metadata(data, NULL);
-		igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
-		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-		if (is_amdgpu_device(data->fd))
-			assert_output_bpc(data, 8);
+	/* Verify that the CRC are equal after DPMS or suspend. */
+	igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);
+	test_cycle_flags(data, flags);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &new_crc);
 
-		/* Apply HDR metadata and 10bpc. We expect a modeset for entering. */
-		set_hdr_output_metadata(data, &hdr);
-		igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
-		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-		if (is_amdgpu_device(data->fd))
-			assert_output_bpc(data, 10);
-
-		/* Verify that the CRC are equal after DPMS or suspend. */
-		igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);
-		test_cycle_flags(data, flags);
-		igt_pipe_crc_collect_crc(data->pipe_crc, &new_crc);
-
-		/* Disable HDR metadata and drop back to 8bpc. We expect a modeset for exiting. */
-		set_hdr_output_metadata(data, NULL);
-		igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
-		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-		if (is_amdgpu_device(data->fd))
-			assert_output_bpc(data, 8);
+	/* Disable HDR metadata and drop back to 8bpc. We expect a modeset for exiting. */
+	set_hdr_output_metadata(data, NULL);
+	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	if (is_amdgpu_device(data->fd))
+		assert_output_bpc(data, 8);
 
-		igt_assert_crc_equal(&ref_crc, &new_crc);
+	igt_assert_crc_equal(&ref_crc, &new_crc);
 
-		test_fini(data);
-		igt_remove_fb(data->fd, &afb);
-
-		break;
-	}
+	test_fini(data);
+	igt_remove_fb(data->fd, &afb);
 }
 
 /* Fills some test values for HDR metadata targeting SDR. */
@@ -520,88 +487,77 @@ static void fill_hdr_output_metadata_sdr(struct hdr_output_metadata *meta)
 	meta->hdmi_metadata_type1.max_cll = 0;
 }
 
-static void test_static_swap(data_t *data, igt_output_t *output)
+static void test_static_swap(data_t *data, enum pipe pipe, igt_output_t *output)
 {
 	igt_display_t *display = &data->display;
 	igt_crc_t ref_crc, new_crc;
-	enum pipe pipe;
 	igt_fb_t afb;
 	int afb_id;
 	struct hdr_output_metadata hdr;
 
-	for_each_pipe(display, pipe) {
-		if (!igt_pipe_connector_valid(pipe, output))
-			continue;
-
-		if (!igt_pipe_is_free(display, pipe))
-			continue;
-
-		prepare_test(data, output, pipe);
-
-		/* 10-bit formats are slow, so limit the size. */
-		afb_id = igt_create_fb(data->fd, 512, 512, DRM_FORMAT_XRGB2101010, 0, &afb);
-		igt_assert(afb_id);
-
-		draw_hdr_pattern(&afb);
-
-		/* Start in SDR. */
-		igt_plane_set_fb(data->primary, &afb);
-		igt_plane_set_size(data->primary, data->w, data->h);
-		igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
+	prepare_test(data, output, pipe);
+
+	/* 10-bit formats are slow, so limit the size. */
+	afb_id = igt_create_fb(data->fd, 512, 512, DRM_FORMAT_XRGB2101010, 0, &afb);
+	igt_assert(afb_id);
+
+	draw_hdr_pattern(&afb);
+
+	/* Start in SDR. */
+	igt_plane_set_fb(data->primary, &afb);
+	igt_plane_set_size(data->primary, data->w, data->h);
+	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	if (is_amdgpu_device(data->fd))
+		assert_output_bpc(data, 8);
+
+	/* Enter HDR, a modeset is allowed here. */
+	fill_hdr_output_metadata_st2048(&hdr);
+	set_hdr_output_metadata(data, &hdr);
+	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	if (is_amdgpu_device(data->fd))
+		assert_output_bpc(data, 10);
+
+	igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);
+
+	/* Change the mastering information, no modeset allowed
+	 * for amd driver, whereas a modeset is required for i915
+	 * driver. */
+	hdr.hdmi_metadata_type1.max_display_mastering_luminance = 200;
+	hdr.hdmi_metadata_type1.max_fall = 200;
+	hdr.hdmi_metadata_type1.max_cll = 100;
+
+	set_hdr_output_metadata(data, &hdr);
+	if (is_amdgpu_device(data->fd))
+		igt_display_commit_atomic(display, 0, NULL);
+	else
 		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-		if (is_amdgpu_device(data->fd))
-			assert_output_bpc(data, 8);
 
-		/* Enter HDR, a modeset is allowed here. */
-		fill_hdr_output_metadata_st2048(&hdr);
-		set_hdr_output_metadata(data, &hdr);
-		igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
+	/* Enter SDR via metadata, no modeset allowed for
+	 * amd driver, whereas a modeset is required for
+	 * i915 driver. */
+	fill_hdr_output_metadata_sdr(&hdr);
+	set_hdr_output_metadata(data, &hdr);
+	if (is_amdgpu_device(data->fd))
+		igt_display_commit_atomic(display, 0, NULL);
+	else
 		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-		if (is_amdgpu_device(data->fd))
-			assert_output_bpc(data, 10);
-
-		igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);
-
-		/* Change the mastering information, no modeset allowed
-		 * for amd driver, whereas a modeset is required for i915
-		 * driver. */
-		hdr.hdmi_metadata_type1.max_display_mastering_luminance = 200;
-		hdr.hdmi_metadata_type1.max_fall = 200;
-		hdr.hdmi_metadata_type1.max_cll = 100;
-
-		set_hdr_output_metadata(data, &hdr);
-		if (is_amdgpu_device(data->fd))
-			igt_display_commit_atomic(display, 0, NULL);
-		else
-			igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-
-		/* Enter SDR via metadata, no modeset allowed for
-		 * amd driver, whereas a modeset is required for
-		 * i915 driver. */
-		fill_hdr_output_metadata_sdr(&hdr);
-		set_hdr_output_metadata(data, &hdr);
-		if (is_amdgpu_device(data->fd))
-			igt_display_commit_atomic(display, 0, NULL);
-		else
-			igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-
-		igt_pipe_crc_collect_crc(data->pipe_crc, &new_crc);
-
-		/* Exit SDR and enter 8bpc, cleanup. */
-		set_hdr_output_metadata(data, NULL);
-		igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
-		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-		if (is_amdgpu_device(data->fd))
-			assert_output_bpc(data, 8);
 
-		/* Verify that the CRC didn't change while cycling metadata. */
-		igt_assert_crc_equal(&ref_crc, &new_crc);
+	igt_pipe_crc_collect_crc(data->pipe_crc, &new_crc);
 
-		test_fini(data);
-		igt_remove_fb(data->fd, &afb);
+	/* Exit SDR and enter 8bpc, cleanup. */
+	set_hdr_output_metadata(data, NULL);
+	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	if (is_amdgpu_device(data->fd))
+		assert_output_bpc(data, 8);
 
-		break;
-	}
+	/* Verify that the CRC didn't change while cycling metadata. */
+	igt_assert_crc_equal(&ref_crc, &new_crc);
+
+	test_fini(data);
+	igt_remove_fb(data->fd, &afb);
 }
 
 /* Returns true if an output supports HDR metadata property. */
@@ -612,10 +568,12 @@ static bool has_hdr(igt_output_t *output)
 
 static void test_hdr(data_t *data, const char *test_name, uint32_t flags)
 {
+	igt_display_t *display = &data->display;
 	igt_output_t *output;
-	int valid_tests = 0;
 
-	for_each_connected_output(&data->display, output) {
+	for_each_connected_output(display, output) {
+		enum pipe pipe;
+
 		/* To test HDR, 10 bpc is required, so we need to
 		 * set MAX_BPC property to 10bpc prior to setting
 		 * HDR metadata property. Therefore, checking.
@@ -630,16 +588,20 @@ static void test_hdr(data_t *data, const char *test_name, uint32_t flags)
 			continue;
 		}
 
-		igt_info("HDR %s test execution on %s\n", test_name, output->name);
-		if (flags & TEST_NONE || flags & TEST_DPMS || flags & TEST_SUSPEND)
-			test_static_toggle(data, output, flags);
-		if (flags & TEST_SWAP)
-			test_static_swap(data, output);
-
-		valid_tests++;
+		for_each_pipe(display, pipe) {
+			if (igt_pipe_connector_valid(pipe, output)) {
+				igt_dynamic_f("%s-%s-pipe-%s",
+					      test_name, output->name, kmstest_pipe_name(pipe)) {
+					if (flags & TEST_NONE || flags & TEST_DPMS || flags & TEST_SUSPEND)
+						test_static_toggle(data, pipe, output, flags);
+					if (flags & TEST_SWAP)
+						test_static_swap(data, pipe, output);
+				}
+			/* One pipe is enough */
+				break;
+			}
+		}
 	}
-
-	igt_require_f(valid_tests, "No connector found with HDR metadata/max_bpc connector property (or) panel is non-HDR\n");
 }
 
 igt_main
@@ -658,21 +620,28 @@ igt_main
 	}
 
 	igt_describe("Tests switching between different display output bpc modes");
-	igt_subtest("bpc-switch") test_bpc_switch(&data, TEST_NONE);
+	igt_subtest_with_dynamic("bpc-switch")
+		test_bpc_switch(&data, "bpc-switch", TEST_NONE);
 	igt_describe("Tests bpc switch with dpms");
-	igt_subtest("bpc-switch-dpms") test_bpc_switch(&data, TEST_DPMS);
+	igt_subtest_with_dynamic("bpc-switch-dpms")
+		test_bpc_switch(&data, "bpc-switch-dpms", TEST_DPMS);
 	igt_describe("Tests bpc switch with suspend");
-	igt_subtest("bpc-switch-suspend") test_bpc_switch(&data, TEST_SUSPEND);
+	igt_subtest_with_dynamic("bpc-switch-suspend")
+		test_bpc_switch(&data, "bpc-switch-suspend", TEST_SUSPEND);
 
 	igt_describe("Tests entering and exiting HDR mode");
-	igt_subtest("static-toggle") test_hdr(&data, "static-toggle", TEST_NONE);
+	igt_subtest_with_dynamic("static-toggle")
+		test_hdr(&data, "static-toggle", TEST_NONE);
 	igt_describe("Tests static toggle with dpms");
-	igt_subtest("static-toggle-dpms") test_hdr(&data, "static-toggle-dpms", TEST_DPMS);
+	igt_subtest_with_dynamic("static-toggle-dpms")
+		test_hdr(&data, "static-toggle-dpms", TEST_DPMS);
 	igt_describe("Tests static toggle with suspend");
-	igt_subtest("static-toggle-suspend") test_hdr(&data, "static-toggle-suspend", TEST_SUSPEND);
+	igt_subtest_with_dynamic("static-toggle-suspend")
+		test_hdr(&data, "static-toggle-suspend", TEST_SUSPEND);
 
 	igt_describe("Tests swapping static HDR metadata");
-	igt_subtest("static-swap") test_hdr(&data, "static-swap", TEST_SWAP);
+	igt_subtest_with_dynamic("static-swap")
+		test_hdr(&data, "static-swap", TEST_SWAP);
 
 	igt_fixture {
 		igt_display_fini(&data.display);
-- 
2.25.1
