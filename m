Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E53FED3EF
	for <igt-dev@archiver.kernel.org>; Fri, 24 Apr 2026 17:12:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0032E10E2E5;
	Fri, 24 Apr 2026 17:12:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="edo4Ld4R";
	dkim-atps=neutral
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8748610E2E5
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 17:11:46 +0000 (UTC)
Received: by mail-dl1-f42.google.com with SMTP id
 a92af1059eb24-12db7bf1541so4893015c88.0
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 10:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777050705; x=1777655505; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lAmRdxxYe9MvQMUN2EX6oKNXSVMdH3wfDm/h8Vdhg0E=;
 b=edo4Ld4R6EEyK3e5IhqFWEn+kt2fzWJyk6errZFuE3qfAJ0VimtZDwhtIPK1q3zuqv
 c8BhhoQSxl/aRrSvf5qaq414ZN0EDMmxr8ld1FJa6RAAsouer8Kjngn3zpFGFPkyoEcS
 fzzBBw/Z2S5iQKtaPWb18KAmS3Q/+X2CujUdVyGSYmflc/6Apg9XEqvgE1MwqP55uIMn
 Ifz5FYgWPecwjALkD1GgwUeaeolLWjeC3PGgJjiX5UHlECesF6i6Yv372NUQD3QB1ryV
 lJmcGsapyEu1+taBd9xKq00vicrK6KDTU0NnWSqDhZnPVp5m395OhxKp89nxVNXIxW2m
 e+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777050705; x=1777655505;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=lAmRdxxYe9MvQMUN2EX6oKNXSVMdH3wfDm/h8Vdhg0E=;
 b=goo3LPgI7CE3BTLYda/MvaJNzScUB8VWA8HTQMY9dxaaUnwFAzpu7tjAltlbEZIsXw
 I5gHtYc25m5T8AcsbZ6IhV+odWCTBAwy+zJRtxMiIMJjY5qUoqecrb5P3T2a7LmTpsQ0
 LOdWPk0q8/DsMRGPf9zRqLc+eDkH/FsG3oVjdjRfDJGPGLVHS+JVdVkuzOA0mZ2cuxu+
 l0PRaTxE4UJ3xrAqMee6DfuFStvUL3MPiDzQgSTxCPAIokobhyOQJ7p5Z/7gYzx8XkW4
 VDMyjoE8lLimmNs1E+M8npRcyoVfpq491QKIsIs5Xp9E8LyAc33fq3pGcu4rsLStewAe
 Fz5g==
X-Gm-Message-State: AOJu0YxB8xZ3DYsIVPEirMTCYvaJumxcAE8fWgZW+R05Eozri+LOflM1
 3pC6DRGp+CJorxOQYId66C/oOFbWJ7wJtXbF0RWQ6d2rMtPEB1arCYzCVzZNtENp
X-Gm-Gg: AeBDieuWsZ76GLLAq7wPiMqFJkyFUuxwwX5K3lG1hBP+rrXReZVxK9T5ZdHg0fSe7mv
 cb+OQKZL1biuIDAJ7gK+hEIORnbNJ782pOxjiQdz+pJ4CBkeWPLGUZrfjkLv2jedazTaBMa2Kls
 jWCqBoJO01OKl5/GKsMNNZB6cKs8M7ik/TdrMQYlIKfpEhaEJCk96y2oDUA7NtgefYjKnMz7yzu
 75SrcJhyEuTpuGEqr8qyrkuMLS701+R494j5E9+J07LOneEDHJ9Qnq5Bo4XweAsKpWGd3y2k3fB
 0YybMHfl8jIP55KsfP/VgRS6EEqrQze2JWV4LziYE3WQ6b0vBv68GBkdEG5aJK6tk0y7K/ZyNhj
 BiVFwZU8CBkQcxC1ff2szJ28yfQELFoDEVGJppfgdtwuC7EvmIGGFLIFy58Xh8s55rziyTik//Z
 LF17ueH68sXwY0rV7oMd04q9jaQoyuiaiinlUJJOGVhOzThafau20N4+R7ZXlhBanMo34kRg==
X-Received: by 2002:a05:7022:129:b0:12a:68cc:3efb with SMTP id
 a92af1059eb24-12c73f9303fmr18739953c88.16.1777050701231; 
 Fri, 24 Apr 2026 10:11:41 -0700 (PDT)
