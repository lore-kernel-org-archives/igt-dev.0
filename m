Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44137F532FA
	for <igt-dev@archiver.kernel.org>; Tue, 24 Mar 2026 09:02:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9FCB10E634;
	Tue, 24 Mar 2026 09:02:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OGa7mmsE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BDE410E636
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Mar 2026 09:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774342935; x=1805878935;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ktkSpLbXBjF1qhAqdGClK5yh0f/Gzbu57nwnB0bdsoo=;
 b=OGa7mmsEqwfQ6RKE0wXbBLP7dKCnmfWOP1n5hKp/UFPcn6xQe0u6Un8j
 AQbWUL+7+UrzS4t0zFmROWP9q1StUb1zhi8a5Y70Far61V2jMyWnjaQWo
 9G9rGe/So8LeLL42PweV+bHjt8sKuoRy9BtgETf4kKeI0PuTvLX1hV047
 tbsshMoYh3g5PqBdh+HRYkHgnSbrR15QKmZceYlsCSAZtAm4JqsrSDYD1
 +DPFupT6yCMd0bz/4hU8D/9+5/1VCPqS8WdY1YVKwrTmjEnL2uuMdAYxg
 /fuVJAV/r9ddh/2+6AtYDXHvyZaapZmfWjRTYYnw+sINUV3xIqUiN04Ny g==;
X-CSE-ConnectionGUID: ptgumQB+S0uoR2huev56yQ==
X-CSE-MsgGUID: mwrm1rG8TXavtToQc8kCAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75545453"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="75545453"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 02:02:14 -0700
X-CSE-ConnectionGUID: qag/6JANQUSLN43f6UHctA==
X-CSE-MsgGUID: d418xedbQwq0EwnRJ9XXbA==
X-ExtLoop1: 1
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.52])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 02:02:12 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [CI 4/5] tests/kms_explicit_fence: store igt_crtc_t* instead of pipe
 in data
Date: Tue, 24 Mar 2026 11:01:50 +0200
Message-ID: <49966370e1585280b9bda8128e9500b93d89b8a9.1774342824.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774342824.git.jani.nikula@intel.com>
References: <cover.1774342824.git.jani.nikula@intel.com>
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

