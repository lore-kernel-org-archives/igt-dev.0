Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD12CA0ED3
	for <igt-dev@archiver.kernel.org>; Mon,  2 Sep 2024 14:38:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 661D110E33C;
	Mon,  2 Sep 2024 14:38:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BN831dE5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88CEE10E33B
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Sep 2024 14:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725287933; x=1756823933;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uFB531qEJwqi2r+peTHeHtWBZDcCT/z50u+UrqbovyA=;
 b=BN831dE528U7+n6++9yatQMtupY2J1hNfTA6YTX5OypPEK0HTelTxTVU
 RRkrLySKtNsORMa6iTW55Th1NzKpYekJ3TmnvJa1ntdZhiad7YkNg7iM/
 jxwJMsCEijKCAeL5IItQcZvkIKC8bDbp0itW/dWOWLW3jiTuK/a8MsZyG
 u7Hn3nYz1wLhnMt0/bPwlBY/iTwj9UlROX3ujt9eFu42OQOOIUWEGrgX5
 gpKfHhUFaJ4+atMGsz7UwSyn5l65yMN0984lJ2vByLXSLZf8DrV/Aeg2i
 Ns4ZQ0UgLDoIILHjun5ythbUk1B5dH4M019IOG5NadbmESmuEsGVL8Rfp Q==;
X-CSE-ConnectionGUID: sH28XS8sSFaAQz/etaRa7A==
X-CSE-MsgGUID: tzp08M//RcSSxTgsi1jt+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="24009518"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="24009518"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 07:38:53 -0700
X-CSE-ConnectionGUID: B6OGUGu0QXm9vvvxbyMS0g==
X-CSE-MsgGUID: z9IEl436TVG2knG5hIziuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="64639476"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Sep 2024 07:38:51 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 02 Sep 2024 17:38:50 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 18/23] lib/igt_fb: Fix blitter compression format
 handling
Date: Mon,  2 Sep 2024 17:37:53 +0300
Message-ID: <20240902143758.21036-19-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240902143758.21036-1-ville.syrjala@linux.intel.com>
References: <20240902143758.21036-1-ville.syrjala@linux.intel.com>
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

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_fb.c | 33 ++++++++++-----------------------
 1 file changed, 10 insertions(+), 23 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 2d53b317afc2..1ec16ab9d813 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2897,12 +2897,6 @@ static enum blt_color_depth blt_get_bpp(const struct igt_fb *fb,
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
@@ -2928,25 +2922,14 @@ static uint32_t get_compression_return_value(uint32_t format,
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
@@ -3021,6 +3004,10 @@ static void do_block_copy(const struct igt_fb *src_fb,
 
 	igt_assert(src && dst);
 
+	igt_assert_f(blt.dst.compression == COMPRESSION_DISABLED ||
+		     blt.dst.compression_type !=  COMPRESSION_TYPE_MEDIA,
+		     "Destination compression not supported on mc ccs\n");
+
 	blt_copy_init(src_fb->fd, &blt);
 	blt.color_depth = blt_get_bpp(src_fb, i);
 	blt_set_copy_object(&blt.src, src);
@@ -3028,12 +3015,12 @@ static void do_block_copy(const struct igt_fb *src_fb,
 
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

