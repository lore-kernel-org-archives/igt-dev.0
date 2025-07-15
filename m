Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3458EC83F27
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 22:08:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB77E10E6BE;
	Tue, 15 Jul 2025 22:08:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eElI9pYF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C86F310E6BE
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 22:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752617284; x=1784153284;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=alauXKZ6DHKcoF0ajjFj+NUPyyRmkik1LXF0h8MJ+M8=;
 b=eElI9pYFofIccbK2TpzJ02YM3ONWouN1HWuuqRYgoXqA6E18KkXXwOfL
 zPuPNqNvK6EnxJtB2SWqQoZU2e1OBzopBRJfBRjAl4k5h3MusgH49jZ70
 TOq+qxE+wqTseP1J88HJqcKBcaexli7qykKPdqNlLGZWrbATb+GAFdYgK
 u+zwKsWOTGvEJzvTJAYq7fbv2XP/wl4n8+6mOVOqdO6j1WAMly2dvFx/g
 2GylKHQIeMvhX6/tg3ZM7Dno07M7RBnH3az5+tnTjnEomzE6YrFVtPyKU
 nNtCUQhTPbhBwCou0Us1NzSLSwh6MvGm5G9f/7LpZ5WqlGUrfhIWVMRqB Q==;
X-CSE-ConnectionGUID: 426mLPYkQsWGD7k77Y6HQw==
X-CSE-MsgGUID: 6+wuE5TWQoSMxrBkqwutZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="58507229"
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="58507229"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 15:08:04 -0700
X-CSE-ConnectionGUID: J2PH472QTfurlv7mhpy96g==
X-CSE-MsgGUID: 6cXoiDBDToyiKyfRHo3OXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="158060593"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 15:08:01 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, swati2.sharma@intel.com, karthik.b.s@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 2/2] tests/kms_plane_scaling: Simplify pixel format
 test flow
Date: Wed, 16 Jul 2025 03:38:10 +0530
Message-ID: <20250715220810.287204-3-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250715220810.287204-1-ramanaidu.naladala@intel.com>
References: <20250715220810.287204-1-ramanaidu.naladala@intel.com>
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

