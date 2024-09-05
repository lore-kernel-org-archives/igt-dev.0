Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4354CD5BCE
	for <igt-dev@archiver.kernel.org>; Thu,  5 Sep 2024 14:51:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 660FB10E8DE;
	Thu,  5 Sep 2024 14:51:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hyD+v5RR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3C2510E8E4
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Sep 2024 14:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725547896; x=1757083896;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CrpdyCAQMmpsP2OPshaGpgWS5lGAjYxPmLbm/TBc3eg=;
 b=hyD+v5RRa5fbK3N1kht4iIEkTm/JaGJN9rQ1MQxgWFZSE3gmE0on4BP3
 ONNaj4y3kuqewVdJTN1wcAfZi7kLzVuAX32Hfa2k+ayMCbW6Wy3mKYCJD
 hUlJcAr7U5IHEz1+n8SdIYtzPyxQUpPepNTccpOR8pm/vAESiu2gvc9ze
 kcPYgJHQTHQQYh44GYsSivFkdT4eTgpYQv9feF9eEQRgptv0JCB4beQyQ
 NsqQXau2vaGe6CbSTdqWRtSUMV5uINcDOrVuNxhcI518xBvOJXFxJzkIU
 Kc0cl6sNBXawN6NoHimNbQLLWLxM/s3osr2lot5t3PO8sgIGStoDgWCo0 Q==;
X-CSE-ConnectionGUID: msfT+DEOSuC0e2vyb7X0fg==
X-CSE-MsgGUID: +cqkI2nwRWexZEQpKZwfmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="24145533"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="24145533"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 07:51:17 -0700
X-CSE-ConnectionGUID: 8OKF6AKqQi+mgKmq5nX/xw==
X-CSE-MsgGUID: FQzwU9qCQZagMz2VUt46WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="88887214"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 07:51:15 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 3/5] tests/kms_plane_scaling: Return error code in
 test_planes_scaling_combo
Date: Thu,  5 Sep 2024 20:20:36 +0530
Message-ID: <20240905145038.1569226-4-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240905145038.1569226-1-ramanaidu.naladala@intel.com>
References: <20240905145038.1569226-1-ramanaidu.naladala@intel.com>
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

Change the return type of test_planes_scaling_combo from void to
uint32_t to return error codes. Modify the loop in
scaler_with_2_planes_tests to break on successful
test_planes_scaling_combo execution.

v1: fix crash issues. (swati)

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_plane_scaling.c | 37 ++++++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index f03a73a5e..5d69eabf4 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -933,7 +933,7 @@ static void setup_fb(int fd, int width, int height, struct igt_fb *fb)
 		      fb);
 }
 
-static void
+static uint32_t
 test_planes_scaling_combo(data_t *d, double sf_plane1,
 			  double sf_plane2,
 			  enum pipe pipe,
@@ -997,13 +997,14 @@ test_planes_scaling_combo(data_t *d, double sf_plane1,
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
@@ -1524,25 +1525,27 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
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
+				for_each_pipe(&data.display, pipe) {
+					igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
+						for_each_valid_output_on_pipe(&data.display, pipe, output) {
+							if (!pipe_output_combo_valid(&data.display, pipe, output))
+								continue;
+							if (get_num_scalers(&data.display, pipe) < 2)
+								continue;
+							ret = test_planes_scaling_combo(&data,
 								scaler_with_2_planes_tests[index].sf_plane1,
 								scaler_with_2_planes_tests[index].sf_plane2,
 								pipe, output,
 								scaler_with_2_planes_tests[index].test_type);
+							if (ret == 0)
+								break;
+						}
+						igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
+							      "Unsupported scaling operation in driver with return value %s\n",
+							      (ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
 					}
-					break;
 				}
 			}
-			}
 		}
 
 		for (int index = 0; index < ARRAY_SIZE(intel_paramtests); index++) {
-- 
2.43.0

