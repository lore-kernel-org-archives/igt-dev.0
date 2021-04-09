Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BA936E491
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Apr 2021 10:55:41 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
Date: Fri,  9 Apr 2021 16:35:47 +0530
Message-Id: <20210409110547.12665-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] Added test description for kms tests
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
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Added description for following tests:
tests/kms_atomic.c
tests/kms_concurrent.c
tests/kms_content_protection.c
tests/kms_fbcon_fbt.c
tests/kms_getfb.c
tests/kms_lease.c
tests/kms_panel_fitting.c
tests/kms_pipe_b_c_ivb.c
tests/kms_plane_lowres.c
tests/kms_plane_scaling.c
tests/kms_prop_blob.c
tests/kms_rmfb.c
tests/kms_sequence.c
tests/kms_vrr.c
tests/kms_pipe_crc_basic.c
tests/kms_plane_alpha_blend.c
tests/kms_draw_crc.c
tests/kms_tv_load_detect.c

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/kms_atomic.c             | 15 +++++++++++++++
 tests/kms_concurrent.c         |  2 ++
 tests/kms_content_protection.c | 14 ++++++++++++++
 tests/kms_draw_crc.c           |  4 ++++
 tests/kms_fbcon_fbt.c          |  8 ++++++++
 tests/kms_getfb.c              | 14 ++++++++++++++
 tests/kms_lease.c              | 10 ++++++++++
 tests/kms_panel_fitting.c      |  2 ++
 tests/kms_pipe_b_c_ivb.c       | 10 ++++++++++
 tests/kms_pipe_crc_basic.c     |  7 +++++++
 tests/kms_plane_alpha_blend.c  |  9 +++++++++
 tests/kms_plane_lowres.c       |  8 ++++++++
 tests/kms_plane_scaling.c      |  5 +++++
 tests/kms_prop_blob.c          | 12 ++++++++++++
 tests/kms_rmfb.c               |  4 ++++
 tests/kms_sequence.c           |  2 ++
 tests/kms_tv_load_detect.c     |  1 +
 tests/kms_vrr.c                |  6 ++++++
 18 files changed, 133 insertions(+)

diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index 2965b350..df9c9df7 100644
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -1104,6 +1104,8 @@ igt_main
 				      LOCAL_DRM_FORMAT_MOD_NONE, &fb);
 	}
 
+	igt_describe("Test for KMS atomic modesetting on overlay plane and ensure coherency between "
+		     "the legacy and atomic interfaces.");
 	igt_subtest("plane-overlay-legacy") {
 		igt_plane_t *overlay =
 			igt_pipe_get_plane_type(pipe_obj, DRM_PLANE_TYPE_OVERLAY);
@@ -1114,6 +1116,8 @@ igt_main
 		plane_overlay(pipe_obj, output, overlay);
 	}
 
+	igt_describe("Test for KMS atomic modesetting on primary plane and ensure coherency between "
+		     "the legacy and atomic interfaces.");
 	igt_subtest("plane-primary-legacy") {
 		atomic_setup(&display, pipe, output, primary, &fb);
 
@@ -1148,12 +1152,16 @@ igt_main
 		plane_immutable_zpos(&display, pipe_obj, output);
 	}
 
+	igt_describe("Test to ensure that DRM_MODE_ATOMIC_TEST_ONLY really only touches "
+		     "the free-standing state objects and nothing else.");
 	igt_subtest("test-only") {
 		atomic_clear(&display, pipe, primary, output);
 
 		test_only(pipe_obj, primary, output);
 	}
 
+	igt_describe("Test for KMS atomic modesetting on cursor plane and ensure coherency between "
+		     "legacy and atomic interfaces.");
 	igt_subtest("plane-cursor-legacy") {
 		igt_plane_t *cursor =
 			igt_pipe_get_plane_type(pipe_obj, DRM_PLANE_TYPE_CURSOR);
@@ -1164,30 +1172,37 @@ igt_main
 		plane_cursor(pipe_obj, output, cursor);
 	}
 
