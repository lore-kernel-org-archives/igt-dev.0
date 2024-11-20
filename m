Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA558D63954
	for <igt-dev@archiver.kernel.org>; Wed, 20 Nov 2024 13:59:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AA7B10E28C;
	Wed, 20 Nov 2024 13:59:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mEreCz/J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99FFF10E28C
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Nov 2024 13:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732111143; x=1763647143;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OiVpRP0NF1vuwvQPXj1E9AVtTgCC5mOJAGMmzU8A8i8=;
 b=mEreCz/JX2faWuKpCaBl9THMLLSi1LTswS2uH/XQsJENKcVGS9J0sE5+
 7RXkIfEwcTgMT7qjcMtm1C0sALBxURfPTtltH9i5BJLy+r3tnxaYQ+2/t
 0CRkP/Uw1MGVN0CN3VCf9Whq8WiOsS84mZSA0qu5fWQ94ar1L6zFSXxuY
 nOcH7+WoZIQ3POzdwGu2uywPu9o21bHOFP8ZqrWd6gU4rBICXgKZOejEm
 0h6ZMsprDqfcBojLOdkGgNqG9ROvLhiHIx+FLYBHqoTcmWTiR/S8/YBst
 tLOJlw+wMTbdl2hpLLFFEY53MbHrCLhTO7MJE84ry9UVmOjfgGuLU0Rpc Q==;
X-CSE-ConnectionGUID: S5BtjwL7Qj2zmmaCsS0Fpw==
X-CSE-MsgGUID: eMJUKG4bSLyAfzag5kUEsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="35026151"
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208";a="35026151"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 05:59:02 -0800
X-CSE-ConnectionGUID: I0U6kuWYRxqjNTf+gQyDrQ==
X-CSE-MsgGUID: 9gxqsj2NRPygR35YA9KYIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; d="scan'208";a="90330462"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.130])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 05:59:01 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_cdclk.c: Handle scenario where ref and
 new cdclk is same
Date: Wed, 20 Nov 2024 19:31:34 +0530
Message-Id: <20241120140134.1746751-1-swati2.sharma@intel.com>
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

There are few issues with the mode-transition-all-outputs
subtest. Firstly, test should execute only if we have minimun
of 2 connected outputs. Secondly, if hdisplay and vdisplay of
highest and lowest modes are same for an output, don't consider
that output.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1887
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_cdclk.c | 67 +++++++++++++++++++++++++----------------
 1 file changed, 41 insertions(+), 26 deletions(-)

diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
index 382b3e9d1..61d73c8c6 100644
--- a/tests/intel/kms_cdclk.c
+++ b/tests/intel/kms_cdclk.c
@@ -54,6 +54,7 @@ IGT_TEST_DESCRIPTION("Test cdclk features : crawling and squashing");
 #define VDISPLAY_4K	2160
 #define VREFRESH	60
 #define MAX_CDCLK_4K	307200
