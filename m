Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DFEBC5472C
	for <igt-dev@archiver.kernel.org>; Mon, 26 Aug 2024 04:54:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E44210E0D9;
	Mon, 26 Aug 2024 04:54:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QrN6f0nI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 685A210E0D8
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Aug 2024 04:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724648067; x=1756184067;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kVih8zQa9tETZwa7NLF+xomsGDYk52upXCoxkyGcRoA=;
 b=QrN6f0nIOxNZiBxP20rnAQfEKJjBIgYANt41t8R95oKhTY+mULktix2h
 4aRG6q920LYF18h1XtgXIcVBks2opGbiMMswpdXQmvOoIxKPQzlYV1QJT
 DVsuheTmtdsjQMCj+GL/PuCp5+ZMe9ZESFSdpfISQimZguHdR+NBl6Tkq
 dWIRQCPQnA0gDQPS20maZCUlTIlLgbr0K2J6yFcdRfhYm2BE+PdxUk2l3
 49JRMs4eTF4JNledj/XQhqIwhdxrZl6RnBlc3gqjtjGB+ZNjgW1UBAiqV
 /dg88eRnx7NlC3oPyDfHfwPiNvP2dSvx6b96zDg19c1Ijn9TBvwDkkPXw w==;
X-CSE-ConnectionGUID: pHvqQJusSJe/9eUr5UUjxQ==
X-CSE-MsgGUID: dKCsp8AgQxKX/eTXAg+t4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="26815344"
X-IronPort-AV: E=Sophos;i="6.10,176,1719903600"; d="scan'208";a="26815344"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2024 21:54:20 -0700
X-CSE-ConnectionGUID: cmtlOELPQeyYlCHdDK5bEA==
X-CSE-MsgGUID: yjkPY17bTiqXEAkWdE/BmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,176,1719903600"; d="scan'208";a="62363980"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2024 21:54:18 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, kunal1.joshi@intel.com, karthik.b.s@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t 1/3] tests/kms_plane_scaling: Update scaling functions
 to return error codes
Date: Mon, 26 Aug 2024 10:23:48 +0530
Message-ID: <20240826045351.1340125-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826045351.1340125-1-ramanaidu.naladala@intel.com>
References: <20240826045351.1340125-1-ramanaidu.naladala@intel.com>
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

This will ensures that the system can automatically find a suitable
configuration, improving the robustness and flexibility of the
testing process. Introduce a `ret` variable to capture the return
value of scaling operations. Modify `check_scaling_pipe_plane_rot`
to return an integer error code instead of void. Update
`test_scaler_with_modifier_pipe`, `test_scaler_with_rotation_pipe`,
and `test_scaler_with_pixel_format_pipe` to handle the returned
error code. Add informative logs to indicate when a scaling operation
is not supported on a specific output.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_plane_scaling.c | 250 +++++++++++++++++++++++---------------
 1 file changed, 150 insertions(+), 100 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 42eb67409..588a9c5f0 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -566,7 +566,7 @@ static void cleanup_crtc(data_t *data)
 	cleanup_fbs(data);
 }
 
-static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
+static int check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
 					 uint32_t pixel_format,
 					 uint64_t modifier,
 					 double sf_plane,
@@ -634,11 +634,7 @@ static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
 		if (commit_ret == 0)
 			break;
 	}