+	igt_describe("Test error handling when invalid plane parameters are passed");
 	igt_subtest("plane-invalid-params") {
 		atomic_setup(&display, pipe, output, primary, &fb);
 
 		plane_invalid_params(pipe_obj, output, primary, &fb);
 	}
 
+	igt_describe("Test error handling when invalid plane fence parameters are passed");
 	igt_subtest("plane-invalid-params-fence") {
 		atomic_setup(&display, pipe, output, primary, &fb);
 
 		plane_invalid_params_fence(pipe_obj, output, primary);
 	}
 
+	igt_describe("Test error handling when invalid crtc parameters are passed");
 	igt_subtest("crtc-invalid-params") {
 		atomic_setup(&display, pipe, output, primary, &fb);
 
 		crtc_invalid_params(pipe_obj, output, primary, &fb);
 	}
 
+	igt_describe("Test error handling when invalid crtc fence parameters are passed");
 	igt_subtest("crtc-invalid-params-fence") {
 		atomic_setup(&display, pipe, output, primary, &fb);
 
 		crtc_invalid_params_fence(pipe_obj, output, primary, &fb);
 	}
 
+	igt_describe("Test abuse the atomic ioctl directly in order to test "
+		     "various invalid conditions which the libdrm wrapper won't "
+		     "allow us to create.");
 	igt_subtest("atomic-invalid-params") {
 		atomic_setup(&display, pipe, output, primary, &fb);
 
diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
index 5a269014..c3f29ec7 100644
--- a/tests/kms_concurrent.c
+++ b/tests/kms_concurrent.c
@@ -329,6 +329,8 @@ run_tests_for_pipe(data_t *data, enum pipe pipe)
 		igt_require_f(valid_tests, "no valid crtc/connector combinations found\n");
 	}
 
+	igt_describe("Test atomic mode setting concurrently with multiple planes and screen "
+		     "resolution.");
 	igt_subtest_f("pipe-%s", kmstest_pipe_name(pipe))
 		for_each_valid_output_on_pipe(&data->display, pipe, output)
 			run_test(data, pipe, output);
diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 0fdbacdd..5a75b871 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -735,46 +735,58 @@ igt_main
 		create_fbs();
 	}
 
+	igt_describe("Test content protection with legacy style commit.");
 	igt_subtest("legacy") {
 		data.cp_tests = 0;
 		test_content_protection(COMMIT_LEGACY, HDCP_CONTENT_TYPE_0);
 	}
 
+	igt_describe("Test content protection with atomic modesetting");
 	igt_subtest("atomic") {
 		igt_require(data.display.is_atomic);
 		data.cp_tests = 0;
 		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_0);
 	}
 
+	igt_describe("Test content protection with DPMS ON/OFF during atomic modesetting.");
 	igt_subtest("atomic-dpms") {
 		igt_require(data.display.is_atomic);
 		data.cp_tests = CP_DPMS;
 		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_0);
 	}
 
+	igt_describe("Test for the integrity of link.");
 	igt_subtest("LIC") {
 		igt_require(data.display.is_atomic);
 		data.cp_tests = CP_LIC;
 		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_0);
 	}
 
+	igt_describe("Test content protection with content type 1 that "
+		     "can be handled only through HDCP2.2.");
 	igt_subtest("type1") {
 		igt_require(data.display.is_atomic);
 		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_1);
 	}
 
+	igt_describe("Test the teardown and rebuild of the interface between "
+		     "I915 and mei hdcp.");
 	igt_subtest("mei_interface") {
 		igt_require(data.display.is_atomic);
 		data.cp_tests = CP_MEI_RELOAD;
 		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_1);
 	}
 
+	igt_describe("Test the content type change when the content protection already "
+		     "enabled.");
 	igt_subtest("content_type_change") {
 		igt_require(data.display.is_atomic);
 		data.cp_tests = CP_TYPE_CHANGE;
 		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_1);
 	}
 