Received: from localhost ([192.55.55.44]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-12da8b8fbc4sm27444304c88.4.2026.04.24.10.11.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2026 10:11:40 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 1/2] tests/kms_plane: Restructure
 planar-pixel-format-settings test and make it Intel only
Date: Fri, 24 Apr 2026 20:11:22 +0300
Message-ID: <20260424171123.3963793-2-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260424171123.3963793-1-juhapekka.heikkila@gmail.com>
References: <20260424171123.3963793-1-juhapekka.heikkila@gmail.com>
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

Separate different planar pixel format tests onto their own dynamic subtests
to make it easier for debugging. All tests here are only testing Intel
hw related restrictions hence it make zero sense to run this on vkms or
other drivers. I added back the original limitation to make these Intel only.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/kms_plane.c | 322 ++++++++++++++++++++++++++--------------------
 1 file changed, 186 insertions(+), 136 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 7962c733a..6c08f1de8 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -41,8 +41,25 @@
 #include "xe/xe_query.h"
 
 /**
- * SUBTEST: planar-pixel-format-settings
- * Description: verify planar settings for pixel format are handled correctly
+ * SUBTEST: planar-pixel-format-settings@nv12-odd-width
+ * Description: Verify odd-width (257px) NV12 framebuffer is rejected by the
+ *              kernel on Intel hardware (display ver < 20 expects -EINVAL).
+ * Driver requirement: i915, xe
+ *
+ * SUBTEST: planar-pixel-format-settings@nv12-odd-height
+ * Description: Verify odd-height (257px) NV12 framebuffer is rejected by the
+ *              kernel on Intel hardware (display ver < 20 or >= 35 expects -EINVAL).
+ * Driver requirement: i915, xe
+ *
+ * SUBTEST: planar-pixel-format-settings@nv12-odd-horizontal-pan
+ * Description: Verify odd horizontal pan on NV12 framebuffer is rejected by
+ *              the kernel on Intel hardware (display ver < 35 expects -EINVAL).
+ * Driver requirement: i915, xe
+ *
+ * SUBTEST: planar-pixel-format-settings@p016-odd-vertical-pan
+ * Description: Verify odd vertical pan on P016 framebuffer and check CRC
+ *              matches a reference XRGB8888 blue fill on Intel hardware.
+ * Driver requirement: i915, xe
  *
  * SUBTEST: plane-position-%s
  * Description: Verify plane position using two planes to create a %arg[1]
@@ -1354,165 +1371,197 @@ test_pixel_formats(data_t *data, igt_crtc_t *crtc)
 	igt_remove_fb(data->drm_fd, &primary_fb);
 }
 
-static void test_planar_settings(data_t *data)
+static igt_plane_t *
+planar_test_setup(data_t *data, igt_crtc_t *crtc, igt_output_t *output)
 {
-	igt_display_t *display = &data->display;
-	igt_crtc_t *crtc;
-	igt_output_t *output;
-	igt_fb_t fb, fb_ref;
-	igt_plane_t *primary;
-	igt_crc_t crc, crc_ref;
-	int devid;
-	int display_ver = -1;
+	igt_display_reset(&data->display);
+	igt_output_set_crtc(output, crtc);
+	igt_display_commit_atomic(&data->display,
+				  DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+	return igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+}
+
+static void
+test_nv12_odd_width(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
+		    int display_ver)
+{
+	igt_plane_t *primary = planar_test_setup(data, crtc, output);
+	igt_fb_t fb;
+	int expected_rval = display_ver >= 20 ? 0 : -EINVAL;
 	int rval;
-	bool is_vkms = false;
 
-	/*
-	 * If here is added non-intel tests below require will need to be
-	 * changed to if(..)
-	 */
-	igt_require_f(data->display.is_atomic, "Atomic mode-set not supported\n");
-	if (is_intel_device(data->drm_fd)) {
-		igt_require_intel(data->drm_fd);
-		devid = intel_get_drm_devid(data->drm_fd);
-		igt_require(intel_display_ver(devid) >= 9);
-		display_ver = intel_display_ver(devid);
-		igt_require(display_ver >= 9);
-	} else if (is_vkms_device(data->drm_fd)) {
-		is_vkms = true;
+	if (!igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
+				      DRM_FORMAT_MOD_LINEAR)) {
+		igt_debug("Odd width NV12 test skipped - format/mod not supported\n");
+		return;
 	}
 
