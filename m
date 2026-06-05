Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 594C7CD6E5D
	for <igt-dev@archiver.kernel.org>; Fri,  5 Jun 2026 06:30:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F08C011A45D;
	Fri,  5 Jun 2026 06:30:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VbXZUCYN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9AB911A465
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jun 2026 06:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780641014; x=1812177014;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2y8QpCYSe0qlRD3P+AH7WH8jb/ZVn8lf8a2rcNiAK/4=;
 b=VbXZUCYNaVDCEaHosrIOsLrPn7DtzNazHKN5co6TMlN7GFtKaV4xVqxi
 qO5rOrKv8uILRCNK1piaXXJ30hqT0/2lrCJFKtEdFRQcE1MSrDt/qaivS
 KtYp9fAMsn2N16dsIIclCE6jCDma0jGkN5lVWRnXDhGkqx80wyDniQroO
 LsDTlLA9sT12xgZonhGZ31BoIo3GqnfqUgzNi5g2B+GJBD1il4HWjsWiG
 9qDUUetEaX7oV1JGOLsj9sdhbMo6uEeKq/GLBj6slrP0FPrqsMZvfbNtW
 PN9SOBtPs8HEs39tv9i5lGBwPwcojAKdj1MRo/s0e455X4YRiaqLhGxcd g==;
X-CSE-ConnectionGUID: 8ybWCSFxQmiXOSP7TfBHvw==
X-CSE-MsgGUID: sBENZx8fSD6SvbwreL2geQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="85362751"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="85362751"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 23:30:13 -0700
X-CSE-ConnectionGUID: BZRtCzoiTriVak3rpkcI5w==
X-CSE-MsgGUID: 1pOEEkojSuGaE4SnA+yudg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="240576120"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by fmviesa010.fm.intel.com with ESMTP; 04 Jun 2026 23:30:11 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v5 1/2] tests/kms_color: Prepare FB creation for
 explicit YUV color range handling
Date: Fri,  5 Jun 2026 12:11:02 +0530
Message-Id: <20260605064103.855630-2-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260605064103.855630-1-pranay.samala@intel.com>
References: <20260605064103.855630-1-pranay.samala@intel.com>
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
use igt_create_fb_with_bo_size() when explicit YCbCr encoding/range is needed.

YUV formats may otherwise be interpreted with implicit limited-range defaults
(16-235) instead of full range (0-255), which can make color expectations
non-deterministic in YUV coverage.

This is a preparatory cleanup and does not fix a user-visible bug.
It refactors FB creation so YUV paths can carry explicit YCbCr parameters,
while RGB paths continue using the default framebuffer creation behavior.

v3:
- Update commit message (Swati)

v4:
- Split the patches (Swati)

v5:
- Add a common FB helper to centralize framebuffer creation (Swati)
- Keep RGB formats on the existing igt_create_fb() path (Swati)
- Use explicit range/encoding only for YUV formats (Swati)
- Update commit message (Swati)

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_color.c | 94 +++++++++++++++++------------------------------
 1 file changed, 34 insertions(+), 60 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 565edb2dc..f4b792fdd 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -78,6 +78,20 @@
 
 IGT_TEST_DESCRIPTION("Test Color Features at Pipe level");
 
