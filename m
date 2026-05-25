Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 097F2CD5BB1
	for <igt-dev@archiver.kernel.org>; Mon, 25 May 2026 20:40:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B28D610E40F;
	Mon, 25 May 2026 20:40:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="q2ZqktyY";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C13E10E40B
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 20:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FMJGYwtzUFk+JYnVp3y+KADVPf0MVFRVv5D9wMWun8M=; b=q2ZqktyY/YtDlEdsXjXZfFkEuQ
 k5hrmY5r6oyw14vcJAevnUtiDwRn8c1b5QYbKVP40AJLZVVQ9K5KY7f5hYZJ+xfjYv4wWxt9yEZZk
 KEdG2GtyGCjdTkDAM6YPV2AVB1GTe3ef24rkHqOT3Hx2+knW/79sP9Z5L2ov0Yq2D5a5kYuEc3PgG
 LKAKo3PGeTQGW/nzGg+/gVvopKVzraLGiaNZ0CPCrA/PbXy65CjW+0epfJXfthkI5+nY/5G0YKXI5
 O5LjHngnYc5bYIMRioltHGuRL4r0nspFsp0VBQflqhd0hSqfkrgBiYPZqNFGnHOm5lwyVwT/0PMLA
 lJlikpZw==;
Received: from c-73-157-168-91.hsd1.or.comcast.net ([73.157.168.91]
 helo=localhost.localdomain) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wRc4o-0089fG-Pf
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 22:39:07 +0200
From: John Harrison <John.Harrison@Igalia.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 4/6] lib/igt_color,
 igt_fb: Add more BGR support to various helpers
Date: Mon, 25 May 2026 13:38:25 -0700
Message-ID: <20260525203827.3155622-5-John.Harrison@Igalia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260525203827.3155622-1-John.Harrison@Igalia.com>
References: <20260525203827.3155622-1-John.Harrison@Igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Intel devices only support BGR format for writeback. The kms_colorop
test uses writeback in its comparisons. So, to enable the kms_colorop
test on Intel platforms requires adding BGR support to the various
helpers used by the kms_colorop test.

Signed-off-by: John Harrison <John.Harrison@Igalia.com>
---
 lib/igt_color.c | 54 +++++++++++++++++++++++++++++++++++++++++++++----
 lib/igt_fb.c    |  5 +++--
 2 files changed, 53 insertions(+), 6 deletions(-)

diff --git a/lib/igt_color.c b/lib/igt_color.c
index 8c405275a..b0bbd8878 100644
--- a/lib/igt_color.c
+++ b/lib/igt_color.c
@@ -462,8 +462,30 @@ igt_color_fourcc_to_pixel(uint32_t raw_pixel, uint32_t drm_format, igt_pixel_t *
 		pixel->r /= (0x3ff);
 		pixel->g /= (0x3ff);
 		pixel->b /= (0x3ff);
+	} else if (drm_format == DRM_FORMAT_XBGR8888) {
+		raw_pixel &= 0x00ffffff;
+
+		pixel->b = (raw_pixel & 0x00ff0000) >> 16;
+		pixel->g = (raw_pixel & 0x0000ff00) >> 8;
+		pixel->r = (raw_pixel & 0x000000ff);
+
+		/* normalize for 8-bit */
+		pixel->b /= (0xff);
+		pixel->g /= (0xff);
+		pixel->r /= (0xff);
+	} else if (drm_format == DRM_FORMAT_XBGR2101010) {
+		raw_pixel &= 0x3fffffff;
+
+		pixel->b = (raw_pixel & 0x3ff00000) >> 20;
+		pixel->g = (raw_pixel & 0x000ffc00) >> 10;
+		pixel->r = (raw_pixel & 0x000003ff);
+
+		/* normalize for 10-bit */
+		pixel->b /= (0x3ff);
+		pixel->g /= (0x3ff);
+		pixel->r /= (0x3ff);
 	} else {
-		igt_skip("pixel format support not implemented");
+		igt_skip("pixel format support not implemented\n");
 	}
 }
 
