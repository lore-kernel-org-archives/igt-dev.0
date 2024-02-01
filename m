Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E7EC4828F
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 16:42:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45BD910F23B;
	Thu,  1 Feb 2024 16:42:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="K+tOOQ5t";
	dkim-atps=neutral
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53EF810F26A
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 16:42:11 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (unknown [217.70.183.196])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 992AFC321C
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 16:36:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F39C3E000D;
 Thu,  1 Feb 2024 16:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1706805365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yLrinQZStj2oyVCfETut45FqBn+XiO/mGlOOiZkArNc=;
 b=K+tOOQ5t8f4dMXXtOwkqbbsT0e0nBAfZaEv/aJ/fHZ19YQx7aqYh1J+j5aOfpUOia2a+NH
 opY3aHukYK7dGqs4scuzgO9btA8wdd6Em9o0vgPzzERc+qTOyPvNdfdYWWhsIoQbbctOCg
 4TAQu0+npMss++CxK8CNd8dbr1AS9osXyGT7oCsatZtn77n9Awne3Rp0B0ziSQ9Un57vfJ
 jvI2shA339GTC/AnCp8wG/kZDWG8up5D9tQLvkE2TaDlSGUf3CysHMq+h+LtppqMffZ9GD
 DZYvygFMaD3NLUB3foKFiQYoCpsMl2Mwj4HQdITA7nQVKhYOJIdTcLhThXfqQg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 01 Feb 2024 17:35:53 +0100
Subject: [PATCH i-g-t 1/3] tests/kms/plane: Rename test_planar_settings to
 test_odd_size_with_yuv
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240201-kms_tests-v1-1-bc34c5d28b3f@bootlin.com>
References: <20240201-kms_tests-v1-0-bc34c5d28b3f@bootlin.com>
In-Reply-To: <20240201-kms_tests-v1-0-bc34c5d28b3f@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: Louis Chauvet <louis.chauvet@bootlin.com>, thomas.petazzoni@bootlin.com, 
 miquel.raynal@bootlin.com
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5114;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=cBdSvIWfA9enZT0PzoJRdcP0tjD820ZpU426h4x4Hic=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBlu8hzanDf4Fbxjwfi3cEsDb9PvYajKSvcpg1676b+
 m+oVR7mJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZbvIcwAKCRAgrS7GWxAs4llcEA
 DPDsrULkhm1DZlG/RDdo36d5QUwvBDQCv1DXz6dEOMrJHTeDIFFOGJBpbI2I+TKOUuqyQwxwIbPB38
 cTuEbbAdMa9YurvHdUkGGj5eK//0O4nOss37H9mu9KNDoAuYEgSK9og6kzyU5wQWt5GPPOkB9/JsHl
 7mi0Jp1b42DZiEvRdqL8P8CWj5YF1+RdVp+6HpIKrMxri3SXKuLUwr/iD/wlylbVm3CzKyqKM3lvjS
 Ahue4Y91JC+AbYowvhdl4rI7D9krYVtR8omjwbKkXrac7fobBxfBq/gU/U1GiYL7Ly99N1sphqjx4B
 F5EdlrVSgaOatmXAtf6Nw0BgP0Fm09iNRnxLJQ1kpFPPQtbp5Gr28/tkMv4UYw227uxHd0O0rqFKvr
 d3s24FOS3ZkyZyCr7dJqMs3prtrBVFA7CYzNIRJXQVdaof3ZclxeDa5a/frgbTnEx1I7GFJt3ytee6
 KeCnBDf0o5zMPnuanGoehTpnScEYjUWs2yDe6tiw7ZHshKY3zlkEW63EX2vJMVpQDWVHwA/xGhaN1y
 CKUr/rwT82pZ9qSutx/9JV+X8OAxHZOqxwKCVro6uLK4mGYLgHOz0vplbs6AUtpGa2s1fTSXg04zmP
 T71bJscrjBVByG9cS3o6Yl9+NdPMicjEL/T96QwKJN1yqFR1GVublW5cuEag==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
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

Rename the test test_planar_settings to test_odd_size_with_yuv, remove the
intel guard on this test.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 tests/kms_plane.c | 91 ++++++++++++++++++++++++++-----------------------------
 1 file changed, 43 insertions(+), 48 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 406aecc04297..0bca96692b14 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -42,8 +42,8 @@
 #include "xe/xe_query.h"
 
 /**
- * SUBTEST: planar-pixel-format-settings
- * Description: verify planar settings for pixel format are handled correctly
+ * SUBTEST: test-odd-size-with-yuv
+ * Description: verify that yuv odd size are handled correctly by the driver
  * Functionality: pixel_formats, plane
  *
  * SUBTEST: plane-position-%s
@@ -1226,8 +1226,7 @@ test_pixel_formats(data_t *data, enum pipe pipe)
 
 	igt_assert_f(result, "At least one CRC mismatch happened\n");
 }
-
-static void test_planar_settings(data_t *data)
+static void test_odd_size_with_yuv(data_t *data)
 {
 	enum pipe pipe = PIPE_A;
 	igt_output_t *output;
@@ -1236,14 +1235,18 @@ static void test_planar_settings(data_t *data)
 	int devid;
 	int rval;
 
-	/*
-	 * If here is added non-intel tests below require will need to be
-	 * changed to if(..)
-	 */
+	bool should_fail = false;
 	igt_require(data->display.is_atomic);