-	crtc = igt_first_crtc_with_single_output(display, &output);
+	igt_create_fb(data->drm_fd, 257, 256,
+		      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb);
+	igt_plane_set_fb(primary, &fb);
+	rval = igt_display_try_commit_atomic(&data->display,
+					     DRM_MODE_ATOMIC_ALLOW_MODESET |
+					     DRM_MODE_ATOMIC_TEST_ONLY,
+					     NULL);
+	igt_plane_set_fb(primary, NULL);
+	igt_remove_fb(data->drm_fd, &fb);
+	igt_assert_f(rval == expected_rval,
+		     "Odd width NV12 framebuffer: got %d, expected %d\n",
+		     rval, expected_rval);
+}
 
-	igt_output_set_crtc(output, crtc);
-	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+static void
+test_nv12_odd_height(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
+		     int display_ver)
+{
+	igt_plane_t *primary = planar_test_setup(data, crtc, output);
+	igt_fb_t fb;
+	int expected_rval = (display_ver >= 20 && display_ver < 35) ? 0 : -EINVAL;
+	int rval;
 
-	igt_display_commit_atomic(&data->display,
-				  DRM_MODE_ATOMIC_ALLOW_MODESET,
-				  NULL);
-	/* test against intel_plane_check_src_coordinates() in i915 */
-	if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
-				     DRM_FORMAT_MOD_LINEAR)) {
-		int expected_rval = -EINVAL;
-
-		if (display_ver >= 20 || is_vkms)
-			expected_rval = 0;
-
-		igt_create_fb(data->drm_fd, 257, 256,
-			      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb);
-		igt_plane_set_fb(primary, &fb);
-		rval = igt_display_try_commit_atomic(&data->display,
-						     DRM_MODE_ATOMIC_ALLOW_MODESET |
-						     DRM_MODE_ATOMIC_TEST_ONLY,
-						     NULL);
-		igt_remove_fb(data->drm_fd, &fb);
-		igt_assert_f(rval == expected_rval, "Odd width NV12 framebuffer\n");
-	} else {
-		igt_debug("Odd width NV12 framebuffer test skipped\n");
+	if (!igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
+				      DRM_FORMAT_MOD_LINEAR)) {
+		igt_debug("Odd height NV12 test skipped - format/mod not supported\n");
+		return;
+	}
+
+	igt_create_fb(data->drm_fd, 256, 257,
+		      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb);
+	igt_plane_set_fb(primary, &fb);
+	rval = igt_display_try_commit_atomic(&data->display,
+					     DRM_MODE_ATOMIC_ALLOW_MODESET |
+					     DRM_MODE_ATOMIC_TEST_ONLY,
+					     NULL);
+	igt_plane_set_fb(primary, NULL);
+	igt_remove_fb(data->drm_fd, &fb);
+	igt_assert_f(rval == expected_rval,
+		     "Odd height NV12 framebuffer: got %d, expected %d\n",
+		     rval, expected_rval);
+}
+
+static void
+test_nv12_odd_horizontal_pan(data_t *data, igt_crtc_t *crtc,
+			     igt_output_t *output, int display_ver)
+{
+	igt_plane_t *primary = planar_test_setup(data, crtc, output);
+	igt_fb_t fb;
+	int expected_rval = display_ver >= 35 ? 0 : -EINVAL;
+	int rval;
+
+	if (!igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
+				      DRM_FORMAT_MOD_LINEAR)) {
+		igt_debug("Odd h-pan NV12 test skipped - format/mod not supported\n");
+		return;
 	}
 
-	/* test against intel_plane_check_src_coordinates() in i915 */
-	if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
-				     DRM_FORMAT_MOD_LINEAR)) {
-		int expected_rval = -EINVAL;
+	igt_create_fb(data->drm_fd, 810, 590,
+		      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb);
+	igt_plane_set_fb(primary, &fb);
+	igt_plane_set_size(primary, 810, 590);
+	igt_plane_set_position(primary, -501, 200);
+	rval = igt_display_try_commit_atomic(&data->display,
+					     DRM_MODE_ATOMIC_ALLOW_MODESET |
+					     DRM_MODE_ATOMIC_TEST_ONLY,
+					     NULL);
+	igt_plane_set_fb(primary, NULL);
+	igt_remove_fb(data->drm_fd, &fb);
+	igt_assert_f(rval == expected_rval,
+		     "Odd horizontal pan NV12 framebuffer: got %d, expected %d\n",
+		     rval, expected_rval);
+}
 
