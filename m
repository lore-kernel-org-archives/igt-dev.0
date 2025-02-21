Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A0FC021B3
	for <igt-dev@archiver.kernel.org>; Fri, 21 Feb 2025 16:52:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B513B10EB0B;
	Fri, 21 Feb 2025 16:52:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fHvMeVwb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2277D10EB09
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Feb 2025 16:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740156769; x=1771692769;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hNBtz7OJIraUMD8xRfJ7K1JocjqfD0zfWYAfcYpFJtE=;
 b=fHvMeVwb08NVvI5bYeBB8FC7HYZfUJpZHmgm+THba2M2wtFt+9LBLVCG
 9oQQEIjTBYTLSma7MKwjCqmwKWzQmCOZ7b9gNPg+k2Z6njP540anVjtDI
 5Yu7xYWFqOmitwpczWoK1UeTOC/LpbIu3nDfUX6X06N97IMSoKpJCeqPI
 xNhai9M+pmW8xuOc2c1wHHTifCOiexWlvtAU+q98TIBGLrHoRzcCF0JYk
 i2LIvjPJyMF1Ey5p21KqrR+gwpMB3Ca/uh55RfBdUa0rJVnps0vQNKtc7
 enfRH6Dexd1tRHl8C7EMoGpDGSCFcADHmCVk4olkjzDa9YkblG33QfLiy w==;
X-CSE-ConnectionGUID: x7BOdcCFTMC/8lQS33ugNg==
X-CSE-MsgGUID: ZjaY4B2fTbyIqHiWdl1RcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41186747"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="41186747"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 08:52:49 -0800
X-CSE-ConnectionGUID: hDRDTN/oSjqtC7Qfluau2w==
X-CSE-MsgGUID: KbCMUzezSPeZoQ0mYsW4eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,305,1732608000"; d="scan'208";a="120517601"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2025 08:52:47 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v2 07/11] tests/kms_sharpness_filter: Add scaler subtests
Date: Fri, 21 Feb 2025 22:27:45 +0530
Message-Id: <20250221165749.460347-8-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250221165749.460347-1-swati2.sharma@intel.com>
References: <20250221165749.460347-1-swati2.sharma@intel.com>
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

Add upscale/downscale subtests to apply plane scaler and CASF
together.

v2: -Improve description (Ankit)
    -Remove unused var (Ankit)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 tests/kms_sharpness_filter.c | 68 ++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/tests/kms_sharpness_filter.c b/tests/kms_sharpness_filter.c
index 32ad7a752..3451a9db4 100644
--- a/tests/kms_sharpness_filter.c
+++ b/tests/kms_sharpness_filter.c
@@ -49,6 +49,14 @@
  * SUBTEST: filter-suspend
  * Description: Verify content adaptive sharpness filter with suspend.
  * Functionality: casf, suspend
+ *
+ * SUBTEST: filter-scaler-upscale
+ * Description: Verify content adaptive sharpness filter with 1 plane scaler enabled during upscaling.
+ * Functionality: casf, scaling
+ *
+ * SUBTEST: filter-scaler-downscale
+ * Description: Verify content adaptive sharpness filter with 1 plane scaler enabled during downscaling.
+ * Functionality: casf, scaling
 */
 
 IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter");
@@ -70,6 +78,9 @@ IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter");
 #define MAX_PIXELS_FOR_5_TAP_FILTER	(3840 * 2160)
 #define NROUNDS				10
 
