Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13219E7717D
	for <igt-dev@archiver.kernel.org>; Fri, 13 Dec 2024 05:59:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C146410EEF7;
	Fri, 13 Dec 2024 05:59:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NKLgkMVA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C37810EEF7
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Dec 2024 05:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734069588; x=1765605588;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jnjffQUJRYd4YIIwdHLtRyz9w+Na/0LsryLIPD7ONJc=;
 b=NKLgkMVAS70NfZCjRMCBcCvzCPG5rRxT7BB0eeXzT0B9rDHz64VlzxES
 B9cdZR325uPGaddZzNdkT7RVg59M/fB/MH56Ewb0A8omtcbE1l6I7TDvu
 /cXRkIoEoB9Tkd3lB6NAh3RlMrhGF/czptCZMdQUi9dZ7PSZTwSiCcWn8
 TdYJf/xYb4SPcZaYmp+ZVoInOwOBq1IgNv6mtlPZpyfDaYBQEk/H00LpA
 qGpFPer/gmiczl4pQ27TZIgMBRB4k+3l7vqWMQOcbmuYsKin4hRZFcVS2
 gOfRW5ZYPQZrylC2QTbFDD9DXQ5DfGVYhwJadhSge4pmYsx6Ed3vvu1R1 g==;
X-CSE-ConnectionGUID: CrMEnbThTBqu50j0X1D5mg==
X-CSE-MsgGUID: 6Bpsa0xfT9moldGsv+CxCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34646604"
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; d="scan'208";a="34646604"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 21:59:48 -0800
X-CSE-ConnectionGUID: X3c6CQO7TbWYwomRLMPRiw==
X-CSE-MsgGUID: HhbrksSMSpG9gQmaxtKJ4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; d="scan'208";a="127252956"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.130])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 21:59:46 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_cdclk: Refactor mode setting and CD
 clock verification
Date: Fri, 13 Dec 2024 11:32:25 +0530
Message-Id: <20241213060225.2144633-1-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
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

Add conditions to filter valid outputs. Encapsulate the
mode-setting functionality in the set_mode function to reduce
redundancy. Remove redundant framebuffer and size setting
operations for the plane. Simplify the CD clock frequency
checks to ensure it increases after the mode transition. Clean
up unnecessary plane operations and redundant framebuffer
handling. Enhance the readability and modularity of the mode
transition logic to handle multiple outputs more effectively.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_cdclk.c | 112 +++++++++++++++++++---------------------
 1 file changed, 54 insertions(+), 58 deletions(-)

diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
index 382b3e9d1..93276f45e 100644
--- a/tests/intel/kms_cdclk.c
+++ b/tests/intel/kms_cdclk.c
@@ -54,6 +54,7 @@ IGT_TEST_DESCRIPTION("Test cdclk features : crawling and squashing");
 #define VDISPLAY_4K	2160
 #define VREFRESH	60
 #define MAX_CDCLK_4K	307200
