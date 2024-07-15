Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE14C3DA4B
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jul 2024 15:42:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2D8A10E42D;
	Mon, 15 Jul 2024 15:42:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UHr1ERID";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 210FE10E427
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jul 2024 15:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721058153; x=1752594153;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bM2/u/NzcJspoaOF6vuJbJm8rPpIhOxqLs+N/wEF/ek=;
 b=UHr1ERIDWCMLlR76BmoQVydAJydcZCSikNRnvJ8vYgqRFjIn5BS3ZX1G
 UEmnVHriND2Zn4XrzqFVxrB+W8GHZDqy3wzQarA+L3a953jdZfH0L7RK6
 sXkK0uuPKRuD7ZKbxzttWcDJKj4+lbrJ5yrguncj4K0YQtZLV5XZR1opA
 C2/A6MCeX92HKE24HNi7B97FFLdMicAeIUu10yM9KSEAsTR1JL3a01cB8
 /Nh5pbdyteM7uGrDiR/MociSjPRh8bqgu1ZXMP0XcuYkMC3N1SjY9Jjtn
 m9Y3U7ZFSkhzyNSXx542YAhQbWh9d7L0akaWr5Sx9HMrKM8ZblP6l57GD g==;
X-CSE-ConnectionGUID: 4frfESsFSeeAkokakwYLsA==
X-CSE-MsgGUID: HtGpW2vfRleXLpQGBDtyXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="35987970"
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; d="scan'208";a="35987970"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 08:42:26 -0700
X-CSE-ConnectionGUID: cVL9LJvRSCSVUz4ZopQMfA==
X-CSE-MsgGUID: trOz59fVQRa2BkRx1M2Gyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,210,1716274800"; d="scan'208";a="49408728"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 08:42:24 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, kunal1.joshi@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t 4/5] tests/kms_plane_scaling: Improvise the plane
 scaling BW issues
Date: Mon, 15 Jul 2024 21:16:27 +0530
Message-ID: <20240715154628.583682-5-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240715154628.583682-1-ramanaidu.naladala@intel.com>
References: <20240715154628.583682-1-ramanaidu.naladala@intel.com>
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
address these failures, we will switch to the next lowest display
modes. Higher display modes will be identified as insufficient for
downscaling operations on plane scaling. As a solution, we
will implement a fix: when bandwidth is inadequate for current
modes, the system will automatically attempt the next lower
display mode.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_plane_scaling.c | 82 +++++++++++++++++++--------------------
 1 file changed, 40 insertions(+), 42 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 1702ec8c8..020d72953 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -582,54 +582,52 @@ static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
 	int w, h;
 	int width, height;
 
-	mode = igt_output_get_mode(output);
-
-	if (is_clip_clamp == true) {
-		width = mode->hdisplay + 100;
-		height = mode->vdisplay + 100;
-	} else {
-		width = get_width(mode, sf_plane1);
-		height = get_height(mode, sf_plane1);
-	}
-
-	if (is_upscale) {
-		w = width;
-		h = height;
-	} else {
-		w = mode->hdisplay;
-		h = mode->vdisplay;
+	for_each_connector_mode(output) {
+		mode = &output->config.connector->modes[j__];
+		if (is_upscale) {
+			w = get_width(mode, sf_plane1);
+			h = get_height(mode, sf_plane1);
+		} else {
+			if (is_clip_clamp == true) {
+				width = mode->hdisplay + 100;
+				height = mode->vdisplay + 100;
+			} else {
+				width = get_width(mode, sf_plane1);
+				height = get_height(mode, sf_plane1);
+			}
+			w = mode->hdisplay;
+			h = mode->vdisplay;
+		}
+		/*
+		 * guarantee even value width/height to avoid fractional
+		 * uv component in chroma subsampling for yuv 4:2:0 formats
+		 */
+		w = ALIGN(w, 2);
+		h = ALIGN(h, 2);
+		igt_create_fb(display->drm_fd, w, h, pixel_format,
+				modifier, &d->fb[0]);
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
+		if (commit_ret == 0)
+			break;
 	}
 
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
-
-	if (is_upscale)
-		igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
-	else
-		igt_plane_set_size(plane, width, height);
-
-	if (rot != IGT_ROTATION_0)
-		igt_plane_set_rotation(plane, rot);
-	commit_ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
-
 	igt_plane_set_fb(plane, NULL);
 	igt_plane_set_position(plane, 0, 0);
 	cleanup_fbs(d);
-
 	igt_skip_on_f(commit_ret == -ERANGE || commit_ret == -EINVAL,
-		      "Unsupported scaling factor with fb size %dx%d\n",
-		      w, h);
+			"Unsupported scaling factor with fb size %dx%d\n", w, h);
 	igt_assert_eq(commit_ret, 0);
 }
 
-- 
2.43.0

