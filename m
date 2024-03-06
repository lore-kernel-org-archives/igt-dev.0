Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A686C54E55
	for <igt-dev@archiver.kernel.org>; Wed,  6 Mar 2024 17:28:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BCF310E086;
	Wed,  6 Mar 2024 17:28:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ne7bY35T";
	dkim-atps=neutral
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3F9511338B
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Mar 2024 17:28:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 17247E000E;
 Wed,  6 Mar 2024 17:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1709746125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H8aMKQ95OQ1xzVEfblaBtbo5p3EwpPa3G8B8LFP/U6k=;
 b=ne7bY35TJT44bInWSZRCM3/GOKTJklkCCC01zR/waDoKnLOJD1kbg8QOMes62yHm4IOYTI
 MoLxNgt9ejV7CcfUvAP93UKQSDA6Mm7b/rC3QhyG2N/zX1//7i2kDtPPJ6uEwAtbBJIsbM
 I2DGS/XMJHM3+3ptc5uGTAM8T6PMJZ4JaybNu1F5jini/oxgxqsmyetuPAYs26Bchx32ZE
 /F6zyX+EjwZxXRKaOlVzjyWVm1Cdis2MXolQCNI8bnL8QteOMAcOemp2plARCMgBzvulT+
 jutq/Qeu11LXFwp2laJZacjbiBMZ6dHTokiGbLjzqKFzfH7CwaD8BPLAQ1F75w==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 06 Mar 2024 18:28:42 +0100
Subject: [PATCH i-g-t 8/9] tests/kms_plane: Allow choosing the number of
 colors when drawing the color array
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240306-b4-kms_tests-v1-8-8fe451efd2ac@bootlin.com>
References: <20240306-b4-kms_tests-v1-0-8fe451efd2ac@bootlin.com>
In-Reply-To: <20240306-b4-kms_tests-v1-0-8fe451efd2ac@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: miquel.raynal@bootlin.com, jeremie.dautheribes@bootlin.com, 
 thomas.petazzoni@bootlin.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6034;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=lCRlvqVA06ht+JfKgJcDsLjZz9PJgbDy5+4J+XNLNSw=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBl6KfJNZKeJmrgvjZk4zW7v/SciDcuTwz/d3pU3Q1i
 EXvH9a+JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZeinyQAKCRAgrS7GWxAs4k6wD/
 4mhS/2PAxFP6qllKvVdtzXIRBtxpuCapsj4YPP5VNpGop5xgyFhWE4zw7FQHBYdgeNImnl4Swpb+XC
 rgGv9pS1r0nvSTbAoq5ehKctbKmQXBn5z/gyEK9e0rAcW3DpVxH6FNjg9jwWpB5VfrlB1x8qigVUJE
 Snfb8NxTuLQ3iFBUZfBKpT5chP7gYdZfC7cgbXuUeA4hbj/Wz4SZnBiZ3BV01NN9iYw5se+V4JrXvL
 NA5/9X0L3q5Brvgygrar8z+9hFPCGYO+MdrFRnCVLh+vc/UzJKWomF9x+T5FN0q7kqKj8nO+kObHNu
 UbhfzWhi2z4f1JMOY/ZC6rA6s1UEr5VpsEimN0glviKLOxDPwQ40A8axYRM8w/7csr/Jqzril4BUjs
 nWPLup7t3Awe+4UQoI2yLTIGL+/o611867HsdEyxKaTflfTkJ0DrLNsy+KyHOyGmOjMAgf86prbdI2
 Ddq5sWwPSi5lk1yIak5WaJ0JK1a4CkH1BDaSEkMNn1+QA24Zg3dZcjrKOj4iBI7hopiDRjtgIdUvPk
 YnX+H5DqZi/erSZM4rKSx3smkJ25/PIy3lOkyDcDRIEO+IqBnEasApBAUSar06GQ71Y5JcZur0aGpN
 zUZTTisqE20zBZKK4Bmxmfjx5DcL6/+yqyTt7rr0oUOW0n/yKjSTxKV8ML1w==
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

To test different formats, it can be useful to pass a custom list of
colors. For example with the grayscale formats, the red/green/blue
components alone don't have any meaning and it's better to test multiple
gray values. This patch edit the fill algorithm to use custom color list.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 tests/kms_plane.c | 64 +++++++++++++++++++++++++++++++++----------------------
 1 file changed, 38 insertions(+), 26 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 2baaeef7bbc8..8e92d2e13993 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -582,10 +582,16 @@ static bool set_c8_legacy_lut(data_t *data, enum pipe pipe,
 	return true;
 }
 
-static void draw_entire_color_array(data_t *data, cairo_t *cr, uint32_t format,
-				    struct igt_fb *fb)
+/*
+ * draw_color_array() - Draw a color array on a plane, respecting the requested cropping
+ *
+ * @data, @cr, @format, @fb: Description of the framebuffer
+ * @colors: list of colors to draw
+ * @color_count: number of colors to draw
+ */
+static void draw_color_array(data_t *data, cairo_t *cr, uint32_t format,
+			     struct igt_fb *fb, const color_t *colors, int color_count)
 {
-	const int color_count = ARRAY_SIZE(colors_extended);
 	const int margin = format == DRM_FORMAT_XRGB8888 ? 0 : data->crop;
 	const int step_x = (fb->width - margin * 2) / color_count;
 	const int step_y = (fb->height - margin * 2) / color_count;
@@ -605,21 +611,32 @@ static void draw_entire_color_array(data_t *data, cairo_t *cr, uint32_t format,
 					margin + m * step_y,
 					step_x,
 					step_y,
-					colors_extended[color_index].red,
-					colors_extended[color_index].green,
-					colors_extended[color_index].blue);
+					colors[color_index].red,
+					colors[color_index].green,
+					colors[color_index].blue);
 		}
 	}
 }
 
