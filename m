Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA286C36008
	for <igt-dev@archiver.kernel.org>; Mon, 24 Mar 2025 09:04:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6164310E1BE;
	Mon, 24 Mar 2025 09:04:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a5jp2rzU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8662010E095
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Mar 2025 09:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742807070; x=1774343070;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bnY2M9amPcHtBYxBdnxdwYqk0ajk8YCyHDRSP2rtX1w=;
 b=a5jp2rzUVEPXJJPXwGcQ7gJBNsKhdCBzZ1ztHqZOpWfzGcrpRr2BHlik
 M4WnWts9ImPCM44RftrzM4l6BAUEYAGsjPpoPH/2tVcIjYxSID3BTpwcV
 eG7bOc7Qq6E/dro/nNlkh3qGNDWulgbLV3m+NmQ0uUBXfaW8Qs4z2GKIX
 sx7VQ1WU1iEHq0S+z1eOXoLE4eaPCLeRjgagIs+8O6oTBMpG8Pg451o2Z
 ZtJZyqJdLBWCb0y9wgJRDi2xM8ZmDl+GFAhb9T6gPHYRAy4JWw9D+1lS6
 NgXiIZVDzJ7IL6oXZ60szuaVyJ9JzvyO2wi7QWWz+sNAw+srtVP8OzIaM w==;
X-CSE-ConnectionGUID: KDVFQ/cxR3mVRSviGuHhHg==
X-CSE-MsgGUID: kHN9ruZgT/eOBfZt2Cvxvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11382"; a="54999673"
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; d="scan'208";a="54999673"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 02:04:30 -0700
X-CSE-ConnectionGUID: H1Mf4xd2TUaSbpCWPLgd6w==
X-CSE-MsgGUID: O513G6pQT3uHwZlZ67PUxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; d="scan'208";a="129097371"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 02:04:28 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 2/3] tests/chamelium/kms_chamelium_color: Fix
 ctm-limited-range subtest
Date: Mon, 24 Mar 2025 14:39:48 +0530
Message-Id: <20250324090949.614233-3-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250324090949.614233-1-swati2.sharma@intel.com>
References: <20250324090949.614233-1-swati2.sharma@intel.com>
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

Test is fixed, now we take chamelium capture after setting output
to full and limited range and then compare frame dumps.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/chamelium/kms_chamelium_color.c | 50 +++++++++++++++------------
 1 file changed, 27 insertions(+), 23 deletions(-)

diff --git a/tests/chamelium/kms_chamelium_color.c b/tests/chamelium/kms_chamelium_color.c
index 68611ec6a..355047ed6 100644
--- a/tests/chamelium/kms_chamelium_color.c
+++ b/tests/chamelium/kms_chamelium_color.c
@@ -352,9 +352,10 @@ static bool test_pipe_limited_range_ctm(data_t *data,
 	gamma_lut_t *degamma_linear, *gamma_linear;
 	igt_output_t *output = data->output;
 	drmModeModeInfo *mode = data->mode;
-	struct igt_fb fb_modeset, fb, fbref;
-	struct chamelium_frame_dump *frame_limited;
-	int fb_id, fb_modeset_id, fbref_id;
+	struct igt_fb fb_modeset, fb;
+	struct chamelium_frame_dump *frame_limited, *frame_full;
+	int fb_id, fb_modeset_id;
+	igt_crc_t *reference_crc;
 	bool ret = false;
 
 	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_CTM));
@@ -380,21 +381,13 @@ static bool test_pipe_limited_range_ctm(data_t *data,
 				      DRM_FORMAT_MOD_LINEAR,
 				      &fb_modeset);
 	igt_assert(fb_modeset_id);
-
-	fbref_id = igt_create_fb(data->drm_fd,
-				 mode->hdisplay,
-				 mode->vdisplay,
-				 DRM_FORMAT_XRGB8888,
-				 DRM_FORMAT_MOD_LINEAR,
-				 &fbref);
-	igt_assert(fbref_id);
-
 	igt_plane_set_fb(primary, &fb_modeset);
 
 	set_degamma(data, primary->pipe, degamma_linear);
 	set_gamma(data, primary->pipe, gamma_linear);
 	set_ctm(primary->pipe, ctm);
 
+	/* Set the output into full range. */
 	igt_output_set_prop_value(output,
 				  IGT_CONNECTOR_BROADCAST_RGB,
 				  BROADCAST_RGB_FULL);
@@ -402,11 +395,28 @@ static bool test_pipe_limited_range_ctm(data_t *data,
 	igt_plane_set_fb(primary, &fb);
 	igt_display_commit(&data->display);
 
+	chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
+	frame_full =
+		chamelium_read_captured_frame(data->chamelium, 0);
+
+	/* Chamelium calculates the CRC for the most recent
+	 * captured frame; that's why CRC of the reference frame
+	 * is captured here.
+	 */
+	reference_crc = chamelium_get_crc_for_area(data->chamelium, port, 0, 0, 0, 0);
+	igt_assert(reference_crc);
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
@@ -414,18 +424,12 @@ static bool test_pipe_limited_range_ctm(data_t *data,
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
+						       reference_crc,
+						       CHAMELIUM_CHECK_ANALOG);
 
 	free_lut(gamma_linear);
 	free_lut(degamma_linear);
-- 
2.25.1

