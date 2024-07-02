Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C721AC30658
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jul 2024 23:29:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A08710E6FA;
	Tue,  2 Jul 2024 23:29:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j09eDaAb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E45210E6F8
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jul 2024 23:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719962968; x=1751498968;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=r2TIfnDloMBglGJJSXybpKaFwueO3+MzPQLJ//gt7hM=;
 b=j09eDaAbqUrQcNm0D7+Nl60MvpasmRPJwN/ziN3hWlFhINAjvwaGFWFo
 AqgAwRxFjqFRZ7ocbkKXUX53lD9+B+XtqxrN/W3AuHg7Zlaz0LjGtowYv
 Io8eGFoSqezcBiK0xjE6uAhnX2F9adRbjrvVdNzkoCWzBZQYGdK9xmKGK
 7VSG5YMoqf59RAkTpiz0fDtcXTkk+Qr2Ud4pyBmJ67Na7ybvzGuulZamd
 ppd5QgNRbiY3wyocUAY0NrfG8At5tPvMnujxz1sRsJLP1sZjsPhKM3Ruj
 79k0Ie2DNMVRqg3LlEHdplromAd6yXOsfQuxB+7UuYmIUK7nQytzZ0Fld A==;
X-CSE-ConnectionGUID: IXU/LHGPQiS3alCylkyakQ==
X-CSE-MsgGUID: rQZ+imDIThyxnKsDiqMuAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="28559655"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="28559655"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 16:29:27 -0700
X-CSE-ConnectionGUID: 8i0QGb8pQmqXOJixuNhu9g==
X-CSE-MsgGUID: LQPOntC6QDesHCaUPwS3gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="46043900"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Jul 2024 16:29:25 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 03 Jul 2024 02:29:24 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 24/37] lib/igt_fb: Fix blitter compression format
 handling
Date: Wed,  3 Jul 2024 02:28:04 +0300
Message-ID: <20240702232817.31147-25-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
References: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
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

For some reason blt_compression_format() sets up both the
source and destination with the same compression format.
This doesn't make sense to me as one or the other could
at least be uncompressed. Decouple the src vs. dst
compression formats so that they can be set independently.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_fb.c | 33 ++++++++++-----------------------
 1 file changed, 10 insertions(+), 23 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 64be4bffdea8..3b2077910349 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2870,12 +2870,6 @@ static enum blt_color_depth blt_get_bpp(const struct igt_fb *fb,
 	}
 }
 
-#define BLT_TARGET_RC(x) (x.compression == COMPRESSION_ENABLED && \
-			  x.compression_type == COMPRESSION_TYPE_3D)
-
-#define BLT_TARGET_MC(x) (x.compression == COMPRESSION_ENABLED && \
-			  x.compression_type == COMPRESSION_TYPE_MEDIA)
-
 const struct {
 	uint32_t format;
 	enum blt_compression_type type;
@@ -2903,25 +2897,14 @@ static uint32_t get_compression_return_value(uint32_t format,
 	return 0; // This line is to avoid compilation warnings, it will not be reached.
 }
 
-static uint32_t blt_compression_format(struct blt_copy_data *blt,
+static uint32_t blt_compression_format(const struct blt_copy_object *obj,
 				       const struct igt_fb *fb)
 {
-	if (blt->src.compression == COMPRESSION_DISABLED &&
-	    blt->dst.compression == COMPRESSION_DISABLED)
+	if (obj->compression == COMPRESSION_DISABLED)
 		return 0;
 
-	if (BLT_TARGET_RC(blt->src) || BLT_TARGET_RC(blt->dst))
-		return get_compression_return_value(igt_reduce_format(fb->drm_format),
-						    COMPRESSION_TYPE_3D);
-
-	if (BLT_TARGET_MC(blt->src))
-		return get_compression_return_value(igt_reduce_format(fb->drm_format),
-						    COMPRESSION_TYPE_MEDIA);
-
-	if (BLT_TARGET_MC(blt->dst))
-		igt_assert_f(0, "Destination compression not supported on mc ccs\n");
-
-	igt_assert_f(0, "unknown compression\n");
+	return get_compression_return_value(igt_reduce_format(fb->drm_format),
+					    obj->compression_type);
 }
 
 static void setup_context_and_memory_region(const struct igt_fb *fb, uint32_t *ctx,
@@ -2996,6 +2979,10 @@ static void do_block_copy(const struct igt_fb *src_fb,
 
 	igt_assert(src && dst);
 
+	igt_assert_f(blt.dst.compression == COMPRESSION_DISABLED ||
+		     blt.dst.compression_type !=  COMPRESSION_TYPE_MEDIA,
+		     "Destination compression not supported on mc ccs\n");
+
 	blt_copy_init(src_fb->fd, &blt);
 	blt.color_depth = blt_get_bpp(src_fb, i);
 	blt_set_copy_object(&blt.src, src);
@@ -3003,12 +2990,12 @@ static void do_block_copy(const struct igt_fb *src_fb,
 
 	if (blt_uses_extended_block_copy(src_fb->fd)) {
 		blt_set_object_ext(&ext.src,
-				   blt_compression_format(&blt, src_fb),
+				   blt_compression_format(&blt.src, src_fb),
 				   src_fb->plane_width[i], src_fb->plane_height[i],
 				   SURFACE_TYPE_2D);
 
 		blt_set_object_ext(&ext.dst,
-				   blt_compression_format(&blt, dst_fb),
+				   blt_compression_format(&blt.dst, dst_fb),
 				   dst_fb->plane_width[i], dst_fb->plane_height[i],
 				   SURFACE_TYPE_2D);
 		pext = &ext;
-- 
2.44.2

