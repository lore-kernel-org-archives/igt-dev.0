Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82320E77188
	for <igt-dev@archiver.kernel.org>; Mon, 30 Dec 2024 18:58:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42F7B10E57D;
	Mon, 30 Dec 2024 18:58:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QRDr+RaH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F00EE10E57B
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Dec 2024 18:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735585096; x=1767121096;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ozA090BPagphoAIxb9oyd1MShMSAvmXzcaSl5NayTyc=;
 b=QRDr+RaHdZxPeMPtCLVdM+gT7Xw2bBs0ayeE53YaxUGOZhD8sWYj/KUO
 GCR7iQO50f92PCJIW3sZ05S59fpQm50yB2DbzNcsFNdwqMJvLL7NVBIae
 hGU6C+0wd5g0ERAuX+3BvngF8reAvIFy5uPdT0CZZE6WJAMymCSwtnDBM
 Bm1lgLMUUgydVvVGi/kEWDBVUXtGOIzjOkYNs2SBfCK2mKvr2w6/800Hf
 wOYrg8ttVKfTKXObhJ0LLH0CbIPcSoO93NDjm04yG8pxfJc1aCK1QnZ5s
 JeOJYKOdlJtdULSkMwUK2BGSRjV5MlAs/ZOpiY0cyZJbAtZa4OWUl59Zn A==;
X-CSE-ConnectionGUID: ZLK1Ui3RQG+klejaVHyvRA==
X-CSE-MsgGUID: 0q6cA+sySyqsSp4r7pxK8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="39803542"
X-IronPort-AV: E=Sophos;i="6.12,277,1728975600"; d="scan'208";a="39803542"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2024 10:58:16 -0800
X-CSE-ConnectionGUID: /WJDyOSWTPCCS0jPyAGzUA==
X-CSE-MsgGUID: nL7+WagUQzWpcNgeG+4sIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,277,1728975600"; d="scan'208";a="100728919"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2024 10:58:14 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, santhosh.reddy.guddati@intel.com,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 3/6] tests/intel/kms_cdclk: Add conditions to filter
 valid outputs
Date: Tue, 31 Dec 2024 00:33:12 +0530
Message-Id: <20241230190315.48821-4-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241230190315.48821-1-swati2.sharma@intel.com>
References: <20241230190315.48821-1-swati2.sharma@intel.com>
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

Conditions are added to filter valid outputs. Also, highres and
lowres of valid outputs are stored in an array to be re-used
later.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_cdclk.c | 52 +++++++++++++++++++++++++++++------------
 1 file changed, 37 insertions(+), 15 deletions(-)

diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
index e78d22e1d..dfc64ae2e 100644
--- a/tests/intel/kms_cdclk.c
+++ b/tests/intel/kms_cdclk.c
@@ -261,8 +261,10 @@ static void test_mode_transition_on_all_outputs(data_t *data)
 	igt_display_t *display = &data->display;
 	int debugfs_fd = data->debugfs_fd;
 	drmModeModeInfo *mode, mode_hi, mode_lo;
+	drmModeModeInfo mode_highres[IGT_MAX_PIPES] = {0}, mode_lowres[IGT_MAX_PIPES] = {0};
+	igt_output_t *valid_outputs[IGT_MAX_PIPES] = {NULL};
 	igt_output_t *output;
-	int valid_outputs = 0;
+	int count = 0;
 	int cdclk_ref, cdclk_new;
 	uint16_t width = 0, height = 0;
 	struct igt_fb fb;
@@ -273,31 +275,51 @@ static void test_mode_transition_on_all_outputs(data_t *data)
 	do_cleanup_display(display);
 	igt_display_reset(display);
 
-	for_each_connected_output(&data->display, output)
-		valid_outputs++;
-
-	i = 0;
 	for_each_connected_output(display, output) {
-		mode = igt_output_get_mode(output);
+		drmModeModeInfo highres_mode;
+		drmModeModeInfo lowres_mode;
+
+		highres_mode = *igt_output_get_highres_mode(output);
+		igt_require_f(highres_mode.hdisplay >= HDISPLAY_4K && highres_mode.vdisplay >= VDISPLAY_4K &&
+			      highres_mode.vrefresh >= VREFRESH, "Mode >= 4K not found on output %s.\n",
+			      igt_output_name(output));
+
+		lowres_mode = *get_lowres_mode(output);
+
+		if (highres_mode.hdisplay == lowres_mode.hdisplay &&
+		    highres_mode.vdisplay == lowres_mode.vdisplay) {
+			igt_info("Highest and lowest mode resolutions are same on output %s; no transition will occur, skipping\n",
+				  igt_output_name(output));
+			continue;
+		}
+
+		valid_outputs[count++] = output;
+	}
+
+	igt_skip_on_f(count < 2,
+		      "Number of valid outputs (%d) must be greater than or equal to 2\n", count);
+
+	for (int k = 0; k < count; k++) {
+		mode_highres[k] = *igt_output_get_highres_mode(valid_outputs[k]);
+		mode_lowres[k] = *get_lowres_mode(valid_outputs[k]);
+
+		mode = igt_output_get_mode(valid_outputs[k]);
 		igt_assert(mode);
 
+		// Update the maximum width and height for the framebuffer
 		width = max(width, mode->hdisplay);
 		height = max(height, mode->vdisplay);
 
-		mode_hi = *igt_output_get_highres_mode(output);
-		igt_require_f(mode_hi.hdisplay >= HDISPLAY_4K && mode_hi.vdisplay >= VDISPLAY_4K &&
-			      mode_hi.vrefresh >= VREFRESH, "Mode >= 4K not found on output %s.\n",
-			      igt_output_name(output));
-
-		igt_output_set_pipe(output, i);
-		igt_output_override_mode(output, &mode_hi);
-		i++;
+		igt_output_set_pipe(valid_outputs[k], k);
+		igt_output_override_mode(valid_outputs[k], &mode_highres[k]);
 	}
+
 	igt_require(intel_pipe_output_combo_valid(display));
-	igt_display_reset(display);
 
+	// Create a framebuffer with the maximum dimensions calculated earlier
 	igt_create_pattern_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
 			      DRM_FORMAT_MOD_LINEAR, &fb);
+
 	i = 0;
 	for_each_connected_output(display, output) {
 		pipe = &display->pipes[i];
-- 
2.25.1