+#define MIN_DISPLAYS	2
 
 /* Test flags */
 enum {
@@ -269,90 +270,86 @@ static void test_mode_transition(data_t *data, enum pipe pipe, igt_output_t *out
 	igt_remove_fb(display->drm_fd, &fb);
 }
 
+
+static void set_mode(data_t *data, drmModeModeInfo *mode, int count,
+		     struct igt_fb fb, igt_output_t **valid_outputs)
+{
+	igt_display_t *display = &data->display;
+	igt_pipe_t *pipe;
+	igt_plane_t *plane;
+
+	for (int k = 0; k < count; k++) {
+		pipe = &display->pipes[k];
+		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+
+		igt_output_override_mode(valid_outputs[k], &mode[k]);
+
+		igt_plane_set_fb(plane, &fb);
+		igt_fb_set_size(&fb, plane, mode[k].hdisplay, mode[k].vdisplay);
+		igt_plane_set_size(plane, mode[k].hdisplay, mode[k].vdisplay);
+	}
+}
+
 static void test_mode_transition_on_all_outputs(data_t *data)
 {
 	igt_display_t *display = &data->display;
 	int debugfs_fd = data->debugfs_fd;
-	drmModeModeInfo *mode, *mode_hi, *mode_lo;
+	drmModeModeInfo *mode, mode_hi[IGT_MAX_PIPES] = {0}, mode_lo[IGT_MAX_PIPES] = {0};
+	igt_output_t *valid_outputs[IGT_MAX_PIPES] = {NULL};
 	igt_output_t *output;
-	int valid_outputs = 0;
+	int count = 0;
 	int cdclk_ref, cdclk_new;
 	uint16_t width = 0, height = 0;
 	struct igt_fb fb;
-	igt_pipe_t *pipe;
-	igt_plane_t *plane;
-	int i = 0, j = 0;
 
 	do_cleanup_display(display);
 	igt_display_reset(display);
 
-	for_each_connected_output(&data->display, output)
-		valid_outputs++;
-
-	i = 0;
 	for_each_connected_output(display, output) {
-		mode = igt_output_get_mode(output);
-		igt_assert(mode);
+		const drmModeModeInfo *highres_mode;
+		const drmModeModeInfo *lowres_mode;
 
-		width = max(width, mode->hdisplay);
-		height = max(height, mode->vdisplay);
+		highres_mode = get_highres_mode(output);
+		igt_require(highres_mode != NULL);
+		mode_hi[count] = *highres_mode;
 
-		mode_hi = get_highres_mode(output);
-		igt_require(mode_hi != NULL);
+		lowres_mode = get_lowres_mode(output);
+		mode_lo[count] = *lowres_mode;
 
-		igt_output_set_pipe(output, i);
-		igt_output_override_mode(output, mode_hi);
-		i++;
-	}
-	igt_require(intel_pipe_output_combo_valid(display));
-	igt_display_reset(display);
+		if (mode_hi[count].hdisplay == mode_lo[count].hdisplay &&
+		    mode_hi[count].vdisplay == mode_lo[count].vdisplay) {
+			igt_debug("Highest and lowest mode resolutions are same; no transition\n");
+			continue;
+		}
 
-	igt_create_pattern_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
-			      DRM_FORMAT_MOD_LINEAR, &fb);
-	i = 0;
-	for_each_connected_output(display, output) {
-		pipe = &display->pipes[i];
-		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+		valid_outputs[count++] = output;
+	}
 
-		mode = NULL;
+	igt_skip_on_f(count < MIN_DISPLAYS,
+		      "Number of valid outputs (%d) must be greater than or equal to the "
+		      "minimum required displays (%d)\n", count, MIN_DISPLAYS);
 
-		igt_output_set_pipe(output, i);
-		mode = igt_output_get_mode(output);
+	for (int i = 0; i < count; i++) {
+		mode = igt_output_get_mode(valid_outputs[i]);
 		igt_assert(mode);
 
-		mode_lo = get_lowres_mode(output);
+		width = max(width, mode->hdisplay);
+		height = max(height, mode->vdisplay);
 
-		igt_output_override_mode(output, mode_lo);
-		igt_plane_set_fb(plane, &fb);
-		igt_fb_set_size(&fb, plane, mode_lo->hdisplay, mode_lo->vdisplay);
-		igt_plane_set_size(plane, mode_lo->hdisplay, mode_lo->vdisplay);
-		i++;
+		igt_output_set_pipe(valid_outputs[i], i);
+		igt_output_override_mode(valid_outputs[i], &mode_hi[i]);
 	}
 
-	igt_display_commit2(display, COMMIT_ATOMIC);
-	cdclk_ref = get_current_cdclk_freq(debugfs_fd);
-
-	j = 0;
-	for_each_connected_output(display, output) {
-		pipe = &display->pipes[j];
-		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
-
-		mode = NULL;
-
-		igt_output_set_pipe(output, j);
-		mode = igt_output_get_mode(output);
-		igt_assert(mode);
+	igt_require(intel_pipe_output_combo_valid(display));
 
-		mode_hi = get_highres_mode(output);
-		igt_require(mode_hi != NULL);
+	igt_create_pattern_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
+			      DRM_FORMAT_MOD_LINEAR, &fb);
 
-		igt_output_override_mode(output, mode_hi);
-		igt_plane_set_fb(plane, &fb);
-		igt_fb_set_size(&fb, plane, mode_hi->hdisplay, mode_hi->vdisplay);
-		igt_plane_set_size(plane, mode_hi->hdisplay, mode_hi->vdisplay);
-		j++;
-	}
+	set_mode(data, mode_lo, count, fb, valid_outputs);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+	cdclk_ref = get_current_cdclk_freq(debugfs_fd);
 
+	set_mode(data, mode_hi, count, fb, valid_outputs);
 	igt_display_commit2(display, COMMIT_ATOMIC);
 	cdclk_new = get_current_cdclk_freq(debugfs_fd);
 	igt_info("CD clock frequency %d -> %d\n", cdclk_ref, cdclk_new);
@@ -360,7 +357,6 @@ static void test_mode_transition_on_all_outputs(data_t *data)
 	/* cdclk should bump */
 	igt_assert_lt(cdclk_ref, cdclk_new);
 
-	igt_plane_set_fb(plane, NULL);
 	do_cleanup_display(display);
 	igt_remove_fb(data->drm_fd, &fb);
 }
-- 
2.25.1