-	igt_require_intel(data->drm_fd);
-	devid = intel_get_drm_devid(data->drm_fd);
-	igt_require(intel_display_ver(devid) >= 9);
+
+	/* Add more devices here if they are expected to fail */
+	if(is_intel_device(data->drm_fd)) {
+		/* This was required in the original test */
+		igt_require(intel_display_ver(devid) >= 9);
+		/* Intel display version below 20 are expected to fail */
+		if (intel_display_ver(devid) < 20) {
+			should_fail = true;
+		}
+	}
 
 	output = igt_get_single_output_for_pipe(&data->display, pipe);
 	igt_require(output);
@@ -1255,44 +1258,37 @@ static void test_planar_settings(data_t *data)
 				  DRM_MODE_ATOMIC_ALLOW_MODESET,
 				  NULL);
 
-	/* test against intel_plane_check_src_coordinates() in i915 */
-	if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
-				     DRM_FORMAT_MOD_LINEAR)) {
-		int expected_rval = -EINVAL;
-
-		if (intel_display_ver(devid) >= 20)
-			expected_rval = 0;
-
-		igt_create_fb(data->drm_fd, 257, 256,
-			      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb);
-		igt_plane_set_fb(primary, &fb);
-		rval = igt_display_try_commit_atomic(&data->display,
-						     DRM_MODE_ATOMIC_ALLOW_MODESET,
-						     NULL);
-		igt_remove_fb(data->drm_fd, &fb);
-		igt_assert_f(rval == expected_rval, "Odd width NV12 framebuffer\n");
+	igt_require(igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
+					     DRM_FORMAT_MOD_LINEAR));
+
+
+	igt_create_fb(data->drm_fd, 257, 256,
+		      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb);
+	igt_plane_set_fb(primary, &fb);
+	rval = igt_display_try_commit_atomic(&data->display,
+					     DRM_MODE_ATOMIC_ALLOW_MODESET,
+					     NULL);
+	igt_remove_fb(data->drm_fd, &fb);
+
+	if(should_fail) {
+		igt_assert_f(rval == -EINVAL, "Odd width NV12 framebuffer correctly failed\n");
 	} else {
-		igt_debug("Odd width NV12 framebuffer test skipped\n");
+		igt_assert_f(rval == 0, "Odd width NV12 framebuffer correctly succeed\n");
 	}
 
-	/* test against intel_plane_check_src_coordinates() in i915 */
-	if (igt_plane_has_format_mod(primary, DRM_FORMAT_NV12,
-				     DRM_FORMAT_MOD_LINEAR)) {
-		int expected_rval = -EINVAL;
-
-		if (intel_display_ver(devid) >= 20)
-			expected_rval = 0;
-
-		igt_create_fb(data->drm_fd, 256, 257,
-			      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb);
-		igt_plane_set_fb(primary, &fb);
-		rval = igt_display_try_commit_atomic(&data->display,
-						     DRM_MODE_ATOMIC_ALLOW_MODESET,
-						     NULL);
-		igt_remove_fb(data->drm_fd, &fb);
-		igt_assert_f(rval == expected_rval, "Odd height NV12 framebuffer\n");
+
+	igt_create_fb(data->drm_fd, 256, 257,
+		      DRM_FORMAT_NV12, DRM_FORMAT_MOD_LINEAR, &fb);
+	igt_plane_set_fb(primary, &fb);
+	rval = igt_display_try_commit_atomic(&data->display,
+					     DRM_MODE_ATOMIC_ALLOW_MODESET,
+					     NULL);
+	igt_remove_fb(data->drm_fd, &fb);
+
+	if(should_fail) {
+		igt_assert_f(rval == -EINVAL, "Odd height NV12 framebuffer correctly failed\n");
 	} else {
-		igt_debug("Odd height NV12 framebuffer test skipped\n");
+		igt_assert_f(rval == 0, "Odd height NV12 framebuffer correctly succeed\n");
 	}
 }
 
@@ -1377,9 +1373,8 @@ run_tests_for_pipe_plane(data_t *data)
 		run_test(data, test_plane_panning);
 	}
 
-	igt_describe("verify planar settings for pixel format are accepted or rejected correctly");
-	igt_subtest_f("planar-pixel-format-settings")
-		test_planar_settings(data);
+	igt_describe("verify that odd sizes for yuv format are accepted or rejected correctly");
+	igt_subtest_f("test-odd-size-with-yuv") test_odd_size_with_yuv(data);
 }
 
 static int opt_handler(int opt, int opt_index, void *_data)

-- 
2.43.0

