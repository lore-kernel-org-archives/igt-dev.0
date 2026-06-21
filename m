Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14BD6CD98F0
	for <igt-dev@archiver.kernel.org>; Sun, 21 Jun 2026 18:15:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 979AD10E27C;
	Sun, 21 Jun 2026 18:14:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kZZUd8zI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC53110E27C
 for <igt-dev@lists.freedesktop.org>; Sun, 21 Jun 2026 18:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782065650; x=1813601650;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EmKXihE1fhcbb6CnhgGFNA+1e1frH8vpRWuM/Vh4XcE=;
 b=kZZUd8zIcbZyURk6YiohBci8WS1KC7g2e/B77cjY/0HPtSAcZ15amYWC
 KbIEd/Kh/K1B/pLgcVjcQUjFGfEOJLbNMkteY5hjDgnC40f+3dvTBUGJn
 WNIzPRH0SGTK+YsSTIQFcnsmaPzZgKUIP6Gb1j/yT6FGpZSKTXntLTcMH
 DSe+geB0rlslEoGPF5bVAntRH+fjAu4hV+1Z2EEa/2ERH3c0b9G0bWiHA
 xhD87oASmc4+dGtiFMUNoQzy846JroB4pcgSS4jsNlxVBuCWQb0bHxNCQ
 K2diHI/RL/QrpgG+l3bpQmgoF15VAvCbBdAXd1VVwRHhfgTFyDCzto6tQ w==;
X-CSE-ConnectionGUID: U4/LwXgETwKgmSaDopaIgA==
X-CSE-MsgGUID: Cq5ZSnEpTOS5MTEp2D1asA==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="94200608"
X-IronPort-AV: E=Sophos;i="6.24,217,1774335600"; d="scan'208";a="94200608"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2026 11:14:09 -0700
X-CSE-ConnectionGUID: FK2oRRdIQrCtWQQvfnaH6Q==
X-CSE-MsgGUID: p4zHtwTfT/ajFdTvtTkz7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,217,1774335600"; d="scan'208";a="244695301"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by fmviesa006.fm.intel.com with ESMTP; 21 Jun 2026 11:14:07 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v6 1/2] tests/kms_color: Prepare FB creation for
 explicit YUV color range handling
Date: Sun, 21 Jun 2026 23:55:05 +0530
Message-Id: <20260621182506.2970102-2-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260621182506.2970102-1-pranay.samala@intel.com>
References: <20260621182506.2970102-1-pranay.samala@intel.com>
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

Switch framebuffer creation from igt_create_fb() to a common path that can
use igt_create_fb_with_bo_size() when explicit YCbCr encoding/range is
needed.

YUV formats may otherwise be interpreted with implicit limited-range
defaults (16-235) instead of full range (0-255), which can make color
expectations non-deterministic in YUV coverage.

This is a preparatory cleanup and does not fix a user-visible bug.
It refactors FB creation so YUV paths can carry explicit YCbCr
parameters, while RGB paths continue using the default framebuffer
creation behavior.

v3:
- Update commit message (Swati)

v4:
- Split the patches (Swati)

v5:
- Add a common FB helper to centralize framebuffer creation (Swati)
- Keep RGB formats on the existing igt_create_fb() path (Swati)
- Use explicit range/encoding only for YUV formats (Swati)
- Update commit message (Swati)

v6:
- Rename fb creation helper name (Swati)
- Make YCbCr encoding and range explicit helper parameters (Swati)

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_color.c | 125 ++++++++++++++++++++++++----------------------
 1 file changed, 65 insertions(+), 60 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 565edb2dc..d98be46f0 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -78,6 +78,21 @@
 
 IGT_TEST_DESCRIPTION("Test Color Features at Pipe level");
 
