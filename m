Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0931CF6C1E
	for <igt-dev@archiver.kernel.org>; Wed,  7 Jan 2026 09:27:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C0F710E582;
	Wed,  7 Jan 2026 09:27:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jRQ3JvYc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 266CE10E582
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jan 2026 09:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767778040; x=1799314040;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UH0B4TmsAvk9jro9aAQcTc/iHNtKoXhelkzJ78ajyjI=;
 b=jRQ3JvYcUGnNu93cJ9S5aWXw+AXmTB5f5FBAuL8yDuu+vHxN3Zp3dZlc
 8ensWPrw9w5lXb3axNi8JWHDek3rUp9h4WHI4mJZ9CuQJTgJ9Nq5u86Ij
 r3ITjJvNZ2mLNNB+7PM6TshnOn7UM+sS15kVhAqG13Mw+5sICiHE5pniJ
 UbYxFen3txwzzdkTtUVxGUkkSpKzqP7flY+36f2BtHmHIn3cg+8DKo+GG
 EqffcrDxM6lDjaUptm5FxMaj67uvqhzqXFRZpByLsWeIAphNGsoWWdJFJ
 OT2taWZ56d+seF5qzNvExNGqDfl1nyq3jtv0traY8L2f8lndUl1NbBLpB A==;
X-CSE-ConnectionGUID: JBZY/44rQ0aBLfvQ74RCmA==
X-CSE-MsgGUID: jqHuPjF2RYGThQ9P9sXy8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="68337783"
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="68337783"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 01:27:19 -0800
X-CSE-ConnectionGUID: twHQPK8LSZ6VDrdxVNOZjQ==
X-CSE-MsgGUID: noYttMIuQJ6kPbQSFjZpLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="207412554"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 01:27:18 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>
Subject: [PATCH i-g-t,
 v2 3/7] tests/kms_plane: add test and limitations for odd height
 planar tests
Date: Wed,  7 Jan 2026 15:05:31 +0530
Message-Id: <20260107093535.70116-4-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260107093535.70116-1-swati2.sharma@intel.com>
References: <20260107093535.70116-1-swati2.sharma@intel.com>
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

From: Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>

With NVL need to disable odd height and odd src y for semiplanar
yuv formats. With older devices check with crc odd src y didn't
break framebuffer on screen.

Bspec: 68903

v2: -initialize display_ver (JP)
    -rebase

