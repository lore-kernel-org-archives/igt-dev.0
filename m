Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB0DE77171
	for <igt-dev@archiver.kernel.org>; Wed,  4 Dec 2024 08:23:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02ECF10EC43;
	Wed,  4 Dec 2024 08:23:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FiRlQwNr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CF9110EC61
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Dec 2024 08:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733300626; x=1764836626;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AjG1Kr5LArP4lZ/m0nR8eh8A2g/RB1Ddym23qpQx/aU=;
 b=FiRlQwNrk3wIp5RavPgDeJ106PBoBXF3GPKf2oRtg0JVrOg676nOwDYc
 M7KFtwLLKk0fZhrX+ykKxiRtp6r0lE+rA1QxmUvIrKFNmXJFgPKszAczr
 wn0VEy+9hS/01OuFHOOXJwk2/ZxqahvYfXHlBzMD62j3mPIRT13GuuyQj
 Gj787sJNcMGpBxefWmS5CN4v5Jxq7xZYAn9An0xD//4x1PgckRJ62YuNv
 ySOtqyAd2F+9QxZL+Iyzt6kWC+sWJySOI20UqAOXabpbhsQ5PBC7QxQhe
 b+G0c4PKJrEN+S6xmQy9ZUAN34cMoQS2q4yL20J/g9/bxi05xP19un8Wd A==;
X-CSE-ConnectionGUID: TeLB8KENTyOr7r/Ie3O6Zg==
X-CSE-MsgGUID: OnrqSDLnRbGBvOuA+IflQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="44163543"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="44163543"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 00:23:46 -0800
X-CSE-ConnectionGUID: zWL+I6eWQ+aLbOnmfpC/KQ==
X-CSE-MsgGUID: 0fnMhqXZSqOnBRdoEWBOtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="98768744"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.130])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 00:23:46 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 7/9] tests/kms_sharpness_filter: Add scaler subtests
Date: Wed,  4 Dec 2024 13:56:25 +0530
Message-Id: <20241204082627.1800617-8-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241204082627.1800617-1-swati2.sharma@intel.com>
References: <20241204082627.1800617-1-swati2.sharma@intel.com>
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

Upscale/Downscale tests are added to apply plane scaler and casf
together.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_sharpness_filter.c | 69 ++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/tests/kms_sharpness_filter.c b/tests/kms_sharpness_filter.c
index cc6b09685..bafe300d3 100644
--- a/tests/kms_sharpness_filter.c
+++ b/tests/kms_sharpness_filter.c
@@ -48,6 +48,14 @@
  * SUBTEST: filter-suspend
  * Description: Verify content adaptive sharpness filter with suspend.
  * Functionality: casf, suspend
+ *
+ * SUBTEST: filter-scaler-upscale
+ * Description: Verify content adaptive sharpness filter with 1 plane scaler enabled.
+ * Functionality: casf, scaling
+ *
+ * SUBTEST: filter-scaler-downscale
+ * Description: Verify content adaptive sharpness filter with 1 plane scaler enabled.
+ * Functionality: casf, scaling
 */
 
 IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter");
@@ -69,6 +77,9 @@ IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter");
 #define MAX_PIXELS_FOR_5_TAP_FILTER	(3840 * 2160)
 #define NROUNDS				10
 
+#define SET_PLANES ((type == TEST_FILTER_UPSCALE) \
+		||  (type == TEST_FILTER_DOWNSCALE))
+
 enum test_type {
 	TEST_FILTER_BASIC,
 	TEST_FILTER_MODIFIERS,
@@ -79,6 +90,8 @@ enum test_type {
 	TEST_FILTER_TAP,
 	TEST_FILTER_DPMS,
 	TEST_FILTER_SUSPEND,
+	TEST_FILTER_UPSCALE,
+	TEST_FILTER_DOWNSCALE,
 };
 
 const int filter_strength_list[] = {
@@ -169,6 +182,27 @@ static void cleanup_fbs(data_t *data)
 		igt_remove_fb(data->drm_fd, &data->fb[i]);
 }
 
+static void set_planes(data_t *data, enum test_type type)
+{
+	drmModeModeInfo *mode = data->mode;
+	igt_output_t *output = data->output;
+
+	data->plane[1] = igt_output_get_plane(output, 1);
+	data->plane[2] = igt_output_get_plane(output, 2);
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
@@ -238,6 +272,9 @@ static void test_sharpness_filter(data_t *data,  enum test_type type)
 	else
 		igt_skip("No requested rotation on pipe %s\n", kmstest_pipe_name(data->pipe_id));
 
+	if (SET_PLANES)
+		set_planes(data, type);
+
 	set_filter_strength_on_pipe(data);
 
 	if (data->filter_strength != 0)
@@ -261,6 +298,10 @@ static void test_sharpness_filter(data_t *data,  enum test_type type)
 	if (type == TEST_FILTER_TOGGLE)
 		ret |= test_filter_toggle(data);
 
+	if (type == TEST_FILTER_DOWNSCALE)
+		igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
+			      "Scaling op not supported, cdclk limits might be exceeded.\n");
+
 	igt_assert_eq(ret, 0);
 
 	cleanup(data);
@@ -354,6 +395,12 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
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
@@ -511,6 +558,28 @@ igt_main_args("l", NULL, help_str, opt_handler, &data)
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

