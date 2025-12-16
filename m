Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B31D5E13D
	for <igt-dev@archiver.kernel.org>; Tue, 16 Dec 2025 18:45:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7C7A10E56B;
	Tue, 16 Dec 2025 18:45:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eVjk0wEm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1054410E3D2
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Dec 2025 18:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765910715; x=1797446715;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aF51dKJtMp8wxJ1+yTynw2IeBIxPivK94MkSzyY7BXg=;
 b=eVjk0wEmZ+IoIsFbjjKVd3Wq/xziq1jl9S4WpKh24pF37t0AK0BSR75X
 RBDH8KFZcGBgkogdLLUfkLS6kK+LesdATNJxnNpmj7BZD7lDVJeWRhID7
 earVoRNcHbvR/BUXP/pamDARaUdBtYL2iknANpEEKfyI7Yt7el8J6o/q3
 48HC4r6NvnKiJdHQ3B8uOWhJnFQqjp4EWZIjbpha421TlOnK26OReebhs
 WfHAgnwD01etL+bMvZlUJTap1kN5gR4H7xUTuPwAHRfKhTVdxyzS4UbOU
 EwKW1HI/xdWU4kaEY8/x05lm8JVOqblkFpUN1r4kx4sBRXpCoi9/z7sMh w==;
X-CSE-ConnectionGUID: A40f1ZGxRmGe6Fe5cGZBug==
X-CSE-MsgGUID: RpljfP1YRmacmVgJPsHf1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="70416029"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="70416029"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 10:45:15 -0800
X-CSE-ConnectionGUID: +BpRQfqkQzy+9m1Y6ElsPw==
X-CSE-MsgGUID: IjDqSuozQwWXoW+CyHiZJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="198148610"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 10:45:14 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: "Heikkila, Juha-pekka" <juha-pekka.heikkila@intel.com>
Subject: [PATCH i-g-t 3/7] tests/kms_plane: add test and limitations for odd
 height planar tests
Date: Wed, 17 Dec 2025 00:22:11 +0530
Message-Id: <20251216185215.1281390-4-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251216185215.1281390-1-swati2.sharma@intel.com>
References: <20251216185215.1281390-1-swati2.sharma@intel.com>
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

From: "Heikkila, Juha-pekka" <juha-pekka.heikkila@intel.com>

With NVL need to disable odd height and odd src y for semiplanar
yuv formats. With older devices check with crc odd src y didn't
break framebuffer on screen.

Bspec: 68903

Signed-off-by: Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>
---
 tests/kms_plane.c | 70 +++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 65 insertions(+), 5 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 5f18eac13..b6b29a98a 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -1246,9 +1246,11 @@ static void test_planar_settings(data_t *data)
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
@@ -1277,14 +1279,15 @@ static void test_planar_settings(data_t *data)
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
@@ -1297,14 +1300,15 @@ static void test_planar_settings(data_t *data)
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
@@ -1330,6 +1334,62 @@ static void test_planar_settings(data_t *data)
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
+			igt_wait_for_vblank_count(data->drm_fd,
+			data->display.pipes[pipe].crtc_offset, 1);
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

