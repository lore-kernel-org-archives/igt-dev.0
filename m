Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D80C5475B
	for <igt-dev@archiver.kernel.org>; Wed,  6 Mar 2024 17:28:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 309CE113392;
	Wed,  6 Mar 2024 17:28:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="eoQIkmBf";
	dkim-atps=neutral
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07E6311338B
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Mar 2024 17:28:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5A783E0006;
 Wed,  6 Mar 2024 17:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1709746123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=917ir0yy5t8i4BjTkgmdbaaS8TICfUneWYf7lwj7i+g=;
 b=eoQIkmBfLmhnap/459gsMNSfSIBVjKKqljPgVvr4W4hvptFmnfTLlQ0wSi0Sjx95QNKYCM
 Sa0vdhPRCEbVLfgKt+OzPW5GHrmbpAR2aD94N/wGTeYgmOMyj35LG0g3rjC9OL4GmY7j/Q
 3ScFq3Xau8S/TC2WDOxpUG4EnVhMuYNzTJNESTvk9r23e7HMFaHceSDkUkN5WaAB+UFzxy
 t8X8ACB3LaAUmsNUARge5BmgZgY3EjvuXbvxYMHe5vorhWH3KPGKpY2pRzwPaLdc8hw9QV
 3Dn0TCJxeJkb+nlT0yqopWOiFjmmJuYc2PrJvpRlZnDFwaSoqd8ieZpo80gDhA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 06 Mar 2024 18:28:37 +0100
Subject: [PATCH i-g-t 3/9] tests/kms_plane: Rename test_planar_settings to
 test_odd_size_with_yuv and remove intel guards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240306-b4-kms_tests-v1-3-8fe451efd2ac@bootlin.com>
References: <20240306-b4-kms_tests-v1-0-8fe451efd2ac@bootlin.com>
In-Reply-To: <20240306-b4-kms_tests-v1-0-8fe451efd2ac@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: miquel.raynal@bootlin.com, jeremie.dautheribes@bootlin.com, 
 thomas.petazzoni@bootlin.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5248;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=gXcERIPEVuLhmRypDei/zpdLuag+TtJaqFVNu4d2YEo=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBl6KfIO6muGLnFk480NfeYJd0RZK0e3SmTWyjLqRB2
 Pxsm69+JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZeinyAAKCRAgrS7GWxAs4kZ0EA
 C20UUnW9cf98k5LZgTMVdR6zJoLLFiXp/pVy6+h8psdVpxaiYd9z9UWwe5GcERpGxHGw6TSjrkwxY1
 WqCsQ09rINRqrPQg4PlVEhZAaSo6S6aL0jAQ1YHrGrTpNsuwejnbUYyB9YsLRftjwrS/EqeGFa0rCN
 P3TVjf6mSLq2E2znlS811A+W9AeLeKqG+A5v1rJk2MGoUQRD5Br5PTVb+wtREW+i/VuO1ggT0nu8FD
 FvSmcjzoFjaGOlhaS6t84twVU8hZe3oDg02Hwxao5bEwt9dCefZgZz0loeEePYiuGSzYL5C7LQG06p
 WRy/k4Fc4iarBokS+/ErNs7Nlyq7Qcr6GaExBU5hkxefHaaZZWi7FM6xcS3PTc6SExE0wcwXKvaFHU
 APwLIWAZWTlFe1WkhJwXyGQqM+JagkbyQm+nNZTGBbXKawPKNkfQqO0A/AGqGE7biOJfN+YoBinogg
 qRzvGW+d3zpwa/wSmmqzCUT0a7NbxQLA3D3VmnZ4RPkTCwtnadmVlWNQyJNnyV3z2iVzEwDa6yjvUs
 /3pUQAGIElFlDvhvq3rRQU4XDKIbveE8Chewt6JO/9Lyj9gn8VjF9Jzq+tfC731irxgrfnJHd3gb8q
 50Zu0BuvR+4y/X5aKkYa99JAP/laXPsHBwKkodCWnByHdRHDbgF+HABmxU6g==
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

The test_planar_settings name and description is not very descriptive for
the content of the test. Change it to "test_odd_size_with_yuv".

Also remove the intel guard on this test, so it can be run for other
platforms like VKMS.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 tests/kms_plane.c | 91 ++++++++++++++++++++++++++-----------------------------
 1 file changed, 43 insertions(+), 48 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index dd830e68a177..9757c6e44325 100644
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
@@ -1225,8 +1225,7 @@ test_pixel_formats(data_t *data, enum pipe pipe)
 
 	igt_assert_f(result, "At least one CRC mismatch happened\n");
 }
-
-static void test_planar_settings(data_t *data)
+static void test_odd_size_with_yuv(data_t *data)
 {
 	enum pipe pipe = PIPE_A;
 	igt_output_t *output;
@@ -1235,14 +1234,18 @@ static void test_planar_settings(data_t *data)
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
+	if (is_intel_device(data->drm_fd)) {
+		/* This was required in the original test */
+		igt_require(intel_display_ver(devid) >= 9);
+		/* Intel display version below 20 are expected to fail */
+		if (intel_display_ver(devid) < 20) {
+			should_fail = true;
+		}
+	}
 
 	output = igt_get_single_output_for_pipe(&data->display, pipe);
 	igt_require(output);
@@ -1254,44 +1257,37 @@ static void test_planar_settings(data_t *data)
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
+	if (should_fail) {
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
+	if (should_fail) {
+		igt_assert_f(rval == -EINVAL, "Odd height NV12 framebuffer correctly failed\n");
 	} else {
-		igt_debug("Odd height NV12 framebuffer test skipped\n");
+		igt_assert_f(rval == 0, "Odd height NV12 framebuffer correctly succeed\n");
 	}
 }
 
@@ -1376,9 +1372,8 @@ run_tests_for_pipe_plane(data_t *data)
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