+	igt_describe("Test to detect the HDCP status change when we are reading the uevent "
+		     "sent with the corresponding connector id and property id.");
 	igt_subtest("uevent") {
 		igt_require(data.display.is_atomic);
 		data.cp_tests = CP_UEVENT;
@@ -792,6 +804,8 @@ igt_main
 	 *  either of these options, we test SRM writing from userspace and
 	 *  validation of the same at kernel. Something is better than nothing.
 	 */
+	igt_describe("This test writes the facsimile SRM into the /lib/firmware/ "
+		     "and check the kernel parsing of it by invoking the hdcp authentication.");
 	igt_subtest("srm") {
 		bool ret;
 
diff --git a/tests/kms_draw_crc.c b/tests/kms_draw_crc.c
index ffd655b0..e1fdcef6 100644
--- a/tests/kms_draw_crc.c
+++ b/tests/kms_draw_crc.c
@@ -331,6 +331,8 @@ igt_main
 	for (format_idx = 0; format_idx < N_FORMATS; format_idx++) {
 	for (method = 0; method < IGT_DRAW_METHOD_COUNT; method++) {
 	for (tiling_idx = 0; tiling_idx < N_TILING_METHODS; tiling_idx++) {
+		igt_describe("This subtest verfies igt_draw library works "
+			     "with different tilings, DRM_FORMATS, DRAW_METHODS.");
 		igt_subtest_f("draw-method-%s-%s-%s",
 			      format_str(format_idx),
 			      igt_draw_get_method_name(method),
@@ -339,6 +341,8 @@ igt_main
 					    tilings[tiling_idx]);
 	} } }
 
+	igt_describe("This subtest verifies CRC after filling fb with x-tiling "
+		     "or none.");
 	igt_subtest("fill-fb")
 		fill_fb_subtest();
 
diff --git a/tests/kms_fbcon_fbt.c b/tests/kms_fbcon_fbt.c
index 4df4db52..43a7ace1 100644
--- a/tests/kms_fbcon_fbt.c
+++ b/tests/kms_fbcon_fbt.c
@@ -419,12 +419,20 @@ igt_main
 	igt_fixture
 		setup_environment(&drm);
 
+	igt_describe("Test the relationship between fbcon and the frontbuffer "
+		     "tracking infrastructure with fbc enabled.");
 	igt_subtest("fbc")
 		subtest(&drm, &fbc, false);
+	igt_describe("Test the relationship between fbcon and the frontbuffer "
+		     "tracking infrastructure with psr enabled.");
 	igt_subtest("psr")
 		subtest(&drm, &psr, false);
+	igt_describe("Suspend test to validate  the relationship between fbcon and the frontbuffer "
+		     "tracking infrastructure with fbc enabled.");
 	igt_subtest("fbc-suspend")
 		subtest(&drm, &fbc, true);
+	igt_describe("Suspend test to validate the relationship between fbcon and the frontbuffer "
+		     "tracking infrastructure with psr enabled.");
 	igt_subtest("psr-suspend")
 		subtest(&drm, &psr, true);
 
diff --git a/tests/kms_getfb.c b/tests/kms_getfb.c
index 8c59b8a9..5f4758c6 100644
--- a/tests/kms_getfb.c
+++ b/tests/kms_getfb.c
@@ -170,11 +170,14 @@ static void test_handle_input(int fd)
 		do_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, &add);
 	}
 
+	igt_describe("Tests error handling for a zero'd input.");
 	igt_subtest("getfb-handle-zero") {
 		struct drm_mode_fb_cmd get = { .fb_id = 0 };
 		do_ioctl_err(fd, DRM_IOCTL_MODE_GETFB, &get, ENOENT);
 	}
 
+	igt_describe("Tests error handling when passing an valid "
+		     "handle.");
 	igt_subtest("getfb-handle-valid") {
 		struct drm_mode_fb_cmd get = { .fb_id = add.fb_id };
 		do_ioctl(fd, DRM_IOCTL_MODE_GETFB, &get);
@@ -187,12 +190,16 @@ static void test_handle_input(int fd)
 		gem_close(fd, get.handle);
 	}
 
