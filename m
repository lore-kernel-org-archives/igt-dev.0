Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13860C369A9
	for <igt-dev@archiver.kernel.org>; Fri, 11 Apr 2025 12:07:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6D1B10EB86;
	Fri, 11 Apr 2025 12:07:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gJditj+m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DCD710EB8D
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Apr 2025 12:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744373251; x=1775909251;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GIQ0QFOeG9nwZgirKgg/j+YpjBgDq+8I5E2oQJxO7XU=;
 b=gJditj+mcFBI0ZV9u9OXleWnRb4HafYSb7Frfkm5anE79mdPip8VCanP
 i5Cqq1bKmS4qUzDykXPHxRcsXmY4wcdbgneCvc6iEBFRdAWFKTF5QdOEN
 ElOhg1RT6hbLbDbHyXicxuD/yV5sbP6fZGgELLJ+V194zAzQWaPQEE9b4
 DuV2cWNcdJie+18ssO/pL05KNYN21943A8Fm52IsA1e8/yULYQJabquXa
 jBDRIlmBnqaGZpiprjyIR0Ix6FTJW6z3R2xhlUNY8TDkgSR1YHcgOa9Rf
 mNgnujVIo8ALHZBTDjGsKH9r45iLtshYXzfZpmJSoxpcLnfr8eGSzX+0X w==;
X-CSE-ConnectionGUID: CfKfGkV1Ql2sKHP7zBcBNg==
X-CSE-MsgGUID: jd2WdaG5QN6jHmxFE8meCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="56907872"
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; d="scan'208";a="56907872"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 05:07:31 -0700
X-CSE-ConnectionGUID: gu55FXAwRjOHtYqV5GF+MA==
X-CSE-MsgGUID: TXA/m27aRiOtciXAjypD4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,205,1739865600"; d="scan'208";a="134045004"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2025 05:07:30 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, Swati Sharma <swati2.sharma@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t 08/10] tests/kms_sharpness_filter: Add invalid subtests
Date: Fri, 11 Apr 2025 17:42:36 +0530
Message-Id: <20250411121238.773949-9-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250411121238.773949-1-swati2.sharma@intel.com>
References: <20250411121238.773949-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Add invalid subtests:
-invalid filter with scaler: enable scaler on 2 planes and attempt
			     to enable casf
-invalid filter with plane: enable 2 NV12 planes and attempt
			    to enable casf
-invalid plane with filter: enable 1 NV12 plane and casf, then attempt
			    to enable a 2nd NV12 plane
-invalid filter with scaling mode: enable scaling_mode property and attempt
				   to enable casf

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 tests/kms_sharpness_filter.c | 181 +++++++++++++++++++++++++++++++++--
 1 file changed, 175 insertions(+), 6 deletions(-)

diff --git a/tests/kms_sharpness_filter.c b/tests/kms_sharpness_filter.c
index 3451a9db4..630b2c41c 100644
--- a/tests/kms_sharpness_filter.c
+++ b/tests/kms_sharpness_filter.c
@@ -57,6 +57,30 @@
  * SUBTEST: filter-scaler-downscale
  * Description: Verify content adaptive sharpness filter with 1 plane scaler enabled during downscaling.
  * Functionality: casf, scaling
+ *
+ * SUBTEST: invalid-filter-with-scaler
+ * Description: Negative check for content adaptive sharpness filter
+ * 		when 2 plane scalers have already been enabled and
+ * 		attempt is made to enable sharpness filter.
+ * Functionality: casf, scaling
+ *
+ * SUBTEST: invalid-filter-with-plane
+ * Description: Negative check for content adaptive sharpness filter
+ * 		when 2 NV12 planes have already been enabled and attempt is
+ * 		made to enable the sharpness filter.
+ * Functionality: casf, plane
+ *
+ * SUBTEST: invalid-plane-with-filter
+ * Description: Negative check for content adaptive sharpness filter
+ * 		when 1 NV12 plane and sharpness filter have already been enabled
+ * 		and attempt is made to enable the second NV12 plane.
+ * Functionality: casf, plane
+ *
+ * SUBTEST: invalid-filter-with-scaling-mode
+ * Description: Negative check for content adaptive sharpness filter
+ *              when scaling mode is already enabled and attempt is made to enable
+ *              sharpness filter.
+ * Functionality: casf, scaling
 */
 
 IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter");