Signed-off-by: Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>
---
 tests/kms_plane.c | 71 +++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 66 insertions(+), 5 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 2c083f4b7..cbc006d7e 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -1245,9 +1245,11 @@ static void test_planar_settings(data_t *data)
 {
 	enum pipe pipe = PIPE_A;
 	igt_output_t *output;
-	igt_fb_t fb;
+	igt_fb_t fb, fb_ref;
 	igt_plane_t *primary;
+	igt_crc_t crc, crc_ref;
 	int devid;
+	int display_ver = -1;
 	int rval;
 
 	/*
@@ -1259,6 +1261,8 @@ static void test_planar_settings(data_t *data)
 		igt_require_intel(data->drm_fd);
 		devid = intel_get_drm_devid(data->drm_fd);
 		igt_require(intel_display_ver(devid) >= 9);
+		display_ver = intel_display_ver(devid);
+		igt_require(display_ver >= 9);
 	}
 
 	output = igt_get_single_output_for_pipe(&data->display, pipe);
@@ -1276,14 +1280,15 @@ static void test_planar_settings(data_t *data)
 				     DRM_FORMAT_MOD_LINEAR)) {
 		int expected_rval = -EINVAL;
 
-		if (intel_display_ver(devid) >= 20)
+		if (display_ver >= 20)
 			expected_rval = 0;
 
 		igt_create_fb(data->drm_fd, 257, 256,
 			      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb);
 		igt_plane_set_fb(primary, &fb);
 		rval = igt_display_try_commit_atomic(&data->display,
-						     DRM_MODE_ATOMIC_ALLOW_MODESET,
+						     DRM_MODE_ATOMIC_ALLOW_MODESET |
+						     DRM_MODE_ATOMIC_TEST_ONLY,
 						     NULL);
 		igt_remove_fb(data->drm_fd, &fb);
 		igt_assert_f(rval == expected_rval, "Odd width NV12 framebuffer\n");
@@ -1296,14 +1301,15 @@ static void test_planar_settings(data_t *data)
 				     DRM_FORMAT_MOD_LINEAR)) {
 		int expected_rval = -EINVAL;
 
-		if (intel_display_ver(devid) >= 20)
+		if (display_ver >= 20 && display_ver < 35)
 			expected_rval = 0;
 
 		igt_create_fb(data->drm_fd, 256, 257,
 			      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb);
 		igt_plane_set_fb(primary, &fb);
 		rval = igt_display_try_commit_atomic(&data->display,
-						     DRM_MODE_ATOMIC_ALLOW_MODESET,
+						     DRM_MODE_ATOMIC_ALLOW_MODESET |
+						     DRM_MODE_ATOMIC_TEST_ONLY,
 						     NULL);
 		igt_remove_fb(data->drm_fd, &fb);
 		igt_assert_f(rval == expected_rval, "Odd height NV12 framebuffer\n");
@@ -1329,6 +1335,61 @@ static void test_planar_settings(data_t *data)
 	} else {
 		igt_debug("Odd horizontal pan NV12 framebuffer test skipped\n");
 	}
+
+	if (igt_plane_has_format_mod(primary, DRM_FORMAT_P016,
+					    DRM_FORMAT_MOD_LINEAR)) {
+		int expected_rval = -EINVAL;
+
+		if (display_ver >= 20 && display_ver < 35)
+			expected_rval = 0;
+
+		igt_create_color_fb(data->drm_fd, 256, 260,
+			      DRM_FORMAT_P016, DRM_FORMAT_MOD_LINEAR,
+			      0.0, 0.0, 1.0,
+			      &fb);
+
+		igt_plane_set_fb(primary, &fb);
+		igt_plane_set_position(primary, 1, 1);
+		igt_plane_set_size(primary, 256, 256);
+
+		/* set odd v pan and check with crc fb didn't break */
+		igt_fb_set_position(&fb, primary, 0, 3);
+		igt_fb_set_size(&fb, primary, 256, 256);
+		rval = igt_display_try_commit_atomic(&data->display,
+						     DRM_MODE_ATOMIC_ALLOW_MODESET,
+						     NULL);
+		if (rval == 0) {
+			set_legacy_lut(data, pipe, LUT_MASK);
+			igt_wait_for_vblank_count(igt_crtc_for_pipe(&data->display, pipe), 1);
+			data->pipe_crc = igt_pipe_crc_new(data->drm_fd, pipe,
+						IGT_PIPE_CRC_SOURCE_AUTO);
+			igt_pipe_crc_collect_crc(data->pipe_crc, &crc);
+
+			igt_create_color_fb(data->drm_fd, 256, 256,
+				DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+				0.0, 0.0, 1.0,
+				&fb_ref);
+
+			igt_plane_set_fb(primary, &fb_ref);
+			rval = igt_display_try_commit_atomic(&data->display,
+						     DRM_MODE_ATOMIC_ALLOW_MODESET,
+						     NULL);
+
+			igt_pipe_crc_collect_crc(data->pipe_crc, &crc_ref);
+			set_legacy_lut(data, pipe, 0xffff);
+
+			igt_pipe_crc_free(data->pipe_crc);
+			data->pipe_crc = NULL;
+
+			igt_remove_fb(data->drm_fd, &fb_ref);
+			igt_assert_crc_equal(&crc_ref, &crc);
+		}
+
+		igt_remove_fb(data->drm_fd, &fb);
+		igt_assert_f(rval == expected_rval, "Odd vertical pan P016 framebuffer\n");
+	} else {
+		igt_debug("Odd vertical pan P016 framebuffer test skipped\n");
+	}
 }
 
 static bool is_pipe_limit_reached(int count)
-- 
2.25.1