+
+/**
+ * prepare_format_color() - Fill a plane with a specific color or pattern
+ *
+ * @data: Generic data for this test
+ * @pipe, @plane, @format, @modifier, @width, @height, @color_encoding, @color_range, @fb: description of the plane
+ * @colors: Color list to display on this plane
+ * @color_count: Number of color in the list
+ *
+ * At least one color must be given
+ */
 static void prepare_format_color(data_t *data, enum pipe pipe,
 				 igt_plane_t *plane,
 				 uint32_t format, uint64_t modifier,
 				 int width, int height,
 				 enum igt_color_encoding color_encoding,
 				 enum igt_color_range color_range,
-				 const color_t *c, struct igt_fb *fb,
-				 bool packed)
+				 struct igt_fb *fb, const color_t *colors,
+				 int color_count)
 {
 	cairo_t *cr;
 	const int localcrop = format == DRM_FORMAT_XRGB8888 ? 0 : data->crop;
@@ -640,17 +657,12 @@ static void prepare_format_color(data_t *data, enum pipe pipe,
 		igt_paint_color(cr, 0, 0,
 				width + localcrop * 2,
 				height + localcrop * 2,
-				1.0f - c->red,
-				1.0f - c->green,
-				1.0f - c->blue);
+				1.0f - colors[0].red,
+				1.0f - colors[0].green,
+				1.0f - colors[0].blue);
 
 
-	if (packed)
-		draw_entire_color_array(data, cr, format, fb);
-	else
-		igt_paint_color(cr, localcrop, localcrop,
-				width, height,
-				c->red, c->green, c->blue);
+	draw_color_array(data, cr, format, fb, colors, color_count);
 
 	igt_put_cairo_ctx(cr);
 	igt_plane_set_fb(plane, fb);
@@ -700,13 +712,13 @@ static void capture_format_crcs_single(data_t *data, enum pipe pipe,
 				       int width, int height,
 				       enum igt_color_encoding encoding,
 				       enum igt_color_range range,
-				       igt_crc_t crc[], struct igt_fb *fb)
+				       igt_crc_t crc[], struct igt_fb *fb,
+				       const color_t *colors, int color_count)
 {
 	struct igt_fb old_fb = *fb;
-	const color_t black = { 0.0f, 0.0f, 0.0f };
 
 	prepare_format_color(data, pipe, plane, format, modifier,
-			     width, height, encoding, range, &black, fb, true);
+			     width, height, encoding, range, fb, colors, color_count);
 
 	igt_display_commit2(&data->display, data->display.is_atomic ?
 					    COMMIT_ATOMIC : COMMIT_UNIVERSAL);
@@ -729,20 +741,20 @@ static void capture_format_crcs_multiple(data_t *data, enum pipe pipe,
 	int i;
 
 	/* Also run single colors to capture more failures */
-	capture_format_crcs_single(data, pipe, plane, format, modifier, width, height, encoding, range, crc, fb);
+	capture_format_crcs_single(data, pipe, plane, format, modifier, width, height, encoding, range, crc, fb,
+				   colors_extended, ARRAY_SIZE(colors_extended));
 
 	/* Skip the first crc as it's taken by "capture_format_crcs_single" */
 	crc = crc + 1;
 
 restart_round:
 	for (i = 0; i < data->num_colors; i++) {
-		const color_t *c = &data->colors[i];
 		struct igt_fb old_fb = *fb;
 		int ret;
 
 		prepare_format_color(data, pipe, plane, format, modifier,
-				     width, height, encoding, range, c, fb,
-				     false);
+				     width, height, encoding, range, fb,
+				     &data->colors[i], 1);
 
 		if (data->display.is_atomic && i >= 1) {
 			igt_assert(read(data->drm_fd, &ev, sizeof(ev)) == sizeof(ev));
@@ -873,7 +885,7 @@ static bool test_format_plane_colors(data_t *data, enum pipe pipe,
 	} else {
 		capture_format_crcs_single(data, pipe, plane, format, modifier,
 					   width, height, encoding, range, crc,
-					   fb);
+					   fb, colors_extended, ARRAY_SIZE(colors_extended));
 	}
 
 	for (i = 0; i < total_crcs; i++) {
@@ -1062,7 +1074,7 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
 	capture_format_crcs_single(data, pipe, plane, ref.format, ref.modifier,
 				   width, height, IGT_COLOR_YCBCR_BT709,
 				   IGT_COLOR_YCBCR_LIMITED_RANGE,
-				   ref_crc[SINGLE_CRC_SET], &fb);
+				   ref_crc[SINGLE_CRC_SET], &fb, colors_extended, ARRAY_SIZE(colors_extended));
 
 	capture_format_crcs_multiple(data, pipe, plane, ref.format, ref.modifier,
 				     width, height, IGT_COLOR_YCBCR_BT709,

-- 
2.43.0

