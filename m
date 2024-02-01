Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69CF2C48286
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 16:42:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F69710F234;
	Thu,  1 Feb 2024 16:42:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="W6JEbcTe";
	dkim-atps=neutral
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4943D10F25C
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 16:42:11 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::224])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 9E7F2C3324
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 16:36:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4C0B8E0007;
 Thu,  1 Feb 2024 16:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1706805365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IesaeA72VoazZXrJKIVk24p9mNpaw1st2egad8lozUU=;
 b=W6JEbcTeGeMa/Tgb1J2KxJFdkhCJezDr4suSouq9eHoyN/2cOztHH2f5TCf+jOQzGXeJ4J
 Y2HCKSs1SHKo59vtqGtcy35eutLEWGCO3BkP/dH/dzLMCIhA0WfxPCLJv9m4StZqb7yQgN
 nIf3Auhn2mAbI2RRimR5XSDxCyL+PGooPBqJc4i2EEe18MLO477GFNTS5yU3hrub9NK+CY
 mUj6GhOSnCjhqSlQGwwpM1/NOGddSmjGGEeikTdAtmYZa2cJguvy6KsVuBqXqrjKTe2nXq
 cBrbomJcfIt1kMiHhZYwmO/Z9pzMfNKvcbwL7y46pEyyWz59wjIy2xXDvtxPMQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 01 Feb 2024 17:35:54 +0100
Subject: [PATCH i-g-t 2/3] tests/kms/plane: Use a complex pattern to test
 plane color conversion.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240201-kms_tests-v1-2-bc34c5d28b3f@bootlin.com>
References: <20240201-kms_tests-v1-0-bc34c5d28b3f@bootlin.com>
In-Reply-To: <20240201-kms_tests-v1-0-bc34c5d28b3f@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: Louis Chauvet <louis.chauvet@bootlin.com>, thomas.petazzoni@bootlin.com, 
 miquel.raynal@bootlin.com
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4467;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=8nks4H23bMPHJvXVDUWzx8vCi/OKmV8bcxI8xrtNUkg=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBlu8hzi616lrYCAbdUSV5qAsgeUBBJo4mUTR0dQC7s
 WSvZuImJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZbvIcwAKCRAgrS7GWxAs4oPCEA
 C6cv/x4+oxdQzO6EGx2ttfEZpMZGlurPmiPaeMGwzTo01iPfNae8EX3+YNwAix5JcVxiKiEuoqFRwT
 6GIQiAlcYkZM0wjlUJlV4KrBG6OoVxeTjr6f0484c98KH8WDRnNFWMrV4lr0yfEb90ZTJABsvCSi6A
 lUCWDf+lJnB4m2mNfS25QEr1ndDcDidCQCgrNNbWUGqTkxdd9nx5E9/alUABTStYlimg0YftLZqhxn
 oA9owSEyHd2/N5g0j+Q7TRpoYiEd30g5O7G24Jo3mgx4xHn2VjKQFsOSsCgSMusD/ABKpnGx0zW2YH
 BR5dgBmiFxDvW3jUykskebetoMu6CtdbEK1sT8vhL79p+ubIsy2oZgFk24+rM0olZS7QgT7NtsQoka
 POPE7vnBkNRAKbP+z+2jCB+TqRq09vF5rY8I+X8ONjZFjHRGWP7/BiShEqpkB4RpyRCVBYOZ26SIo9
 8TudxwssU4Ov+Vu1+ydkOH2j8TukMOpdTY3WfffTETD+dgLx/yIqzHN3kNFaOcPfWW7UAWXe0IVKuP
 rZLLjypOg8rlk1TSLnpTIgQxCVRaAcvr9py9g95huXnHEyz9GKUx471KuIsLFxWkH1LRR6OaKwYHdd
 6knP3mYCZYT++sx4eg/KhyLrRL2euZ5c9lH4ElReRr1An17q3ohACUxwYu5w==
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

Replace the simple "lines pattern" by a "square pattern" to detect if the
drm device correctly render the picture.

It's useful for example for the series [1] where the tests are "SUCCESS",
but in fact it works only because the content of a line is the same. The
"square pattern" will detect this kind of issues on the x axis.

It also allows this "square pattern" to be tested in the
"capture_format_crcs_multiple" tests, otherwise it is not executed for yuv
formats.

