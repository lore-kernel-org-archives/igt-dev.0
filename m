Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C53C5475B
	for <igt-dev@archiver.kernel.org>; Wed,  6 Mar 2024 17:28:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0C2E11338D;
	Wed,  6 Mar 2024 17:28:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ekK5RHCB";
	dkim-atps=neutral
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B111E113393
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Mar 2024 17:28:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A3856E0002;
 Wed,  6 Mar 2024 17:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1709746122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cYtpKNbOXqXuoHBRDfQM7jAatwz+Q8P9rpXtK8wsA7Y=;
 b=ekK5RHCBPGFrYfSZil15aGOTyJDGVK3ntiDtRTlH+03jNXdyWfScJJttipVmiemCNednrd
 Ibs39Qstx/Eo2ENKqvr01xW4Z+Y8dNu+JjLFhHOoxJzj0rEdPgFgaFCzqL0i+Oh8wdYWUp
 ZrqinSh8Hz49tnlIjkryophtF29I1G7QOLU3UOdu7T9bI0cTPtg0jbdocziXCTRhaO/tiL
 gLZh6Kl95apVWV6/ZvuLkpya0clqfvf7cqg74DxeEIXpzvNn8ek9tXzT9tvwJ9EmvDGrgA
 ZjCsmku7b405wmIVRd3pCyiAbhLdODGLB3+EZ7BZrKJ9n6I4WJfYSmRL3f+Ljw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 06 Mar 2024 18:28:35 +0100
Subject: [PATCH i-g-t 1/9] tests/kms_rotation_crc: Remove intel guards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240306-b4-kms_tests-v1-1-8fe451efd2ac@bootlin.com>
References: <20240306-b4-kms_tests-v1-0-8fe451efd2ac@bootlin.com>
In-Reply-To: <20240306-b4-kms_tests-v1-0-8fe451efd2ac@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: miquel.raynal@bootlin.com, jeremie.dautheribes@bootlin.com, 
 thomas.petazzoni@bootlin.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3945;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=YPlPvloe1w1AbC2/tI/ckjwBOlYAWMRb3mhQ/CGeCbE=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBl6KfIDpFlTLxIyPmZkxEDf+6Ar6Zzkt5YxETaWEbU
 UrDGmXGJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZeinyAAKCRAgrS7GWxAs4l4dD/
 4k5P/qa6svMW7h5WohIzhl4fDKtjxVJMyvJFNpDpgkBNDVrlSZr4ijbbPVmhVx0o61R1pNoNEhZ+E6
 TgjdgsCnoFNoD/EDhXIfBYp4T645gh6gwZTmt4QB1PPKkvZf471MQ9Kbok0vorc0OmqO1/GhEIXL/B
 nsC3uurVq4AD0wDqcmHoFQfXAr4aAqPIqZ0GZ60jquCRdpYjWinioRrNaqodUVO7u7km2R/Mzzsr28
 62HeabGjr7341b5yJqa4o6+VkkfBTynxf5sP2Z4BIl8SrMnKzaZxiK73zoj88MIFINp046Jp2O5r0s
 fhXz/PSe12F+6YqIooGgQC/ckLnNeHco/rvpx0L1Si+ifYgykGnvs5SR6q0A7hFjPzm6xLsA7nsWYt
 bGyQiWnisS8LQO8iOPtcCRoU6jWvCIv6QXxqnZhU225GAqYznnL7VqrWbRWgt8B+Qf/PXoyJ8+iyJI
 eKRIHPZa72Uiyhc1iVfnwhAk0nDe3wLniHt82ZF35ShIqz+2mbulSIClhLtz0XZ1TGCAgCT9w+8RCk
 wD3m65RvuOk3VdTpCJCgdoJL+axcf1oMp6yeobxExfFDFShsxrzfKFYm6mxuLgr5YnHNTD2Ek4IM3l
 vGnP28tb1/WAxXZVFTy+wG2DfG4thR0IKrbPm5vWzdgtgeMX6KaF6JfZkBUQ==
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

