Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1595C52D7B
	for <igt-dev@archiver.kernel.org>; Tue, 13 Aug 2024 05:48:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F4C510E2A5;
	Tue, 13 Aug 2024 05:48:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lDFqpdIA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B2D010E2A5
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Aug 2024 05:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723528116; x=1755064116;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YMHCX2Y2aLSWCXtsVfmphIzWY96DJKCj835jZcgeH0M=;
 b=lDFqpdIAwC2rFwHcdO7z9ShrDAsw9U9bpM+eaRThT6CH697FptL0vPkq
 4eUm4U1OmQ/Ob1pCp+ZUB7oxDsYNlh2U/QnmfjpRYqayLjNvkpTsRz1bl
 fAjapWPSaCGbdMbwpYZocdHFfiy1FgSW4cs/1NxMCXMnCzMzIjewrjD6j
 jiBEnzSb6nSWC8oSLV0ASgbPnafrUseaTCiAt9OqJ5kUrnwnhM6RU22l6
 j91QypRyb1o1Wrg0G0GuUAl/C8eqhe22D9G6DLw73JiBkNgY1gJRpyY3l
 qwCDfAV2a27UK398q5JhkX6GnJfKKxfJjRDIMZVCOTKxbvDRPVXvR4ClQ A==;
X-CSE-ConnectionGUID: yYvdGbw6RY+Ric5+XxM3fw==
X-CSE-MsgGUID: CipLGCpiR6m/N5OYOqLXOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="25459889"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="25459889"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 22:48:24 -0700
X-CSE-ConnectionGUID: FD06ULvtRHuN9mXt2mCwKg==
X-CSE-MsgGUID: qlwBA3EjTQGE9/T0UiF52w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="58623747"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 22:48:22 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [i-g-t 1/4] tests/kms_color: Add more logs to skips
Date: Tue, 13 Aug 2024 11:08:42 +0530
Message-ID: <20240813053845.2567954-2-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240813053845.2567954-1-bhanuprakash.modem@intel.com>
References: <20240813053845.2567954-1-bhanuprakash.modem@intel.com>
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

Debugging would be easier if we had logs available for
test failures and skips. This patch adds print statements
at crucial points to provide better insights.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_color.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 645a03537..5f0128bca 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -893,11 +893,18 @@ run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
 		uint64_t max_bpc = get_max_bpc(output);
 		bool ret;
 
-		if (!max_bpc)
+		if (!max_bpc) {
+			igt_info("Output %s: Doesn't support \"max bpc\" property.\n",
+				 igt_output_name(output));
 			continue;
+		}
 
-		if (!panel_supports_deep_color(data->drm_fd, output->name))
+		if (!panel_supports_deep_color(data->drm_fd, output->name)) {
+			igt_info("Output %s: Doesn't support deep-color.\n",
+				 igt_output_name(output));
 			continue;
+		}
+
 		/*
 		 * In intel driver, for MST streams pipe_bpp is
 		 * restricted to 8bpc. So, deep-color >= 10bpc
@@ -905,16 +912,22 @@ run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
 		 * supports 10bpc. Once KMD FIXME, is resolved
 		 * this MST constraint can be removed.
 		 */
-		if (is_intel_device(data->drm_fd) && igt_check_output_is_dp_mst(output))
+		if (is_intel_device(data->drm_fd) && igt_check_output_is_dp_mst(output)) {
+			igt_info("Output %s: DP-MST doesn't support deep-color on Intel hardware.\n",
+				 igt_output_name(output));
 			continue;
+		}
 
 		igt_display_reset(&data->display);
 		igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, 10);
 		igt_output_set_pipe(output, p);
 
 		if (is_intel_device(data->drm_fd) &&
-		    !igt_max_bpc_constraint(&data->display, p, output, 10))
+		    !igt_max_bpc_constraint(&data->display, p, output, 10)) {
+			igt_info("Output %s: Doesn't support 10-bpc.\n",
+				 igt_output_name(output));
 			continue;
+		}
 
 		data->color_depth = 10;
 		data->drm_format = DRM_FORMAT_XRGB2101010;
-- 
2.43.2