@@ -499,8 +521,30 @@ igt_color_pixel_to_fourcc(uint32_t drm_format, igt_pixel_t *pixel)
 		raw_pixel |= (lround(pixel->r) & 0x3ff) << 20;
 		raw_pixel |= (lround(pixel->g) & 0x3ff) << 10;
 		raw_pixel |= (lround(pixel->b) & 0x3ff);
+	} else if (drm_format == DRM_FORMAT_XBGR8888) {
+		/* de-normalize back to 8-bit */
+		pixel->b *= (0xff);
+		pixel->g *= (0xff);
+		pixel->r *= (0xff);
+
+		/* re-pack pixel into FB*/
+		raw_pixel = 0x0;
+		raw_pixel |= ((uint8_t)(lround(pixel->b) & 0xff)) << 16;
+		raw_pixel |= ((uint8_t)(lround(pixel->g) & 0xff)) << 8;
+		raw_pixel |= ((uint8_t)(lround(pixel->r) & 0xff));
+	} else if (drm_format == DRM_FORMAT_XBGR2101010) {
+		/* de-normalize back to 10-bit */
+		pixel->b *= (0x3ff);
+		pixel->g *= (0x3ff);
+		pixel->r *= (0x3ff);
+
+		/* re-pack pixel into FB*/
+		raw_pixel = 0x0;
+		raw_pixel |= (lround(pixel->b) & 0x3ff) << 20;
+		raw_pixel |= (lround(pixel->g) & 0x3ff) << 10;
+		raw_pixel |= (lround(pixel->r) & 0x3ff);
 	} else {
-		igt_skip("pixel format support not implemented");
+		igt_skip("pixel format support not implemented\n");
 	}
 
 	return raw_pixel;
@@ -611,14 +655,16 @@ bool igt_cmp_fb_pixels(igt_fb_t *fb1, igt_fb_t *fb2, uint8_t up, uint8_t down)
 		uint16_t mask = 0xff;
 		uint16_t shift = 8;
 
-		if (fb1->drm_format == DRM_FORMAT_XRGB2101010) {
+		if (fb1->drm_format == DRM_FORMAT_XRGB2101010 ||
+		    fb1->drm_format == DRM_FORMAT_XBGR2101010) {
 			/* ignore alpha */
 			pixel1 = ptr1[i] & ~0xc0000000;
 			pixel2 = ptr2[i] & ~0xc0000000;
 
 			mask = 0x3ff;
 			shift = 10;
-		} else if (fb1->drm_format == DRM_FORMAT_XRGB8888) {
+		} else if (fb1->drm_format == DRM_FORMAT_XRGB8888 ||
+			   fb1->drm_format == DRM_FORMAT_XBGR8888) {
 			/* ignore alpha */
 			pixel1 = ptr1[i] & ~0xff000000;
 			pixel2 = ptr2[i] & ~0xff000000;
diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 104ad74db..55e2ad6ef 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -5102,7 +5102,7 @@ int igt_fb_get_fnv1a_crc(struct igt_fb *fb, igt_crc_t *crc)
 		return -EINVAL;
 
 	if (fb->drm_format != DRM_FORMAT_XRGB8888 && fb->drm_format != DRM_FORMAT_XRGB2101010 &&
-	    fb->drm_format != DRM_FORMAT_XBGR8888)
+	    fb->drm_format != DRM_FORMAT_XBGR8888 && fb->drm_format != DRM_FORMAT_XBGR2101010)
 		return -EINVAL;
 
 	ptr = igt_fb_map_buffer(fb->fd, fb);
@@ -5132,7 +5132,8 @@ int igt_fb_get_fnv1a_crc(struct igt_fb *fb, igt_crc_t *crc)
 			if (fb->drm_format == DRM_FORMAT_XRGB8888 ||
 			    fb->drm_format == DRM_FORMAT_XBGR8888)
 				pixel &= 0x00ffffff;
-			else if (fb->drm_format == DRM_FORMAT_XRGB2101010)
+			else if (fb->drm_format == DRM_FORMAT_XRGB2101010 ||
+				 fb->drm_format == DRM_FORMAT_XBGR2101010)
 				pixel &= 0x3fffffff;
 
 			hash ^= pixel;
-- 
2.43.0

