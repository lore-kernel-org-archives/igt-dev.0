Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0EE6CD5BD0
	for <igt-dev@archiver.kernel.org>; Thu,  5 Sep 2024 14:51:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E948410E8E5;
	Thu,  5 Sep 2024 14:51:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BeOenuLk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25A0D10E8E5
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Sep 2024 14:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725547896; x=1757083896;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cEOi7uvKtJqKDHgoLgMkieynxqMAwZHIITqKpqRRw6I=;
 b=BeOenuLkQ0NnQmaxMWd8voD/UOCkJsPuTebRp2BdLxpljTAiTTdEw+aN
 AAzeXGUXTC99ovivNFyuc6itprXNHuTloyCtB4qRdWQ4yHLwrP4Umwqgc
 +n5M4eql4pOg6raYJ42Lh+ZRLyfG7iXfCutNAxRaL/rYJ6PSCZmkbF1sb
 aTIACA8YH0GB1e5jILD3+3+RGAbhA43zI5Xi/jKCmhL1/IdTLKq1mLg2d
 8X4uUjtxAvMb+ZxnlqUozZIFd4d6/3scBchsF9OGigBI+bCaTYNczJNON
 PQTMihg1aF51B0vZZooLHCiCBOr3gAKMj5RjrqelxFgiXVZJXbz7WUrjX w==;
X-CSE-ConnectionGUID: qbJP2MPLRS6/8o61XfrRVg==
X-CSE-MsgGUID: B3pVhJaaSiinrzF1LKOz8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="24145538"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="24145538"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 07:51:19 -0700
X-CSE-ConnectionGUID: HF4h0/IyQ+O48Hi60YsbdQ==
X-CSE-MsgGUID: Kh2nxZ7kQieFovQOIQCjXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; d="scan'208";a="88887223"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 07:51:17 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 4/5] tests/kms_plane_scaling: Add debug logs for
 output scaling attempts
Date: Thu,  5 Sep 2024 20:20:37 +0530
Message-ID: <20240905145038.1569226-5-ramanaidu.naladala@intel.com>
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

This will introduces additional debug information to the
kms_plane_scaling test. The new logs provide clarity on which
outputs are being tested for scaling operations and indicate
when a required scaling operation is not supported.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_plane_scaling.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 5d69eabf4..04264d35d 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -1528,6 +1528,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 				for_each_pipe(&data.display, pipe) {
 					igt_dynamic_f("pipe-%s", kmstest_pipe_name(pipe)) {
 						for_each_valid_output_on_pipe(&data.display, pipe, output) {
+							igt_info("Trying on %s\n",
+								 igt_output_name(output));
 							if (!pipe_output_combo_valid(&data.display, pipe, output))
 								continue;
 							if (get_num_scalers(&data.display, pipe) < 2)
@@ -1539,6 +1541,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 								scaler_with_2_planes_tests[index].test_type);
 							if (ret == 0)
 								break;
+							igt_info("Required Scaling operation not supported on %s trying on next output\n",
+								 igt_output_name(output));
 						}
 						igt_skip_on_f(ret == -ERANGE || ret == -EINVAL,
 							      "Unsupported scaling operation in driver with return value %s\n",
-- 
2.43.0

