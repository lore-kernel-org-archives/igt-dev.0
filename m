Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B33ACC54E41
	for <igt-dev@archiver.kernel.org>; Wed,  6 Mar 2024 17:28:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE961113394;
	Wed,  6 Mar 2024 17:28:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="hgYhxwzh";
	dkim-atps=neutral
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9099B113393
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Mar 2024 17:28:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 145F2E000B;
 Wed,  6 Mar 2024 17:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1709746124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qmAtXvc+Oy3Z4TVvfuNb0NEUTXX0LcbzUoajBaq1G7k=;
 b=hgYhxwzhEbywdTknF+v3Va637BA6Zo0THNZBTGWpQi9sm8axb20PTjCNm0F+DLlEyD4x+O
 PtsZtTSOs1+BsGDZBZXVJjeVryAyU4ElPwSBZreLSOG3xzQ9Y1JtJzAzbW05iDTcXJC9NO
 2mjfMhawO33OZk47Kyv2E8mm83ymzToG5u/B9NC6VKeweIaYOlLzc7sjIM0Qa1JeAVxzuY
 +AZJdLWOLJVS90y1kraugxfm9KdjvKZMLcmU7tvida+J6GpHegbC9hw1gX4Jkev41BPvvx
 BbCKTG6rAKrVkcMyAerZvYkqipVCBuQ5wGjwDVozYXPoN5F2RNUgCFOhcm/lZA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 06 Mar 2024 18:28:39 +0100
Subject: [PATCH i-g-t 5/9] tests/kms_plane: Use a complex pattern to test
 plane color conversion.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240306-b4-kms_tests-v1-5-8fe451efd2ac@bootlin.com>
References: <20240306-b4-kms_tests-v1-0-8fe451efd2ac@bootlin.com>
In-Reply-To: <20240306-b4-kms_tests-v1-0-8fe451efd2ac@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: miquel.raynal@bootlin.com, jeremie.dautheribes@bootlin.com, 
 thomas.petazzoni@bootlin.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2564;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Iqx2Nr096ne4zhW479FvXiEAW5covjMVQWw4YrUl1Mw=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBl6KfIhD7QMRc7+Z5hbudyxPhCfMEJEjONXZFXOeql
 KXb6vriJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZeinyAAKCRAgrS7GWxAs4h7ED/
 9RAyedE5g4lNsxbr9g7m//+PdVnogB92Uio+pqkKu0qgDtvcFA6R1c1PN3zmUl642auroA7zXL+/2R
 aq3Mq64tjMVYTue2+W0mduJJ8dalx2O6R4PJVUUalcHKm66nUo/MiS9q1MM9dygjC7V60Q4yAsTqNf
 Sa7wOKlZGLP07Dd8DZ8gCb6lgn/zFKIGuZ8wuhJz39avw9PozwFDItWD4W0xUikyP8XSbtaCVyd6ZC
 SPwYRgvZeThNXWFDacKsvu9gKP69/2qVcokn4GrY8etNQ9ZbAtzThJhkL+79ydHIKLP830UevaSDwT
 uYzA6Ai60RH5zUPHJyCN+cOneilCYpY1f6IXEmDauzWjHqhABuK45huow+94BzSLk0+If9HHWZ9o2o
 xHVxa+/HX3XOyIWSqaVDn+7ECdfssLaSrhMoystOt8ya09DY6O9YmHCy3YTxz5bTYskCKugJBbNCg/
 jUPEX/3zZz49a76ptS6a3VCnQd9J5WLyerRk9U5NrGsHbBDWey+GuVBeRLK77/RvV4JoTXHKLu75gA
 79Rr1rHi5VNuig22BBxJ2s2ce8hmmqlZxcqDdLJyOfG55Ky09VnoZwTERtoE4wGkcvJYkN0V75Aoyt
 RFGTcLx5tfumK7Y2cs3XPxMfdpwwBXc/3AAgoVBoPUZjNiHdIzrfUmWGwuTA==
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

The capture_format_crcs_single helper uses a "line pattern" with all the
colors in the color list. It is useful to make quick test of color
conversion (only one plane to render, not one per color).

To help detecting issues, this "line pattern" is replaced by a
"square pattern". It is useful for complex formats like YUV where the
iteration on each pixel is not a trivial "ptr++".

The kind of issue which can be detected can be found in [1]. The tests
were all "SUCCESS" despite a wrong pixel iteration. With the "square"
pattern, it is now more difficult to have a test "SUCCESS" if the pixel
iteration is not correct.

[1]: https://lore.kernel.org/dri-devel/ZbvXV-1hrfXLcvC3@localhost.localdomain/

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 tests/kms_plane.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 9757c6e44325..f0be09b8e506 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -585,8 +585,11 @@ static bool set_c8_legacy_lut(data_t *data, enum pipe pipe,
 static void draw_entire_color_array(data_t *data, cairo_t *cr, uint32_t format,
 				    struct igt_fb *fb)
 {
-	const int color_amount = ARRAY_SIZE(colors_extended);
-	const int x = format == DRM_FORMAT_XRGB8888 ? 0 : data->crop;
+	const int color_count = ARRAY_SIZE(colors_extended);
+	const int margin = format == DRM_FORMAT_XRGB8888 ? 0 : data->crop;
+	const int step_x = (fb->width - margin * 2) / color_count;
+	const int step_y = (fb->height - margin * 2) / color_count;
+	int color_index;
 
 	if (format != DRM_FORMAT_XRGB8888) {
 		cairo_rectangle(cr, data->crop, data->crop,
@@ -594,16 +597,18 @@ static void draw_entire_color_array(data_t *data, cairo_t *cr, uint32_t format,
 				fb->height - data->crop * 2);
 	}
 
-
-	for (int n = 0; n < color_amount; n++) {
-		int y = (fb->height - x * 2) * n / color_amount + x;
-
-		igt_paint_color(cr, x, y,
-				fb->width - x * 2,
-				(fb->height - x * 2) / color_amount + 1,
-				colors_extended[n].red,
-				colors_extended[n].green,
-				colors_extended[n].blue);
+	for (int n = 0; n < color_count; n++) {
+		for (int m = 0; m < color_count; m++) {
+			color_index = (n + m) % color_count;
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
 

-- 
2.43.0

