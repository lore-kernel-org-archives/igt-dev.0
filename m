Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B20DBC48BF6
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 07:26:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5015E10EEE1;
	Mon, 26 Feb 2024 07:26:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j9+6YzrT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A43EB10EEE1
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Feb 2024 07:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708932395; x=1740468395;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=9H+EQGy21XPfWmXg8tZQtCsgUD+7mHaTLt+oS2YC4T8=;
 b=j9+6YzrTH5PM+y2R0wcaZkoXq2Oz/E49gxiJH6WW26SkM7kZqeKU6Xy5
 lYyGq4FUrmih/iyLmTMzMZILCz3+rEziutVWX+n8u45Ge8FnjVVejAyad
 chMsvuV2/cqxSg9rZteFwk6rQ7U6XG3Ol8fuFEQ1VXbHtc3ZE7sC2rfdS
 HLEWt5rnduAZfDtp1oi12DruBHYLqxigKmDWvLsel7NQl4R3LRkmUPsc1
 jH/yERpcZ9DFy4y6QzVccNCbHPfu/PKFlzkATFhhmYaTmAxx54VOgyfMe
 Tbeef+JurfSy4EougEj5Rf1xCaRIZwF6DtPJduZ/M7GuJOcAdWftvwtfU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="6147557"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="6147557"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2024 23:26:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="6923233"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2024 23:26:34 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [i-g-t v6 1/9] tests/kms_vrr: Move fb0 and fb1 to an array
Date: Mon, 26 Feb 2024 12:50:27 +0530
Message-ID: <20240226072035.2620383-2-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240226072035.2620383-1-bhanuprakash.modem@intel.com>
References: <20240226072035.2620383-1-bhanuprakash.modem@intel.com>
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
Reviewed-by: Sean Paul <seanpaul@chromium.org>
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

