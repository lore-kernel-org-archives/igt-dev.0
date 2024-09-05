Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C5F2CD5BCB
	for <igt-dev@archiver.kernel.org>; Thu,  5 Sep 2024 14:51:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0971310E8E1;
	Thu,  5 Sep 2024 14:51:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CTeWxKbM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC26110E8DB
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Sep 2024 14:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725547894; x=1757083894;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O1pdMinXU/3YbxvlW8YPVW3iWqp36HT1YE6Cq5c5iXQ=;
 b=CTeWxKbMOjTM1wRtgwlLgxBT4G/LVctbqaLb61n9FfIg6BLXvaVMOj+N
 zc/m0z0JWd56kL5ZNCOov+TQNnxKv+PPRA2n419I2uj0Dvd4t8L8Vbqi5
 2bnLXeqKl8fEYqrfMGEgjC+YSY+FJVK6u9Zwky5BziAziGnLzxVMYTVSi
 e9MLOu4ZQr2ky5icznnc7O+gIa6q44dE47ifIcz70Dpj0xsEL2imbMME9
 fl1l1G2MRhW2LRChYkV27613IMvl9ux9dciuYpP+BnwE0awLP6pFwEFKT
 TOGwh4yiGuYvkf39KJKTeLiPt0B+RrCkHVKLgfO7sjSZjHKbgpOneFkPv w==;
X-CSE-ConnectionGUID: LrqCWi6lTO+Fjhvl1Ch70w==
X-CSE-MsgGUID: goKQk7aTQYWF0RLCnHuc5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="24145527"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="24145527"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 07:51:16 -0700
X-CSE-ConnectionGUID: zfL2DEHkTAWVY6TFrJ93Ow==
X-CSE-MsgGUID: FDZ2sC2GT+yTLCtvg6RMAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="88887204"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 07:51:14 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 2/5] tests/kms_plane_scaling: Add informative logs
 for single plane scaling operations
Date: Thu,  5 Sep 2024 20:20:35 +0530
Message-ID: <20240905145038.1569226-3-ramanaidu.naladala@intel.com>
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

This will adds informative logging to the kms_plane_scaling test
Logs indicating which output is being tried for scaling. When a
required scaling operation is not supported on a particular output
and the test is moving to the next output.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_plane_scaling.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 5c5837a51..f03a73a5e 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -1359,6 +1359,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 				for_each_pipe(&data.display, pipe) {
 					igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
 						for_each_valid_output_on_pipe(&data.display, pipe, output) {
+							igt_info("Trying on %s\n", igt_output_name(output));
 							if (!pipe_output_combo_valid(&data.display, pipe, output))
 								continue;
 							if (get_num_scalers(&data.display, pipe) < 1)
@@ -1370,6 +1371,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 									pipe, output);
 							if (ret == 0)
 								break;
+							igt_info("Required Scaling operation not supported on %s trying on next output\n",
+								 igt_output_name(output));
 						}
 						igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
 							      "Unsupported scaling operation in driver with return value %s\n",
@@ -1385,6 +1388,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 				for_each_pipe(&data.display, pipe) {
 					igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
 						for_each_valid_output_on_pipe(&data.display, pipe, output) {
+							igt_info("Trying on %s\n", igt_output_name(output));
 							if (!pipe_output_combo_valid(&data.display, pipe, output))
 								continue;
 							if (get_num_scalers(&data.display, pipe) < 1)
@@ -1397,6 +1401,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 									pipe, output);
 							if (ret == 0)
 								break;
+							igt_info("Required Scaling operation not supported on %s trying on next output\n",
+								 igt_output_name(output));
 						}
 						igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
 							      "Unsupported scaling operation in driver with return value %s\n",
@@ -1412,6 +1418,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 				for_each_pipe(&data.display, pipe) {
 					igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
 						for_each_valid_output_on_pipe(&data.display, pipe, output) {
+							igt_info("Trying on %s\n", igt_output_name(output));
 							if (!pipe_output_combo_valid(&data.display, pipe, output))
 								continue;
 							if (get_num_scalers(&data.display, pipe) < 1)
@@ -1424,6 +1431,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 									pipe, output);
 							if (ret == 0)
 								break;
+							igt_info("Required Scaling operation not supported on %s trying on next output\n",
+								 igt_output_name(output));
 						}
 						igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
 							      "Unsupported scaling operation in driver with return value %s\n",
@@ -1438,6 +1447,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 			for_each_pipe(&data.display, pipe) {
 				igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
 					for_each_valid_output_on_pipe(&data.display, pipe, output) {
+						igt_info("Trying on %s\n", igt_output_name(output));
 						if (!pipe_output_combo_valid(&data.display, pipe, output))
 							continue;
 						if (get_num_scalers(&data.display, pipe) < 1)
@@ -1448,6 +1458,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 											 output);
 						if (ret == 0)
 							break;
+						igt_info("Required Scaling operation not supported on %s trying on next output\n",
+							 igt_output_name(output));
 					}
 					igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
 						      "Unsupported scaling operation in driver with return value %s\n",
@@ -1462,6 +1474,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 			for_each_pipe(&data.display, pipe) {
 				igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
 					for_each_valid_output_on_pipe(&data.display, pipe, output) {
+						igt_info("Trying on %s\n", igt_output_name(output));
 						if (!pipe_output_combo_valid(&data.display, pipe, output))
 							continue;
 						if (get_num_scalers(&data.display, pipe) < 1)
@@ -1472,6 +1485,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 										     output);
 						if (ret == 0)
 							break;
+						igt_info("Required Scaling operation not supported on %s trying on next output\n",
+							 igt_output_name(output));
 					}
 					igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
 						      "Unsupported scaling operation in driver with return value %s\n",
@@ -1485,6 +1500,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 			for_each_pipe(&data.display, pipe) {
 				igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
 					for_each_valid_output_on_pipe(&data.display, pipe, output) {
+						igt_info("Trying on %s\n", igt_output_name(output));
 						if (!pipe_output_combo_valid(&data.display, pipe, output))
 							continue;
 						if (get_num_scalers(&data.display, pipe) < 1)
@@ -1495,6 +1511,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 										     output);
 						if (ret == 0)
 							break;
+						igt_info("Required Scaling operation not supported on %s trying on next output\n",
+							 igt_output_name(output));
 					}
 					igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
 						      "Unsupported scaling operation in driver with return value %s\n",
-- 
2.43.0

