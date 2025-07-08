Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36BD7C83F09
	for <igt-dev@archiver.kernel.org>; Tue,  8 Jul 2025 03:56:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E139410E0A4;
	Tue,  8 Jul 2025 03:56:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WkKtOYJc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05A8910E0A4
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Jul 2025 03:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751947007; x=1783483007;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1Q7ryMe131iOYiSuXLphSBwgnrP/nftk7nnbzG1NkBk=;
 b=WkKtOYJcvt8fSwOVeMLlhBsHl4FI/GSVtYyAm17uoNjVmvMLJ6E1cW3E
 u1n6I3fIgjxSKy42U0fbkAG/ASxgvbCik9gVKwKo+NLQBWHLSv2wTkTuB
 Pp9tlKDN9JDMgpqAM+h+w/zz1GBa5OAth71vq7W02dCKXJx52PDkJQrfC
 Z/qY7NYaeWo5TvAGFXc3aTcXeyV4dsIAWgfJdgtPFfIT38rbPed0mcgEH
 KuaQv6z+YQhV802voTU4LihaZqV5IoOvritmovTRkRkRzr2XPtidH5ENK
 xnDHEg+Fr1JM6rQPqOTxwgSLryLFrQ96HhfGjJ4BHrpVrP3DK//NPOZzr g==;
X-CSE-ConnectionGUID: CuRjp1wYR2ijWUVByMcQJA==
X-CSE-MsgGUID: BkRsHq83Q2eHT9XP3PUOyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="64765009"
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; d="scan'208";a="64765009"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 20:56:47 -0700
X-CSE-ConnectionGUID: Nkecm6OkRhqN64xE9xzcUA==
X-CSE-MsgGUID: 69MtH6iSQ/iSM25lYnicVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; d="scan'208";a="179051030"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa002.fm.intel.com with ESMTP; 07 Jul 2025 20:56:45 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t] tests/kms_bw: Restrict linear-tiling subtest to HDMI
 outputs and improve skip logic
Date: Tue,  8 Jul 2025 09:34:25 +0530
Message-Id: <20250708040425.950013-1-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This patch updates the linear-tiling subtest in kms_bw to only use HDMI
connector. If the platform does not have enough HDMI outputs to match the
number of requested pipes, the test is skipped with a clear message
indicating the requirement and the number of HDMI outputs found.

This avoids attempting to force modes on non-HDMI connectors and makes
the test results clearer and more reliable on systems that don’t have
enough HDMI connectivity.

v2:
- Skip the test instead of continue (Rama)
- Remove hdmi_count (Rama)

v3:
- Only force mode if mode is not present

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_bw.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/tests/kms_bw.c b/tests/kms_bw.c
index ca05695d3..c09b80dd7 100644
--- a/tests/kms_bw.c
+++ b/tests/kms_bw.c
@@ -195,6 +195,7 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
 	int i = 0, num_pipes = 0;
 	enum pipe p;
 	int ret;
+	bool mode_found = false;
 
 	/* Cannot use igt_display_get_n_pipes() due to fused pipes on i915 where they do
 	 * not give the numver of valid crtcs and always return IGT_MAX_PIPES */
@@ -215,7 +216,24 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
 			continue;
 		}
 
-		force_output_mode(data, output, mode);
+		// Check if the mode is present in the output's mode list
+		for (int m = 0; m < output->config.connector->count_modes; m++) {
+			if (output->config.connector->modes[m].hdisplay == mode->hdisplay &&
+			    output->config.connector->modes[m].vdisplay == mode->vdisplay){
+				mode_found = true;
+				break;
+			}
+		}
+
+		if (!mode_found) {
+			if (!physical &&
+			    output->config.connector->connector_type != DRM_MODE_CONNECTOR_HDMIA &&
+			    output->config.connector->connector_type != DRM_MODE_CONNECTOR_HDMIB)
+				force_output_mode(data, output, mode);
+		} else {
+			igt_skip("Requested mode not present, can't force mode on %s\n",
+				 igt_output_name(output));
+		}
 
 		igt_create_color_fb(display->drm_fd, mode->hdisplay,
 				    mode->vdisplay, DRM_FORMAT_XRGB8888,
-- 
2.34.1

