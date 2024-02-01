Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41593C48292
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 16:42:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C14B610F24F;
	Thu,  1 Feb 2024 16:42:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="RBHuiq7t";
	dkim-atps=neutral
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A99F10F261
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 16:42:11 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (unknown [217.70.183.196])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 9BF8FC32A2
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 16:36:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8D3DDE000C;
 Thu,  1 Feb 2024 16:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1706805365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=koIp+m72UisHv+XRLBvuZ5tbEbEpBXiL16PtYFy+I40=;
 b=RBHuiq7tDW+Pl5bSSsuKqRpM3sivp6KsobNw3fWyOS9OGmFF4B0+PKUzZ2j92MGb8At61J
 zXAEts12b0vJKoM+8PoWvbb6Cx6DmowW/2eYMhLf4iq/tiGWZNOzXF1q91b11yTm0BAY8H
 fScdevouBHnQ1nnT0Uzo+6jLPHPWStFL5QqCPrr4/KgEEncAJ79uEHzIv5jB1CCAsX2UQC
 jI4NEOECfLkJzzJv3wCN9ItmPu4Jm6eQsJY/WEEVdWLMeXVa/cVnHyAO7m1qmja/auVnqF
 zmNr1ZRue4yKec+kd5tIsRYIkhoJ3hoELS+94nbRFZGpCzJw7MypW5DimBsN+g==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 01 Feb 2024 17:35:55 +0100
Subject: [PATCH i-g-t 3/3] tests/kms_rotation_crc: Remove intel guards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240201-kms_tests-v1-3-bc34c5d28b3f@bootlin.com>
References: <20240201-kms_tests-v1-0-bc34c5d28b3f@bootlin.com>
In-Reply-To: <20240201-kms_tests-v1-0-bc34c5d28b3f@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: Louis Chauvet <louis.chauvet@bootlin.com>, thomas.petazzoni@bootlin.com, 
 miquel.raynal@bootlin.com
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3975;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=sZstu8vtufIWvvucEV45Ub5nJ0gvu2HLj86Ms/4JuTU=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBlu8h02UT45Vm8dJvBywAMpvidqB7RGcSiJ++KxbgU
 U2qyGdCJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZbvIdAAKCRAgrS7GWxAs4smjEA
 CIbzDYaLT+mBiZgAn8AUbtr1lA53I/tSnf1TUvg4uiBms3Cb2fqIsEKLGdWHJ9VfzR8DleWt33wLOl
 COdqjj7rICnD88akdyNeQCmyWE+OfrJO2IFINYZ1oY07UNsXH3/1Vh7Uv2klk8i9yuzQAf+PeXAspn
 n96aXHuyr/4IZTAuHTourVPt9vSjrYcFbCCrP2Jhfz2lTiE3si5v3ovSFsY1bpLtsu2SV2MBTlh2Z3
 6Nw+L+bPkiEpQoHanR7EdVQL6xXZtv67rsgb6mJ0yMiiXA+W1yxuL1aUW6adGeA2XgOpTa6KRgLW1c
 9o3UyFqIoXTKp8hMbQeGRj77dP7cuTlBNO6qgJl2PAS3bznvcOifAOZXwDPo7MAlh6q5diEct+Vok7
 jiQe7iuurlYuv7MLLIfmiaEiY5bD2jVOtjXy5SnS/s5AptTAFEclo9p+Mqss4Li54f7LPL25Lz0Str
 mMzn7JVK0j584AALg8XKr6zQ5r4S9rr6Z7/evcm2mhsvvUH1gwt+CvT3ocCaoV2uu6XHhKDE0PowUC
 b6MGo7QloVKgM/NfFAgFJazJBv0mCMFiZ2WzkpP9bP6HFmmI0M+PZ1n2KBpoSS2w1Fc929p/kD46kQ
 fUN4bBox5LY5eO+B+CrgpG0LokGP3k4bWKlb2NeqC0uZkBv1/0mMco7zGGMQ==
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

Remove a lot of intel guards on multiple tests.
The only guard keep is bad-pixel-format because it seems very
intel-specific.

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

