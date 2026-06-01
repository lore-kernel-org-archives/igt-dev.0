Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F96CD6E4C
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jun 2026 08:14:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF523112F5A;
	Mon,  1 Jun 2026 08:14:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bdbjM+eF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9698B112F56
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jun 2026 08:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780301597; x=1811837597;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dll3EEpP/eGJ2fdHJKp1JEpp+6aK+92G1QVe+rXSDY4=;
 b=bdbjM+eF8tyW2Z09TLIg7PGyszJ8Tsmf5tX1hwopSkq1Y2t/qv3XeNXm
 akQrh9pEyUD7kXVwtBFqLQXPIoWyn+RHH+RqWIYgoScjB7vNXCKZsNuQ6
 G+H6X/FXjVj9XuZKScQgNZLWhz4+du4nXwRCDgHZ8ZnLRLZX4MYECZacp
 ytOgahX1TTaQ9jXppKjEYPdqrnqL3UEgobZWYyBIE7bJag4A88k6//2xp
 remEgUFnpKPKsXAwY3PtKTSz54bFdGprmBNR0Pptpq+/8/J+Dt4WDnLX8
 RsuIVY6WOu3yzsARxdBJjBIWWgylCYiMtgDof9JbbxCVQ01s8wpc3qbx0 A==;
X-CSE-ConnectionGUID: LAuhw4PFRHCgQcPtRVLvjg==
X-CSE-MsgGUID: ObTaHLgsQSG3gbtJYVvyRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="80906135"
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; d="scan'208";a="80906135"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 01:13:17 -0700
X-CSE-ConnectionGUID: 0xmjrrK9QxSu1Z5G8KsUHg==
X-CSE-MsgGUID: PFPjdR5JQJi+zWd4RpTrhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,180,1774335600"; d="scan'208";a="245337459"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by fmviesa004.fm.intel.com with ESMTP; 01 Jun 2026 01:13:14 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v4 1/2] tests/kms_color: Use explicit YCbCr
 encoding/range in FB creation
Date: Mon,  1 Jun 2026 13:54:09 +0530
Message-Id: <20260601082410.798948-2-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260601082410.798948-1-pranay.samala@intel.com>
References: <20260601082410.798948-1-pranay.samala@intel.com>
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

Switch framebuffer creation from igt_create_fb() to
igt_create_fb_with_bo_size() to explicitly specify YCbCr encoding
and range parameter.

YUV formats may otherwise be interpreted using implicit limited-range
defaults (16-235) instead of full-range values (0-255). Using explicit
full-range handling keeps the expected color values deterministic for
YUV test coverage.

v3:
- Update commit message (Swati)