@@ -77,9 +101,15 @@ IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter");
 #define MAX_PIXELS_FOR_3_TAP_FILTER	(1920 * 1080)
 #define MAX_PIXELS_FOR_5_TAP_FILTER	(3840 * 2160)
 #define NROUNDS				10
-
+#define INVALID_TEST ((type == TEST_INVALID_FILTER_WITH_SCALER) \
+		   || (type == TEST_INVALID_FILTER_WITH_PLANE) \
+		   || (type == TEST_INVALID_PLANE_WITH_FILTER) \
+		   || (type == TEST_INVALID_FILTER_WITH_SCALING_MODE))
 #define SET_PLANES ((type == TEST_FILTER_UPSCALE) \
-		||  (type == TEST_FILTER_DOWNSCALE))
+		||  (type == TEST_FILTER_DOWNSCALE) \
+		||  (type == TEST_INVALID_FILTER_WITH_SCALER) \
+		||  (type == TEST_INVALID_FILTER_WITH_PLANE) \
+		||  (type == TEST_INVALID_FILTER_WITH_SCALING_MODE))
 
 enum test_type {
 	TEST_FILTER_BASIC,
@@ -93,6 +123,10 @@ enum test_type {
 	TEST_FILTER_SUSPEND,
 	TEST_FILTER_UPSCALE,
 	TEST_FILTER_DOWNSCALE,
+	TEST_INVALID_FILTER_WITH_SCALER,
+	TEST_INVALID_FILTER_WITH_PLANE,
+	TEST_INVALID_PLANE_WITH_FILTER,
+	TEST_INVALID_FILTER_WITH_SCALING_MODE,
 };
 
 const int filter_strength_list[] = {
@@ -125,6 +159,11 @@ static const igt_rotation_t rotations[] = {
 	IGT_ROTATION_0,
 	IGT_ROTATION_180,
 };
+static const uint32_t scaling_modes[] = {
+	DRM_MODE_SCALE_FULLSCREEN,
+	DRM_MODE_SCALE_CENTER,
+	DRM_MODE_SCALE_ASPECT,
+};
 
 typedef struct {
 	int drm_fd;
@@ -142,6 +181,7 @@ typedef struct {
 	const char *modifier_name;
 	uint32_t format;
 	igt_rotation_t rotation;
+	uint32_t scaling_mode;
 } data_t;
 
 static void set_filter_strength_on_pipe(data_t *data)
@@ -151,6 +191,12 @@ static void set_filter_strength_on_pipe(data_t *data)
 				data->filter_strength);
 }
 
+static bool has_scaling_mode(igt_output_t *output)
+{
+	return igt_output_has_prop(output, IGT_CONNECTOR_SCALING_MODE) &&
+	       igt_output_get_prop(output, IGT_CONNECTOR_SCALING_MODE);
+}
+
 static void paint_image(igt_fb_t *fb)
 {
 	cairo_t *cr = igt_get_cairo_ctx(fb->fd, fb);
@@ -185,10 +231,12 @@ static void cleanup_fbs(data_t *data)
 
 static void set_planes(data_t *data, enum test_type type)
 {
+	int ret;
 	drmModeModeInfo *mode = data->mode;
 	igt_output_t *output = data->output;
 
 	data->plane[1] = igt_output_get_plane(output, 1);
+	data->plane[2] = igt_output_get_plane(output, 2);
 
 	if (type == TEST_FILTER_UPSCALE) {
 		setup_fb(data->drm_fd, 20, 20, data->format, data->modifier, &data->fb[1]);
@@ -201,6 +249,46 @@ static void set_planes(data_t *data, enum test_type type)
 		igt_plane_set_fb(data->plane[1], &data->fb[1]);
 		igt_plane_set_size(data->plane[1], mode->hdisplay * 0.75, mode->vdisplay * 0.75);
 	}
+
+	if (type == TEST_INVALID_FILTER_WITH_SCALER) {
+		setup_fb(data->drm_fd, 20, 20, data->format, data->modifier, &data->fb[1]);
+		setup_fb(data->drm_fd, 20, 20, data->format, data->modifier, &data->fb[2]);
+		igt_plane_set_fb(data->plane[1], &data->fb[1]);
+		igt_plane_set_fb(data->plane[2], &data->fb[2]);
+		igt_plane_set_size(data->plane[1], mode->hdisplay, mode->vdisplay);
+		igt_plane_set_size(data->plane[2], mode->hdisplay, mode->vdisplay);
+	}
+
+	if (type == TEST_INVALID_FILTER_WITH_PLANE) {
+		setup_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, data->format, data->modifier, &data->fb[1]);
+		setup_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, data->format, data->modifier, &data->fb[2]);
+		igt_plane_set_fb(data->plane[1], &data->fb[1]);
+		igt_plane_set_fb(data->plane[2], &data->fb[2]);
+	}
+
+	if (type == TEST_INVALID_PLANE_WITH_FILTER) {
+		setup_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, data->format, data->modifier, &data->fb[1]);
+		igt_plane_set_fb(data->plane[1], &data->fb[1]);
+	}
+
+	if (type == TEST_INVALID_FILTER_WITH_SCALING_MODE) {
+		setup_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, data->format, data->modifier, &data->fb[1]);
+		setup_fb(data->drm_fd, 640, 480, data->format, data->modifier, &data->fb[2]);
+		igt_plane_set_fb(data->plane[1], &data->fb[1]);
+		igt_plane_set_fb(data->plane[2], &data->fb[2]);
+
+		ret = igt_display_try_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+		igt_assert_eq(ret, 0);
+
+		mode->hdisplay = 640;
+		mode->vdisplay = 480;
+
+		igt_output_override_mode(data->output, mode);
+		igt_plane_set_fb(data->plane[2], NULL);
+		igt_plane_set_fb(data->plane[1], &data->fb[2]);
+
+		igt_output_set_prop_value(data->output, IGT_CONNECTOR_SCALING_MODE, data->scaling_mode);
+	}
 }
 
 static void cleanup(data_t *data)
