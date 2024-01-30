Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F54C47DDB
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jan 2024 05:49:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F7A11260D;
	Tue, 30 Jan 2024 05:49:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9782F112131
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jan 2024 05:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706593754; x=1738129754;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p5CkbOrsogK2F8A7CgB2r5otl3/nam1hIfXFIiLNZ3Y=;
 b=mnWpvx6HpAqtfyuWY9DhH5HEue8Y6aDluyFa5oHsnP32FZItDMgwztgV
 oO2guRYxQAyB0ZGY/+fIXIGSmYjvaa5+hVm2IZjUbJ1rZcSHV2KpZ+m9L
 RVDpuz5CYeakFcepfH/6aXVIBVX5tGNqKKMlq+xPmTBR4LPxhCQWZ71oA
 LCCTozHm0mkdlrFNvwlAitm1kaOY5bVDme5a9YL4XEYXWy1FLiBCbEo8Z
 1QpcjnzSeS82r3sHAFNj5czxo9EtxaqDLiO+yQZITCC8ZNC2Szlz4CfAO
 ICQja5uRHhHRuNT/sj6cjgThjrP0cBarzmWsXMdnXb7G2G5uEHQJ+Fz9Z Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="393609599"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; d="scan'208";a="393609599"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 21:49:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="3603122"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 21:49:13 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [i-g-t v5 1/9] tests/kms_vrr: Move fb0 and fb1 to an array
Date: Tue, 30 Jan 2024 11:12:27 +0530
Message-ID: <20240130054235.533132-2-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240130054235.533132-1-bhanuprakash.modem@intel.com>
References: <20240130054235.533132-1-bhanuprakash.modem@intel.com>
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
Cc: Sean Paul <seanpaul@chromium.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Consolidate the 2 fb variables into an array. No functional changes.

v2:
- Clarified commit msg (Bhanu)
v3: (Bhanu)
- Rebase

Cc: Mark Yacoub <markyacoub@chromium.org>
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_vrr.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 9de0ffc85..a9fcde821 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -104,8 +104,7 @@ typedef struct data {
 	igt_display_t display;
 	int drm_fd;
 	igt_plane_t *primary;
-	igt_fb_t fb0;
-	igt_fb_t fb1;
+	igt_fb_t fb[2];
 	range_t range;
 	drmModeModeInfo switch_modes[RR_MODES_COUNT];
 } data_t;
@@ -280,13 +279,13 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 	/* Prepare resources */
 	igt_create_color_fb(data->drm_fd, mode.hdisplay, mode.vdisplay,
 			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
-			    0.50, 0.50, 0.50, &data->fb0);
+			    0.50, 0.50, 0.50, &data->fb[0]);
 
 	igt_create_color_fb(data->drm_fd, mode.hdisplay, mode.vdisplay,
 			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
-			    0.50, 0.50, 0.50, &data->fb1);
+			    0.50, 0.50, 0.50, &data->fb[1]);
 
-	cr = igt_get_cairo_ctx(data->drm_fd, &data->fb0);
+	cr = igt_get_cairo_ctx(data->drm_fd, &data->fb[0]);
 
 	igt_paint_color(cr, 0, 0, mode.hdisplay / 10, mode.vdisplay / 10,
 			1.00, 0.00, 0.00);
@@ -295,7 +294,7 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 
 	/* Take care of any required modesetting before the test begins. */
 	data->primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
-	igt_plane_set_fb(data->primary, &data->fb0);
+	igt_plane_set_fb(data->primary, &data->fb[0]);
 
 	/* Clear vrr_enabled state before enabling it, because
 	 * it might be left enabled if the previous test fails.
@@ -358,7 +357,7 @@ flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
 			rate_ns, threshold_hi, threshold_lo);
 
 	/* Align with the flip completion event to speed up convergence. */
-	do_flip(data, &data->fb0);
+	do_flip(data, &data->fb[0]);
 	start_ns = last_event_ns = target_ns = get_kernel_event_ns(data,
 							DRM_EVENT_FLIP_COMPLETE);
 
@@ -367,7 +366,7 @@ flip_and_measure(data_t *data, igt_output_t *output, enum pipe pipe,
 		int64_t diff_ns;
 
 		front = !front;
-		do_flip(data, front ? &data->fb1 : &data->fb0);
+		do_flip(data, front ? &data->fb[1] : &data->fb[0]);
 
 		/* We need to cpture flip event instead of vblank event,
 		 * because vblank is triggered after each frame, but depending
@@ -573,8 +572,8 @@ static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *output)
 	igt_output_override_mode(output, NULL);
 	igt_display_commit2(&data->display, COMMIT_ATOMIC);
 
-	igt_remove_fb(data->drm_fd, &data->fb1);
-	igt_remove_fb(data->drm_fd, &data->fb0);
+	igt_remove_fb(data->drm_fd, &data->fb[1]);
+	igt_remove_fb(data->drm_fd, &data->fb[0]);
 }
 
 static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags)
-- 
2.43.0

