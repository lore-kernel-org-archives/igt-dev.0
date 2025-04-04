Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 198EBC3601B
	for <igt-dev@archiver.kernel.org>; Fri,  4 Apr 2025 07:24:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDD4010EA61;
	Fri,  4 Apr 2025 07:24:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kwQAAfpp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87AAD10EA61
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Apr 2025 07:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743751454; x=1775287454;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ea3XkiYRPE+X+1XbGPUfEC/q1PVg1d4rG9Co/WVH6a4=;
 b=kwQAAfppyZXPajX3ynG9h0Yb+bSXdLtyYhc4AgmLM7g4LswU4qYX5zDX
 qplLIcwlEWxbsZvwTKtq3gUlMFNUt1bclpr0oRXfWYEtFQog4r2mtsXsn
 QkaqGbRXgJOC6NyJddqi/bW3wd9fF0W/p1gCb9cj6jrZTzj/m3bAdB0EH
 M1eQkKpeNFgdBcBrqCZSAPhGEInTFVRwRtx1VyFAMMSi4I+zHxCDVPC73
 3ETq7mKBzfqriWGq9jrY9xJX0zLM6NJlLFvO4TL5H9Ei4eh1LtfsGark3
 zQu8OlJ9gFfan1GkYXewAWoWkdtjoQYfwgoTJ2r17i34ILk2CmYbUoCUs Q==;
X-CSE-ConnectionGUID: pZGLgEQTS56KZmqWTcJyGw==
X-CSE-MsgGUID: bRXXcOj3Tr6kYNf5lT8Zvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="45359307"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="45359307"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 00:24:14 -0700
X-CSE-ConnectionGUID: vLml+doES+Wgz4G9o9+apw==
X-CSE-MsgGUID: HtR2uASYTiCQ+fqd2V2CnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="132361903"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 00:24:12 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, juhapekka.heikkila@gmail.com,
 uma.shankar@intel.com, chaitanya.kumar.borah@intel.com,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v3 3/3] tests/chamelium/kms_chamelium_color: Fix ctm-limited-range
 subtest
Date: Fri,  4 Apr 2025 12:59:30 +0530
Message-Id: <20250404072930.695363-4-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250404072930.695363-1-swati2.sharma@intel.com>
References: <20250404072930.695363-1-swati2.sharma@intel.com>
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

This test verifies the connector's capability to clip RGB values
when switching between full and limited range output.

Steps:
1. Render a frame with full RGB values (0-255).
2. Set the connector's range property to **limited** (BROADCAST_RGB_16_235).
   - Despite the full-range input, the output should be clipped
     to limited range (16-235).
3. Commit and capture the output frame (Frame A).
4. Render a frame with limited RGB values (16-235).
5. Set the connector's range property to **full** (BROADCAST_RGB_FULL).
   - The output should now match the input without modification.
6. Commit and capture the output frame (Frame B).
7. Compare captured frames from steps 3 and 6.
   - The frames should be identical, confirming that the
     connector correctly handles limited range clipping.

v2: -remove unused fb (Chaitanya)
    -remove computation of reference CRC (Chaitanya)
    -add details of test (Chaitanya)
v3: -use 2 fbs to avoid issues in future (Chaitanya/JP)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/chamelium/kms_chamelium_color.c | 88 +++++++++++++--------------
 1 file changed, 41 insertions(+), 47 deletions(-)

diff --git a/tests/chamelium/kms_chamelium_color.c b/tests/chamelium/kms_chamelium_color.c
index 68611ec6a..5f61bc2ec 100644
--- a/tests/chamelium/kms_chamelium_color.c
+++ b/tests/chamelium/kms_chamelium_color.c
@@ -342,19 +342,19 @@ static bool test_pipe_limited_range_ctm(data_t *data,
 		{ 0.0, 0.0, limited_result }
 	};
 	color_t red_green_blue_full[] = {
-		{ 0.5, 0.0, 0.0 },
-		{ 0.0, 0.5, 0.0 },
-		{ 0.0, 0.0, 0.5 }
+		{ 1.0, 0.0, 0.0 },
+		{ 0.0, 1.0, 0.0 },
+		{ 0.0, 0.0, 1.0 }
 	};
 	double ctm[] = { 1.0, 0.0, 0.0,
-			0.0, 1.0, 0.0,
-			0.0, 0.0, 1.0 };
+			 0.0, 1.0, 0.0,
+			 0.0, 0.0, 1.0 };
 	gamma_lut_t *degamma_linear, *gamma_linear;
 	igt_output_t *output = data->output;
 	drmModeModeInfo *mode = data->mode;
