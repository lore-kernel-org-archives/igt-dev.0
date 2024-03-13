Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC980C54E68
	for <igt-dev@archiver.kernel.org>; Wed, 13 Mar 2024 17:10:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FF0E10EF63;
	Wed, 13 Mar 2024 17:10:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="kG7X1KND";
	dkim-atps=neutral
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 772DD10EDEF
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Mar 2024 17:10:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D7CAA1C0004;
 Wed, 13 Mar 2024 17:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1710349800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wo83YTD1XPxXSz8nk5eE+b9HyeSJMSp4dfn9BZRFQfY=;
 b=kG7X1KND2lZr+/xMgNST3PTNakpz8n94993R8N287TGzn78azRy+UFMRA1S7wCzsLvUt2d
 EvSD9fqRXPZ3p7Duwg4BeUghItasbpGxyG96RS0ALOT8Glb80jepVsg4ejkNqPWyBiqRtP
 /yjFh9qaYDCOXSJX4r3LxM+HSVv/EXNMwq63UulNOGJv5pmWf9myeOhehTIkZDni6CBUDx
 EQkzFzybnoAcDODkp1b4evKoGMOoadbCwlCK0VUc/DTWzkTGmFDjbcdHz8qYvgDirkPceU
 Mhy+zWeUndl0pxX0JQmxB4UmtZjR3IJu0d8d94QWVutQnG0jlFOpqIOEY6tzPg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 13 Mar 2024 18:09:41 +0100
Subject: [PATCH i-g-t v2 2/4] lib/igt_fb: Expose lookup_drm_format to
 access format properties in tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240313-new_rotation-v2-2-6230fd5cae59@bootlin.com>
References: <20240313-new_rotation-v2-0-6230fd5cae59@bootlin.com>
In-Reply-To: <20240313-new_rotation-v2-0-6230fd5cae59@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: miquel.raynal@bootlin.com, jeremie.dautheribes@bootlin.com, 
 thomas.petazzoni@bootlin.com, arthurgrillo@riseup.net, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3400;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Xns/Gz4cS6roVFRkXs17QTWAYlUCbS3FxOUHWAk8B1A=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBl8d3mSbDcU4FFt+Yymro+Je+tAjlrgNkrSTxyV0uW
 ej8/cIiJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZfHd5gAKCRAgrS7GWxAs4qmdD/
 0RLKRwsyr5M1oB7LQxvqiVSDVnOGL0iSzyOlZd82st74/2k5KLOiU6Ml0VoS4UBq04S+zOeXZb/3ha
 jrfeL1hv4nzMctMes2qVT/8+SjRb4sBHjJIlM2gMLDVQ69pi54QBTG1IPvfyORiy7ZTlJGLFW8O8kN
 v4E+YlhL1FY0kXo/1iA/66Kkj48wfSHckhJ4QGq4fqQg1p0fB2bsqHkA5iL56vxpQPZZaVHisUHgKO
 O1yxMZ6i4k2zJhPBluWJQf9LpyYz3dDs6/xYoxoP8tTd2nOT3DBQwPKXHOq/XBDQJznmbBN2CNw6Y4
 qnIcATkZpwiJgA2YY/Iwsegdw9NtwD1QcIKHXnI38DnB/KIx6KLNbZonVvOGD3s1mBVHOVxenNOJq7
 fQ6z83eu0A/GVHtdkCOKSjMfoMGfrmlwpUyR2CueUSUCq11yNVYk0H3ZGtrpUpF8IxuZEvBHLZoQF6
 u2Y0rHBj6FRugL1OscNEWbLfU+8NJv1lcaEGpyAOCI9+UvwXzjQVtzc3gYd17AnUFUPtqojaj+nFmn
 4Siws/9wfOrJEiHt261MvxH6Uzsb7Q+30THGpAG/2+8VBLKBzY1MMRzQ0z9SGZR9Bxf2Vrg86auk+1
 z/kG4Fp/AjyMiQRa87HOfBFaTDwTWDzYp544wnIhvLv3p4Qok2Z0Jd+TEW/A==
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