-		if ((display_ver >= 20 && display_ver < 35) || is_vkms)
-			expected_rval = 0;
+static void
+test_p016_odd_vertical_pan(data_t *data, igt_crtc_t *crtc,
+			   igt_output_t *output, int display_ver)
+{
+	igt_plane_t *primary = planar_test_setup(data, crtc, output);
+	igt_fb_t fb, fb_ref;
+	igt_crc_t crc, crc_ref;
+	int expected_rval = (display_ver >= 20 && display_ver < 35) ? 0 : -EINVAL;
+	int rval;
 
-		igt_create_fb(data->drm_fd, 256, 257,
-			      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb);
-		igt_plane_set_fb(primary, &fb);
-		rval = igt_display_try_commit_atomic(&data->display,
-						     DRM_MODE_ATOMIC_ALLOW_MODESET |
-						     DRM_MODE_ATOMIC_TEST_ONLY,
-						     NULL);
-		igt_remove_fb(data->drm_fd, &fb);
-		igt_assert_f(rval == expected_rval, "Odd height NV12 framebuffer\n");
-	} else {
-		igt_debug("Odd height NV12 framebuffer test skipped\n");
+	if (!igt_plane_has_format_mod(primary, DRM_FORMAT_P016,
+				      DRM_FORMAT_MOD_LINEAR)) {
+		igt_debug("Odd v-pan P016 test skipped - format/mod not supported\n");
+		return;
 	}
 
-	/* test against intel_plane_check_src_coordinates() in i915 */
-	if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
-				     DRM_FORMAT_MOD_LINEAR)) {
-		int expected_rval = -EINVAL;
+	igt_create_color_fb(data->drm_fd, 256, 260,
+			    DRM_FORMAT_P016, DRM_FORMAT_MOD_LINEAR,
+			    0.0, 0.0, 1.0, &fb);
 
-		if (display_ver >= 35 || is_vkms)
-			expected_rval = 0;
+	igt_plane_set_fb(primary, &fb);
+	igt_plane_set_position(primary, 1, 1);
+	igt_plane_set_size(primary, 256, 256);
+	igt_fb_set_position(&fb, primary, 0, 3);
+	igt_fb_set_size(&fb, primary, 256, 256);
+
+	rval = igt_display_try_commit_atomic(&data->display,
+					     DRM_MODE_ATOMIC_ALLOW_MODESET,
+					     NULL);
+	if (rval == 0) {
+		set_legacy_lut(data, crtc, LUT_MASK);
+		igt_wait_for_vblank_count(crtc, 1);
+
+		data->pipe_crc = igt_crtc_crc_new(crtc,
+						  IGT_PIPE_CRC_SOURCE_AUTO);
+		igt_pipe_crc_collect_crc(data->pipe_crc, &crc);
+
+		/* reference: plain blue XRGB8888 of the same visible size */
+		igt_create_color_fb(data->drm_fd, 256, 256,
+				    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
+				    0.0, 0.0, 1.0, &fb_ref);
+		igt_plane_set_fb(primary, &fb_ref);
+		rval = igt_display_try_commit_atomic(&data->display,
+						     DRM_MODE_ATOMIC_ALLOW_MODESET,
+						     NULL);
 
-		igt_create_fb(data->drm_fd, 810, 590,
-			      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb);
-		igt_plane_set_fb(primary, &fb);
-		igt_plane_set_size(primary, 810, 590);
-		igt_plane_set_position(primary, -501, 200);
-		rval = igt_display_try_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET |
-						     DRM_MODE_ATOMIC_TEST_ONLY, NULL);
+		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_ref);
+		set_legacy_lut(data, crtc, 0xffff);
+		igt_pipe_crc_free(data->pipe_crc);
+		data->pipe_crc = NULL;
 
-		igt_remove_fb(data->drm_fd, &fb);
-		igt_assert_f(rval == expected_rval, "Odd horizontal pan NV12 framebuffer\n");
+		igt_plane_set_fb(primary, NULL);
+		igt_remove_fb(data->drm_fd, &fb_ref);
+		igt_assert_crc_equal(&crc_ref, &crc);
 	} else {
-		igt_debug("Odd horizontal pan NV12 framebuffer test skipped\n");
+		igt_plane_set_fb(primary, NULL);
 	}
 
