Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7439C54E49
	for <igt-dev@archiver.kernel.org>; Wed,  6 Mar 2024 17:28:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBEF7113390;
	Wed,  6 Mar 2024 17:28:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="DaUxqM+y";
	dkim-atps=neutral
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0745710E086
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Mar 2024 17:28:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 677A9E000F;
 Wed,  6 Mar 2024 17:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1709746125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G8tl3i3UxXadJB8ZiMQUDTIw4k7tz2Xv2+6uTDj7B3s=;
 b=DaUxqM+ywQRQ2T+O9bEhqk5Vrce08AMluztyVhyAA7G2m81UufXDBKVex0tSpV9XtE6orN
 8pJo728QiQHSlfVTyTgEWOfgwdgfw7fUKvvUGWuvFMZHTfcAe1CIYr6Jx7QkKJ2k2ueKzB
 3BMy8YGXfHDsBIoEu81LbwgxAn6cTzFplZQ6dL+TIPS57x9/IfbOCTuLgCDAcngALAtN5i
 FzL2Y1dQVH/hkz5M4NdMyqj/uih/mGeIXOddmjkx6A+ZvDMzVEwzc6ZTLx8GJMHGi1eUbf
 u4bw3gl/cComfBIxBmQncq0yMwodDQZJSbsHjF/62F2N+KQBIQ91sBt5E3U6ww==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 06 Mar 2024 18:28:43 +0100
Subject: [PATCH i-g-t 9/9] tests/kms_plane: Add black and white test
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240306-b4-kms_tests-v1-9-8fe451efd2ac@bootlin.com>
References: <20240306-b4-kms_tests-v1-0-8fe451efd2ac@bootlin.com>
In-Reply-To: <20240306-b4-kms_tests-v1-0-8fe451efd2ac@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: miquel.raynal@bootlin.com, jeremie.dautheribes@bootlin.com, 
 thomas.petazzoni@bootlin.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7691;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=fS+8n31PM+T/V8CNyhdVOuGqoyL9/VI+L4i829QcmD0=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBl6KfJM8gSfGLAvDWRp00Z4ezc4uxivx4jtn78FGsv
 XkHwWJqJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZeinyQAKCRAgrS7GWxAs4nxPEA
 C2jSQlgfAus+iD8jyL43Y67HumDM7wnvtxmEr1qSejqUJL8zP1DVkVrgg+K8HvhqwjvJYIrHn9MY1G
 MB3N7WlfVe8b+ZSsOBzsc81KUIv9y7ZgzC/B971X/4gj4jQGvlegH1LJ0fFAmyvRzLwhiFW/k1Azr/
 1tjURUssUYaVktk+XANf4d2vRPL3pRgLBwCNsAoDpIJXG0hXDuwzlT8nLXoDuRwzUSaL4tTwFPERLR
 ktuoIapmjnhvAjJEtgNJPvlx7wF83SW0Kk3EWYP4ULGWzWiJjluStuiri78zkTVPZa/ntCa+iqc2/g
 bTErchqrVzMpZ2xB87CxXF9Fak1sA51y6kPaO8QkOBI37Py37w6vmEn1A5ul+p+IoTPxa8fMl9MdSO
 q8MioTEw1n3buL+oxFYdQxkmN04l8VY8VxDuIhBCoOM5WcWzoWWZQXQfLVp8UstNsRZDSYw5U+Qzf7
 Xk8YUyoGqUEiLtTGlNnaalHejCHLu7CXQV5fWvC66A0mdiS4sXP7aL7cCUH4dUkp2RpAHX0mPzSTrw
 eUK+vXJd8kn0PNulZORLWtxvNX2TmJz+6TM/833W+bcz2iMdvLU9UPmMOHhVS6fQ7QGzYn6l0oN08J
 tl8wg3woTKCMhGy6Wvk2fCrLikaQVtf7Vhp4L8n7xi3Wc9/tbuIux9mi1/rQ==
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

