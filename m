Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EFA7C30658
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jul 2024 23:28:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E20810E702;
	Tue,  2 Jul 2024 23:28:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AEIypjwS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B6E10E704
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jul 2024 23:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719962932; x=1751498932;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=F+NHoxmZyBwoNk/OyPXa1U8Cxv9poN6PE8g3ifEXS6I=;
 b=AEIypjwSYfkiVc+cF2vmvEag4SbdeJXx6p73PJfCjc7XJ9xzsEwtblew
 8mjiaF0Dxr0QpEAGy/forb4g0UvIUrEen7cPEKkykJJSvP2HHfYh+CB/S
 t5pTa4IVCIj24jt4wEtYFHl+NPQ9SzGPxxns5DsGyc8wfzSZwkVSeXpId
 uLiytK3FXvPwVWp/lSaYLFL7c56t/YfwHAUpJ3U2YYuLR0RoSqVCcoBhD
 L9sz5BgeNl/iGhBE65rZgi3jRymbWWSqcy7bdM6vjwlk2LL3CtDs79JiW
 ITXCf9rZ0gO/pgVf0+26AhbBZ8YLeKhsrabUYnptU8+r0Kh8+2lEbSlr9 w==;
X-CSE-ConnectionGUID: v9SlclG5T/CNyrqD2cpkyA==
X-CSE-MsgGUID: /vSTC3cPQqC6FMZfeF4ILw==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="28559548"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="28559548"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 16:28:52 -0700
X-CSE-ConnectionGUID: ZwoAUidpROiNqlNy/TH3OQ==
X-CSE-MsgGUID: N+t6Gj+STH+tCZl6WVCzkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="46043795"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Jul 2024 16:28:50 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 03 Jul 2024 02:28:49 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 11/37] lib/rendercopy: Add specific support for
 2:10:10:10 formats
Date: Wed,  3 Jul 2024 02:27:51 +0300
Message-ID: <20240702232817.31147-12-ville.syrjala@linux.intel.com>
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

Use B10G10R10A2_UNORM instead of B8G8R8A8_UNORM when dealing
with actual 10bpc pixel formats.

This is needed on tgl+ because the display hardware decompressor
expects some magic bit shuffling to have taken place. If the
compressor didn't do that we get garbage.

Also if the clear color is involved then the hardware needs
to know the actual pixel format in order to correctly generate
the native version of the clear color (which will be consumed
by the display hardware.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/intel_bufops.h    | 2 +-
 lib/rendercopy_gen4.c | 2 +-
 lib/rendercopy_gen6.c | 2 +-
 lib/rendercopy_gen7.c | 2 +-
 lib/rendercopy_gen8.c | 2 +-
 lib/rendercopy_gen9.c | 2 +-
 lib/surfaceformat.h   | 8 ++++++--
 7 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/lib/intel_bufops.h b/lib/intel_bufops.h
index 06e72ba4ba93..d111346aaa86 100644
--- a/lib/intel_bufops.h
+++ b/lib/intel_bufops.h
@@ -21,7 +21,7 @@ struct intel_buf {
 	uint32_t width;
 	uint32_t height;
 	uint32_t tiling;
-	uint32_t bpp;
+	uint32_t bpp, depth;
 	uint32_t compression;
 	uint32_t swizzle_mode;
 	uint32_t yuv_semiplanar_bpp;
diff --git a/lib/rendercopy_gen4.c b/lib/rendercopy_gen4.c
index 8289abbabe0f..fa553765d475 100644
--- a/lib/rendercopy_gen4.c
+++ b/lib/rendercopy_gen4.c
@@ -138,7 +138,7 @@ gen4_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst)
 	ss = intel_bb_ptr_align(ibb, 32);
 
 	ss->ss0.surface_type = SURFACE_2D;
-	ss->ss0.surface_format = gen4_surface_format(buf->bpp);
+	ss->ss0.surface_format = gen4_surface_format(buf->bpp, buf->depth);
 	ss->ss0.data_return_format = SURFACERETURNFORMAT_FLOAT32;
 	ss->ss0.color_blend = 1;
 
diff --git a/lib/rendercopy_gen6.c b/lib/rendercopy_gen6.c
index 0c71bd9cbf19..233ec3bf6e85 100644
--- a/lib/rendercopy_gen6.c
+++ b/lib/rendercopy_gen6.c
@@ -79,7 +79,7 @@ gen6_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst)
 
 	ss = intel_bb_ptr_align(ibb, 32);
 	ss->ss0.surface_type = SURFACE_2D;