[1]: https://lore.kernel.org/dri-devel/20240110-vkms-yuv-v2-0-952fcaa5a193@riseup.net/

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 tests/kms_plane.c | 42 +++++++++++++++++++++++++++++-------------
 1 file changed, 29 insertions(+), 13 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 0bca96692b14..296d5af3eb91 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -587,7 +587,10 @@ static void draw_entire_color_array(data_t *data, cairo_t *cr, uint32_t format,
 				    struct igt_fb *fb)
 {
 	const int color_amount = ARRAY_SIZE(colors_extended);
-	const int x = format == DRM_FORMAT_XRGB8888 ? 0 : data->crop;
+	const int margin = format == DRM_FORMAT_XRGB8888 ? 0 : data->crop;
+	const int step_x = (fb->width - margin * 2) / color_amount;
+	const int step_y = (fb->height - margin * 2) / color_amount;
+	int color_index;
 
 	if (format != DRM_FORMAT_XRGB8888) {
 		cairo_rectangle(cr, data->crop, data->crop,
@@ -595,16 +598,18 @@ static void draw_entire_color_array(data_t *data, cairo_t *cr, uint32_t format,
 				fb->height - data->crop * 2);
 	}
 
-
 	for (int n = 0; n < color_amount; n++) {
-		int y = (fb->height - x * 2) * n / color_amount + x;
-
-		igt_paint_color(cr, x, y,
-				fb->width - x * 2,
-				(fb->height - x * 2) / color_amount + 1,
-				colors_extended[n].red,
-				colors_extended[n].green,
-				colors_extended[n].blue);
+		for (int m = 0; m < color_amount; m++) {
+			color_index = (n + m) % color_amount;
+			igt_paint_color(cr,
+					margin + n * step_x,
+					margin + m * step_y,
+					step_x,
+					step_y,
+					colors_extended[color_index].red,
+					colors_extended[color_index].green,
+					colors_extended[color_index].blue);
+		}
 	}
 }
 
@@ -712,6 +717,11 @@ static void capture_format_crcs_single(data_t *data, enum pipe pipe,
 	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &crc[0]);
 }
 
+/*
+ * capture_format_crcs_multiple() - Capture CRC for multiples colors
+ *
+ * @crc: list to store generated CRC. It must be at least data.num_colors + 1
+ */
 static void capture_format_crcs_multiple(data_t *data, enum pipe pipe,
 					 igt_plane_t *plane,
 					 uint32_t format, uint64_t modifier,
@@ -724,6 +734,12 @@ static void capture_format_crcs_multiple(data_t *data, enum pipe pipe,
 	struct drm_event_vblank ev;
 	int i;
 
+	/* Also run single colors to capture more failures */
+	capture_format_crcs_single(data, pipe, plane, format, modifier, width, height, encoding, range, crc, fb);
+
+	/* Skip the first crc as it's taken by "capture_format_crcs_single" */
+	crc = crc + 1;
+
 restart_round:
 	for (i = 0; i < data->num_colors; i++) {
 		const color_t *c = &data->colors[i];
@@ -849,7 +865,7 @@ static bool test_format_plane_colors(data_t *data, enum pipe pipe,
 				     igt_crc_t ref_crc[],
 				     struct igt_fb *fb)
 {
-	igt_crc_t crc[ARRAY_SIZE(colors_extended)];
+	igt_crc_t crc[ARRAY_SIZE(colors_extended) + 1];
 	unsigned int crc_mismatch_mask = 0;
 	int crc_mismatch_count = 0;
 	bool result = true;
@@ -859,7 +875,7 @@ static bool test_format_plane_colors(data_t *data, enum pipe pipe,
 		capture_format_crcs_multiple(data, pipe, plane, format, modifier,
 					     width, height, encoding, range, crc,
 					     fb);
-		total_crcs = data->num_colors;
+		total_crcs = data->num_colors + 1;
 	} else {
 		capture_format_crcs_single(data, pipe, plane, format, modifier,
 					   width, height, encoding, range, crc,
@@ -1006,7 +1022,7 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
 	struct igt_fb *clear_fb = plane->type == DRM_PLANE_TYPE_PRIMARY ? primary_fb : NULL;
 	drmModeModeInfo *mode;
 	uint64_t width, height;
-	igt_crc_t ref_crc[MAX_CRC_SET][ARRAY_SIZE(colors_extended)];
+	igt_crc_t ref_crc[MAX_CRC_SET][ARRAY_SIZE(colors_extended) + 1];
 	struct igt_vec tested_formats;
 	struct format_mod ref = {};
 	igt_crc_t* crcset;

-- 
2.43.0