The black and white formats can't use the same list of colors as the
standard colors test. This new subtest uses only black and white to check
if the conversion is correct.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 tests/kms_plane.c | 172 +++++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 171 insertions(+), 1 deletion(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 8e92d2e13993..1d47ccc73f75 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -521,6 +521,11 @@ static const color_t colors_reduced[] = {
 	{ 0.0f, 1.0f, 1.0f, },
 };
 
+static const color_t color_black_white[] = {
+	{ 1.0f, 1.0f, 1.0f },
+	{ 0.0f, 0.0f, 0.0f },
+};
+
 static void set_legacy_lut(data_t *data, enum pipe pipe,
 			   uint16_t mask)
 {
@@ -1159,6 +1164,118 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
 	return result;
 }
 
+static bool test_format_black_and_white_plane(data_t *data, enum pipe pipe,
+					      igt_output_t *output, igt_plane_t *plane, igt_fb_t *primary_fb)
+{
+	struct igt_fb fb = {};
+	struct igt_fb *clear_fb = plane->type == DRM_PLANE_TYPE_PRIMARY ? primary_fb : NULL;
+	drmModeModeInfo *mode;
+	int width, height;
+	igt_crc_t ref_crc[ARRAY_SIZE(color_black_white) + 1];
+	igt_crc_t crc[ARRAY_SIZE(color_black_white) + 1];
+	struct format_mod ref = {};
+	bool result = true;
+
+	/*
+	 * No clamping test for cursor plane
+	 */
+	if (data->crop != 0 && plane->type == DRM_PLANE_TYPE_CURSOR)
+		return true;
+
+
+	mode = igt_output_get_mode(output);
+	if (plane->type != DRM_PLANE_TYPE_CURSOR) {
+		width = mode->hdisplay;
+		height = mode->vdisplay;
+		ref.format = DRM_FORMAT_XRGB8888;
+		ref.modifier = DRM_FORMAT_MOD_LINEAR;
+	} else {
+		if (!plane->drm_plane) {
+			igt_debug("Only legacy cursor ioctl supported, skipping cursor plane\n");
+			return true;
+		}
+		do_or_die(drmGetCap(data->drm_fd, DRM_CAP_CURSOR_WIDTH, &width));
+		do_or_die(drmGetCap(data->drm_fd, DRM_CAP_CURSOR_HEIGHT, &height));
+		ref.format = DRM_FORMAT_ARGB8888;
+		ref.modifier = DRM_FORMAT_MOD_LINEAR;
+	}
+
+	igt_debug("Testing connector %s on %s plane %s.%u with black and white colors\n",
+		  igt_output_name(output), kmstest_plane_type_name(plane->type),
+		  kmstest_pipe_name(pipe), plane->index);
+
+	igt_pipe_crc_start(data->pipe_crc);
+
+	igt_info("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " on %s.%u for reference CRC\n",
+		 IGT_FORMAT_ARGS(ref.format), IGT_MODIFIER_ARGS(ref.modifier),
+		 kmstest_pipe_name(pipe), plane->index);
+
+	check_allowed_plane_size_64x64(data, plane, &width, &height, ref.format);
+
+	/* Capture the reference CRCs */
+	capture_format_crcs_single(data, pipe, plane, ref.format, ref.modifier,
+				   width, height, IGT_COLOR_YCBCR_BT709,
+				   IGT_COLOR_YCBCR_LIMITED_RANGE,
+				   &ref_crc[0], &fb, color_black_white, ARRAY_SIZE(color_black_white));
+
+	for (int i = 0; i < ARRAY_SIZE(color_black_white); i++) {
+		capture_format_crcs_single(data, pipe, plane, ref.format, ref.modifier, width, height,
+					   IGT_COLOR_YCBCR_BT709, IGT_COLOR_YCBCR_LIMITED_RANGE, &ref_crc[i + 1], &fb,
+					   &color_black_white[i], 1);
+	}
+
+	for (int i = 0; i < plane->format_mod_count; i++) {
+		uint32_t format = plane->formats[i];
+		uint64_t modifier = plane->modifiers[i];
+
+		if (!igt_fb_supported_format(format)
+		    || !igt_format_is_black_white(format))
+			continue;
+
+		igt_info("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " on %s.%u\n",
+			 IGT_FORMAT_ARGS(format), IGT_MODIFIER_ARGS(modifier),
+			 kmstest_pipe_name(pipe), plane->index);
+
+		capture_format_crcs_single(data, pipe, plane, format, modifier,
+					   width, height, IGT_COLOR_YCBCR_BT709,
+					   IGT_COLOR_YCBCR_LIMITED_RANGE,
+					   &crc[0], &fb, color_black_white, ARRAY_SIZE(color_black_white));
+
+		for (int i = 0; i < ARRAY_SIZE(color_black_white); i++) {
+			capture_format_crcs_single(data, pipe, plane, format, modifier, width, height,
+						   IGT_COLOR_YCBCR_BT709, IGT_COLOR_YCBCR_LIMITED_RANGE, &crc[i + 1],
+						   &fb,
+						   &color_black_white[i], 1);
+		}
+
+		bool tmp_result = igt_check_crc_equal(&crc[0], &ref_crc[0]);
+		if (!tmp_result)
+			igt_warn(
+				"Format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " failed on %s.%u with the array pattern\n",
+				IGT_FORMAT_ARGS(format), IGT_MODIFIER_ARGS(modifier), kmstest_pipe_name(pipe),
+				plane->index);
+		result &= tmp_result;
+
+		for (int i = 1; i < ARRAY_SIZE(crc); i++) {
+			tmp_result = igt_check_crc_equal(&crc[i], &ref_crc[i]);
+			if (!tmp_result)
+				igt_warn(
+					"Format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT " failed on %s.%u for the color (r=%f,g=%f,b=%f)\n",
+					IGT_FORMAT_ARGS(format), IGT_MODIFIER_ARGS(modifier), kmstest_pipe_name(pipe),
+					plane->index, color_black_white[i - 1].red, color_black_white[i - 1].green,
+					color_black_white[i - 1].blue);
+			result &= tmp_result;
+		}
+	}
+
+	igt_pipe_crc_stop(data->pipe_crc);
+
+	igt_plane_set_fb(plane, clear_fb);
+	igt_remove_fb(data->drm_fd, &fb);
+
+	return result;
+}
+
 static bool skip_plane(data_t *data, igt_plane_t *plane)
 {
 	int index = plane->index;
@@ -1251,6 +1368,55 @@ test_pixel_formats(data_t *data, enum pipe pipe)
 
 	igt_assert_f(result, "At least one CRC mismatch happened\n");
 }
+
+
+static void
+test_pixel_black_and_white_formats(data_t *data, enum pipe pipe)
+{
+	struct igt_fb primary_fb;
+	igt_plane_t *primary;
+	drmModeModeInfo *mode;
+	bool result;
+	igt_output_t *output = data->output;
+	igt_plane_t *plane;
+
+	igt_info("Using (pipe %s + %s) to run the subtest.\n",
+		 kmstest_pipe_name(pipe), igt_output_name(output));
+
+	test_init(data, pipe);
+
+	mode = igt_output_get_mode(output);
+
+	igt_create_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
+		      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &primary_fb);
+
+	igt_output_set_pipe(output, pipe);
+	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+	igt_plane_set_fb(primary, &primary_fb);
+
+	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
+
+	set_legacy_lut(data, pipe, LUT_MASK);
+
+	result = true;
+	for_each_plane_on_pipe(&data->display, pipe, plane) {
+		if (skip_plane(data, plane))
+			continue;
+		result &= test_format_black_and_white_plane(data, pipe, output, plane, &primary_fb);
+	}
+
+	test_fini(data);
+
+	set_legacy_lut(data, pipe, 0xffff);
+
+	igt_plane_set_fb(primary, NULL);
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
+
+	igt_remove_fb(data->drm_fd, &primary_fb);
+
+	igt_assert_f(result, "At least one CRC mismatch happened\n");
+}
 static void test_odd_size_with_yuv(data_t *data)
 {
 	enum pipe pipe = PIPE_A;
@@ -1350,9 +1516,13 @@ static void
 run_tests_for_pipe_plane(data_t *data)
 {
 	igt_describe("verify the pixel formats for given plane and pipe");
-	igt_subtest_with_dynamic_f("pixel-format")
+	igt_subtest_with_dynamic_f("pixel-format-colors")
 		run_test(data, test_pixel_formats);
 
+	igt_describe("verify the black and white pixel formats for given plane and pipe");
+	igt_subtest_with_dynamic_f("pixel-format-black-white")
+		run_test(data, test_pixel_black_and_white_formats);
+
 	igt_describe("verify the pixel formats for given plane and pipe with source clamping");
 	igt_subtest_with_dynamic_f("pixel-format-source-clamping") {
 		data->crop = 4;

-- 
2.43.0