+static unsigned int create_test_fb(data_t *data, int w, int h,
+				   uint32_t format,
+				   enum igt_color_encoding encoding,
+				   enum igt_color_range range,
+				   struct igt_fb *fb)
+{
+	if (igt_format_is_yuv(format))
+		return igt_create_fb_with_bo_size(data->drm_fd, w, h, format,
+						  DRM_FORMAT_MOD_LINEAR,
+						  encoding, range, fb, 0, 0);
+
+	return igt_create_fb(data->drm_fd, w, h, format,
+			     DRM_FORMAT_MOD_LINEAR, fb);
+}
+
 static bool test_pipe_degamma(data_t *data,
 			      igt_plane_t *primary)
 {
@@ -104,20 +119,18 @@ static bool test_pipe_degamma(data_t *data,
 	igt_output_override_mode(output, mode);
 
 	/* Create a framebuffer at the size of the output. */
-	fb_id = igt_create_fb(data->drm_fd,
-			      mode->hdisplay,
-			      mode->vdisplay,
-			      data->drm_format,
-			      DRM_FORMAT_MOD_LINEAR,
-			      &fb);
+	fb_id = create_test_fb(data, mode->hdisplay, mode->vdisplay,
+			       data->drm_format,
+			       IGT_COLOR_YCBCR_BT709,
+			       IGT_COLOR_YCBCR_FULL_RANGE,
+			       &fb);
 	igt_assert(fb_id);
 
-	fb_modeset_id = igt_create_fb(data->drm_fd,
-				      mode->hdisplay,
-				      mode->vdisplay,
-				      data->drm_format,
-				      DRM_FORMAT_MOD_LINEAR,
-				      &fb_modeset);
+	fb_modeset_id = create_test_fb(data, mode->hdisplay, mode->vdisplay,
+				       data->drm_format,
+				       IGT_COLOR_YCBCR_BT709,
+				       IGT_COLOR_YCBCR_FULL_RANGE,
+				       &fb_modeset);
 	igt_assert(fb_modeset_id);
 
 	igt_plane_set_fb(primary, &fb_modeset);
@@ -191,20 +204,18 @@ static bool test_pipe_gamma(data_t *data,
 	igt_output_override_mode(output, mode);
 
 	/* Create a framebuffer at the size of the output. */
-	fb_id = igt_create_fb(data->drm_fd,
-			      mode->hdisplay,
-			      mode->vdisplay,
-			      data->drm_format,
-			      DRM_FORMAT_MOD_LINEAR,
-			      &fb);
+	fb_id = create_test_fb(data, mode->hdisplay, mode->vdisplay,
+			       data->drm_format,
+			       IGT_COLOR_YCBCR_BT709,
+			       IGT_COLOR_YCBCR_FULL_RANGE,
+			       &fb);
 	igt_assert(fb_id);
 
-	fb_modeset_id = igt_create_fb(data->drm_fd,
-				      mode->hdisplay,
-				      mode->vdisplay,
-				      data->drm_format,
-				      DRM_FORMAT_MOD_LINEAR,
-				      &fb_modeset);
+	fb_modeset_id = create_test_fb(data, mode->hdisplay, mode->vdisplay,
+				       data->drm_format,
+				       IGT_COLOR_YCBCR_BT709,
+				       IGT_COLOR_YCBCR_FULL_RANGE,
+				       &fb_modeset);
 	igt_assert(fb_modeset_id);
 
 	igt_plane_set_fb(primary, &fb_modeset);
@@ -285,20 +296,18 @@ static bool test_pipe_legacy_gamma(data_t *data,
 	igt_output_override_mode(output, mode);
 
 	/* Create a framebuffer at the size of the output. */
-	fb_id = igt_create_fb(data->drm_fd,
-			      mode->hdisplay,
-			      mode->vdisplay,
-			      DRM_FORMAT_XRGB8888,
-			      DRM_FORMAT_MOD_LINEAR,
-			      &fb);
+	fb_id = create_test_fb(data, mode->hdisplay, mode->vdisplay,
+			       DRM_FORMAT_XRGB8888,
+			       IGT_COLOR_YCBCR_BT709,
+			       IGT_COLOR_YCBCR_FULL_RANGE,
+			       &fb);
 	igt_assert(fb_id);
 
-	fb_modeset_id = igt_create_fb(data->drm_fd,
-				      mode->hdisplay,
-				      mode->vdisplay,
-				      DRM_FORMAT_XRGB8888,
-				      DRM_FORMAT_MOD_LINEAR,
-				      &fb_modeset);
+	fb_modeset_id = create_test_fb(data, mode->hdisplay, mode->vdisplay,
+				       DRM_FORMAT_XRGB8888,
+				       IGT_COLOR_YCBCR_BT709,
+				       IGT_COLOR_YCBCR_FULL_RANGE,
+				       &fb_modeset);
 	igt_assert(fb_modeset_id);
 
 	igt_plane_set_fb(primary, &fb_modeset);
@@ -520,20 +529,18 @@ static bool test_pipe_ctm(data_t *data,
 	igt_output_override_mode(output, mode);
 
 	/* Create a framebuffer at the size of the output. */
-	fb_id = igt_create_fb(data->drm_fd,
-			      mode->hdisplay,
-			      mode->vdisplay,
-			      data->drm_format,
-			      DRM_FORMAT_MOD_LINEAR,
-			      &fb);
+	fb_id = create_test_fb(data, mode->hdisplay, mode->vdisplay,
+			       data->drm_format,
+			       IGT_COLOR_YCBCR_BT709,
+			       IGT_COLOR_YCBCR_FULL_RANGE,
+			       &fb);
 	igt_assert(fb_id);
 
-	fb_modeset_id = igt_create_fb(data->drm_fd,
-				      mode->hdisplay,
-				      mode->vdisplay,
-				      data->drm_format,
-				      DRM_FORMAT_MOD_LINEAR,
-				      &fb_modeset);
+	fb_modeset_id = create_test_fb(data, mode->hdisplay, mode->vdisplay,
+				       data->drm_format,
+				       IGT_COLOR_YCBCR_BT709,
+				       IGT_COLOR_YCBCR_FULL_RANGE,
+				       &fb_modeset);
 	igt_assert(fb_modeset_id);
 	igt_plane_set_fb(primary, &fb_modeset);
 
@@ -654,20 +661,18 @@ static void test_pipe_limited_range_ctm(data_t *data,
 		mode = igt_output_get_mode(output);
 
 		/* Create a framebuffer at the size of the output. */
-		fb_id = igt_create_fb(data->drm_fd,
-				      mode->hdisplay,
-				      mode->vdisplay,
-				      DRM_FORMAT_XRGB8888,
-				      DRM_FORMAT_MOD_LINEAR,
-				      &fb);
+		fb_id = create_test_fb(data, mode->hdisplay, mode->vdisplay,
+				       DRM_FORMAT_XRGB8888,
+				       IGT_COLOR_YCBCR_BT709,
+				       IGT_COLOR_YCBCR_FULL_RANGE,
+				       &fb);
 		igt_assert(fb_id);
 
-		fb_modeset_id = igt_create_fb(data->drm_fd,
-					      mode->hdisplay,
-					      mode->vdisplay,
-					      DRM_FORMAT_XRGB8888,
-					      DRM_FORMAT_MOD_LINEAR,
-					      &fb_modeset);
+		fb_modeset_id = create_test_fb(data, mode->hdisplay, mode->vdisplay,
+					       DRM_FORMAT_XRGB8888,
+					       IGT_COLOR_YCBCR_BT709,
+					       IGT_COLOR_YCBCR_FULL_RANGE,
+					       &fb_modeset);
 		igt_assert(fb_modeset_id);
 		igt_plane_set_fb(primary, &fb_modeset);
 
-- 
2.34.1

