Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00398C4450A
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 04:20:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A609F10E125;
	Wed, 15 Jul 2026 04:20:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dh+viRzb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7305610E125
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 04:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784089164; x=1815625164;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4nFGXOO6MDwTyK7uy6QV5ncfv63SqlPbrTiRU4Ttkyg=;
 b=dh+viRzb/AvKr4BcU73CESp80Vg1GQiA5GHiy2RGJQ8yWfA+L1Vo5mrk
 Qto7MByvFE93Bkeh1v83YP+S/pMpl4+XSgtFkS6i3S0bEiMGKQltm4zZb
 Pg6SIWR78kXZSNZgVD9wcXImv3LJazmfOL5G+T5Sl/Is5oo6/osWYv/xq
 fTt01kQVvDsEXiqwjduxaAtQp7expvwADzrB6xgeWHbD6zJtz4g/u3aIr
 xsM0e6FSTN0L8Qr+uV3Y1qiOM7lwtI747yZkoEUtCmAOKl694pY1mpTVr
 diNPqJ32l8k8I7S4o5vVncCbrtPLum7dEKlfyay/M5odvtlpKYTo/U9l5 w==;
X-CSE-ConnectionGUID: zEVP9jyWQKSZpkSHol6VoA==
X-CSE-MsgGUID: SNx+NGCRTfm5mZIBvXwdww==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84807136"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="84807136"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 21:19:24 -0700
X-CSE-ConnectionGUID: 8jUuDCMrT3K+Cx2nNBPTvw==
X-CSE-MsgGUID: 4caZlQ3DTqKUOIHu3FpfBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="256692239"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 21:19:23 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v2 1/2] tests/chamelium/kms_chamelium_color: Prepare FB
 creation for explicit YUV color range handling
Date: Wed, 15 Jul 2026 10:02:25 +0530
Message-ID: <20260715043226.169521-2-pranay.samala@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260715043226.169521-1-pranay.samala@intel.com>
References: <20260715043226.169521-1-pranay.samala@intel.com>
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

v2:
- Keep RGB formats on the existing igt_create_fb() path
- Use explicit range/encoding only for YUV formats
- Rebase and split the patches

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/chamelium/kms_chamelium_color.c | 138 ++++++++++++++------------
 1 file changed, 72 insertions(+), 66 deletions(-)

diff --git a/tests/chamelium/kms_chamelium_color.c b/tests/chamelium/kms_chamelium_color.c
index 31629ec58..72d7716bc 100644
--- a/tests/chamelium/kms_chamelium_color.c
+++ b/tests/chamelium/kms_chamelium_color.c
@@ -58,6 +58,21 @@
 
 IGT_TEST_DESCRIPTION("Test Color Features at Pipe level using Chamelium to verify instead of CRC");
 
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
 /*
  * Draw 3 gradient rectangles in red, green and blue, with a maxed out
  * degamma LUT and verify we have the same frame dump as drawing solid color
@@ -87,28 +102,25 @@ static bool test_pipe_degamma(data_t *data,
 	igt_output_set_crtc(output, primary->crtc);
 
 	/* Create a framebuffer at the size of the output. */
-	fb_id = igt_create_fb(data->drm_fd,
-			      mode->hdisplay,
-			      mode->vdisplay,
-			      DRM_FORMAT_XRGB8888,
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
-				      DRM_FORMAT_XRGB8888,
-				      DRM_FORMAT_MOD_LINEAR,
-				      &fb_modeset);
+	fb_modeset_id = create_test_fb(data, mode->hdisplay, mode->vdisplay,
+				       data->drm_format,
+				       IGT_COLOR_YCBCR_BT709,
+				       IGT_COLOR_YCBCR_FULL_RANGE,
+				       &fb_modeset);
 	igt_assert(fb_modeset_id);
 
-	fbref_id = igt_create_fb(data->drm_fd,
-				 mode->hdisplay,
-				 mode->vdisplay,
-				 DRM_FORMAT_XRGB8888,
-				 DRM_FORMAT_MOD_LINEAR,
-				 &fbref);
+	fbref_id = create_test_fb(data, mode->hdisplay, mode->vdisplay,
+				  data->drm_format,
+				  IGT_COLOR_YCBCR_BT709,
+				  IGT_COLOR_YCBCR_FULL_RANGE,
+				  &fbref);
 	igt_assert(fbref_id);
 
 	igt_plane_set_fb(primary, &fb_modeset);