+	igt_describe("Tests error handling when passing a handle that "
+		     "has been closed.");
 	igt_subtest("getfb-handle-closed") {
 		struct drm_mode_fb_cmd get = { .fb_id = add.fb_id };
 		do_ioctl(fd, DRM_IOCTL_MODE_RMFB, &add.fb_id);
 		do_ioctl_err(fd, DRM_IOCTL_MODE_GETFB, &get, ENOENT);
 	}
 
+	igt_describe("Tests error handling when passing an invalid "
+		     "handle.");
 	igt_subtest("getfb-handle-not-fb") {
 		struct drm_mode_fb_cmd get = { .fb_id = get_any_prop_id(fd) };
 		igt_require(get.fb_id > 0);
@@ -218,6 +225,8 @@ static void test_duplicate_handles(int fd)
 		do_ioctl(fd, DRM_IOCTL_MODE_ADDFB2, &add);
 	}
 
+	igt_describe("Tests error handling while requesting for two different "
+		     "handles from same fd.");
 	igt_subtest("getfb-addfb-different-handles") {
 		struct drm_mode_fb_cmd get = { .fb_id = add.fb_id };
 
@@ -226,6 +235,8 @@ static void test_duplicate_handles(int fd)
 		gem_close(fd, get.handle);
 	}
 
+	igt_describe("Tests error handling while requesting for two different "
+		     "handles from different fd.");
 	igt_subtest("getfb-repeated-different-handles") {
 		struct drm_mode_fb_cmd get1 = { .fb_id = add.fb_id };
 		struct drm_mode_fb_cmd get2 = { .fb_id = add.fb_id };
@@ -238,6 +249,9 @@ static void test_duplicate_handles(int fd)
 		gem_close(fd, get2.handle);
 	}
 
+	igt_describe("Tests error handling while requesting CCS buffers "
+		     "it should refuse because getfb supports returning "
+		     "a single buffer handle.");
 	igt_subtest("getfb-reject-ccs") {
 		struct drm_mode_fb_cmd2 add_ccs = { };
 		struct drm_mode_fb_cmd get = { };
diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index e9a47767..6397ef8f 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -1312,21 +1312,31 @@ igt_main
 		}
 	}
 
+	igt_describe("Tests error handling while creating invalid corner-cases for "
+		     "create-lease ioctl");
 	igt_subtest("invalid-create-leases")
 		invalid_create_leases(&data);
 
+	igt_describe("Tests that  possible_crtcs logically match between master and "
+		     "lease, and that the values are correctly renumbered on the lease side.");
 	igt_subtest("possible-crtcs-filtering")
 		possible_crtcs_filtering(&data);
 
+	igt_describe("Tests the drop/set_master interactions.");
 	igt_subtest("master-vs-lease")
 		master_vs_lease(&data);
 
+	igt_describe("Tests that the 2nd master can only create leases while being active "
+		     "master, and that leases on the first master don't prevent lease creation "
+		     "for the 2nd master.");
 	igt_subtest("multimaster-lease")
 		multimaster_lease(&data);
 
+	igt_describe("Tests the implicitly added planes.");
 	igt_subtest("implicit-plane-lease")
 		implicit_plane_lease(&data);
 
+	igt_describe("Tests all the uevent cases");
 	igt_subtest("lease-uevent")
 		lease_uevent(&data);
 }
diff --git a/tests/kms_panel_fitting.c b/tests/kms_panel_fitting.c
index 4f4c5608..398addeb 100644
--- a/tests/kms_panel_fitting.c
+++ b/tests/kms_panel_fitting.c
@@ -257,9 +257,11 @@ igt_main
 		igt_display_require_output(&data.display);
 	}
 
