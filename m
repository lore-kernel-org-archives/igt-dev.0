Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9EFC3DA49
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jul 2024 11:07:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40B0E10E78B;
	Thu, 18 Jul 2024 11:07:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TB2ChhZ+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADC8010E78B
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jul 2024 11:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721300864; x=1752836864;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Dt8CBwsEZ7j6Ip90IGYrtfIvGEcR859mBDZi4krdCDs=;
 b=TB2ChhZ+rHfRCUUV2mX7a/Xerj0HDLnOrgx4LyBkUqCmaxcK+Ck+pES9
 UmuK7couaHV5BiH/iHJcs43DzwywaTfHuFLWzMXbWfYB94fuVk1YdOh5W
 tPmnJtLVpMfr3QacIHCURxbSdBI0NHPK9NzyITz4oDqHp8sQPy+nq9CTx
 mZ1c9LRP32DVxEEyEe8hAQnW/wNxZIjmdXTQ2GHMrnieQvAf07FRcZzlR
 MGMukKzjX2TEVyjdxZHvTn3Hz45qpMm1nJM+oidFxEPmXsTw9IEsPG17i
 1H+yIy/K4s5IWTuJxYK6gx9wLkhEcG6+NLkGRJw7J7A+mHA8UIBf0N3c9 Q==;
X-CSE-ConnectionGUID: gsnAtBU2TyaB4lhK689q7A==
X-CSE-MsgGUID: BV749zMTRGyJIp14DbVXqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="44277918"
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="44277918"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 04:07:44 -0700
X-CSE-ConnectionGUID: aUyTAJgqSE2toGSs6cNKRg==
X-CSE-MsgGUID: v+iuEJi/Q0a4vBNrnbcyTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; d="scan'208";a="50678078"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 04:07:42 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, kunal1.joshi@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v6 4/5] tests/kms_plane_scaling: Find display mode
 fitting in BW for rotations
Date: Thu, 18 Jul 2024 16:41:45 +0530
Message-ID: <20240718111146.665240-5-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240718111146.665240-1-ramanaidu.naladala@intel.com>
References: <20240718111146.665240-1-ramanaidu.naladala@intel.com>
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

Anticipating bandwidth issues, we expect many tests to fail. To
address these failures, we will switch to the next lower display
mode. Some higher display modes will be identified as insufficient
for downscaling operations on plane scaling. As a solution, we
will implement a fix: When bandwidth is inadequate for current
modes, the system will automatically attempt the next lower
display mode.

Example for failure:
[drm:intel_compute_min_cdclk [xe]] required cdclk (1066500 kHz)
exceeds max (652800 kHz)

v2: Fix some styling issues in the patch (Ankit)
v3: Split single plane and multi plane scaling
    functions arguments in separate patch (Ankit)
v4: Split single plane and multi plane scaling
    functions in separate patch (Ankit)
v5: Update check_scaling_pipe_plane_rot to handle
    scaling mode failure by trying next lower mode
v6: Update commit subject/message and add driver return value
    in igt_debug and igt_skip print   (kamil)

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_plane_scaling.c | 101 +++++++++++++++++++++-----------------
 1 file changed, 55 insertions(+), 46 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 2c4490fd3..6cd7ed35d 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -582,55 +582,64 @@ static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
 	int w, h;
 	int width, height;
 
-	mode = igt_output_get_mode(output);
-	if (is_clip_clamp == true) {
-		width = mode->hdisplay + 100;
-		height = mode->vdisplay + 100;
-	} else {
-		width = get_width(mode, sf_plane);
-		height = get_height(mode, sf_plane);
-	}
+	for_each_connector_mode(output) {
+		mode = &output->config.connector->modes[j__];
+		igt_debug("Trying mode %dx%d\n",
+				mode->hdisplay, mode->vdisplay);
+		if (is_clip_clamp == true) {
+			width = mode->hdisplay + 100;
+			height = mode->vdisplay + 100;
+		} else {
+			width = get_width(mode, sf_plane);
+			height = get_height(mode, sf_plane);
+		}
 
-	if (is_upscale) {
-		w = width;
-		h = height;
-	} else {
-		w = mode->hdisplay;
-		h = mode->vdisplay;
+		if (is_upscale) {
+			w = width;
+			h = height;
+		} else {
+			w = mode->hdisplay;
+			h = mode->vdisplay;
+		}
+		/*
+		 * guarantee even value width/height to avoid fractional
+		 * uv component in chroma subsampling for yuv 4:2:0 formats
+		 */
+		w = ALIGN(w, 2);
+		h = ALIGN(h, 2);
+
+		igt_create_fb(display->drm_fd, w, h, pixel_format,
+			      modifier, &d->fb[0]);
+
+		igt_plane_set_fb(plane, &d->fb[0]);
+		igt_fb_set_position(&d->fb[0], plane, 0, 0);
+		igt_fb_set_size(&d->fb[0], plane, w, h);
+		igt_plane_set_position(plane, 0, 0);
+		commit_ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
+		igt_skip_on_f(commit_ret == -ERANGE || commit_ret == -EINVAL,
+			      "Mode fail with  %dx%d\n", w, h);
+
+		if (is_upscale)
+			igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
+		else
+			igt_plane_set_size(plane, width, height);
+
+		if (rot != IGT_ROTATION_0)
+			igt_plane_set_rotation(plane, rot);
+		commit_ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
+		if (commit_ret == -ERANGE || commit_ret == -EINVAL)
+			igt_debug("Unsupported scaling factor with fb size %dx%d "
+				  "with return value %s\n",
+				   w, h, (commit_ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
+		igt_plane_set_fb(plane, NULL);
+		igt_plane_set_position(plane, 0, 0);
+		cleanup_fbs(d);
+		if (commit_ret == 0)
+			break;
 	}
-
-	/*
-	 * guarantee even value width/height to avoid fractional
-	 * uv component in chroma subsampling for yuv 4:2:0 formats
-	 * */
-	w = ALIGN(w, 2);
-	h = ALIGN(h, 2);
-
-	igt_create_fb(display->drm_fd, w, h, pixel_format, modifier, &d->fb[0]);
-
-	igt_plane_set_fb(plane, &d->fb[0]);
-	igt_fb_set_position(&d->fb[0], plane, 0, 0);
-	igt_fb_set_size(&d->fb[0], plane, w, h);
-	igt_plane_set_position(plane, 0, 0);
-	commit_ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
-	igt_skip_on_f(commit_ret == -ERANGE || commit_ret == -EINVAL,
-		      "Mode fail with  %dx%d\n", w, h);
-	if (is_upscale)
-		igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
-	else
-		igt_plane_set_size(plane, width, height);
-
-	if (rot != IGT_ROTATION_0)
-		igt_plane_set_rotation(plane, rot);
-	commit_ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
-
-	igt_plane_set_fb(plane, NULL);
-	igt_plane_set_position(plane, 0, 0);
-	cleanup_fbs(d);
-
 	igt_skip_on_f(commit_ret == -ERANGE || commit_ret == -EINVAL,
-		      "Unsupported scaling factor with fb size %dx%d\n",
-		      w, h);
+		      "Unsupported scaling operation in driver with return value %s\n",
+		      (commit_ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
 	igt_assert_eq(commit_ret, 0);
 }
 
-- 
2.43.0

