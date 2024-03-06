Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7BEEC54E49
	for <igt-dev@archiver.kernel.org>; Wed,  6 Mar 2024 17:28:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 782FC11338B;
	Wed,  6 Mar 2024 17:28:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="KvxW54JH";
	dkim-atps=neutral
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E25511338B
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Mar 2024 17:28:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 65B89E000C;
 Wed,  6 Mar 2024 17:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1709746124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FQyAqUZ0UqY76A/i3A+S4UoZd1z+Z+rBz4QzzwKsHYY=;
 b=KvxW54JHGskx2vOAVGuJBVhW4M1p3xOoQxcyGucQfTscDzqPFuwq4rwpColKIPwYqddm68
 BK2yOLvmbMCoLrk1VblWYEQM1mFhJ6uXbxw+jHVcaqJPR0ZLu9hpTcwUJSMkfS+e2ucBD0
 +8H02DqyUXH4KZCJdSlAwmiFazZBLraFWXz4Ci4R3C9/RQk8icJrsrwnR9wpiTYUcVr04y
 ZpWMYF7HVo44emCPHhSvFoQBb4FB5kobtis0UwgQLeJewhIiE5R2uJ4ecCL7SHYJ56/+yP
 vPW76h8P3VGD3nHu6/fDP28yO7nwtZ/mw3A24dmATqpD+zTf0BVORvgkJ4v4Og==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 06 Mar 2024 18:28:40 +0100
Subject: [PATCH i-g-t 6/9] tests/kms_plane: Use the square pattern even
 when using multiple planes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240306-b4-kms_tests-v1-6-8fe451efd2ac@bootlin.com>
References: <20240306-b4-kms_tests-v1-0-8fe451efd2ac@bootlin.com>
In-Reply-To: <20240306-b4-kms_tests-v1-0-8fe451efd2ac@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: miquel.raynal@bootlin.com, jeremie.dautheribes@bootlin.com, 
 thomas.petazzoni@bootlin.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3002;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=y+kZsjNhrcKjorDYEmW8zHta7n4z0cxOfKhkkqOznxU=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBl6KfJP/3uGbpAzGlQAxFtsH/NBMwFiU5EvBY07tGU
 hKR7N0uJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZeinyQAKCRAgrS7GWxAs4phBEA
 CwX0E12t7rohBKhk2YYo6ppIwgdpJqdTIt5pEvpRCh4NSwle9Bh121qztEVBJu2l021ML0HxchUtCd
 thGikJAwuTNvzDHOm3aVHNm8oN3iFP0W1lpBc1TfUfPZlghCbBzeJFm5PMVTqx4vdowx/62uV4JQAB
 Wi+ibD+jrLgitOlkG6km2SeDyNmIXOQlTkBqj5PWbHAbGbsm3IaDDNdSCpMOh7VtI2n0G0AS9HCFOA
 Zmuc282CnIt0JA2NwhwFgYYyq5yXR45pN/tj7emXu5y2Zf8ftxGCyQ+z8vIKSg4U20hlsC9cSAjD4x
 JsufsFuVnqknZM+vKGA2sc07ctMB8VrFxpQ1BlrkXDhdzufwVcoIOg7+6GAotLijuxUvSm+T2OiKva
 hX5yFONi4wFBu3HQO4jtszA96SxgQTT+XfITTDdzpdiHVLxJ1u5/Ne5XjZ9ImGGCbIbFJT6prBz8Dg
 sg8Jh4gOluwITsF7KTLvsCAakozoqElrWfJKQfTjYiTuaGaLa32vMC1nce5qmTPbz2wASrnbsmJP52
 aY+jIGeapbHEolzLwP+r+8NIuxQXxnyAaDKoogDBA3FV6YInr7owg70sN0g8BUy5PqpKGcwvqvK+cq
 Xl19oCA0xG+G7tripPhiM0qwsJnXmXqtNDCvXLub9/EHKZLog6llp/vGx0Mw==
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

When the capture_format_crcs_multiple function is used, it was only using
plain colors. It is enough to detect if the format conversion don't
return the correct color, but it was not sufficient to check if the
correct pixel is converted.

As seen in [1], the capture_format_crcs_multiple was "SUCCESS" because if
the whole plane have only one color, if the wrong pixel is read, it will
always convert to the correct color.

[1]: https://lore.kernel.org/dri-devel/ZbvXV-1hrfXLcvC3@localhost.localdomain/

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 tests/kms_plane.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index f0be09b8e506..bb8229124b8c 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -728,6 +728,12 @@ static void capture_format_crcs_multiple(data_t *data, enum pipe pipe,
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
@@ -853,7 +859,7 @@ static bool test_format_plane_colors(data_t *data, enum pipe pipe,
 				     igt_crc_t ref_crc[],
 				     struct igt_fb *fb)
 {
-	igt_crc_t crc[ARRAY_SIZE(colors_extended)];
+	igt_crc_t crc[ARRAY_SIZE(colors_extended) + 1];
 	unsigned int crc_mismatch_mask = 0;
 	int crc_mismatch_count = 0;
 	bool result = true;
@@ -863,7 +869,7 @@ static bool test_format_plane_colors(data_t *data, enum pipe pipe,
 		capture_format_crcs_multiple(data, pipe, plane, format, modifier,
 					     width, height, encoding, range, crc,
 					     fb);
-		total_crcs = data->num_colors;
+		total_crcs = data->num_colors + 1;
 	} else {
 		capture_format_crcs_single(data, pipe, plane, format, modifier,
 					   width, height, encoding, range, crc,
@@ -881,7 +887,7 @@ static bool test_format_plane_colors(data_t *data, enum pipe pipe,
 	if (crc_mismatch_count)
 		igt_warn("CRC mismatches with format " IGT_FORMAT_FMT " on %s.%u with %d/%d solid colors tested (0x%X)\n",
 			 IGT_FORMAT_ARGS(format), kmstest_pipe_name(pipe),
-			 plane->index, crc_mismatch_count, data->num_colors, crc_mismatch_mask);
+			 plane->index, crc_mismatch_count, total_crcs, crc_mismatch_mask);
 
 	return result;
 }
@@ -1010,7 +1016,7 @@ static bool test_format_plane(data_t *data, enum pipe pipe,
 	struct igt_fb *clear_fb = plane->type == DRM_PLANE_TYPE_PRIMARY ? primary_fb : NULL;
 	drmModeModeInfo *mode;
 	uint64_t width, height;
-	igt_crc_t ref_crc[MAX_CRC_SET][ARRAY_SIZE(colors_extended)];
+	igt_crc_t ref_crc[MAX_CRC_SET][ARRAY_SIZE(colors_extended) + 1];
 	struct igt_vec tested_formats;
 	struct format_mod ref = {};
 	igt_crc_t *crcset;

-- 
2.43.0