+	igt_describe("Tests panel fitting usages with legacy style commit.");
 	igt_subtest("legacy")
 		test_panel_fitting(&data);
 
+	igt_describe("Tests panel fitting usages with atomic fastset.");
 	igt_subtest("atomic-fastset")
 		test_atomic_fastset(&data);
 
diff --git a/tests/kms_pipe_b_c_ivb.c b/tests/kms_pipe_b_c_ivb.c
index 94768eec..5823ae2a 100644
--- a/tests/kms_pipe_b_c_ivb.c
+++ b/tests/kms_pipe_b_c_ivb.c
@@ -264,18 +264,28 @@ igt_main
 		igt_display_require(&data.display, data.drm_fd);
 	}
 
+	igt_describe("Tests pipe-B and pipe-C interactions in IVB by enabling pipe-B with mode "
+		     "that requires 3 lanes and then enabling pipe-c with dpms off/on pipe-B.");
 	igt_subtest("pipe-B-dpms-off-modeset-pipe-C")
 		test_dpms(&data);
 
+	igt_describe("Tests pipe-B and pipe-C interactions in IVB by enabling 2 different modes "
+		     "on pipe-B and then a single mode on pipe-C.");
 	igt_subtest("pipe-B-double-modeset-then-modeset-pipe-C")
 		test_lane_reduction(&data);
 
+	igt_describe("Tests pipe-B and pipe-C interactions in IVB by disabling pipe-B and then "
+		     "setting mode on pipe-C.");
 	igt_subtest("disable-pipe-B-enable-pipe-C")
 		test_disable_pipe_B(&data);
 
+	igt_describe("Tests pipe-B and pipe-C interactions in IVB by enabling pipe-B with 3 lanes "
+		     "from pipe-C.");
 	igt_subtest("from-pipe-C-to-B-with-3-lanes")
 		test_from_C_to_B_with_3_lanes(&data);
 
+	igt_describe("Tests pipe-B and pipe-C interactions in IVB by enabling pipe-C while pipe-B "
+		     "has 3-lanes");
 	igt_subtest("enable-pipe-C-while-B-has-3-lanes")
 		test_fail_enable_pipe_C_while_B_has_3_lanes(&data);
 
diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index db047c4c..67d68ebe 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -282,22 +282,28 @@ igt_main
 		data.debugfs = igt_debugfs_dir(data.drm_fd);
 	}
 