+#define SET_PLANES ((type == TEST_FILTER_UPSCALE) \
+		||  (type == TEST_FILTER_DOWNSCALE))
+
 enum test_type {
 	TEST_FILTER_BASIC,
 	TEST_FILTER_MODIFIERS,
@@ -80,6 +91,8 @@ enum test_type {
 	TEST_FILTER_TAP,
 	TEST_FILTER_DPMS,
 	TEST_FILTER_SUSPEND,
+	TEST_FILTER_UPSCALE,
+	TEST_FILTER_DOWNSCALE,
 };
 
 const int filter_strength_list[] = {
@@ -170,6 +183,26 @@ static void cleanup_fbs(data_t *data)
 		igt_remove_fb(data->drm_fd, &data->fb[i]);
 }
 
+static void set_planes(data_t *data, enum test_type type)
+{
+	drmModeModeInfo *mode = data->mode;
+	igt_output_t *output = data->output;
+
+	data->plane[1] = igt_output_get_plane(output, 1);
+
+	if (type == TEST_FILTER_UPSCALE) {
+		setup_fb(data->drm_fd, 20, 20, data->format, data->modifier, &data->fb[1]);
+		igt_plane_set_fb(data->plane[1], &data->fb[1]);
+		igt_plane_set_size(data->plane[1], mode->hdisplay, mode->vdisplay);
+	}
+
+	if (type == TEST_FILTER_DOWNSCALE) {
+		setup_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, data->format, data->modifier, &data->fb[1]);
+		igt_plane_set_fb(data->plane[1], &data->fb[1]);
+		igt_plane_set_size(data->plane[1], mode->hdisplay * 0.75, mode->vdisplay * 0.75);
+	}
+}
+
 static void cleanup(data_t *data)
 {
 	igt_display_reset(&data->display);
@@ -244,6 +277,9 @@ static void test_sharpness_filter(data_t *data,  enum test_type type)
 			igt_skip("No requested rotation on pipe %s\n", kmstest_pipe_name(data->pipe_id));
 	}
 
+	if (SET_PLANES)
+		set_planes(data, type);
+
 	set_filter_strength_on_pipe(data);
 
 	if (data->filter_strength != 0)
@@ -278,6 +314,10 @@ static void test_sharpness_filter(data_t *data,  enum test_type type)
 	if (type == TEST_FILTER_TOGGLE)
 		ret |= test_filter_toggle(data);
 
+	if (type == TEST_FILTER_DOWNSCALE)
+		igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
+			      "Scaling op not supported, cdclk limits might be exceeded.\n");
+
 	igt_assert_eq(ret, 0);
 
 	/* clean-up */
@@ -373,6 +413,12 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
 			case TEST_FILTER_SUSPEND:
 				snprintf(name, sizeof(name), "-suspend");
 				break;
+			case TEST_FILTER_UPSCALE:
+				snprintf(name, sizeof(name), "-upscale");
+				break;
+			case TEST_FILTER_DOWNSCALE:
+				snprintf(name, sizeof(name), "-downscale");
+				break;
 			default:
 				igt_assert(0);
 			}
@@ -529,6 +575,28 @@ igt_main_args("l", NULL, help_str, opt_handler, &data)
 		run_sharpness_filter_test(&data, TEST_FILTER_SUSPEND);
 	}
 
+	igt_describe("Verify content adaptive sharpness filter "
+		     "with 1 plane scaler enabled.");
+	igt_subtest_with_dynamic("filter-scaler-upscale") {
+		data.modifier = DRM_FORMAT_MOD_LINEAR;
+		data.rotation = IGT_ROTATION_0;
+		data.format = DRM_FORMAT_XRGB8888;
+		data.filter_strength = MID_FILTER_STRENGTH;
+
+		run_sharpness_filter_test(&data, TEST_FILTER_UPSCALE);
+	}
+
+	igt_describe("Verify content adaptive sharpness filter "
+		     "with 1 plane scaler enabled.");
+	igt_subtest_with_dynamic("filter-scaler-downscale") {
+		data.modifier = DRM_FORMAT_MOD_LINEAR;
+		data.rotation = IGT_ROTATION_0;
+		data.format = DRM_FORMAT_XRGB8888;
+		data.filter_strength = MID_FILTER_STRENGTH;
+
+		run_sharpness_filter_test(&data, TEST_FILTER_DOWNSCALE);
+	}
+
 	igt_fixture {
 		igt_display_fini(&data.display);
 		drm_close_driver(data.drm_fd);
-- 
2.25.1