-	if (igt_plane_has_format_mod(primary, DRM_FORMAT_P016,
-					    DRM_FORMAT_MOD_LINEAR)) {
-		int expected_rval = -EINVAL;
+	igt_remove_fb(data->drm_fd, &fb);
+	igt_assert_f(rval == expected_rval,
+		     "Odd vertical pan P016 framebuffer: got %d, expected %d\n",
+		     rval, expected_rval);
+}
 
-		if ((display_ver >= 20 && display_ver < 35) || is_vkms)
-			expected_rval = 0;
+static void test_planar_settings(data_t *data)
+{
+	igt_display_t *display = &data->display;
+	igt_crtc_t *crtc;
+	igt_output_t *output;
+	int display_ver;
 
-		igt_create_color_fb(data->drm_fd, 256, 260,
-			      DRM_FORMAT_P016, DRM_FORMAT_MOD_LINEAR,
-			      0.0, 0.0, 1.0,
-			      &fb);
+	igt_require(display->is_atomic);
 
-		igt_plane_set_fb(primary, &fb);
-		igt_plane_set_position(primary, 1, 1);
-		igt_plane_set_size(primary, 256, 256);
+	/* All sub-tests below are Intel-specific. */
+	igt_require_intel(data->drm_fd);
+	display_ver = intel_display_ver(intel_get_drm_devid(data->drm_fd));
+	igt_require(display_ver >= 9);
 
-		/* set odd v pan and check with crc fb didn't break */
-		igt_fb_set_position(&fb, primary, 0, 3);
-		igt_fb_set_size(&fb, primary, 256, 256);
-		rval = igt_display_try_commit_atomic(&data->display,
-						     DRM_MODE_ATOMIC_ALLOW_MODESET,
-						     NULL);
-		if (rval == 0) {
-			set_legacy_lut(data,
-				       crtc,
-				       LUT_MASK);
-			igt_wait_for_vblank_count(crtc,
-						  1);
-			data->pipe_crc = igt_crtc_crc_new(crtc,
-							  IGT_PIPE_CRC_SOURCE_AUTO);
-			igt_pipe_crc_collect_crc(data->pipe_crc, &crc);
-
-			igt_create_color_fb(data->drm_fd, 256, 256,
-				DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
-				0.0, 0.0, 1.0,
-				&fb_ref);
-
-			igt_plane_set_fb(primary, &fb_ref);
-			rval = igt_display_try_commit_atomic(&data->display,
-						     DRM_MODE_ATOMIC_ALLOW_MODESET,
-						     NULL);
+	crtc = igt_first_crtc_with_single_output(display, &output);
+	igt_require_f(crtc, "No suitable output/crtc pair found\n");
 
-			igt_pipe_crc_collect_crc(data->pipe_crc, &crc_ref);
-			set_legacy_lut(data,
-				       crtc,
-				       0xffff);
+	igt_dynamic("nv12-odd-width")
+		test_nv12_odd_width(data, crtc, output, display_ver);
 
-			igt_pipe_crc_free(data->pipe_crc);
-			data->pipe_crc = NULL;
+	igt_dynamic("nv12-odd-height")
+		test_nv12_odd_height(data, crtc, output, display_ver);
 
-			igt_remove_fb(data->drm_fd, &fb_ref);
-			igt_assert_crc_equal(&crc_ref, &crc);
-		}
+	igt_dynamic("nv12-odd-horizontal-pan")
+		test_nv12_odd_horizontal_pan(data, crtc, output, display_ver);
 
-		igt_remove_fb(data->drm_fd, &fb);
-		igt_assert_f(rval == expected_rval, "Odd vertical pan P016 framebuffer\n");
-	} else {
-		igt_debug("Odd vertical pan P016 framebuffer test skipped\n");
-	}
+	igt_dynamic("p016-odd-vertical-pan")
+		test_p016_odd_vertical_pan(data, crtc, output, display_ver);
 }
 
 static bool is_pipe_limit_reached(int count)
@@ -1621,8 +1670,9 @@ run_tests_for_pipe_plane(data_t *data)
 		run_test(data, dynamic_test_handler);
 	}
 
-	igt_describe("verify planar settings for pixel format are accepted or rejected correctly");
-	igt_subtest_f("planar-pixel-format-settings")
+	igt_describe("verify planar pixel format settings are accepted or rejected correctly"
+		     " on Intel hardware");
+	igt_subtest_with_dynamic_f("planar-pixel-format-settings")
 		test_planar_settings(data);
 }
 
-- 
2.43.0