+	igt_describe("Tests error handling when the bad source is set.");
 	igt_subtest("bad-source")
 		test_bad_source(&data);
 
 	for_each_pipe_static(pipe) {
+		igt_describe("Test for pipe CRC reads.");
 		igt_subtest_f("read-crc-pipe-%s", kmstest_pipe_name(pipe))
 			test_read_crc(&data, pipe, 0);
 
+		igt_describe("Tests the pipe CRC read and ensure frame sequence.");
 		igt_subtest_f("read-crc-pipe-%s-frame-sequence", kmstest_pipe_name(pipe))
 			test_read_crc(&data, pipe, TEST_SEQUENCE);
 
+		igt_describe("Test for O_NONBLOCK CRC reads.");
 		igt_subtest_f("nonblocking-crc-pipe-%s", kmstest_pipe_name(pipe))
 			test_read_crc(&data, pipe, TEST_NONBLOCK);
 
+		igt_describe("Test for O_NONBLOCK CRC reads and ensure frame sequence.");
 		igt_subtest_f("nonblocking-crc-pipe-%s-frame-sequence", kmstest_pipe_name(pipe))
 			test_read_crc(&data, pipe, TEST_SEQUENCE | TEST_NONBLOCK);
 
+		igt_describe("Suspend test for pipe CRC reads");
 		igt_subtest_f("suspend-read-crc-pipe-%s", kmstest_pipe_name(pipe)) {
 			test_read_crc(&data, pipe, 0);
 
@@ -312,6 +318,7 @@ igt_main
 		igt_subtest_f("disable-crc-after-crtc-pipe-%s", kmstest_pipe_name(pipe))
 			test_disable_crc_after_crtc(&data, pipe);
 
+		igt_describe("Hang test for pipe CRC read");
 		igt_subtest_f("hang-read-crc-pipe-%s", kmstest_pipe_name(pipe)) {
 			igt_hang_t hang = igt_allow_hang(data.drm_fd, 0, 0);
 
diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index dd162546..5e80ae36 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -531,30 +531,39 @@ static void run_subtests(data_t *data, enum pipe pipe)
 			      kmstest_pipe_name(pipe));
 	}
 
+	igt_describe("Tests basic plane alpha properties.");
 	igt_subtest_f("pipe-%s-alpha-basic", kmstest_pipe_name(pipe))
 		run_test_on_pipe_planes(data, pipe, false, true, basic_alpha);
 
+	igt_describe("Tests plane alpha-7efc properties.");
 	igt_subtest_f("pipe-%s-alpha-7efc", kmstest_pipe_name(pipe))
 		run_test_on_pipe_planes(data, pipe, false, true, alpha_7efc);
 
+	igt_describe("Tests pipe coverage blending properties.");
 	igt_subtest_f("pipe-%s-coverage-7efc", kmstest_pipe_name(pipe))
 		run_test_on_pipe_planes(data, pipe, true, true, coverage_7efc);
 
+	igt_describe("Tests pipe coverage blending properties.");
 	igt_subtest_f("pipe-%s-coverage-vs-premult-vs-constant", kmstest_pipe_name(pipe))
 		run_test_on_pipe_planes(data, pipe, true, false, coverage_premult_constant);
 
+	igt_describe("Tests the alpha property with transparent fb.");
 	igt_subtest_f("pipe-%s-alpha-transparent-fb", kmstest_pipe_name(pipe))
 		run_test_on_pipe_planes(data, pipe, false, false, argb_transparent);
 
+	igt_describe("Tests alpha properties with opaque fb.");
 	igt_subtest_f("pipe-%s-alpha-opaque-fb", kmstest_pipe_name(pipe))
 		run_test_on_pipe_planes(data, pipe, false, false, argb_opaque);
 
+	igt_describe("Tests plane alpha and blending properties with minimum alpha value.");
 	igt_subtest_f("pipe-%s-constant-alpha-min", kmstest_pipe_name(pipe))
 		run_test_on_pipe_planes(data, pipe, true, false, constant_alpha_min);
 
+	igt_describe("Tests plane alpha and blending properties with medium alpha value");
 	igt_subtest_f("pipe-%s-constant-alpha-mid", kmstest_pipe_name(pipe))
 		run_test_on_pipe_planes(data, pipe, true, false, constant_alpha_mid);
 
+	igt_describe("Tests plane alpha and blending properties with maximum alpha value");
 	igt_subtest_f("pipe-%s-constant-alpha-max", kmstest_pipe_name(pipe))
 		run_test_on_pipe_planes(data, pipe, true, false, constant_alpha_max);
 }
diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
index a5af1f8a..5cfe53c8 100644
--- a/tests/kms_plane_lowres.c
+++ b/tests/kms_plane_lowres.c
@@ -301,15 +301,23 @@ igt_main
 
 	for_each_pipe_static(pipe) {
 		data.pipe = pipe;
+		igt_describe("Tests the visibility of the planes when switching between "
+			     "high and low resolution with tiling as none.");
 		igt_subtest_f("pipe-%s-tiling-none", kmstest_pipe_name(pipe))
 			test_planes_on_pipe(&data, LOCAL_DRM_FORMAT_MOD_NONE);
 
+		igt_describe("Tests the visibility of the planes when switching between "
+			     "high and low resolution with x-tiling.");
 		igt_subtest_f("pipe-%s-tiling-x", kmstest_pipe_name(pipe))
 			test_planes_on_pipe(&data, LOCAL_I915_FORMAT_MOD_X_TILED);
 
+		igt_describe("Tests the visibility of the planes when switching between "
+			     "high and low resolution with y-tiling.");
 		igt_subtest_f("pipe-%s-tiling-y", kmstest_pipe_name(pipe))
 			test_planes_on_pipe(&data, LOCAL_I915_FORMAT_MOD_Y_TILED);
 
+		igt_describe("Tests the visibility of the planes when switching between "
+			     "high and low resolution with yf-tiling.");
 		igt_subtest_f("pipe-%s-tiling-yf", kmstest_pipe_name(pipe))
 			test_planes_on_pipe(&data, LOCAL_I915_FORMAT_MOD_Yf_TILED);
 	}
diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 31f14275..34efc588 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -709,24 +709,28 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	igt_subtest_group {
 		igt_output_t *output;
 
+		igt_describe("Tests plane scaling per pipe.");
 		igt_subtest_with_dynamic("plane-scaling") {
 			for_each_pipe_with_single_output(&data.display, pipe, output)
 				igt_dynamic_f("pipe-%s-plane-scaling", kmstest_pipe_name(pipe))
 					test_plane_scaling_on_pipe(&data, pipe, output);
 		}
 
+		igt_describe("Tests scaling with pixel formats.");
 		igt_subtest_with_dynamic("scaler-with-pixel-format") {
 			for_each_pipe_with_single_output(&data.display, pipe, output)
 				igt_dynamic_f("pipe-%s-scaler-with-pixel-format", kmstest_pipe_name(pipe))
 					test_scaler_with_pixel_format_pipe(&data, pipe, output);
 		}
 
+		igt_describe("Tests scaling with tiling rotation.");
 		igt_subtest_with_dynamic("scaler-with-rotation") {
 			for_each_pipe_with_single_output(&data.display, pipe, output)
 				igt_dynamic_f("pipe-%s-scaler-with-rotation", kmstest_pipe_name(pipe))
 					test_scaler_with_rotation_pipe(&data, pipe, output);
 		}
 
+		igt_describe("Tests scaling with clipping and clamping.");
 		igt_subtest_with_dynamic("scaler-with-clipping-clamping") {
 			for_each_pipe_with_single_output(&data.display, pipe, output)
 				igt_dynamic_f("pipe-%s-scaler-with-clipping-clamping", kmstest_pipe_name(pipe))
@@ -734,6 +738,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		}
 	}
 
+	igt_describe("Tests scaling with multi-pipe scenario.");
 	igt_subtest_f("2x-scaler-multi-pipe")
 		test_scaler_with_multi_pipe_plane(&data);
 
diff --git a/tests/kms_prop_blob.c b/tests/kms_prop_blob.c
index 0a2004c3..819936d6 100644
--- a/tests/kms_prop_blob.c
+++ b/tests/kms_prop_blob.c
@@ -262,6 +262,8 @@ static void prop_tests(int fd)
 	get_props.count_props = 1;
 	get_props.obj_id = blob_id;
 
+	igt_describe("Tests error handling when invalid properties are fetched with "
+		     "object of any type.");
 	igt_subtest("invalid-get-prop-any") {
 		get_props.obj_type = 0; /* DRM_MODE_OBJECT_ANY */
 
@@ -269,6 +271,8 @@ static void prop_tests(int fd)
 				    &get_props) == -1 && errno == EINVAL);
 	}
 
+	igt_describe("Tests error handling when invalid properties are fetched with blob "
+		     "object type.");
 	igt_subtest("invalid-get-prop") {
 		get_props.obj_type = DRM_MODE_OBJECT_BLOB;
 
@@ -280,6 +284,8 @@ static void prop_tests(int fd)
 	set_prop.prop_id = 1;
 	set_prop.obj_id = blob_id;
 
+	igt_describe("Tests error handling when invalid properties are set with object "
+		     "of any type.");
 	igt_subtest("invalid-set-prop-any") {
 		set_prop.obj_type = 0; /* DRM_MODE_OBJECT_ANY */
 
@@ -287,6 +293,7 @@ static void prop_tests(int fd)
 				    &set_prop) == -1 && errno == EINVAL);
 	}
 
