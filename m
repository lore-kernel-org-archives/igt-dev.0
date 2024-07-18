Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 005EEC3DA63
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jul 2024 14:01:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA15F10E8AE;
	Thu, 18 Jul 2024 14:01:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="drMvVgzC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19AF310E8AE
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jul 2024 14:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721311307; x=1752847307;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aMkNnJsTgKGL+ohzwfi2Q3a2V7tuMJJyYeB76st7Rxw=;
 b=drMvVgzCYitec2Itg8b0+SGceDvoE8VLx/P6niPg9NkqZlVioGkIC8XA
 SFxNFrWFL7GXAt5KaMZiAnJvnStrtVJnRP1/lxG6IIQAcIR3OvOlmeHL4
 wIQ0aOtYDLjvbwNYJEJCy+8L27RIEyc7r+YPLdwQ88i20wFWrQ/Fafmj/
 FzWmokkZzc5fvyiwC5YMRaxtYSgBzx7ghemXfDF8JWNCVO1fbWPdgyq2K
 EOTu2DmcEqViwJ2zBgJQtgwoV8SoVLEpfKWZp+p/x/ovMDi/EzAGXZ+RS
 irjb1HSyXklyZISRG+NCLEZdkw9w+7ryleEt/M1HLyOHxWPDKUpAhAk0W w==;
X-CSE-ConnectionGUID: O3NrLCRHSuipRkY0x5hJBQ==
X-CSE-MsgGUID: b73h5nQ5TV6Z6nChuKP78w==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="19005893"
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="19005893"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 07:01:47 -0700
X-CSE-ConnectionGUID: 1LZzJVw9Q4+nDDhHSMmL3Q==
X-CSE-MsgGUID: zfTYiJcJSneaxgWtbBtVOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,218,1716274800"; d="scan'208";a="55927320"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2024 07:01:45 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, kunal1.joshi@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v7 4/5] tests/kms_plane_scaling: Find display mode
 fitting in BW for rotations
Date: Thu, 18 Jul 2024 19:35:45 +0530
Message-ID: <20240718140546.676903-5-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240718140546.676903-1-ramanaidu.naladala@intel.com>
References: <20240718140546.676903-1-ramanaidu.naladala@intel.com>
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
modes, the test will automatically attempt the next lower
display mode.

Example for failure:
[drm:intel_compute_min_cdclk [xe]] required cdclk (1066500 kHz) exceeds max (652800 kHz)

v2: Fix some styling issues in the patch (Ankit)
v3: Split single plane and multi plane scaling
    functions arguments in separate patch (Ankit)
v4: Split single plane and multi plane scaling
    functions in separate patch (Ankit)
v5: Update check_scaling_pipe_plane_rot to handle
    scaling mode failure by trying next lower mode
v6: Update commit subject/message and add driver return value
    in igt_debug and igt_skip print   (kamil)
v7: Update message string to single line (Ankit)

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 tests/kms_plane_scaling.c | 93 +++++++++++++++++++++------------------
 1 file changed, 51 insertions(+), 42 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index af255aa7c..90bfb0047 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -582,53 +582,62 @@ static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
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
-
-	if (is_upscale) {
-		w = width;
-		h = height;
-	} else {
-		w = mode->hdisplay;
-		h = mode->vdisplay;
-	}
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
+	for_each_connector_mode(output) {
+		mode = &output->config.connector->modes[j__];
+		igt_debug("Trying mode %dx%d\n",
+			  mode->hdisplay, mode->vdisplay);
 
-	if (is_upscale)
-		igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
-	else
-		igt_plane_set_size(plane, width, height);
+		if (is_clip_clamp == true) {
+			width = mode->hdisplay + 100;
+			height = mode->vdisplay + 100;
+		} else {
+			width = get_width(mode, sf_plane);
+			height = get_height(mode, sf_plane);
+		}
 
-	if (rot != IGT_ROTATION_0)
-		igt_plane_set_rotation(plane, rot);
-	commit_ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
+		if (is_upscale) {
+			w = width;
+			h = height;
+		} else {
+			w = mode->hdisplay;
+			h = mode->vdisplay;
+		}
 
-	igt_plane_set_fb(plane, NULL);
-	igt_plane_set_position(plane, 0, 0);
-	cleanup_fbs(d);
+		/*
+		 * guarantee even value width/height to avoid fractional
+		 * uv component in chroma subsampling for yuv 4:2:0 formats
+		 */
+		w = ALIGN(w, 2);
+		h = ALIGN(h, 2);
+
+		igt_create_fb(display->drm_fd, w, h, pixel_format, modifier, &d->fb[0]);
+
+		igt_plane_set_fb(plane, &d->fb[0]);
+		igt_fb_set_position(&d->fb[0], plane, 0, 0);
+		igt_fb_set_size(&d->fb[0], plane, w, h);
+		igt_plane_set_position(plane, 0, 0);
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
+			igt_debug("Unsupported scaling factor with fb size %dx%d with return value %s\n",
+				  w, h, (commit_ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
+		igt_plane_set_fb(plane, NULL);
+		igt_plane_set_position(plane, 0, 0);
+		cleanup_fbs(d);
+		if (commit_ret == 0)
+			break;
+	}
 
 	igt_skip_on_f(commit_ret == -ERANGE || commit_ret == -EINVAL,
-		      "Unsupported scaling factor with fb size %dx%d\n",
-		      w, h);
+		      "Unsupported scaling operation in driver with return value %s\n",
+		      (commit_ret == -EINVAL) ? "-EINVAL" : "-ERANGE");
 	igt_assert_eq(commit_ret, 0);
 }
 
-- 
2.43.0

