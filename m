Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B3B8CCD1A5
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 12:05:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E0A710E58E;
	Wed, 18 Sep 2024 12:05:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kYBfJWV6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5BCF10E58E
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 12:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726661145; x=1758197145;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E3SVful6qJ/cO18XtpVhyoK8pwH5UhqWi+D88ngbnM4=;
 b=kYBfJWV66wQQqsbkQVmyL6JZCXUd3E309wh/bl1tp8idsT/I6KiFDSuJ
 9WTq2VT7fbV8Buzy3IH/tbRcGdlqNXt7I9BK1r67BuVoox+mIyWA/36vi
 F7c/BUzBVsxxc8YO8cWEWLMTNJsW0cgID1MK6LSGTsjE6hxKHcGjaNngw
 OdoJBr21Wg1YitnP2DKMBC+d4614sIcSmA1rX2Rijw5a49zFJ6j9LqqbA
 90s2AU7X6gJG2S1dKXAI3DR6GcenIFE08e8oN3KyoE6XzRfPiNWxyXt0O
 fDb8i8nZFASdXv5/A6SJrMLi0ExeMrg8gX3FkhmG0EH+TEpodnDscYHCn w==;
X-CSE-ConnectionGUID: ikgV66H3Tsy0bXZrwZpYFA==
X-CSE-MsgGUID: Bt4hOcTfTdOqk4vDCfspeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25687531"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="25687531"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 05:05:45 -0700
X-CSE-ConnectionGUID: uL1HQcAiTFy//ZycaYSMfQ==
X-CSE-MsgGUID: jt3gS/POTmaMDZHNyi+0LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="69634449"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 18 Sep 2024 05:05:43 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 18 Sep 2024 15:05:41 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v2 08/18] lib/igt_fb: Try to fix block copy media
 compression handling
Date: Wed, 18 Sep 2024 15:05:08 +0300
Message-ID: <20240918120518.30258-9-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240918120518.30258-1-ville.syrjala@linux.intel.com>
References: <20240918120518.30258-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

The media compression format handling for the block
copy seems to be very broken.

Empirical findings from dg2:
- the compression format needs to be based on bspec's
  render compression format list even when doing media
  compression
- 0x8/B8G8G8A8 doesn't work correctly for XYUV8888 for
  some reason, but using 0x18/R8 does seem to work
- YUYV/etc. packed formats don't work any which way
- planar formats can be handled as R8/R8G8/etc.
- RGB+media compression is a lost cause (black turns white
  when you try it)

This is all based on very cursory testing, so no idea if any
of it is actually correct. Doesn't actually matter currently
as we take the enginecopy path for media compression always.

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_fb.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index e9cd575bf925..0a30148ef5df 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2908,23 +2908,29 @@ static enum blt_color_depth blt_get_bpp(const struct igt_fb *fb,
 
 const struct {
 	uint32_t format;
+	int color_plane;
 	enum blt_compression_type type;
 	uint32_t return_value;
 } compression_mappings[] = {
-	{ DRM_FORMAT_XRGB16161616F, COMPRESSION_TYPE_3D, 0x5 },
-	{ DRM_FORMAT_XRGB2101010, COMPRESSION_TYPE_3D, 0xc },
-	{ DRM_FORMAT_XRGB8888, COMPRESSION_TYPE_3D, 0x8 },
-	{ DRM_FORMAT_XRGB8888, COMPRESSION_TYPE_MEDIA, 8 },
-	{ DRM_FORMAT_XYUV8888, COMPRESSION_TYPE_MEDIA, 9 },
-	{ DRM_FORMAT_NV12, COMPRESSION_TYPE_MEDIA, 9 },
-	{ DRM_FORMAT_P010, COMPRESSION_TYPE_MEDIA, 8 },
+	{ DRM_FORMAT_XRGB16161616F, 0, COMPRESSION_TYPE_3D, 0x5 }, /* R16G16B16A16_FLOAT */
+	{ DRM_FORMAT_XRGB2101010, 0, COMPRESSION_TYPE_3D, 0xc }, /* B10G10R10A2_UNORM */
+	{ DRM_FORMAT_XRGB8888, 0, COMPRESSION_TYPE_3D, 0x8 }, /* B8G8R8A8_UNORM */
+
+	/* FIXME why doesn't 0x8/B8G8R8A8_UNORM work here? */
+	{ DRM_FORMAT_XYUV8888, 0, COMPRESSION_TYPE_MEDIA, 0x18 }, /* R8_UNORM */
+
+	{ DRM_FORMAT_NV12, 0, COMPRESSION_TYPE_MEDIA, 0x18 }, /* R8_UNORM */
+	{ DRM_FORMAT_NV12, 1, COMPRESSION_TYPE_MEDIA, 0xa },  /* R8G8_UNORM */
+	{ DRM_FORMAT_P010, 0, COMPRESSION_TYPE_MEDIA, 0x14 }, /* R16_UNORM */
+	{ DRM_FORMAT_P010, 1, COMPRESSION_TYPE_MEDIA, 0x6 },  /* R16G16_UNORM */
 };
 
-static uint32_t get_compression_return_value(uint32_t format,
+static uint32_t get_compression_return_value(uint32_t format, int color_plane,
 					     enum  blt_compression_type type)
 {
 	for (int i = 0; i < ARRAY_SIZE(compression_mappings); i++) {
 		if (compression_mappings[i].format == format &&
+		    compression_mappings[i].color_plane == color_plane &&
 		    compression_mappings[i].type == type) {
 			return compression_mappings[i].return_value;
 		}
@@ -2934,13 +2940,13 @@ static uint32_t get_compression_return_value(uint32_t format,
 }
 
 static uint32_t blt_compression_format(const struct blt_copy_object *obj,
-				       const struct igt_fb *fb)
+				       const struct igt_fb *fb, int color_plane)
 {
 	if (obj->compression == COMPRESSION_DISABLED)
 		return 0;
 
 	return get_compression_return_value(igt_reduce_format(fb->drm_format),
-					    obj->compression_type);
+					    color_plane, obj->compression_type);
 }
 
 static void setup_context_and_memory_region(const struct igt_fb *fb, uint32_t *ctx,
@@ -3026,12 +3032,12 @@ static void do_block_copy(const struct igt_fb *src_fb,
 
 	if (blt_uses_extended_block_copy(src_fb->fd)) {
 		blt_set_object_ext(&ext.src,
-				   blt_compression_format(&blt.src, src_fb),
+				   blt_compression_format(&blt.src, src_fb, i),
 				   src_fb->plane_width[i], src_fb->plane_height[i],
 				   SURFACE_TYPE_2D);
 
 		blt_set_object_ext(&ext.dst,
-				   blt_compression_format(&blt.dst, dst_fb),
+				   blt_compression_format(&blt.dst, dst_fb, i),
 				   dst_fb->plane_width[i], dst_fb->plane_height[i],
 				   SURFACE_TYPE_2D);
 		pext = &ext;
-- 
2.44.2