@@ -177,28 +189,27 @@ static bool test_pipe_gamma(data_t *data,
 	igt_output_set_crtc(output, primary->crtc);
 
 	/* Create a framebuffer at the size of the output. */
-	fb_id = igt_create_fb(data->drm_fd,
-			      mode->hdisplay,
-			      mode->vdisplay,
-			      DRM_FORMAT_XRGB8888,
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
-				      DRM_FORMAT_XRGB8888,
-				      DRM_FORMAT_MOD_LINEAR,
-				      &fb_modeset);
+	fb_modeset_id = create_test_fb(data, mode->hdisplay,
+				       mode->vdisplay,
+				       data->drm_format,
+				       IGT_COLOR_YCBCR_BT709,
+				       IGT_COLOR_YCBCR_FULL_RANGE,
+				       &fb_modeset);
 	igt_assert(fb_modeset_id);
 
-	fbref_id = igt_create_fb(data->drm_fd,
-			      mode->hdisplay,
-			      mode->vdisplay,
-			      DRM_FORMAT_XRGB8888,
-			      DRM_FORMAT_MOD_LINEAR,
-			      &fbref);
+	fbref_id = create_test_fb(data, mode->hdisplay,
+				  mode->vdisplay,
+				  data->drm_format,
+				  IGT_COLOR_YCBCR_BT709,
+				  IGT_COLOR_YCBCR_FULL_RANGE,
+				  &fbref);
 	igt_assert(fbref_id);
 
 	igt_plane_set_fb(primary, &fbref);
@@ -265,28 +276,25 @@ static bool test_pipe_ctm(data_t *data,
 	igt_output_set_crtc(output, primary->crtc);
 
 	/* Create a framebuffer at the size of the output. */
-	fb_id = igt_create_fb(data->drm_fd,
-			      mode->hdisplay,
-			      mode->vdisplay,
-			      DRM_FORMAT_XRGB8888,
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
-				      DRM_FORMAT_XRGB8888,
-				      DRM_FORMAT_MOD_LINEAR,
-				      &fb_modeset);
+	fb_modeset_id = create_test_fb(data, mode->hdisplay, mode->vdisplay,
+				       data->drm_format,
+				       IGT_COLOR_YCBCR_BT709,
+				       IGT_COLOR_YCBCR_FULL_RANGE,
+				       &fb_modeset);
 	igt_assert(fb_modeset_id);
 
-	fbref_id = igt_create_fb(data->drm_fd,
-				 mode->hdisplay,
-				 mode->vdisplay,
-				 DRM_FORMAT_XRGB8888,
-				 DRM_FORMAT_MOD_LINEAR,
-				 &fbref);
+	fbref_id = create_test_fb(data, mode->hdisplay, mode->vdisplay,
+				  data->drm_format,
+				  IGT_COLOR_YCBCR_BT709,
+				  IGT_COLOR_YCBCR_FULL_RANGE,
+				  &fbref);
 	igt_assert(fbref_id);
 
 	igt_plane_set_fb(primary, &fb_modeset);
@@ -369,20 +377,18 @@ static bool test_pipe_limited_range_ctm(data_t *data,
 	igt_output_set_crtc(output, primary->crtc);
 
 	/* Create a framebuffer at the size of the output. */
-	fb_id0 = igt_create_fb(data->drm_fd,
-			       mode->hdisplay,
-			       mode->vdisplay,
-			       DRM_FORMAT_XRGB8888,
-			       DRM_FORMAT_MOD_LINEAR,
-			       &fb0);
+	fb_id0 = create_test_fb(data, mode->hdisplay, mode->vdisplay,
+				data->drm_format,
+				IGT_COLOR_YCBCR_BT709,
+				IGT_COLOR_YCBCR_FULL_RANGE,
+				&fb0);
 	igt_assert(fb_id0);
 
-	fb_id1 = igt_create_fb(data->drm_fd,
-		               mode->hdisplay,
-			       mode->vdisplay,
-			       DRM_FORMAT_XRGB8888,
-			       DRM_FORMAT_MOD_LINEAR,
-			       &fb1);
+	fb_id1 = create_test_fb(data, mode->hdisplay, mode->vdisplay,
+				data->drm_format,
+				IGT_COLOR_YCBCR_BT709,
+				IGT_COLOR_YCBCR_FULL_RANGE,
+				&fb1);
 	igt_assert(fb_id1);
 
 	set_degamma(data, primary->crtc, degamma_linear);
-- 
2.53.0

