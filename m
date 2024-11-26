Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7902ED5A6DF
	for <igt-dev@archiver.kernel.org>; Tue, 26 Nov 2024 05:46:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1111410E799;
	Tue, 26 Nov 2024 05:46:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e9LEflgA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2306110E799
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Nov 2024 05:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732599980; x=1764135980;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UbuBmZz5vC2c5M4qy1jyHBff6EPyxZHXfCDBHsJnkIc=;
 b=e9LEflgAtw7O7AZIaxu/rX43f9eDRMBCM5HKmYzyag1S2uyY4L3sJn7a
 Tudsyu5eud12Nt04CUqawUvMuiPglEIO3isE+hoIMuyXxHaVCJPTLtJ1a
 u/+8YSQ75Gj4xiWJsHWgSt+CDuYWaEbUu7xnBVPmfJfkTbM+rC8Rj/yVL
 9M0BMec/gUSVbJkj+xrx6mmDeFO+7WAqTm1uC/0/24R/heyubHuTO4q9B
 AQO/y58Iv0RisXZe/wPhMC82El3XuP4wyamFWwupr/sLI5Blns/jKh49F
 +hamtwROgfhJRIRXD/cbw97n5ozuGqUKUjJovscgEQZithJrLRrvwu9+e w==;
X-CSE-ConnectionGUID: T+yB4rlCT7u/hMpg1rDoQw==
X-CSE-MsgGUID: FpumUMkxRySsiyfzWPOjpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="32599989"
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; d="scan'208";a="32599989"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 21:46:20 -0800
X-CSE-ConnectionGUID: iS3NX4zYRM2CmGfX/uSqwQ==
X-CSE-MsgGUID: 9/YcoZrpS0WGFa5qm5Yf9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,185,1728975600"; d="scan'208";a="91912615"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa007.jf.intel.com with ESMTP; 25 Nov 2024 21:46:18 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com, jeevan.b@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v2] tests/intel/kms_dsc: Add meaningfull skip message
Date: Tue, 26 Nov 2024 11:16:58 +0530
Message-Id: <20241126054658.1951121-1-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
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

This patch adds a proper skip message which will be
easy to debug.

v2: Small clean up in if statement

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
Reviewed-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_dsc.c | 34 ++++++++++++++++++----------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
index 9b48caf76..5ebb12e9d 100644
--- a/tests/intel/kms_dsc.c
+++ b/tests/intel/kms_dsc.c
@@ -280,21 +280,6 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
 		data->output = output;
 		data->pipe = pipe;
 
-		if (!is_dsc_supported_by_sink(data->drm_fd, data->output) ||
-		    !check_gen11_dp_constraint(data->drm_fd, data->output, data->pipe) ||
-		     igt_get_output_max_bpc(data->drm_fd, output->name) < MIN_DSC_BPC)
-			continue;
-
-		if ((test_type & TEST_DSC_OUTPUT_FORMAT) &&
-		    (!is_dsc_output_format_supported(data->drm_fd, data->disp_ver,
-						     data->output, data->output_format)))
-			continue;
-
-		if ((test_type & TEST_DSC_FRACTIONAL_BPP) &&
-		    (!is_dsc_fractional_bpp_supported(data->disp_ver,
-						      data->drm_fd, data->output)))
-			continue;
-
 		if (test_type & TEST_DSC_OUTPUT_FORMAT)
 			snprintf(&name[0][0], LEN, "-%s", kmstest_dsc_output_format_str(data->output_format));
 		if (test_type & TEST_DSC_FORMAT)
@@ -303,8 +288,25 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
 			snprintf(&name[2][0], LEN, "-%dbpc", data->input_bpc);
 
 		igt_dynamic_f("pipe-%s-%s%s%s%s",  kmstest_pipe_name(data->pipe), data->output->name,
-			      &name[0][0], &name[1][0], &name[2][0])
+			      &name[0][0], &name[1][0], &name[2][0]) {
+			if (!is_dsc_supported_by_sink(data->drm_fd, data->output) ||
+			    !check_gen11_dp_constraint(data->drm_fd, data->output, data->pipe) ||
+			    igt_get_output_max_bpc(data->drm_fd, output->name) < MIN_DSC_BPC)
+				continue;
+
+			if ((test_type & TEST_DSC_OUTPUT_FORMAT) &&
+			    (!is_dsc_output_format_supported(data->drm_fd, data->disp_ver,
+							     data->output, data->output_format)))
+				igt_skip("DSC %s output format not supported on pipe-%s\n",
+					 kmstest_dsc_output_format_str(data->output_format),
+					 kmstest_pipe_name(data->pipe));
+
+			if ((test_type & TEST_DSC_FRACTIONAL_BPP) &&
+			    (!is_dsc_fractional_bpp_supported(data->disp_ver,
+							      data->drm_fd, data->output)))
+				continue;
 			update_display(data, test_type);
+		}
 
 		if (data->limited)
 			break;
-- 
2.34.1