+	igt_describe("Tests error handling when invalid properties are set with blob object type.");
 	igt_subtest("invalid-set-prop") {
 		set_prop.obj_type = DRM_MODE_OBJECT_BLOB;
 
@@ -308,18 +315,23 @@ igt_main
 		igt_require_propblob(fd);
 	}
 
+	igt_describe("Test to ensure property support exists.");
 	igt_subtest("basic")
 		test_basic(fd);
 
+	igt_describe("Tests error handling when invalid property IDs are passed.");
 	igt_subtest("blob-prop-core")
 		test_core(fd);
 
+	igt_describe("Tests error handling when incorrect bolb size is passed.");
 	igt_subtest("blob-prop-validate")
 		test_validate(fd);
 
+	igt_describe("Tests validates the lifetime of the properties created.");
 	igt_subtest("blob-prop-lifetime")
 		test_lifetime(fd);
 
+	igt_describe("Test validates destroying multiple properties explicitly works as needed.");
 	igt_subtest("blob-multiple")
 		test_multiple(fd);
 
diff --git a/tests/kms_rmfb.c b/tests/kms_rmfb.c
index 2d49be8e..879ea574 100644
--- a/tests/kms_rmfb.c
+++ b/tests/kms_rmfb.c
@@ -168,9 +168,13 @@ igt_main
 		igt_display_require_output(&data.display);
 	}
 
+	igt_describe("RMFB is supposed to free the framebuffers from any and all "
+		     "planes so test this and make sure it works.");
 	igt_subtest_f("rmfb-ioctl")
 		run_rmfb_test(&data, false);
 
+	igt_describe("RMFB is supposed to free the framebuffers from any and all planes "
+		     "so test this and make sure it works with fd close and reopen.");
 	igt_subtest_f("close-fd")
 		run_rmfb_test(&data, true);
 
diff --git a/tests/kms_sequence.c b/tests/kms_sequence.c
index 081bd9d7..15afb2f1 100644
--- a/tests/kms_sequence.c
+++ b/tests/kms_sequence.c
@@ -305,6 +305,8 @@ igt_main
 			if (m->flags & ~f->valid)
 				continue;
 
+			igt_describe("This is a test of drmCrtcGetSequence and "
+				     "drmCrtcQueueSequence");
 			igt_subtest_f("%s-%s", f->name, m->name) {
 				data.flags = m->flags;
 				run_test(&data, fd, f->func);
diff --git a/tests/kms_tv_load_detect.c b/tests/kms_tv_load_detect.c
index 89f587d5..caac3aec 100644
--- a/tests/kms_tv_load_detect.c
+++ b/tests/kms_tv_load_detect.c
@@ -63,6 +63,7 @@ igt_main
 		igt_require(tv_connector);
 	}
 
+	igt_describe("Check tv load detection works correctly.");
 	igt_subtest("load-detect") {
 		/*
 		 * disable all outputs to make sure we have a
diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 5b854100..e28864f5 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -469,12 +469,18 @@ igt_main
 		igt_display_require_output(&data.display);
 	}
 
+	igt_describe("Tests that VRR is enabled and that the difference between flip "
+		     "timestamps converges to the requested rate");
 	igt_subtest("flip-basic")
 		run_vrr_test(&data, test_basic, 0);
 
+	igt_describe("Tests with DPMS that VRR is enabled and that the difference between flip "
+		     "timestamps converges to the requested rate.");
 	igt_subtest("flip-dpms")
 		run_vrr_test(&data, test_basic, TEST_DPMS);
 
+	igt_describe("Tests that VRR is enabled and that the difference between flip "
+		     "timestamps converges to the requested rate in a suspend test");
 	igt_subtest("flip-suspend")
 		run_vrr_test(&data, test_basic, TEST_SUSPEND);
 
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