-	struct igt_fb fb_modeset, fb, fbref;
-	struct chamelium_frame_dump *frame_limited;
-	int fb_id, fb_modeset_id, fbref_id;
+	struct igt_fb fb0, fb1;
+	struct chamelium_frame_dump *frame_limited, *frame_full;
+	int fb_id0, fb_id1;
 	bool ret = false;
 
 	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_CTM));
@@ -365,48 +365,49 @@ static bool test_pipe_limited_range_ctm(data_t *data,
 	igt_output_set_pipe(output, primary->pipe->pipe);
 
 	/* Create a framebuffer at the size of the output. */
-	fb_id = igt_create_fb(data->drm_fd,
-			      mode->hdisplay,
-			      mode->vdisplay,
-			      DRM_FORMAT_XRGB8888,
-			      DRM_FORMAT_MOD_LINEAR,
-			      &fb);
-	igt_assert(fb_id);
-
-	fb_modeset_id = igt_create_fb(data->drm_fd,
-				      mode->hdisplay,
-				      mode->vdisplay,
-				      DRM_FORMAT_XRGB8888,
-				      DRM_FORMAT_MOD_LINEAR,
-				      &fb_modeset);
-	igt_assert(fb_modeset_id);
-
-	fbref_id = igt_create_fb(data->drm_fd,
-				 mode->hdisplay,
-				 mode->vdisplay,
-				 DRM_FORMAT_XRGB8888,
-				 DRM_FORMAT_MOD_LINEAR,
-				 &fbref);
-	igt_assert(fbref_id);
-
-	igt_plane_set_fb(primary, &fb_modeset);
+	fb_id0 = igt_create_fb(data->drm_fd,
+			       mode->hdisplay,
+			       mode->vdisplay,
+			       DRM_FORMAT_XRGB8888,
+			       DRM_FORMAT_MOD_LINEAR,
+			       &fb0);
+	igt_assert(fb_id0);
+
+	fb_id1 = igt_create_fb(data->drm_fd,
+		               mode->hdisplay,
+			       mode->vdisplay,
+			       DRM_FORMAT_XRGB8888,
+			       DRM_FORMAT_MOD_LINEAR,
+			       &fb1);
+	igt_assert(fb_id1);
 
 	set_degamma(data, primary->pipe, degamma_linear);
 	set_gamma(data, primary->pipe, gamma_linear);
 	set_ctm(primary->pipe, ctm);
 
+	/* Set the output into full range. */
 	igt_output_set_prop_value(output,
 				  IGT_CONNECTOR_BROADCAST_RGB,
 				  BROADCAST_RGB_FULL);
-	paint_rectangles(data, mode, red_green_blue_limited, &fb);
-	igt_plane_set_fb(primary, &fb);
+	paint_rectangles(data, mode, red_green_blue_limited, &fb0);
+	igt_plane_set_fb(primary, &fb0);
 	igt_display_commit(&data->display);
 
+	chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
+	frame_full =
+		chamelium_read_captured_frame(data->chamelium, 0);
+
 	/* Set the output into limited range. */
 	igt_output_set_prop_value(output,
 				  IGT_CONNECTOR_BROADCAST_RGB,
 				  BROADCAST_RGB_16_235);
-	paint_rectangles(data, mode, red_green_blue_full, &fb);
+	paint_rectangles(data, mode, red_green_blue_full, &fb1);
+	igt_plane_set_fb(primary, &fb1);
+	igt_display_commit(&data->display);
+
+	chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
+	frame_limited =
+		chamelium_read_captured_frame(data->chamelium, 0);
 
 	/* And reset.. */
 	igt_output_set_prop_value(output,
@@ -414,18 +415,11 @@ static bool test_pipe_limited_range_ctm(data_t *data,
 				  BROADCAST_RGB_FULL);
 	igt_plane_set_fb(primary, NULL);
 	igt_output_set_pipe(output, PIPE_NONE);
-	chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
-	frame_limited =
-		chamelium_read_captured_frame(data->chamelium, 0);
-
 
-	/* Verify that the framebuffer reference of the software
-	 * computed output is equal to the frame dump of the CTM
-	 * matrix transformation output.
-	 */
-	ret = chamelium_frame_match_or_dump(data->chamelium, port,
-					    frame_limited, &fbref,
-					    CHAMELIUM_CHECK_ANALOG);
+	/* Verify frame dumps are equal. */
+	ret = chamelium_frame_match_or_dump_frame_pair(data->chamelium, port,
+						       frame_full, frame_limited,
+						       CHAMELIUM_CHECK_ANALOG);
 
 	free_lut(gamma_linear);
 	free_lut(degamma_linear);
-- 
2.25.1