+#define DISPLAY_COUNT	2
 
 /* Test flags */
 enum {
@@ -274,83 +275,97 @@ static void test_mode_transition_on_all_outputs(data_t *data)
 	igt_display_t *display = &data->display;
 	int debugfs_fd = data->debugfs_fd;
 	drmModeModeInfo *mode, *mode_hi, *mode_lo;
+	igt_output_t *valid_outputs[IGT_MAX_PIPES];
 	igt_output_t *output;
-	int valid_outputs = 0;
+	int count = 0;
 	int cdclk_ref, cdclk_new;
 	uint16_t width = 0, height = 0;
 	struct igt_fb fb;
 	igt_pipe_t *pipe;
 	igt_plane_t *plane;
-	int i = 0, j = 0;
+	int i = 0, j = 0, k = 0;
 
 	do_cleanup_display(display);
 	igt_display_reset(display);
 
-	for_each_connected_output(&data->display, output)
-		valid_outputs++;
-
-	i = 0;
-	for_each_connected_output(display, output) {
+	for_each_connected_output(&data->display, output) {
 		mode = igt_output_get_mode(output);
 		igt_assert(mode);
 
+		mode_hi = get_highres_mode(output);
+		igt_require(mode_hi != NULL);
+
+		mode_lo = get_lowres_mode(output);
+
+		if (mode_hi->hdisplay == mode_lo->hdisplay && mode_hi->vdisplay == mode_lo->vdisplay) {
+		      igt_debug("Highest and lowest mode resolutions are same; no transition\n");
+		      continue;
+		}
+
+		valid_outputs[count++] = output;
+	}
+
+	igt_skip_on_f(count < DISPLAY_COUNT,
+		      "Valid outputs (%d) should be equal or greater than %d\n", count, DISPLAY_COUNT);
+
+	for (i = 0; i < count; i++) {
+		mode = igt_output_get_mode(valid_outputs[i]);
+		igt_assert(mode);
+
 		width = max(width, mode->hdisplay);
 		height = max(height, mode->vdisplay);
 
-		mode_hi = get_highres_mode(output);
+		mode_hi = get_highres_mode(valid_outputs[i]);
 		igt_require(mode_hi != NULL);
 
-		igt_output_set_pipe(output, i);
-		igt_output_override_mode(output, mode_hi);
-		i++;
+		igt_output_set_pipe(valid_outputs[i], i);
+		igt_output_override_mode(valid_outputs[i], mode_hi);
 	}
+
 	igt_require(intel_pipe_output_combo_valid(display));
 	igt_display_reset(display);
 
 	igt_create_pattern_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
 			      DRM_FORMAT_MOD_LINEAR, &fb);
-	i = 0;
-	for_each_connected_output(display, output) {
-		pipe = &display->pipes[i];
+
+	for (k = 0; k < count; k++) {
+		pipe = &display->pipes[k];
 		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
 
 		mode = NULL;
 
-		igt_output_set_pipe(output, i);
-		mode = igt_output_get_mode(output);
+		igt_output_set_pipe(valid_outputs[k], k);
+		mode = igt_output_get_mode(valid_outputs[k]);
 		igt_assert(mode);
 
-		mode_lo = get_lowres_mode(output);
+		mode_lo = get_lowres_mode(valid_outputs[k]);
 
-		igt_output_override_mode(output, mode_lo);
+		igt_output_override_mode(valid_outputs[k], mode_lo);
 		igt_plane_set_fb(plane, &fb);
 		igt_fb_set_size(&fb, plane, mode_lo->hdisplay, mode_lo->vdisplay);
 		igt_plane_set_size(plane, mode_lo->hdisplay, mode_lo->vdisplay);
-		i++;
 	}
 
 	igt_display_commit2(display, COMMIT_ATOMIC);
 	cdclk_ref = get_current_cdclk_freq(debugfs_fd);
 
-	j = 0;
-	for_each_connected_output(display, output) {
+	for (j = 0; j < count; j++) {
 		pipe = &display->pipes[j];
 		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
 
 		mode = NULL;
 
-		igt_output_set_pipe(output, j);
-		mode = igt_output_get_mode(output);
+		igt_output_set_pipe(valid_outputs[j], j);
+		mode = igt_output_get_mode(valid_outputs[j]);
 		igt_assert(mode);
 
-		mode_hi = get_highres_mode(output);
+		mode_hi = get_highres_mode(valid_outputs[j]);
 		igt_require(mode_hi != NULL);
 
-		igt_output_override_mode(output, mode_hi);
+		igt_output_override_mode(valid_outputs[j], mode_hi);
 		igt_plane_set_fb(plane, &fb);
 		igt_fb_set_size(&fb, plane, mode_hi->hdisplay, mode_hi->vdisplay);
 		igt_plane_set_size(plane, mode_hi->hdisplay, mode_hi->vdisplay);
-		j++;
 	}
 
 	igt_display_commit2(display, COMMIT_ATOMIC);
-- 
2.25.1