+static unsigned int create_color_test_fb(data_t *data, int w, int h,
+					 uint32_t format, struct igt_fb *fb)
+{
+	if (igt_format_is_yuv(format))
+		return igt_create_fb_with_bo_size(data->drm_fd, w, h, format,
+						  DRM_FORMAT_MOD_LINEAR,
+						  IGT_COLOR_YCBCR_BT709,
+						  IGT_COLOR_YCBCR_FULL_RANGE,
+						  fb, 0, 0);
+
+	return igt_create_fb(data->drm_fd, w, h, format,
+			     DRM_FORMAT_MOD_LINEAR, fb);
+}
+
 static bool test_pipe_degamma(data_t *data,
 			      igt_plane_t *primary)
 {
@@ -104,20 +118,12 @@ static bool test_pipe_degamma(data_t *data,
 	igt_output_override_mode(output, mode);
 
 	/* Create a framebuffer at the size of the output. */
-	fb_id = igt_create_fb(data->drm_fd,
-			      mode->hdisplay,
-			      mode->vdisplay,
-			      data->drm_format,
-			      DRM_FORMAT_MOD_LINEAR,
-			      &fb);
+	fb_id = create_color_test_fb(data, mode->hdisplay, mode->vdisplay,
+				     data->drm_format, &fb);
 	igt_assert(fb_id);
 
-	fb_modeset_id = igt_create_fb(data->drm_fd,
-				      mode->hdisplay,
-				      mode->vdisplay,
-				      data->drm_format,
-				      DRM_FORMAT_MOD_LINEAR,
-				      &fb_modeset);
+	fb_modeset_id = create_color_test_fb(data, mode->hdisplay, mode->vdisplay,
+					     data->drm_format, &fb_modeset);
 	igt_assert(fb_modeset_id);
 
 	igt_plane_set_fb(primary, &fb_modeset);
@@ -191,20 +197,12 @@ static bool test_pipe_gamma(data_t *data,
 	igt_output_override_mode(output, mode);
 
 	/* Create a framebuffer at the size of the output. */
-	fb_id = igt_create_fb(data->drm_fd,
-			      mode->hdisplay,
-			      mode->vdisplay,
-			      data->drm_format,
-			      DRM_FORMAT_MOD_LINEAR,
-			      &fb);
+	fb_id = create_color_test_fb(data, mode->hdisplay, mode->vdisplay,
+				     data->drm_format, &fb);
 	igt_assert(fb_id);
 
-	fb_modeset_id = igt_create_fb(data->drm_fd,
-				      mode->hdisplay,
-				      mode->vdisplay,
-				      data->drm_format,
-				      DRM_FORMAT_MOD_LINEAR,
-				      &fb_modeset);
+	fb_modeset_id = create_color_test_fb(data, mode->hdisplay, mode->vdisplay,
+					     data->drm_format, &fb_modeset);
 	igt_assert(fb_modeset_id);
 
 	igt_plane_set_fb(primary, &fb_modeset);
@@ -285,20 +283,12 @@ static bool test_pipe_legacy_gamma(data_t *data,
 	igt_output_override_mode(output, mode);
 
 	/* Create a framebuffer at the size of the output. */
-	fb_id = igt_create_fb(data->drm_fd,
-			      mode->hdisplay,
-			      mode->vdisplay,
-			      DRM_FORMAT_XRGB8888,
-			      DRM_FORMAT_MOD_LINEAR,
-			      &fb);
+	fb_id = create_color_test_fb(data, mode->hdisplay, mode->vdisplay,
+				     DRM_FORMAT_XRGB8888, &fb);
 	igt_assert(fb_id);
 
-	fb_modeset_id = igt_create_fb(data->drm_fd,
-				      mode->hdisplay,
-				      mode->vdisplay,
-				      DRM_FORMAT_XRGB8888,
-				      DRM_FORMAT_MOD_LINEAR,
-				      &fb_modeset);
+	fb_modeset_id = create_color_test_fb(data, mode->hdisplay, mode->vdisplay,
+					     DRM_FORMAT_XRGB8888, &fb_modeset);
 	igt_assert(fb_modeset_id);
 
 	igt_plane_set_fb(primary, &fb_modeset);
@@ -520,20 +510,12 @@ static bool test_pipe_ctm(data_t *data,
 	igt_output_override_mode(output, mode);
 
 	/* Create a framebuffer at the size of the output. */
-	fb_id = igt_create_fb(data->drm_fd,
-			      mode->hdisplay,
-			      mode->vdisplay,
-			      data->drm_format,
-			      DRM_FORMAT_MOD_LINEAR,
-			      &fb);
+	fb_id = create_color_test_fb(data, mode->hdisplay, mode->vdisplay,
+				     data->drm_format, &fb);
 	igt_assert(fb_id);
 
-	fb_modeset_id = igt_create_fb(data->drm_fd,
-				      mode->hdisplay,
-				      mode->vdisplay,
-				      data->drm_format,
-				      DRM_FORMAT_MOD_LINEAR,
-				      &fb_modeset);
+	fb_modeset_id = create_color_test_fb(data, mode->hdisplay, mode->vdisplay,
+					     data->drm_format, &fb_modeset);
 	igt_assert(fb_modeset_id);
 	igt_plane_set_fb(primary, &fb_modeset);
 
@@ -654,20 +636,12 @@ static void test_pipe_limited_range_ctm(data_t *data,
 		mode = igt_output_get_mode(output);
 
 		/* Create a framebuffer at the size of the output. */
-		fb_id = igt_create_fb(data->drm_fd,
-				      mode->hdisplay,
-				      mode->vdisplay,
-				      DRM_FORMAT_XRGB8888,
-				      DRM_FORMAT_MOD_LINEAR,
-				      &fb);
+		fb_id = create_color_test_fb(data, mode->hdisplay, mode->vdisplay,
+					     DRM_FORMAT_XRGB8888, &fb);
 		igt_assert(fb_id);
 
-		fb_modeset_id = igt_create_fb(data->drm_fd,
-					      mode->hdisplay,
-					      mode->vdisplay,
-					      DRM_FORMAT_XRGB8888,
-					      DRM_FORMAT_MOD_LINEAR,
-					      &fb_modeset);
+		fb_modeset_id = create_color_test_fb(data, mode->hdisplay, mode->vdisplay,
+						     DRM_FORMAT_XRGB8888, &fb_modeset);
 		igt_assert(fb_modeset_id);
 		igt_plane_set_fb(primary, &fb_modeset);
 
-- 
2.34.1