@@ -277,15 +365,21 @@ static void test_sharpness_filter(data_t *data,  enum test_type type)
 			igt_skip("No requested rotation on pipe %s\n", kmstest_pipe_name(data->pipe_id));
 	}
 
+	if (type == TEST_INVALID_FILTER_WITH_SCALING_MODE)
+		igt_require_f(has_scaling_mode(output), "No connecter scaling mode found on %s\n", output->name);
+
 	if (SET_PLANES)
 		set_planes(data, type);
 
 	set_filter_strength_on_pipe(data);
 
-	if (data->filter_strength != 0)
+	if (!INVALID_TEST && data->filter_strength != 0)
 		igt_debug("Sharpened image should be observed for filter strength > 0\n");
 
-	ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
+	if (type == TEST_INVALID_FILTER_WITH_SCALING_MODE)
+		ret = igt_display_try_commit_atomic(&data->display, 0, NULL);
+	else
+		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
 
 	if (type == TEST_FILTER_DPMS || type == TEST_FILTER_SUSPEND) {
 		pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe_id,
@@ -299,7 +393,7 @@ static void test_sharpness_filter(data_t *data,  enum test_type type)
 					   DRM_MODE_DPMS_OFF);
 		kmstest_set_connector_dpms(data->drm_fd,
 					   output->config.connector,
-					   DRM_MODE_DPMS_ON);
+						   DRM_MODE_DPMS_ON);
 	}
 
 	if (type == TEST_FILTER_SUSPEND)
@@ -318,7 +412,18 @@ static void test_sharpness_filter(data_t *data,  enum test_type type)
 		igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
 			      "Scaling op not supported, cdclk limits might be exceeded.\n");
 
-	igt_assert_eq(ret, 0);
+	if (type == TEST_INVALID_PLANE_WITH_FILTER) {
+		data->plane[3] = igt_output_get_plane(data->output, 3);
+		setup_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, data->format, data->modifier, &data->fb[3]);
+		igt_plane_set_fb(data->plane[3], &data->fb[3]);
+
+		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
+	}
+
+	if (INVALID_TEST)
+		igt_assert_eq(ret, -EINVAL);
+	else
+		igt_assert_eq(ret, 0);
 
 	/* clean-up */
 	igt_pipe_crc_free(pipe_crc);