-	ss->ss0.surface_format = gen4_surface_format(buf->bpp);
+	ss->ss0.surface_format = gen4_surface_format(buf->bpp, buf->depth);
 	ss->ss0.data_return_format = SURFACERETURNFORMAT_FLOAT32;
 	ss->ss0.color_blend = 1;
 
diff --git a/lib/rendercopy_gen7.c b/lib/rendercopy_gen7.c
index 8fcbbc21cdd8..0cd165809b69 100644
--- a/lib/rendercopy_gen7.c
+++ b/lib/rendercopy_gen7.c
@@ -76,7 +76,7 @@ gen7_bind_buf(struct intel_bb *ibb,
 
 	ss[0] = (SURFACE_2D << GEN7_SURFACE_TYPE_SHIFT |
 		 gen7_tiling_bits(buf->tiling) |
-		 gen4_surface_format(buf->bpp) << GEN7_SURFACE_FORMAT_SHIFT);
+		 gen4_surface_format(buf->bpp, buf->depth) << GEN7_SURFACE_FORMAT_SHIFT);
 
 	address = intel_bb_offset_reloc_with_delta(ibb, buf->handle,
 						   read_domain, write_domain,
diff --git a/lib/rendercopy_gen8.c b/lib/rendercopy_gen8.c
index 28c703fca393..206af226a346 100644
--- a/lib/rendercopy_gen8.c
+++ b/lib/rendercopy_gen8.c
@@ -88,7 +88,7 @@ gen8_bind_buf(struct intel_bb *ibb,
 	ss = intel_bb_ptr_align(ibb, 64);
 
 	ss->ss0.surface_type = SURFACE_2D;
-	ss->ss0.surface_format = gen4_surface_format(buf->bpp);
+	ss->ss0.surface_format = gen4_surface_format(buf->bpp, buf->depth);
 	ss->ss0.render_cache_read_write = 1;
 	ss->ss0.vertical_alignment = 1; /* align 4 */
 	ss->ss0.horizontal_alignment = 1; /* align 4 */
diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index eafdf50581d3..4014100a23b5 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -190,7 +190,7 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
 	ss = intel_bb_ptr_align(ibb, 64);
 
 	ss->ss0.surface_type = SURFACE_2D;
-	ss->ss0.surface_format = gen4_surface_format(buf->bpp);
+	ss->ss0.surface_format = gen4_surface_format(buf->bpp, buf->depth);
 	ss->ss0.vertical_alignment = 1; /* align 4 */
 	ss->ss0.horizontal_alignment = 1; /* align 4 or HALIGN_32 on display ver >= 13*/
 
diff --git a/lib/surfaceformat.h b/lib/surfaceformat.h
index 58ef41e6d3cd..9090d7707647 100644
--- a/lib/surfaceformat.h
+++ b/lib/surfaceformat.h
@@ -186,7 +186,7 @@
 #define SURFACE_MIPMAPLAYOUT_BELOW	0
 #define SURFACE_MIPMAPLAYOUT_RIGHT	1
 
-static inline uint32_t gen4_surface_format(int bpp)
+static inline uint32_t gen4_surface_format(int bpp, int depth)
 {
 	switch (bpp) {
 	case 8:
@@ -194,7 +194,11 @@ static inline uint32_t gen4_surface_format(int bpp)
 	case 16:
 		return SURFACEFORMAT_R8G8_UNORM;
 	case 32:
-		return SURFACEFORMAT_B8G8R8A8_UNORM;
+		/* only needed for proper CCS handling */
+		if (depth == 30)
+			return SURFACEFORMAT_B10G10R10A2_UNORM;
+		else
+			return SURFACEFORMAT_B8G8R8A8_UNORM;
 	case 64:
 		return SURFACEFORMAT_R16G16B16A16_FLOAT;
 	default:
-- 
2.44.2

