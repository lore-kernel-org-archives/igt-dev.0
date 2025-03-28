Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82AD2C36010
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 18:05:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 307C010EA77;
	Fri, 28 Mar 2025 18:05:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HBRPt891";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13E0010EA66
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 18:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743185141; x=1774721141;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZZYbbgFqethSsCiUNIrZTubWeEetR4Ttz2QyodsvVLo=;
 b=HBRPt89100w/wks+pw8TnRy0UvxtBepGSlz+HeYaO7Ha/ILwgKHi6MjK
 Z3qhUBvXhMBJD0m3RvMCr3/6ShnfX9Ftwei/Zgw6Jmbr//CJaqFVpasJw
 2YFkddqMIAs0KaYpRoBBnqAyqpcuZHxsEpRIEzwof3Yr6qzQTHViNtPo5
 IlbZNj8NVz8hzohlukbqCryt5HnhPHePG7GCsEanF5wikRwWL4POYEHa1
 KIDEG8Tac59l0LYgPkPze4S29Qk4n/+ZqUVebrVdiLPCJ19oWuHOQV1wv
 CEymaC2oB+zlcug6xud/FFrzJMkC7pNQH/pWe74Z8vi8pyci3rLNgiaKV A==;
X-CSE-ConnectionGUID: 6byQXUvaTnudEVwNmAyd3Q==
X-CSE-MsgGUID: BQd1YPiJTFmqGmvEUR2UWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="62088492"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; d="scan'208";a="62088492"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 11:05:41 -0700
X-CSE-ConnectionGUID: zP9QHvAxSZWvKLG3cIqOBA==
X-CSE-MsgGUID: vzOmwt6mTli+1Pjz7iuwEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; d="scan'208";a="130725730"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 11:05:39 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, uma.shankar@intel.com,
 chaitanya.kumar.borah@intel.com, Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v2 3/3] tests/chamelium/kms_chamelium_color: Fix ctm-limited-range
 subtest
Date: Fri, 28 Mar 2025 23:40:55 +0530
Message-Id: <20250328181055.642777-4-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250328181055.642777-1-swati2.sharma@intel.com>
References: <20250328181055.642777-1-swati2.sharma@intel.com>
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

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/chamelium/kms_chamelium_color.c | 60 ++++++++++-----------------
 1 file changed, 23 insertions(+), 37 deletions(-)

diff --git a/tests/chamelium/kms_chamelium_color.c b/tests/chamelium/kms_chamelium_color.c
index 68611ec6a..6009de7d0 100644
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
+	struct igt_fb fb;
+	struct chamelium_frame_dump *frame_limited, *frame_full;
+	int fb_id;
 	bool ret = false;
 
 	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_CTM));
@@ -373,28 +373,11 @@ static bool test_pipe_limited_range_ctm(data_t *data,
 			      &fb);
 	igt_assert(fb_id);
 
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
-
 	set_degamma(data, primary->pipe, degamma_linear);
 	set_gamma(data, primary->pipe, gamma_linear);
 	set_ctm(primary->pipe, ctm);
 
+	/* Set the output into full range. */
 	igt_output_set_prop_value(output,
 				  IGT_CONNECTOR_BROADCAST_RGB,
 				  BROADCAST_RGB_FULL);
@@ -402,11 +385,21 @@ static bool test_pipe_limited_range_ctm(data_t *data,
 	igt_plane_set_fb(primary, &fb);
 	igt_display_commit(&data->display);
 
+	chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
+	frame_full =
+		chamelium_read_captured_frame(data->chamelium, 0);
+
 	/* Set the output into limited range. */
 	igt_output_set_prop_value(output,
 				  IGT_CONNECTOR_BROADCAST_RGB,
 				  BROADCAST_RGB_16_235);
 	paint_rectangles(data, mode, red_green_blue_full, &fb);
+	igt_plane_set_fb(primary, &fb);
+	igt_display_commit(&data->display);
+
+	chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
+	frame_limited =
+		chamelium_read_captured_frame(data->chamelium, 0);
 
 	/* And reset.. */
 	igt_output_set_prop_value(output,
@@ -414,18 +407,11 @@ static bool test_pipe_limited_range_ctm(data_t *data,
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