Members of this struct are useful to configure tests when formats are discovered at runtime.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt_fb.c | 15 ++-------------
 lib/igt_fb.h | 29 +++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+), 13 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index cc70cb91cef9..6cd299374d31 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -103,18 +103,7 @@
 #endif
 
 /* drm fourcc/cairo format maps */
-static const struct format_desc_struct {
-	const char *name;
-	uint32_t drm_id;
-	cairo_format_t cairo_id;
-	pixman_format_code_t pixman_id;
-	int depth;
-	int num_planes;
-	int plane_bpp[4];
-	uint8_t hsub;
-	uint8_t vsub;
-	bool convert;
-} format_desc[] = {
+static const struct format_desc_struct format_desc[] = {
 	{ .name = "ARGB1555", .depth = -1, .drm_id = DRM_FORMAT_ARGB1555,
 	  .cairo_id = CAIRO_FORMAT_ARGB32, .convert = true,
 	  .pixman_id = PIXMAN_a1r5g5b5,
@@ -371,7 +360,7 @@ static const struct format_desc_struct {
 #define for_each_format(f)	\
 	for (f = format_desc; f - format_desc < ARRAY_SIZE(format_desc); f++)
 
-static const struct format_desc_struct *lookup_drm_format(uint32_t drm_format)
+const struct format_desc_struct *lookup_drm_format(uint32_t drm_format)
 {
 	const struct format_desc_struct *format;
 
diff --git a/lib/igt_fb.h b/lib/igt_fb.h
index 834aaef54dea..28c18b355d94 100644
--- a/lib/igt_fb.h
+++ b/lib/igt_fb.h
@@ -30,6 +30,7 @@
 #define __IGT_FB_H__
 
 #include <cairo.h>
+#include <pixman.h>
 #include <stddef.h>
 #include <stdbool.h>
 #include <stdint.h>
@@ -123,6 +124,32 @@ enum igt_text_align {
 	align_hcenter	= 0x08,
 };
 
+/**
+ * struct format_desc_struct - Description of a format in igt
+ *
+ * @name: Name of a format, used for lookup and printing
+ * @drm_id: Id of this format in DRM.
+ * @cairo_id: Id of the format used by IGT for software rendering. It can be different from @drm_id, the colors will be converted when writing to the DRM framebuffer.
+ * @pixman_id: When set, the conversion from @cairo_id to @drm_id will be done with pixman and this format. It should correspond to @drm_id.
+ * @depth: Number of bits used to represent a pixel
+ * @num_planes: Number of planes in this format
+ * @plane_bpp: Number of bit per pixels, per plane
+ * @hsub, @vsub: Subsampling of this format
+ * @convert: When set, the format must be converted using either pixman or a custom conversion function before writing to the DRM framebuffer.
+ */
+struct format_desc_struct {
+	const char *name;
+	uint32_t drm_id;
+	cairo_format_t cairo_id;
+	pixman_format_code_t pixman_id;
+	int depth;
+	int num_planes;
+	int plane_bpp[4];
+	uint8_t hsub;
+	uint8_t vsub;
+	bool convert;
+};
+
 void igt_get_fb_tile_size(int fd, uint64_t modifier, int fb_bpp,
 			  unsigned *width_ret, unsigned *height_ret);
 void igt_calc_fb_size(int fd, int width, int height, uint32_t format, uint64_t modifier,
@@ -215,6 +242,8 @@ const char *igt_format_str(uint32_t drm_format);
 bool igt_fb_supported_format(uint32_t drm_format);
 bool igt_format_is_yuv(uint32_t drm_format);
 bool igt_format_is_yuv_semiplanar(uint32_t format);
+const struct format_desc_struct *lookup_drm_format(uint32_t drm_format);
+
 
 uint32_t igt_drm_format_str_to_format(const char *drm_format);
 

-- 
2.43.0

