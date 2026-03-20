Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB95D108B8ED
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 10:40:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F7FA10EA71;
	Fri, 20 Mar 2026 10:40:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kpu3lg3l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E22BF10EA71
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 10:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774003227; x=1805539227;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ktkSpLbXBjF1qhAqdGClK5yh0f/Gzbu57nwnB0bdsoo=;
 b=Kpu3lg3lPl40W7poDIejjuVKGh1pVN/N2ty6C4UMDGiOPiPzoTL8p0jO
 Ir4QZg0BN2nF2RwPkbPMTyqBTYJMVPIWETw3lNyjmSksRZLAflVX/zIng
 RwxARZ422zFedWFfloeplKZLx5OJ3964Q8QSXdz8wjOkpg4ABHlbNtIjT
 yW6uIgBwPLiEdKJw/y1goWt679qbIHRMdvnd0xNCW/AOEIQTdD1LR5amk
 vC5ySx6Qk0NeXGmmXxOi11Y0HBXlDEUfA2B1AVcNLbeX8hKImiMBKOjLT
 w2FDbnMqbPwxN1IWLQuAzvSkNx1o2RpsZS2duMRv2utLjEOOs4GX/JhTS w==;
X-CSE-ConnectionGUID: mCjFG4INT3+9rlwbA0zGMg==
X-CSE-MsgGUID: OnUvDoLxRUW3qGsJymJD4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="75272819"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="75272819"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 03:40:27 -0700
X-CSE-ConnectionGUID: LNsXedRPTJiuZd+4Btv45Q==
X-CSE-MsgGUID: +7ADC/a9SYqGYJaHWfTGAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; d="scan'208";a="253751235"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.197])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2026 03:40:25 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH i-g-t v2 10/11] tests/kms_explicit_fence: store igt_crtc_t*
 instead of pipe in data
Date: Fri, 20 Mar 2026 12:39:30 +0200
Message-ID: <2278abf93947e509fb1a32bcc69c4b12cbf664b3.1774002591.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774002591.git.jani.nikula@intel.com>
References: <cover.1774002591.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

The CRTC originates from for_each_crtc_with_single_output() and is thus
always valid. Just store the igt_crtc_t* pointer instead of the pipe in
data, so that we can avoid igt_crtc_for_pipe() lookups and its return
value checks.

While at it, also fix the call to igt_pipe_crc_new() by passing the CRTC
index instead of pipe to it.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tests/kms_explicit_fence.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/kms_explicit_fence.c b/tests/kms_explicit_fence.c
index a7d127c93afc..0b85a9402383 100644
--- a/tests/kms_explicit_fence.c
+++ b/tests/kms_explicit_fence.c
@@ -54,7 +54,7 @@ typedef struct {
 	int drm_fd;
 	igt_display_t display;
 	igt_output_t *output;
-	enum pipe pipe;
+	igt_crtc_t *crtc;
 	igt_plane_t *primary;
 	igt_plane_t *overlay1;
 	igt_plane_t *overlay2;
@@ -91,7 +91,7 @@ static void setup_output(data_t *data)
 								       DRM_PLANE_TYPE_OVERLAY,
 								       1);
 			data->output = output;
-			data->pipe = crtc->pipe;
+			data->crtc = crtc;
 			data->mode = igt_output_get_mode(output);
 			data->width = data->mode->hdisplay;
 			data->height = data->mode->vdisplay;
@@ -141,7 +141,7 @@ static void create_fbs(data_t *data)
 static void setup_initial_modeset(data_t *data)
 {
 	/* Initial modeset to establish baseline (no fences) */
-	igt_output_set_crtc(data->output, igt_crtc_for_pipe(&data->display, data->pipe));
+	igt_output_set_crtc(data->output, data->crtc);
 	igt_plane_set_fb(data->primary, &data->primary_fb);
 	igt_plane_set_fb(data->overlay1, &data->overlay1_fb);
 	igt_plane_set_position(data->overlay1, OVERLAY1_POS_X, OVERLAY1_POS_Y);
@@ -250,7 +250,7 @@ static void multiplane_atomic_fence_wait(data_t *data)
 				data->overlay1_fb.width, OVERLAY1_POS_Y);
 
 	/* Request OUT_FENCE to track when display update completes */
-	igt_crtc_request_out_fence(igt_crtc_for_pipe(&data->display, data->pipe));
+	igt_crtc_request_out_fence(data->crtc);
 
 	/*
 	 * The atomic commit should succeed immediately (NONBLOCK mode),
@@ -268,7 +268,7 @@ static void multiplane_atomic_fence_wait(data_t *data)
 	igt_assert_eq(ret, 0);
 
 	/* Get the out fence to monitor completion */
-	out_fence = igt_crtc_for_pipe(&data->display, data->pipe)->out_fence_fd;
+	out_fence = data->crtc->out_fence_fd;
 	igt_assert(out_fence >= 0);
 
 	/* Verify overlay2 fence (last one) is still unsignaled */
@@ -324,7 +324,7 @@ static void multiplane_atomic_fence_wait(data_t *data)
 		igt_plane_set_fence_fd(planes[i], -1);
 	}
 	close(out_fence);
-	igt_crtc_for_pipe(&data->display, data->pipe)->out_fence_fd = -1;
+	data->crtc->out_fence_fd = -1;
 }
 
 static void reset_display_state(data_t *data)
@@ -349,7 +349,7 @@ int igt_main()
 		setup_output(&data);
 		create_fbs(&data);
 
-		data.pipe_crc = igt_pipe_crc_new(data.drm_fd, data.pipe,
+		data.pipe_crc = igt_pipe_crc_new(data.drm_fd, data.crtc->crtc_index,
 						 IGT_PIPE_CRC_SOURCE_AUTO);
 	}
 
-- 
2.47.3

