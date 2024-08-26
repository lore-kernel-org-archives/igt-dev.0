Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF378C5321E
	for <igt-dev@archiver.kernel.org>; Mon, 26 Aug 2024 04:57:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A022C10E0E7;
	Mon, 26 Aug 2024 04:57:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cH6MmYYp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13B4010E0E6
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Aug 2024 04:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724648222; x=1756184222;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=quMxZ50DpATcTVRekMlg6TGGUdQ5x6bzDN9Id7f8O8U=;
 b=cH6MmYYpomFnvgOtIb7NeykwdYXq1XGeNLsXC7mzZvn+anYrdvuBno6c
 SS+DLwb89SJM8gxr7L1F/RCIhLQ70296pRca4gjvWSGZPP8pBYmnfCwla
 MNhVXxSWNOT37c/UkJN61dIHS4W2l+Y9OvojC7lijfeLeH3YRi/Rv6blE
 ZnakMH0p0DlEAwdLsQcfqcHiarkVhcyCMONHvl63N6En6typ2YyOXE/6G
 ZEwumVgKNgFw0S/YeSH0tyti0aC1MIkH/nB3B3/0HnEFaebpbhbz6Gsa/
 2wuJfOWg+7rNro5rbkBvDmX1yaIVOsa2XVbKpbu6fTWsAwGoTsQuKTYe6 A==;
X-CSE-ConnectionGUID: tNqiCU8XSU2xpJ+cArzrlw==
X-CSE-MsgGUID: L4/hRjCCRmC9LpSxcAPdHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="26845193"
X-IronPort-AV: E=Sophos;i="6.10,176,1719903600"; d="scan'208";a="26845193"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2024 21:57:02 -0700
X-CSE-ConnectionGUID: VLLM1zkJTxCPHuH6InJDkQ==
X-CSE-MsgGUID: BtXx++aTSZyGqwg5xlLaLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,176,1719903600"; d="scan'208";a="99886301"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2024 21:56:58 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, kunal1.joshi@intel.com, karthik.b.s@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t 2/3] tests/kms_plane_scaling: Update Multi-plane scaling
 functions
Date: Mon, 26 Aug 2024 10:26:29 +0530
Message-ID: <20240826045630.1340226-3-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826045630.1340226-1-ramanaidu.naladala@intel.com>
References: <20240826045630.1340226-1-ramanaidu.naladala@intel.com>
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

