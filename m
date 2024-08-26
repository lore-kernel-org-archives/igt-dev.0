Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D279C5321D
	for <igt-dev@archiver.kernel.org>; Mon, 26 Aug 2024 04:54:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FB3210E0D8;
	Mon, 26 Aug 2024 04:54:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N6qG8DPV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 604C710E0D8
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Aug 2024 04:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724648069; x=1756184069;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=quMxZ50DpATcTVRekMlg6TGGUdQ5x6bzDN9Id7f8O8U=;
 b=N6qG8DPVJEfBHhLeZalTS2iM5dfrISfsGGeEsiSrS5sM5OwlIbV2w1d4
 +z8xI9L66j/RZCZPVAqwB/7Ewi3/he6bEAjDcdx3Q6CpDE4kLbna2hkA+
 Clc7oajcRUORWxK0NaL+CB9UVrRXg75C4jjhgq+WFz2lVHjubv/lZU5Vf
 nlSI8xBQjYLGaO2XEI21eU4xMpFNiOXbI/vBBSSrMw6iVBKf84HG/RPvT
 fImFyNVA7Qf+ssK/xAd5lyB4xcdrwqoxfO1KoWX9fHiDu6PRUKoFIkPL5
 9Z9lKk5S0XRnwPCZ2hiqF13m/abYSPnJ/2lf4QxjRft0yPoRQrVDGEDqi w==;
X-CSE-ConnectionGUID: XWu9IJo3TfeoxCyUZHa1Tg==
X-CSE-MsgGUID: VJMVxxOjRVmZdqhiE4yArA==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="26815360"
X-IronPort-AV: E=Sophos;i="6.10,176,1719903600"; d="scan'208";a="26815360"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2024 21:54:22 -0700
X-CSE-ConnectionGUID: y3rHktFMRLm4T7+RGrvsmA==
X-CSE-MsgGUID: QoAVPfcGQ96PBerqP1Xq5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,176,1719903600"; d="scan'208";a="62363993"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2024 21:54:20 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, kunal1.joshi@intel.com, karthik.b.s@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t 2/3] tests/kms_plane_scaling: Update Multi-plane scaling
 functions
Date: Mon, 26 Aug 2024 10:23:49 +0530
Message-ID: <20240826045351.1340125-3-ramanaidu.naladala@intel.com>
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

This update enhances the multi-plane scaling subtest function by
improving error handling. The return type of
test_planes_scaling_combo has been changed from void to int. The
test logic has been updated to handle the return value appropriately
and skip unsupported scaling operations.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_plane_scaling.c | 49 ++++++++++++++++++++++-----------------
 1 file changed, 28 insertions(+), 21 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 588a9c5f0..d4d3664e8 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -930,7 +930,7 @@ static void setup_fb(int fd, int width, int height, struct igt_fb *fb)
 		      fb);
 }
 
-static void
+static int
 test_planes_scaling_combo(data_t *d, double sf_plane1,
 			  double sf_plane2,
 			  enum pipe pipe,
@@ -994,13 +994,14 @@ test_planes_scaling_combo(data_t *d, double sf_plane1,
 							  pipe, output, p1, p2,
 							  &d->fb[1], &d->fb[2],
 							  test_type);
-			if (ret != 0)
-				break;
+			if (ret != 0) {
+				cleanup_fbs(d);
+				return ret;
+			}
 		}
 		cleanup_fbs(d);
 	}
-	igt_skip_on_f(ret == -EINVAL || ret == -ERANGE, "Unsupported scaling operation in driver with return value %s\n",
-		      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
+	return ret;
 }
 
 static void
@@ -1523,25 +1524,31 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 		for (int index = 0; index < ARRAY_SIZE(scaler_with_2_planes_tests); index++) {
 			igt_describe(scaler_with_2_planes_tests[index].describe);
 			igt_subtest_with_dynamic(scaler_with_2_planes_tests[index].name) {
-			for_each_pipe(&data.display, pipe) {
-				for_each_valid_output_on_pipe(&data.display, pipe, output) {
-					if (!pipe_output_combo_valid(&data.display, pipe, output))
-						continue;
-					if (get_num_scalers(&data.display, pipe) < 2)
-						continue;
-
-					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), igt_output_name(output)) {
-
-						test_planes_scaling_combo(&data,
-								scaler_with_2_planes_tests[index].sf_plane1,
-								scaler_with_2_planes_tests[index].sf_plane2,
-								pipe, output,
-								scaler_with_2_planes_tests[index].test_type);
+				for_each_pipe(&data.display, pipe) {
+					igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
+						for_each_valid_output_on_pipe(&data.display, pipe, output) {
+							igt_info(" Trying on %s\n", igt_output_name(output));
+							if (!pipe_output_combo_valid(&data.display, pipe, output))
+								continue;
+							if (get_num_scalers(&data.display, pipe) < 2)
+								continue;
+							ret = test_planes_scaling_combo(&data,
+									scaler_with_2_planes_tests[index].sf_plane1,
+									scaler_with_2_planes_tests[index].sf_plane2,
+									pipe, output,
+									scaler_with_2_planes_tests[index].test_type);
+							if (ret == 0)
+								break;
+							igt_info("Required Scaling operation not supported on %s trying on next valid output\n",
+								  igt_output_name(output));
+						}
+						igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
+							      "Unsupported scaling operation in driver with return value %s\n",
+							      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
+						igt_assert_eq(ret, 0);
 					}
-					break;
 				}
 			}
-			}
 		}
 
 		for (int index = 0; index < ARRAY_SIZE(intel_paramtests); index++) {
-- 
2.43.0

