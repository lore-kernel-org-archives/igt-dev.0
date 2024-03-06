Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14BA0C54E41
	for <igt-dev@archiver.kernel.org>; Wed,  6 Mar 2024 17:28:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2466311338F;
	Wed,  6 Mar 2024 17:28:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="R7yrB1u8";
	dkim-atps=neutral
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1173113394
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Mar 2024 17:28:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 08B9EE0005;
 Wed,  6 Mar 2024 17:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1709746123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KxOg8Q7QVju9ImXPvjEGtTtDBZBGeWSZ1qVTn6ETC44=;
 b=R7yrB1u8yhYxCC9pD+hM5ZuWs2eVNk0sXWaKV0TaNoiFS/aCKaFCP+gKbwUKxCgx8zIQ7F
 5xZ7t8KiVkBHgaZu2NkNPgJ65JuoSB7HS9gWtp0brFr4rK7AEmDZhzM1dZ9/61ydT1zvaZ
 FooiXikpKBWYAcF6oznIsyANwy19CM5vyl1xRkwhrXrcy/wpoEHuudv+L1yH+bQeEbukpZ
 bneu4qMLxodhtMv5OtX9Nlj+IGdloTT2dC9PrFEYGUWLow++Nyn2fkImqw+g+6nW3ZOJOW
 //ZCOyoUr8SNpZRh+OKvsgGphfzdl9uzPMdfzVgNzXRbrmP6F26VcqM3ASrwIg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 06 Mar 2024 18:28:36 +0100
Subject: [PATCH i-g-t 2/9] tests/kms_plane: Fix some formatting and alignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240306-b4-kms_tests-v1-2-8fe451efd2ac@bootlin.com>
References: <20240306-b4-kms_tests-v1-0-8fe451efd2ac@bootlin.com>
In-Reply-To: <20240306-b4-kms_tests-v1-0-8fe451efd2ac@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: miquel.raynal@bootlin.com, jeremie.dautheribes@bootlin.com, 
 thomas.petazzoni@bootlin.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2900;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=822nCjCbFfeBvf2zWoS4yzRDSqxd3CR4HhlMfLSHNZw=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBl6KfIKOtU5kRhXa5Qs8kFmSjj2Odx2Fr+xQwklS0z
 ktWSCiiJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZeinyAAKCRAgrS7GWxAs4nDKD/
 wP+xttvXiXO335bXEr1W4Q4sx1YY6/0eFphSV0YPmx1rytO53+/JVO8/L5lGKieD5ciKJKwjprqXGQ
 lWbAacJeaq/TaTnEvY4H2aOH2KaBxVI3caEmAY+Z8m0fxf6WB6DW5iKxXJ1YdEsJ4Rlt6GYlit2Chq
 O5Lbdx9WjLJ7jfuszICChRGHLSC5TtM2grKXj3RWVe4VBO58XEFq4NzeB8BU+xrVUyBoi9uz9cFCey
 R6X9XPWBLpLd9OWYOpd8aljudZgTU1r9SXQXBCpOd3Qp/w0ST6Yr8R2V/INuAbPcBu0F4ef0nZFzYb
 JxY7SuU7cNBLYQGzDfqHOGTfVgni6ADtSMjzW9D3LM4u752tMFXGIDRJxCxsEX3ruxqQLmeFoQ03lB
 LtMYwaF17KOX9Rpir2HtAHjUyKaSnYIkJc9pjxS7yCLoda1vPw2ag4SKMMtNA3pSRToK20Oax95BXz
 TdqdqGFKq7wmVrDErsqh5rKQmn51gfHQbT0uC51iGfEz1dS7JzKvCTO/AKzhJYfU1JiGiilNWxgVyG
 GsXxFq9DyRJPL5KapHScT0AR1bHuZ4NUPuCtBjZjdpi3cxot8M2AWw/cXQTlx+ljxJGbl3YWe6mDtV
 qTtmbzh78eX+Bx4eSMV9JNLDEbNTHtl88cOCFE+v6lyJKH1iBwX2944Kdt8g==
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

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 tests/kms_plane.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 406aecc04297..dd830e68a177 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -286,7 +286,7 @@ test_plane_position_with_output(data_t *data,
 
 	if (primary->drm_plane->plane_id > sprite->drm_plane->plane_id) {
 		igt_info("primary plane ID (%d) > sprite plane ID (%d), skipping plane %d\n",
-				primary->drm_plane->plane_id, sprite->drm_plane->plane_id, plane);
+			 primary->drm_plane->plane_id, sprite->drm_plane->plane_id, plane);
 		return;
 	}
 
@@ -373,7 +373,7 @@ test_plane_position(data_t *data, enum pipe pipe)
  */
 static void
 create_fb_for_mode_panning(data_t *data, drmModeModeInfo *mode,
-			    struct igt_fb *fb /* out */)
+			   struct igt_fb *fb /* out */)
 {
 	unsigned int fb_id;
 	cairo_t *cr;
@@ -463,7 +463,6 @@ test_plane_panning(data_t *data, enum pipe pipe)
 		for_each_memory_region(r, data->drm_fd)
 			if (r->ci.memory_class == I915_MEMORY_CLASS_DEVICE)
 				mem_size = r->cpu_size;
-
 	}
 
 	if (is_xe_device(data->drm_fd)) {
@@ -705,7 +704,7 @@ static void capture_format_crcs_single(data_t *data, enum pipe pipe,
 			     width, height, encoding, range, &black, fb, true);
 
 	igt_display_commit2(&data->display, data->display.is_atomic ?
-			    COMMIT_ATOMIC : COMMIT_UNIVERSAL);
+					    COMMIT_ATOMIC : COMMIT_UNIVERSAL);
 
 	igt_remove_fb(data->drm_fd, &old_fb);
 
@@ -796,7 +795,7 @@ restart_round:
 				igt_display_t *display = &data->display;
 
 				igt_wait_for_vblank(data->drm_fd,
-						display->pipes[pipe].crtc_offset);
+						    display->pipes[pipe].crtc_offset);
 			}
 		}
 
@@ -1009,7 +1008,7 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
 	igt_crc_t ref_crc[MAX_CRC_SET][ARRAY_SIZE(colors_extended)];
 	struct igt_vec tested_formats;
 	struct format_mod ref = {};
-	igt_crc_t* crcset;
+	igt_crc_t *crcset;
 	bool result = true;
 
 	/*
@@ -1352,7 +1351,7 @@ run_tests_for_pipe_plane(data_t *data)
 	}
 
 	igt_describe("verify plane position using two planes to create a partially covered screen and"
-		       "check for DPMS");
+		     "check for DPMS");
 	igt_subtest_with_dynamic_f("plane-position-hole-dpms") {
 		data->flags = TEST_POSITION_PARTIALLY_COVERED | TEST_DPMS;
 		run_test(data, test_plane_position);
@@ -1371,7 +1370,7 @@ run_tests_for_pipe_plane(data_t *data)
 	}
 
 	igt_describe("verify plane panning at bottom-right position using primary plane and executes system"
-		       "suspend cycles");
+		     "suspend cycles");
 	igt_subtest_with_dynamic_f("plane-panning-bottom-right-suspend") {
 		data->flags = TEST_PANNING_BOTTOM_RIGHT | TEST_SUSPEND_RESUME;
 		run_test(data, test_plane_panning);

-- 
2.43.0

