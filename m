Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A92E77194
	for <igt-dev@archiver.kernel.org>; Mon, 30 Dec 2024 18:58:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32DE310E57E;
	Mon, 30 Dec 2024 18:58:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k6x8ue9M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABBA610E57E
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Dec 2024 18:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735585098; x=1767121098;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sDV/7vHJBseYhW0nLzh911HDN+s2HiVoUTX2286mM7w=;
 b=k6x8ue9M/PV2obLI67S3B78C4M8APoXG+bAnmD7aIL1LGKiDfrUb1U6G
 8R5XZd67yKQPaiceNRxl6G9kfSXc9RZ5rIgaRWWGP8nB0eET3KfRxJd2T
 bMb1seU3HfXu4D+2GlVFgRB3rz9hnOaF5igBWnJimkt65rY356o8GnueE
 r8umtC0EFxodGnrD929XCfxZukaq3MRTpcCCk107kF0t+o6NbzHkkcJsq
 9Dfwoj9P2L93gV4cUuUkdIZAlr+MOhnjfs6qD4oYKJj94vf41eGkuetXn
 PeILlobr2y43vvagY311RIQtyg5ulIUOlL/DiUx4ny2FbOCI4lkfDnsj8 g==;
X-CSE-ConnectionGUID: kzMEBvLdSg698g2yzRYssw==
X-CSE-MsgGUID: kJ3c5Rq9Sri4qOT+rXjZ1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="39803543"
X-IronPort-AV: E=Sophos;i="6.12,277,1728975600"; d="scan'208";a="39803543"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2024 10:58:18 -0800
X-CSE-ConnectionGUID: gi7Y+Z7bT16/kBWfrBhDng==
X-CSE-MsgGUID: B6VmbTlQTASELlc6NILg9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,277,1728975600"; d="scan'208";a="100728923"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2024 10:58:16 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, santhosh.reddy.guddati@intel.com,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 4/6] tests/intel/kms_cdclk: Introduce set_mode()
Date: Tue, 31 Dec 2024 00:33:13 +0530
Message-Id: <20241230190315.48821-5-swati2.sharma@intel.com>
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

Encapsulate the mode-setting functionality in the set_mode
function to reduce redundancy.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_cdclk.c | 71 +++++++++++++----------------------------
 1 file changed, 22 insertions(+), 49 deletions(-)

diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
index dfc64ae2e..67efdaa3f 100644
--- a/tests/intel/kms_cdclk.c
+++ b/tests/intel/kms_cdclk.c
@@ -256,21 +256,36 @@ static void test_mode_transition(data_t *data, enum pipe pipe, igt_output_t *out
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
@@ -320,52 +335,11 @@ static void test_mode_transition_on_all_outputs(data_t *data)
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
@@ -373,7 +347,6 @@ static void test_mode_transition_on_all_outputs(data_t *data)
 	/* cdclk should bump */
 	igt_assert_lt(cdclk_ref, cdclk_new);
 
-	igt_plane_set_fb(plane, NULL);
 	do_cleanup_display(display);
 	igt_remove_fb(data->drm_fd, &fb);
 }
-- 
2.25.1