@@ -419,6 +524,18 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
 			case TEST_FILTER_DOWNSCALE:
 				snprintf(name, sizeof(name), "-downscale");
 				break;
+			case TEST_INVALID_FILTER_WITH_SCALER:
+				snprintf(name, sizeof(name), "-invalid-filter-with-scaler");
+				break;
+			case TEST_INVALID_FILTER_WITH_PLANE:
+				snprintf(name, sizeof(name), "-invalid-filter-with-plane");
+				break;
+			case TEST_INVALID_PLANE_WITH_FILTER:
+				snprintf(name, sizeof(name), "-invalid-plane-with-filter");
+				break;
+			case TEST_INVALID_FILTER_WITH_SCALING_MODE:
+				snprintf(name, sizeof(name), "-invalid-filter-with-scaling-mode-%s", kmstest_scaling_mode_str(data->scaling_mode));
+				break;
 			default:
 				igt_assert(0);
 			}
@@ -597,6 +714,58 @@ igt_main_args("l", NULL, help_str, opt_handler, &data)
 		run_sharpness_filter_test(&data, TEST_FILTER_DOWNSCALE);
 	}
 
+	igt_describe("Negative check for content adaptive sharpness filter "
+		     "when 2 plane scalers have already been enabled and "
+		     "attempt is made to enable sharpness filter.");
+	igt_subtest_with_dynamic("invalid-filter-with-scaler") {
+		data.modifier = DRM_FORMAT_MOD_LINEAR;
+		data.rotation = IGT_ROTATION_0;
+		data.format = DRM_FORMAT_XRGB8888;
+		data.filter_strength = MID_FILTER_STRENGTH;
+
+		run_sharpness_filter_test(&data, TEST_INVALID_FILTER_WITH_SCALER);
+	}
+
+	igt_describe("Negative check for content adaptive sharpness filter "
+		     "when 2 NV12 planes have already been enabled and attempt is "
+		     "made to enable the sharpness filter.");
+	igt_subtest_with_dynamic("invalid-filter-with-plane") {
+		data.modifier = DRM_FORMAT_MOD_LINEAR;
+		data.rotation = IGT_ROTATION_0;
+		data.format = DRM_FORMAT_NV12;
+		data.filter_strength = MID_FILTER_STRENGTH;
+
+		run_sharpness_filter_test(&data, TEST_INVALID_FILTER_WITH_PLANE);
+	}
+
+	igt_describe("Negative check for content adaptive sharpness filter "
+		     "when 1 NV12 plane and sharpness filter have already been enabled "
+		     "and attempt is made to enable the second NV12 plane.");
+	igt_subtest_with_dynamic("invalid-plane-with-filter") {
+		data.modifier = DRM_FORMAT_MOD_LINEAR;
+		data.rotation = IGT_ROTATION_0;
+		data.format = DRM_FORMAT_NV12;
+		data.filter_strength = MID_FILTER_STRENGTH;
+
+		run_sharpness_filter_test(&data, TEST_INVALID_PLANE_WITH_FILTER);
+	}
+
+	igt_describe("Negative check for content adaptive sharpness filter "
+		     "when scaling mode is already enabled and attempt is made "
+		     "to enable sharpness filter.");
+	igt_subtest_with_dynamic("invalid-filter-with-scaling-mode") {
+		data.modifier = DRM_FORMAT_MOD_LINEAR;
+		data.rotation = IGT_ROTATION_0;
+		data.format = DRM_FORMAT_XRGB8888;
+		data.filter_strength = MID_FILTER_STRENGTH;
+
+		for (int k = 0; k < ARRAY_SIZE(scaling_modes); k++) {
+			data.scaling_mode = scaling_modes[k];
+
+			run_sharpness_filter_test(&data, TEST_INVALID_FILTER_WITH_SCALING_MODE);
+		}
+	}
+
 	igt_fixture {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
-- 
2.25.1

