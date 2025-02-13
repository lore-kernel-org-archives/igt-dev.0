Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C129C021A0
	for <igt-dev@archiver.kernel.org>; Thu, 13 Feb 2025 11:03:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0048110EA52;
	Thu, 13 Feb 2025 11:03:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B1DbvHRK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE5E110EA5A
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Feb 2025 11:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739444634; x=1770980634;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RznquTimuGFhQdULfNmP8SgXjqhij0HZml5adMuT5ow=;
 b=B1DbvHRKXAYZQ3kIn4NUgOv9K1SwHwm9d6LuSi9Vwn9LE2cSNraz2uGu
 LUd8A3HbkYfPTgIKZqp2jjeA9qXvKKD3NZRtMYhVmVq7gaksnWrkNhD0S
 CIxu3EgmG8guQZNA+XRXt9dYL1I8w7mxVnwPIJWpc5BRug23Fvy+qalvB
 35otGxT0NauxYtuK48z5GRYyP64Xll3IhKi5WWAu1bs+XzOdzZnGxt+8s
 7A8eJJ3bGGS/SKgiE5DdKR07xQltxnhcNiXGsGFVFltE2yhGqwkiMF/6A
 QKZnZoHXlC9lrJ5XbBA2hBb7w0GGkUgKNVPbdl1LJhqKkeXgCC7LPqwtr A==;
X-CSE-ConnectionGUID: dobi51c4RYiYdCq434oX5A==
X-CSE-MsgGUID: NVJLYSdPSLixFx61OYfyMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="62609487"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="62609487"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 03:03:54 -0800
X-CSE-ConnectionGUID: +IgJWk69QKaSxBM5kFZZ/w==
X-CSE-MsgGUID: CUwxw3DAQwWFrREMX7X99Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="113094060"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 03:03:52 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 3/5] tests/intel/kms_cdclk: Introduce set_mode()
Date: Thu, 13 Feb 2025 16:38:12 +0530
Message-Id: <20250213110814.351186-4-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250213110814.351186-1-swati2.sharma@intel.com>
References: <20250213110814.351186-1-swati2.sharma@intel.com>
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

Encapsulate the mode-setting functionality in the set_mode
function to reduce redundancy.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 tests/intel/kms_cdclk.c | 71 +++++++++++++----------------------------
 1 file changed, 22 insertions(+), 49 deletions(-)

diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
index 75542e21b..eeb1ecd69 100644
--- a/tests/intel/kms_cdclk.c
+++ b/tests/intel/kms_cdclk.c
@@ -258,21 +258,36 @@ static void test_mode_transition(data_t *data, enum pipe pipe, igt_output_t *out
 	igt_remove_fb(display->drm_fd, &fb);
 }
 
+static void set_mode(data_t *data, int count, drmModeModeInfo *mode,
+		     igt_output_t **valid_outputs, struct igt_fb fb)
+{
+	igt_display_t *display = &data->display;
+	igt_pipe_t *pipe;
+	igt_plane_t *plane;
+
+	for (int i = 0; i < count; i++) {
+		pipe = &display->pipes[i];
+		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
+
+		igt_output_override_mode(valid_outputs[i], &mode[i]);
+
+		igt_plane_set_fb(plane, &fb);
+		igt_fb_set_size(&fb, plane, mode[i].hdisplay, mode[i].vdisplay);
+		igt_plane_set_size(plane, mode[i].hdisplay, mode[i].vdisplay);
+	}
+}
+
 static void test_mode_transition_on_all_outputs(data_t *data)
 {
 	igt_display_t *display = &data->display;
 	int debugfs_fd = data->debugfs_fd;
-	drmModeModeInfo *mode, mode_hi, mode_lo;
-	drmModeModeInfo mode_highres[IGT_MAX_PIPES] = {0}, mode_lowres[IGT_MAX_PIPES] = {0};
+	drmModeModeInfo *mode, mode_highres[IGT_MAX_PIPES] = {0}, mode_lowres[IGT_MAX_PIPES] = {0};
 	igt_output_t *valid_outputs[IGT_MAX_PIPES] = {NULL};
 	igt_output_t *output;
 	int count = 0;
 	int cdclk_ref, cdclk_new;
 	uint16_t width = 0, height = 0;
 	struct igt_fb fb;
-	igt_pipe_t *pipe;
-	igt_plane_t *plane;
-	int i = 0, j = 0;
 
 	do_cleanup_display(display);
 	igt_display_reset(display);
@@ -316,52 +331,11 @@ static void test_mode_transition_on_all_outputs(data_t *data)
 	igt_create_pattern_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
 			      DRM_FORMAT_MOD_LINEAR, &fb);
 
-	i = 0;
-	for_each_connected_output(display, output) {
-		pipe = &display->pipes[i];
-		plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
-
-		mode = NULL;
-
-		igt_output_set_pipe(output, i);
-		mode = igt_output_get_mode(output);
-		igt_assert(mode);
-
-		mode_lo = *get_lowres_mode(output);
-
-		igt_output_override_mode(output, &mode_lo);
-		igt_plane_set_fb(plane, &fb);
-		igt_fb_set_size(&fb, plane, mode_lo.hdisplay, mode_lo.vdisplay);
-		igt_plane_set_size(plane, mode_lo.hdisplay, mode_lo.vdisplay);
-		i++;
-	}
-
+	set_mode(data, count, mode_lowres, valid_outputs, fb);
 	igt_display_commit2(display, COMMIT_ATOMIC);
 	cdclk_ref = get_current_cdclk_freq(debugfs_fd);
 
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
-
-		mode_hi = *igt_output_get_highres_mode(output);
-		igt_require_f(mode_hi.hdisplay >= HDISPLAY_4K && mode_hi.vdisplay >= VDISPLAY_4K &&
-			      mode_hi.vrefresh >= VREFRESH, "Mode >= 4K not found on output %s.\n",
-			      igt_output_name(output));
-
-		igt_output_override_mode(output, &mode_hi);
-		igt_plane_set_fb(plane, &fb);
-		igt_fb_set_size(&fb, plane, mode_hi.hdisplay, mode_hi.vdisplay);
-		igt_plane_set_size(plane, mode_hi.hdisplay, mode_hi.vdisplay);
-		j++;
-	}
-
+	set_mode(data, count, mode_highres, valid_outputs, fb);
 	igt_display_commit2(display, COMMIT_ATOMIC);
 	cdclk_new = get_current_cdclk_freq(debugfs_fd);
 	igt_info("CD clock frequency %d -> %d\n", cdclk_ref, cdclk_new);
@@ -369,7 +343,6 @@ static void test_mode_transition_on_all_outputs(data_t *data)
 	/* cdclk should bump */
 	igt_assert_lt(cdclk_ref, cdclk_new);
 
-	igt_plane_set_fb(plane, NULL);
 	do_cleanup_display(display);
 	igt_remove_fb(data->drm_fd, &fb);
 }
-- 
2.25.1