v4:
- Split the patches (Swati)

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_color.c | 128 +++++++++++++++++++++++++++++-----------------
 1 file changed, 80 insertions(+), 48 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 565edb2dc..146181fbb 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -104,20 +104,28 @@ static bool test_pipe_degamma(data_t *data,
 	igt_output_override_mode(output, mode);
 
 	/* Create a framebuffer at the size of the output. */
-	fb_id = igt_create_fb(data->drm_fd,
-			      mode->hdisplay,
-			      mode->vdisplay,
-			      data->drm_format,
-			      DRM_FORMAT_MOD_LINEAR,
-			      &fb);
+	fb_id = igt_create_fb_with_bo_size(data->drm_fd,
+					   mode->hdisplay,
+					   mode->vdisplay,
+					   data->drm_format,
+					   DRM_FORMAT_MOD_LINEAR,
+					   IGT_COLOR_YCBCR_BT709,
+					   IGT_COLOR_YCBCR_FULL_RANGE,
+					   &fb,
+					   0,
+					   0);
 	igt_assert(fb_id);
 
-	fb_modeset_id = igt_create_fb(data->drm_fd,
-				      mode->hdisplay,
-				      mode->vdisplay,
-				      data->drm_format,
-				      DRM_FORMAT_MOD_LINEAR,
-				      &fb_modeset);
+	fb_modeset_id = igt_create_fb_with_bo_size(data->drm_fd,
+						   mode->hdisplay,
+						   mode->vdisplay,
+						   data->drm_format,
+						   DRM_FORMAT_MOD_LINEAR,
+						   IGT_COLOR_YCBCR_BT709,
+						   IGT_COLOR_YCBCR_FULL_RANGE,
+						   &fb_modeset,
+						   0,
+						   0);
 	igt_assert(fb_modeset_id);
 
 	igt_plane_set_fb(primary, &fb_modeset);
@@ -191,20 +199,28 @@ static bool test_pipe_gamma(data_t *data,
 	igt_output_override_mode(output, mode);
 
 	/* Create a framebuffer at the size of the output. */
-	fb_id = igt_create_fb(data->drm_fd,
-			      mode->hdisplay,
-			      mode->vdisplay,
-			      data->drm_format,
-			      DRM_FORMAT_MOD_LINEAR,
-			      &fb);
+	fb_id = igt_create_fb_with_bo_size(data->drm_fd,
+					   mode->hdisplay,
+					   mode->vdisplay,
+					   data->drm_format,
+					   DRM_FORMAT_MOD_LINEAR,
+					   IGT_COLOR_YCBCR_BT709,
+					   IGT_COLOR_YCBCR_FULL_RANGE,
+					   &fb,
+					   0,
+					   0);
 	igt_assert(fb_id);
 
-	fb_modeset_id = igt_create_fb(data->drm_fd,
-				      mode->hdisplay,
-				      mode->vdisplay,
-				      data->drm_format,
-				      DRM_FORMAT_MOD_LINEAR,
-				      &fb_modeset);
+	fb_modeset_id = igt_create_fb_with_bo_size(data->drm_fd,
+						   mode->hdisplay,
+						   mode->vdisplay,
+						   data->drm_format,
+						   DRM_FORMAT_MOD_LINEAR,
+						   IGT_COLOR_YCBCR_BT709,
+						   IGT_COLOR_YCBCR_FULL_RANGE,
+						   &fb_modeset,
+						   0,
+						   0);
 	igt_assert(fb_modeset_id);
 
 	igt_plane_set_fb(primary, &fb_modeset);
@@ -285,20 +301,28 @@ static bool test_pipe_legacy_gamma(data_t *data,
 	igt_output_override_mode(output, mode);
 
 	/* Create a framebuffer at the size of the output. */
-	fb_id = igt_create_fb(data->drm_fd,
-			      mode->hdisplay,
-			      mode->vdisplay,
-			      DRM_FORMAT_XRGB8888,
-			      DRM_FORMAT_MOD_LINEAR,
-			      &fb);
+	fb_id = igt_create_fb_with_bo_size(data->drm_fd,
+					   mode->hdisplay,
+					   mode->vdisplay,
+					   DRM_FORMAT_XRGB8888,
+					   DRM_FORMAT_MOD_LINEAR,
+					   IGT_COLOR_YCBCR_BT709,
+					   IGT_COLOR_YCBCR_FULL_RANGE,
+					   &fb,
+					   0,
+					   0);
 	igt_assert(fb_id);
 
-	fb_modeset_id = igt_create_fb(data->drm_fd,
-				      mode->hdisplay,
-				      mode->vdisplay,
-				      DRM_FORMAT_XRGB8888,
-				      DRM_FORMAT_MOD_LINEAR,
-				      &fb_modeset);
+	fb_modeset_id = igt_create_fb_with_bo_size(data->drm_fd,
+						   mode->hdisplay,
+						   mode->vdisplay,
+						   DRM_FORMAT_XRGB8888,
+						   DRM_FORMAT_MOD_LINEAR,
+						   IGT_COLOR_YCBCR_BT709,
+						   IGT_COLOR_YCBCR_FULL_RANGE,
+						   &fb_modeset,
+						   0,
+						   0);
 	igt_assert(fb_modeset_id);
 
 	igt_plane_set_fb(primary, &fb_modeset);
@@ -520,20 +544,28 @@ static bool test_pipe_ctm(data_t *data,
 	igt_output_override_mode(output, mode);
 
 	/* Create a framebuffer at the size of the output. */
-	fb_id = igt_create_fb(data->drm_fd,
-			      mode->hdisplay,
-			      mode->vdisplay,
-			      data->drm_format,
-			      DRM_FORMAT_MOD_LINEAR,
-			      &fb);
+	fb_id = igt_create_fb_with_bo_size(data->drm_fd,
+					   mode->hdisplay,
+					   mode->vdisplay,
+					   data->drm_format,
+					   DRM_FORMAT_MOD_LINEAR,
+					   IGT_COLOR_YCBCR_BT709,
+					   IGT_COLOR_YCBCR_FULL_RANGE,
+					   &fb,
+					   0,
+					   0);
 	igt_assert(fb_id);
 
-	fb_modeset_id = igt_create_fb(data->drm_fd,
-				      mode->hdisplay,
-				      mode->vdisplay,
-				      data->drm_format,
-				      DRM_FORMAT_MOD_LINEAR,
-				      &fb_modeset);
+	fb_modeset_id = igt_create_fb_with_bo_size(data->drm_fd,
+						   mode->hdisplay,
+						   mode->vdisplay,
+						   data->drm_format,
+						   DRM_FORMAT_MOD_LINEAR,
+						   IGT_COLOR_YCBCR_BT709,
+						   IGT_COLOR_YCBCR_FULL_RANGE,
+						   &fb_modeset,
+						   0,
+						   0);
 	igt_assert(fb_modeset_id);
 	igt_plane_set_fb(primary, &fb_modeset);
 
-- 
2.34.1