A lot of rotation tests were behind intel guards, so remove them to make
them working with VKMS.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 tests/kms_rotation_crc.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index 8d8c53b5ff84..1ab2dc68663b 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -634,7 +634,8 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
 		plane = igt_output_get_plane_type(output, plane_type);
 		igt_require(igt_plane_has_prop(plane, IGT_PLANE_ROTATION));
 		igt_require(igt_plane_has_rotation(plane, data->rotation));
-		/* CHV can't rotate and reflect simultaneously */
+		/* When using CHERRYVIEW intel device, simultaneous rotation and reflection are not supported at the
+		 * same time, so skip this test */
 		igt_require(!is_intel_device(data->gfx_fd) ||
 			    !IS_CHERRYVIEW(data->devid) ||
 			    data->rotation != (IGT_ROTATION_180 | IGT_REFLECT_X));
@@ -1250,12 +1251,13 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	data.pos_x = 0,
 	data.pos_y = 0;
 
-	igt_describe("Checking unsupported pixel format for gen9+ with 90 degree of rotation");
+	igt_describe("Checking unsupported pixel format for Intel gen9+ with 90 degree of rotation");
 	igt_subtest_f("bad-pixel-format") {
 		 /* gen11 enables RGB565 rotation for 90/270 degrees.
 		  * so apart from this, any other gen11+ pixel format
 		  * can be used which doesn't support 90/270 degree
 		  * rotation */
+		igt_require(is_intel_device(data.gfx_fd));
 		data.rotation = IGT_ROTATION_90;
 		data.override_fmt = gen < 11 ? DRM_FORMAT_RGB565 : DRM_FORMAT_Y212;
 		test_plane_rotation(&data, DRM_PLANE_TYPE_PRIMARY, true);
@@ -1270,11 +1272,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	}
 	data.override_modifier = 0;
 
-	igt_describe("Tiling and Rotation test for gen 10+ for primary plane");
+	igt_describe("Tiling and Rotation test for primary plane");
 	for (reflect_x = reflect_x_subtests; reflect_x->modifier; reflect_x++) {
-		igt_fixture
-			igt_require_intel(data.gfx_fd);
-
 		igt_subtest_f("primary-%s-tiled-reflect-x-%s",
 			      igt_fb_modifier_name(reflect_x->modifier),
 			      igt_plane_rotation_name(reflect_x->rot)) {
@@ -1286,7 +1285,9 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 
 	igt_describe("Rotation test on both planes by making them fully visible");
 	igt_subtest_f("multiplane-rotation") {
-		igt_require(gen >= 9);
+		/* This feature is only supported for Intel device >= 9 */
+		if (is_intel_device(data.gfx_fd))
+			igt_require(gen > 9);
 		cleanup_crtc(&data);
 		data.planepos[0].origo = p_top | p_left;
 		data.planepos[0].x = .2f;
@@ -1300,7 +1301,9 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	igt_describe("Rotation test on both planes by cropping left/top corner of primary plane and"
 			"right/top corner of sprite plane");
 	igt_subtest_f("multiplane-rotation-cropping-top") {
-		igt_require(gen >= 9);
+/* This feature is only supported for Intel device >= 9 */
+		if (is_intel_device(data.gfx_fd))
+			igt_require(gen > 9);
 		cleanup_crtc(&data);
 		data.planepos[0].origo = p_top | p_left;
 		data.planepos[0].x = -.05f;
@@ -1314,7 +1317,9 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 	igt_describe("Rotation test on both planes by cropping left/bottom corner of primary plane"
 			"and right/bottom corner of sprite plane");
 	igt_subtest_f("multiplane-rotation-cropping-bottom") {
-		igt_require(gen >= 9);
+/* This feature is only supported for Intel device >= 9 */
+		if (is_intel_device(data.gfx_fd))
+			igt_require(gen > 9);
 		cleanup_crtc(&data);
 		data.planepos[0].origo = p_bottom | p_left;
 		data.planepos[0].x = -.05f;

-- 
2.43.0

