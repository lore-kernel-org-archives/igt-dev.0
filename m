Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55588C3DA60
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jul 2024 14:59:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED3AC10E1C0;
	Wed, 17 Jul 2024 14:59:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jQ+NILmT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6862D10E1A4
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jul 2024 14:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721228388; x=1752764388;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kPyB/OtBkO6CUR+jPL2GSyhGwdhRwvk0yPjLrE4iEnc=;
 b=jQ+NILmTjTEJxm8yh3Vg12EyiqIvMVRvFogat2bv8u1AShgcsepfdKNN
 DykQZ3vcs/btKu30Lw0RLAnE4ybeU4t268PZxnSDz4owA5lxBpI4QJDec
 6soQNuujlAfc3dLlDFG+LPEQuae21R8GYr0z5HDu5HEZRblSj9GMfYElF
 mckEwraEKVqxpdTDJ91Ax7xm4njsAK0vCGfo+EFeVSqNXE+WQY9wfiSz7
 +kFos/H26mkrqnuzF4bAQkfPdiGU6MkVk11RVj9q7u5U9xqxmPBiOXseQ
 BuN9s+Mrs957d26utc3kpwuHaLz3tmF5NUjauY8CRpZRtSEm6tuvPZa/l g==;
X-CSE-ConnectionGUID: O72NMNUVTnWWgEKv2cjJkw==
X-CSE-MsgGUID: iM5JtLLHRGC8vGUW2v1zhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18354555"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="18354555"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 07:59:47 -0700
X-CSE-ConnectionGUID: 9O4I2xxFTl23WLIMXs0hUA==
X-CSE-MsgGUID: pA4X79VUSSy7hXEwBFKSUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; d="scan'208";a="87890835"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 07:59:45 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, kunal1.joshi@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t 4/5] tests/kms_plane_scaling: Improvise the plane
 scaling BW issues
Date: Wed, 17 Jul 2024 20:33:45 +0530
Message-ID: <20240717150346.650276-5-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240717150346.650276-1-ramanaidu.naladala@intel.com>
References: <20240717150346.650276-1-ramanaidu.naladala@intel.com>
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
mode.Some higher display modes will be identified as insufficient
for downscaling operations on plane scaling. As a solution, we
will implement a fix: when bandwidth is inadequate for current
modes, the system will automatically attempt the next lower
display mode.

v2: Fix some styling issues in the patch (Ankit)
v3: Split single plane and multi plane scaling
    functions arguments in separate patch (Ankit)
v4: Split single plane and multi plane scaling
    functions in separate patch (Ankit)
v5: Update check_scaling_pipe_plane_rot to handle
    scaling mode failure by trying next lower mode.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_plane_scaling.c | 99 +++++++++++++++++++++------------------
 1 file changed, 53 insertions(+), 46 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 385f02df9..a7e17dfe7 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -582,55 +582,62 @@ static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
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
+			igt_debug("Unsupported scaling factor with fb size %dx%d\n",
+				   w, h);
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
 	igt_skip_on_f(commit_ret == -ERANGE || commit_ret == -EINVAL,
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
-	igt_skip_on_f(commit_ret == -ERANGE || commit_ret == -EINVAL,
-		      "Unsupported scaling factor with fb size %dx%d\n",
-		      w, h);
+		      "Scaling op not supported by driver\n");
 	igt_assert_eq(commit_ret, 0);
 }
 
-- 
2.43.0

