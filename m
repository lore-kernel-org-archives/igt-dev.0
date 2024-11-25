Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F71CD3B7CC
	for <igt-dev@archiver.kernel.org>; Mon, 25 Nov 2024 03:23:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2170E10E021;
	Mon, 25 Nov 2024 03:23:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P5hme34w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3D2410E021
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Nov 2024 03:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732505022; x=1764041022;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=e4I2bcdjoW1ejU/iU64uiK/M/QBkb3sfYhzWZt/jNe8=;
 b=P5hme34weIStzLKFZxCUCi60wy/w7JMeOMyxwQOL4mUxBtQ7/8YTjxbk
 Nbw+nBFnfUxsleXTGzFUQPO+q4xHCWb3fPYgI9FBFncXJL8rDzuMJK5AG
 Kfp2JzpwP5Rxe6R+EEyKx05qv58QO9WjHEcYG8pICU7/923u5nn6qzK+g
 8aUB67KMtrTogSPrVVelujgfPHLFdTVL09K49BmgMcRwP+ImKuEZzgrB8
 22pWetwvnrs9ogow26LTLqfNT5Kz+zmx8C648HBSC/JMUKWtVCtt/Al14
 nj1WLqsRS00CZZFjf12WRKAVBOEnkTxGQ4dX/xpDAVl438sv2ZzHlvRBT w==;
X-CSE-ConnectionGUID: t8H2Ky1wS2yZRXhMIl0FXg==
X-CSE-MsgGUID: /2iof6FkR9uEfTCIo1iwZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="32453287"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="32453287"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2024 19:23:42 -0800
X-CSE-ConnectionGUID: G2n40HY7RtSb92yCp//fJQ==
X-CSE-MsgGUID: gtJyrYxBT3WMFdx2Hqb/uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="91033365"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa010.jf.intel.com with ESMTP; 24 Nov 2024 19:23:41 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com, jeevan.b@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t] tests/intel/kms_dsc: Add meaningfull skip message
Date: Mon, 25 Nov 2024 08:54:20 +0530
Message-Id: <20241125032420.1945935-1-pranay.samala@intel.com>
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

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/intel/kms_dsc.c | 36 ++++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
index 9b48caf76..65b0d262c 100644
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
@@ -303,8 +288,27 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
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
+							     data->output, data->output_format))) {
+				igt_skip("DSC %s output format not supported on pipe-%s\n",
+					 kmstest_dsc_output_format_str(data->output_format),
+					 kmstest_pipe_name(data->pipe));
+				continue;
+			}
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

