Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DFB0F46113
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 14:00:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA4BA10E11F;
	Mon, 23 Mar 2026 14:00:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="grbmMNfz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE0C410E11F
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 14:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774274417; x=1805810417;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9TBeHLg+FzhP6y/6wUF+8glTXNbSPEXknHb/wHOxpNs=;
 b=grbmMNfzq7IE7g74hMbxbidBPh/J2K9mXYkxT7tUs01oNZ/0rmUBldZj
 s5JGueVHUk8H4V6e02Z4aFo1lbj7ril2iX7qKcD9z466tb9bo8fg9BDjN
 +D9ksa/c9kNHzfLNCMdsc8Mikh51iLhhfZ9l2CLx0tPS3g/f01AHmCZhB
 HGYsRED2EXOKf1zhfuf3A6gRHttt1Vqdddr56Zc/nzJ+orZs98IxqmXDN
 shSgVY/NrW8gNbiV1D20h/0Zhbt/FUZlWv+RG1WKL3MlXUSRZZm+2UpvD
 hyZ0LMRelCJ/Y8ZRDMbXSPlW36yfhr6nZzcj0CSHTSOBxReeQdDn18mGJ Q==;
X-CSE-ConnectionGUID: nN1aGgbbTUimFMX/Cyaddw==
X-CSE-MsgGUID: zDvzmXf2QFK+BtzDqqUZUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="85894532"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="85894532"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 07:00:16 -0700
X-CSE-ConnectionGUID: 8YpScDMgRraxT56tOXAN7g==
X-CSE-MsgGUID: KJKyOzpBT1WpzVWWxyNNIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="223993986"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by orviesa009.jf.intel.com with ESMTP; 23 Mar 2026 07:00:15 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t] tests/intel/kms_sharpness_filter: Fix stale mode
 pointer in joiner bypass
Date: Mon, 23 Mar 2026 19:41:01 +0530
Message-Id: <20260323141101.2657652-1-pranay.samala@intel.com>
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

When joiner mode is detected, the returned mode pointer from
igt_get_non_joiner_mode() points into connector-owned memory
which can become invalid after subsequent display state changes.

Fix this by copying the mode into local variable for stable
storage. Skip the output if no non-joiner mode is found.

Fixes: 10dccc7fc82f ("tests/intel/kms_sharpness_filter: Detect and bypass joiner modes")
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7045
Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/intel/kms_sharpness_filter.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
index 96fb139ae..c2295c0ee 100644
--- a/tests/intel/kms_sharpness_filter.c
+++ b/tests/intel/kms_sharpness_filter.c
@@ -430,6 +430,7 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
 	igt_display_t *display = &data->display;
 	igt_output_t *output;
 	igt_crtc_t *crtc;
+	drmModeModeInfo *m, selected_mode;
 	char name[40];
 
 	for_each_connected_output(display, output) {
@@ -438,7 +439,6 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
 
 			data->output = output;
 			data->crtc = crtc;
-			data->mode = igt_output_get_mode(data->output);
 
 			/*
 			 * FIXME: Joiner + CASF currently unsupported.
@@ -446,7 +446,15 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
 			 * Until then, run on non-joiner mode in joiner configuration.
 			 */
 			if (is_joiner_mode(data->drm_fd, data->output)) {
-				data->mode = igt_get_non_joiner_mode(data->drm_fd, data->output);
+				m = igt_get_non_joiner_mode(data->drm_fd, data->output);
+				if (!m) {
+					igt_info("No non-joiner mode found on %s\n",
+						 igt_output_name(data->output));
+					continue;
+				}
+
+				selected_mode = *m;
+				data->mode = &selected_mode;
 				igt_info("Executing on mode %dx%d@%d\n",
 					 data->mode->hdisplay,
 					 data->mode->vdisplay,
@@ -463,6 +471,7 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
 
 			igt_output_set_crtc(data->output,
 					    data->crtc);
+			igt_output_override_mode(data->output, data->mode);
 
 			if (!intel_pipe_output_combo_valid(display)) {
 				igt_output_set_crtc(data->output, NULL);
-- 
2.34.1

