Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 495E4C43458
	for <igt-dev@archiver.kernel.org>; Wed,  8 Jul 2026 19:05:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E102B10E664;
	Wed,  8 Jul 2026 19:05:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jDdqTXsN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5321810E645
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Jul 2026 19:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783537450; x=1815073450;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=J68pJnCWHpbKzgDp+ywHDJjgBEKSQfQn12gM7yLL3mg=;
 b=jDdqTXsNMC7AKeavwN2xUUt+cldFQv9+gcdr2+as1tBrsqTp11TlJNnC
 F9nqPBEJB9EyPabT/0iZLvbXoOEG2Hq/5ThSPsk1aUbagT/BGkh8G6p91
 hghJLhjFZHshXCENf7YQhcqqMm8+RlcjkIyQNLhp4oP+nbWRlC2/qqNGj
 1/ZzZ2uYwmnQwOA8UYueUzYIaXzdifl+kLITqfn9xolTFlKZoDzb5LOxw
 CbF9lxvI5htvhevdP5qHdbW02dVHiTwecQ+gxqPASmIADsIODr5EbppIJ
 4V1GurCTRV8Rh1Baiw9lMx7HkYAlvevZhCQPR2/zCOP8TDT4YwHeikEk5 g==;
X-CSE-ConnectionGUID: hDUq9FqARx2hQOw5QL5DjQ==
X-CSE-MsgGUID: doFpONeyR5iF5Rh5M/cgrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="94567499"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="94567499"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 12:04:10 -0700
X-CSE-ConnectionGUID: XubhFZtsRs6AcgeF73a8zw==
X-CSE-MsgGUID: +JgTiwhdSdSMlyYThdocUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="278758972"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2026 12:04:08 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>, Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH i-g-t 1/2] tests/intel/kms_sharpness_filter: Skip joiner modes
Date: Thu,  9 Jul 2026 00:43:05 +0530
Message-Id: <20260708191306.2995928-2-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260708191306.2995928-1-swati2.sharma@intel.com>
References: <20260708191306.2995928-1-swati2.sharma@intel.com>
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

get_modes_for_filter_taps() could select modes requiring
bigjoiner (e.g. 7680x2160@60) for tap filter testing, but
joiner + CASF is currently unsupported. Filter out such modes
using igt_bigjoiner_possible() against the platform's max
dotclock.

Assisted-by: GitHub Copilot:Claude Opus 4.6
Reviewed-by: Nemesa Garg <nemesa.garg@intel.com>
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_sharpness_filter.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
index ff7b4540c..171a3e99c 100644
--- a/tests/intel/kms_sharpness_filter.c
+++ b/tests/intel/kms_sharpness_filter.c
@@ -358,9 +358,11 @@ static void cleanup(data_t *data)
 	cleanup_fbs(data);
 }
 
-static void get_modes_for_filter_taps(igt_output_t *output, drmModeModeInfo *mode[3])
+static void get_modes_for_filter_taps(int drm_fd, igt_output_t *output,
+				      drmModeModeInfo *mode[3])
 {
 	drmModeConnector *connector = output->config.connector;
+	int max_dotclock = igt_get_max_dotclock(drm_fd);
 	int total_pixels = 0;
 
 	/*
@@ -368,8 +370,14 @@ static void get_modes_for_filter_taps(igt_output_t *output, drmModeModeInfo *mod
 	 * TAP 5: (mode->hdisplay > 1920 && mode->hdisplay < 3840) &&
 	 * 	  (mode->vdisplay > 1080 && mode->vdisplay < 2160)
 	 * TAP 7: mode->hdisplay >= 3840 && mode->vdisplay >= 2160
+	 *
+	 * Skip modes requiring joiner since joiner + CASF is unsupported.
 	 */
 	for (int i = 0; i < connector->count_modes; i++) {
+		if (igt_bigjoiner_possible(drm_fd, &connector->modes[i],
+					   max_dotclock))
+			continue;
+
 		total_pixels = connector->modes[i].hdisplay * connector->modes[i].vdisplay;
 
 		if (total_pixels <= MAX_PIXELS_FOR_3_TAP_FILTER)
@@ -670,11 +678,15 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
 			if (type == TEST_FILTER_TAP) {
 				drmModeModeInfo *modes[3] = { NULL, NULL, NULL };
 
-				get_modes_for_filter_taps(output, modes);
+				get_modes_for_filter_taps(data->drm_fd, output, modes);
 				for (int i = 0; i < 3; i++) {
 					data->filter_tap = filter_tap_list[i];
-					if (!modes[i])
+					if (!modes[i]) {
+						igt_info("No valid non-joiner mode for tap-%d on %s\n",
+							 data->filter_tap,
+							 igt_output_name(data->output));
 						continue;
+					}
 					data->mode = modes[i];
 					igt_info("Mode %dx%d@%d on output %s\n",
 						 data->mode->hdisplay,
-- 
2.25.1