This patch improves the structure and clarity of the scaler pixel
format tests by adopting a more modular and scalable approach.
Rather than handling all pixel format variations within a single
test block, the tests are now divided into distinct subtests for
each pixel format model.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_plane_scaling.c | 124 ++++++++++++++++++++++++++++----------
 1 file changed, 91 insertions(+), 33 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 63d35d76b..922d984a0 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -89,13 +89,25 @@
  */
 
 /**
- * SUBTEST: plane-scaler-unity-scaling-with-pixel-format
+ * SUBTEST: plane-scaler-unity-scaling-with-pixel-format-rgb
+ * Description: Tests scaling with pixel formats, unity scaling.
+ *
+ * SUBTEST: plane-scaler-unity-scaling-with-pixel-format-packed
+ * Description: Tests scaling with pixel formats, unity scaling.
+ *
+ * SUBTEST: plane-scaler-unity-scaling-with-pixel-format-planar
  * Description: Tests scaling with pixel formats, unity scaling.
  *
  * SUBTEST: plane-scaler-with-clipping-clamping-pixel-formats
  * Description: Tests scaling with clipping and clamping, pixel formats.
  *
- * SUBTEST: plane-upscale-%s-with-pixel-format
+ * SUBTEST: plane-upscale-%s-with-pixel-format-rgb
+ * Description: Tests upscaling with pixel formats %arg[1].
+ *
+ * SUBTEST: plane-upscale-%s-with-pixel-format-packed
+ * Description: Tests upscaling with pixel formats %arg[1].
+ *
+ * SUBTEST: plane-upscale-%s-with-pixel-format-planar
  * Description: Tests upscaling with pixel formats %arg[1].
  *
  * arg[1]:
@@ -105,7 +117,13 @@
  */
 
 /**
- * SUBTEST: plane-downscale-factor-%s-with-pixel-format
+ * SUBTEST: plane-downscale-factor-%s-with-pixel-format-rgb
+ * Description: Tests downscaling with pixel formats for %arg[1] scaling factor.
+ *
+ * SUBTEST: plane-downscale-factor-%s-with-pixel-format-packed
+ * Description: Tests downscaling with pixel formats for %arg[1] scaling factor.
+ *
+ * SUBTEST: plane-downscale-factor-%s-with-pixel-format-planar
  * Description: Tests downscaling with pixel formats for %arg[1] scaling factor.
  *
  * arg[1]:
@@ -204,6 +222,7 @@ typedef struct {
 	igt_display_t display;
 	struct igt_fb fb[4];
 	bool extended;
+	const char *pixel_format_type;
 } data_t;
 
 struct invalid_paramtests {
@@ -815,7 +834,14 @@ test_scaler_with_pixel_format_pipe(data_t *d, double sf_plane,
 
 			if (test_format(d, &tested_formats, format) &&
 			    igt_plane_has_format_mod(plane, format, modifier) &&
-			    can_scale(d, format))
+			    can_scale(d, format)) {
+				if (strcmp(d->pixel_format_type, "packed") == 0) {
+					if (!igt_format_is_packedyuv(format))
+						continue;
+				} else if (strcmp(d->pixel_format_type, "planar") == 0) {
+					if (!igt_format_is_planaryuv(format))
+						continue;
+				}
 				ret = check_scaling_pipe_plane_rot(d, plane,
 								   format, modifier,
 								   sf_plane,
@@ -823,9 +849,10 @@ test_scaler_with_pixel_format_pipe(data_t *d, double sf_plane,
 								   is_upscale,
 								   pipe, output,
 								   IGT_ROTATION_0);
-			if (ret != 0) {
-				igt_vec_fini(&tested_formats);
-				return ret;
+				if (ret != 0) {
+					igt_vec_fini(&tested_formats);
+					return ret;
+				}
 			}
 		}
 		igt_vec_fini(&tested_formats);
@@ -1324,6 +1351,62 @@ pipe_output_combo_valid(igt_display_t *display,
 	return ret;
 }
 
+static void
+scaler_pixel_format(data_t *d, uint32_t index)
+{
+	uint32_t ret = -EINVAL;
+	uint32_t z;
+	char subtest_name[128];
+	enum pipe pipe;
+	igt_output_t *output;
+
+	const char *append[3] = {
+		"rgb",
+		"planar",
+		"packed"
+	};
+
+	for (z = 0; z < ARRAY_SIZE(append); z++) {
+		snprintf(subtest_name, sizeof(subtest_name), "%s-%s",
+			 scaler_with_pixel_format_tests[index].name,
+			 append[z]);
+
+		igt_subtest_with_dynamic(subtest_name) {
+			d->pixel_format_type = append[z];
+
+			for_each_pipe(&d->display, pipe) {
+				igt_dynamic_f("pipe-%s",
+					      kmstest_pipe_name(pipe)) {
+					for_each_valid_output_on_pipe(&d->display,
+								      pipe,
+								      output) {
+						igt_info("Trying on %s\n",
+							 igt_output_name(output));
+						if (!pipe_output_combo_valid(&d->display,
+									     pipe, output))
+							continue;
+						if (get_num_scalers(&d->display, pipe) < 1)
+							continue;
+
+						ret = test_scaler_with_pixel_format_pipe(d,
+								scaler_with_pixel_format_tests[index].sf,
+								false,
+								scaler_with_pixel_format_tests[index].is_upscale,
+								pipe, output);
+						if (ret == 0)
+							break;
+						igt_info("Required scaling operation not supported on %s trying on next output\n",
+							 igt_output_name(output));
+					}
+					igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
+						      "Unsupported scaling operation in driver with return value %s\n",
+						      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
+				}
+			}
+		}
+	}
+}
+
 static int opt_handler(int opt, int opt_index, void *_data)
 {
 	data_t *data = _data;
@@ -1365,32 +1448,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 		for (int index = 0; index < ARRAY_SIZE(scaler_with_pixel_format_tests); index++) {
 			igt_describe(scaler_with_pixel_format_tests[index].describe);
-			igt_subtest_with_dynamic(scaler_with_pixel_format_tests[index].name) {
-				for_each_pipe(&data.display, pipe) {
-					igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
-						for_each_valid_output_on_pipe(&data.display, pipe, output) {
-							igt_info("Trying on %s\n", igt_output_name(output));
-							if (!pipe_output_combo_valid(&data.display, pipe, output))
-								continue;
-							if (get_num_scalers(&data.display, pipe) < 1)
-								continue;
-
-							ret = test_scaler_with_pixel_format_pipe(&data,
-									scaler_with_pixel_format_tests[index].sf,
-									false,
-									scaler_with_pixel_format_tests[index].is_upscale,
-									pipe, output);
-							if (ret == 0)
-								break;
-							igt_info("Required scaling operation not supported on %s trying on next output\n",
-								 igt_output_name(output));
-						}
-						igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
-							      "Unsupported scaling operation in driver with return value %s\n",
-							      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
-					}
-				}
-			}
+			scaler_pixel_format(&data, index);
 		}
 
 		for (int index = 0; index < ARRAY_SIZE(scaler_with_rotation_tests); index++) {
-- 
2.43.0