-
-	igt_skip_on_f(commit_ret == -ERANGE || commit_ret == -EINVAL,
-		      "Unsupported scaling operation in driver with return value %s\n",
-		      (commit_ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
-	igt_assert_eq(commit_ret, 0);
+	return commit_ret;
 }
 
 static const igt_rotation_t rotations[] = {
@@ -710,16 +706,17 @@ static const uint64_t modifiers[] = {
 	I915_FORMAT_MOD_4_TILED
 };
 
-static void test_scaler_with_modifier_pipe(data_t *d,
-					   double sf_plane,
-					   bool is_clip_clamp,
-					   bool is_upscale,
-					   enum pipe pipe,
-					   igt_output_t *output)
+static int test_scaler_with_modifier_pipe(data_t *d,
+					  double sf_plane,
+					  bool is_clip_clamp,
+					  bool is_upscale,
+					  enum pipe pipe,
+					  igt_output_t *output)
 {
 	igt_display_t *display = &d->display;
 	unsigned format = DRM_FORMAT_XRGB8888;
 	igt_plane_t *plane;
+	uint32_t ret;
 
 	cleanup_crtc(d);
 
@@ -733,18 +730,22 @@ static void test_scaler_with_modifier_pipe(data_t *d,
 			uint64_t modifier = modifiers[i];
 
 			if (igt_plane_has_format_mod(plane, format, modifier))
-				check_scaling_pipe_plane_rot(d, plane,
-							     format, modifier,
-							     sf_plane,
-							     is_clip_clamp,
-							     is_upscale,
-							     pipe, output,
-							     IGT_ROTATION_0);
+				ret = check_scaling_pipe_plane_rot(d, plane,
+								   format, modifier,
+								   sf_plane,
+								   is_clip_clamp,
+								   is_upscale,
+								   pipe, output,
+								   IGT_ROTATION_0);
+			if (ret != 0)
+				return ret;
 		}
+
 	}
+	return ret;
 }
 
-static void test_scaler_with_rotation_pipe(data_t *d,
+static int test_scaler_with_rotation_pipe(data_t *d,
 					   double sf_plane,
 					   bool is_clip_clamp,
 					   bool is_upscale,
@@ -755,6 +756,7 @@ static void test_scaler_with_rotation_pipe(data_t *d,
 	unsigned format = DRM_FORMAT_XRGB8888;
 	uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
 	igt_plane_t *plane;
+	uint32_t ret;
 
 	cleanup_crtc(d);
 
@@ -768,18 +770,21 @@ static void test_scaler_with_rotation_pipe(data_t *d,
 			igt_rotation_t rot = rotations[i];
 
 			if (igt_plane_has_rotation(plane, rot))
-				check_scaling_pipe_plane_rot(d, plane,
-							     format, modifier,
-							     sf_plane,
-							     is_clip_clamp,
-							     is_upscale,
-							     pipe, output,
-							     rot);
+				ret = check_scaling_pipe_plane_rot(d, plane,
+								   format, modifier,
+								   sf_plane,
+								   is_clip_clamp,
+								   is_upscale,
+								   pipe, output,
+								   rot);
+			if (ret != 0)
+				return ret;
 		}
 	}
+	return ret;
 }
 
-static void test_scaler_with_pixel_format_pipe(data_t *d, double sf_plane,
+static int test_scaler_with_pixel_format_pipe(data_t *d, double sf_plane,
 					       bool is_clip_clamp,
 					       bool is_upscale,
 					       enum pipe pipe,
@@ -788,6 +793,7 @@ static void test_scaler_with_pixel_format_pipe(data_t *d, double sf_plane,
 	igt_display_t *display = &d->display;
 	uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
 	igt_plane_t *plane;
+	uint32_t ret;
 
 	cleanup_crtc(d);
 
@@ -810,17 +816,21 @@ static void test_scaler_with_pixel_format_pipe(data_t *d, double sf_plane,
 			if (test_format(d, &tested_formats, format) &&
 			    igt_plane_has_format_mod(plane, format, modifier) &&
 			    can_scale(d, format))
-			    check_scaling_pipe_plane_rot(d, plane,
-							 format, modifier,
-							 sf_plane,
-							 is_clip_clamp,
-							 is_upscale,
-							 pipe, output,
-							 IGT_ROTATION_0);
+				ret = check_scaling_pipe_plane_rot(d, plane,
+								   format, modifier,
+								   sf_plane,
+								   is_clip_clamp,
+								   is_upscale,
+								   pipe, output,
+								   IGT_ROTATION_0);
+			if (ret != 0) {
+				igt_vec_fini(&tested_formats);
+				return ret;
+			}
 		}
-
 		igt_vec_fini(&tested_formats);
 	}
+	return ret;
 }
 
 static enum pipe
@@ -1327,6 +1337,7 @@ static data_t data;
 igt_main_args("", long_opts, help_str, opt_handler, &data)
 {
 	enum pipe pipe;
+	uint32_t ret;
 
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
@@ -1343,21 +1354,28 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 			igt_describe(scaler_with_pixel_format_tests[index].describe);
 			igt_subtest_with_dynamic(scaler_with_pixel_format_tests[index].name) {
 				for_each_pipe(&data.display, pipe) {
-					for_each_valid_output_on_pipe(&data.display, pipe, output) {
-						if (!pipe_output_combo_valid(&data.display, pipe, output))
-							continue;
-						if (get_num_scalers(&data.display, pipe) < 1)
-							continue;
-
-						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
-
-							test_scaler_with_pixel_format_pipe(&data,
+					igt_dynamic_f("pipe-%s",  kmstest_pipe_name(pipe)) {
+						for_each_valid_output_on_pipe(&data.display, pipe, output) {
+							igt_info(" Trying on %s\n",
+								   igt_output_name(output));
+							if (!pipe_output_combo_valid(&data.display, pipe, output))
+								continue;
+							if (get_num_scalers(&data.display, pipe) < 1)
+								continue;
+							ret = test_scaler_with_pixel_format_pipe(&data,
 									scaler_with_pixel_format_tests[index].sf,
 									false,
 									scaler_with_pixel_format_tests[index].is_upscale,
 									pipe, output);
+							if (ret == 0)
+								break;
+							igt_info("Required Scaling operation not supported on %s trying on next output\n",
+								  igt_output_name(output));
 						}
-						break;
+						igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
+							      "Unsupported scaling operation in driver with return value %s\n",
+							      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
+						igt_assert_eq(ret, 0);
 					}
 				}
 			}
@@ -1367,21 +1385,27 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 			igt_describe(scaler_with_rotation_tests[index].describe);
 			igt_subtest_with_dynamic(scaler_with_rotation_tests[index].name) {
 				for_each_pipe(&data.display, pipe) {
-					for_each_valid_output_on_pipe(&data.display, pipe, output) {
-						if (!pipe_output_combo_valid(&data.display, pipe, output))
-							continue;
-						if (get_num_scalers(&data.display, pipe) < 1)
-							continue;
-
-						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
-
-							test_scaler_with_rotation_pipe(&data,
+					igt_dynamic_f("pipe-%s",  kmstest_pipe_name(pipe)) {
+						igt_info(" Trying on %s\n", igt_output_name(output));
+						for_each_valid_output_on_pipe(&data.display, pipe, output) {
+							if (!pipe_output_combo_valid(&data.display, pipe, output))
+								continue;
+							if (get_num_scalers(&data.display, pipe) < 1)
+								continue;
+							ret = test_scaler_with_rotation_pipe(&data,
 									scaler_with_rotation_tests[index].sf,
 									false,
 									scaler_with_rotation_tests[index].is_upscale,
 									pipe, output);
+							if (ret == 0)
+								break;
+							igt_info("Required Scaling operation not supported on %s trying on next output\n",
+								  igt_output_name(output));
 						}
-						break;
+						igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
+							      "Unsupported scaling operation in driver with return value %s\n",
+							      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
+						igt_assert_eq(ret, 0);
 					}
 				}
 			}
@@ -1391,21 +1415,27 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 			igt_describe(scaler_with_modifiers_tests[index].describe);
 			igt_subtest_with_dynamic(scaler_with_modifiers_tests[index].name) {
 				for_each_pipe(&data.display, pipe) {
-					for_each_valid_output_on_pipe(&data.display, pipe, output) {
-						if (!pipe_output_combo_valid(&data.display, pipe, output))
-							continue;
-						if (get_num_scalers(&data.display, pipe) < 1)
-							continue;
-
-						igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
-
-							test_scaler_with_modifier_pipe(&data,
+					igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
+						for_each_valid_output_on_pipe(&data.display, pipe, output) {
+							igt_info(" Trying on %s\n", igt_output_name(output));
+							if (!pipe_output_combo_valid(&data.display, pipe, output))
+								continue;
+							if (get_num_scalers(&data.display, pipe) < 1)
+								continue;
+							ret = test_scaler_with_modifier_pipe(&data,
 									scaler_with_modifiers_tests[index].sf,
 									false,
 									scaler_with_modifiers_tests[index].is_upscale,
 									pipe, output);
+							if (ret == 0)
+								break;
+							igt_info("Required Scaling operation not supported on %s trying on next valid output\n",
+								  igt_output_name(output));
 						}
-						break;
+						igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
+							      "Unsupported scaling operation in driver with return value %s\n",
+							      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
+						igt_assert_eq(ret, 0);
 					}
 				}
 			}
@@ -1414,19 +1444,25 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		igt_describe("Tests scaling with clipping and clamping, pixel formats.");
 		igt_subtest_with_dynamic("plane-scaler-with-clipping-clamping-pixel-formats") {
 			for_each_pipe(&data.display, pipe) {
-				for_each_valid_output_on_pipe(&data.display, pipe, output) {
-					if (!pipe_output_combo_valid(&data.display, pipe, output))
-						continue;
-					if (get_num_scalers(&data.display, pipe) < 1)
-						continue;
-
-					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
-
-						test_scaler_with_pixel_format_pipe(&data, 0.0, true,
-										   false, pipe,
-										   output);
+				igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
+					for_each_valid_output_on_pipe(&data.display, pipe, output) {
+						igt_info(" Trying on %s\n", igt_output_name(output));
+						if (!pipe_output_combo_valid(&data.display, pipe, output))
+							continue;
+						if (get_num_scalers(&data.display, pipe) < 1)
+							continue;
+						ret = test_scaler_with_pixel_format_pipe(&data, 0.0, true,
+											 false, pipe,
+											 output);
+						if (ret == 0)
+							break;
+						igt_info("Required Scaling operation not supported on %s trying on next valid output\n",
+							  igt_output_name(output));
 					}
-					break;
+					igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
+						      "Unsupported scaling operation in driver with return value %s\n",
+						      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
+					igt_assert_eq(ret, 0);
 				}
 			}
 		}
@@ -1434,19 +1470,26 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		igt_describe("Tests scaling with clipping and clamping, rotation.");
 		igt_subtest_with_dynamic("plane-scaler-with-clipping-clamping-rotation") {
 			for_each_pipe(&data.display, pipe) {
-				for_each_valid_output_on_pipe(&data.display, pipe, output) {
-					if (!pipe_output_combo_valid(&data.display, pipe, output))
-						continue;
-					if (get_num_scalers(&data.display, pipe) < 1)
-						continue;
-
-					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
+				igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
+					for_each_valid_output_on_pipe(&data.display, pipe, output) {
+						igt_info(" Trying on %s\n", igt_output_name(output));
+						if (!pipe_output_combo_valid(&data.display, pipe, output))
+							continue;
+						if (get_num_scalers(&data.display, pipe) < 1)
+							continue;
+						ret = test_scaler_with_rotation_pipe(&data, 0.0, true,
+										     false, pipe,
+										     output);
+						if (ret == 0)
+							break;
+						igt_info("Required Scaling operation not supported on %s trying on next valid output\n",
+							  igt_output_name(output));
 
-						test_scaler_with_rotation_pipe(&data, 0.0, true,
-										false, pipe,
-										output);
 					}
-					break;
+					igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
+						      "Unsupported scaling operation in driver with return value %s\n",
+						      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
+					igt_assert_eq(ret, 0);
 				}
 			}
 		}
@@ -1454,18 +1497,25 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		igt_describe("Tests scaling with clipping and clamping, modifiers.");
 		igt_subtest_with_dynamic("plane-scaler-with-clipping-clamping-modifiers") {
 			for_each_pipe(&data.display, pipe) {
-				for_each_valid_output_on_pipe(&data.display, pipe, output) {
-					if (!pipe_output_combo_valid(&data.display, pipe, output))
-						continue;
-					if (get_num_scalers(&data.display, pipe) < 1)
-						continue;
-
-					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
-						test_scaler_with_modifier_pipe(&data, 0.0, true,
-										false, pipe,
-										output);
+				igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
+					for_each_valid_output_on_pipe(&data.display, pipe, output) {
+						igt_info(" Trying on %s\n", igt_output_name(output));
+						if (!pipe_output_combo_valid(&data.display, pipe, output))
+							continue;
+						if (get_num_scalers(&data.display, pipe) < 1)
+							continue;
+						ret = test_scaler_with_modifier_pipe(&data, 0.0, true,
+										     false, pipe,
+										     output);
+						if (ret == 0)
+							break;
+						igt_info("Required Scaling operation not supported on %s trying on next valid output\n",
+							  igt_output_name(output));
 					}
-					break;
+					igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
+						      "Unsupported scaling operation in driver with return value %s\n",
+						      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
+					igt_assert_eq(ret, 0);
 				}
 			}
 		}
-- 
2.43.0

