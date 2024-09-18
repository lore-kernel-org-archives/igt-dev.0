Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30812CCD1A0
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 12:05:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DED3D10E57C;
	Wed, 18 Sep 2024 12:05:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nl+cYaMR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75B2710E57C
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 12:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726661128; x=1758197128;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IZ86Ns2TtMVRZz3TNZ/RTf5OrsoTzvwUTKHQpBzRT9M=;
 b=Nl+cYaMR6hbSzAPtVNjFwVnRYU6Q8Y+LZ68FXo4QyMfHfmxF+jttuVue
 MQPdDmatL3a56XcZ8sVkxW0fg3hTnBY3au87iHknb0rO6WrgUJcQIZInG
 vQdhzwmj2Fv6dmqyFnIZLyMDrgu3JHx0wXRgo8Gs6ukt95GCsN4YdsyH9
 icNslMa0w9Qb1XczTEYCUlmJzB7aYFPDDrWsGbv5XPplf8QbT3R2cmGXj
 4p/kvk1rUfb7rkslk+Y7t6HK6mSpTDmZjsO+YZ96oE1aZiOWSUFKTIpsO
 VO+ukoJ7/KRNMyFHuh8I/AUcohyNL+v537gcpZI+svDV9RbS9PO5AMB91 g==;
X-CSE-ConnectionGUID: /okIuf4fQFetsWKmWgAb9Q==
X-CSE-MsgGUID: S3WBk8f5Q0eadRkWQLyrsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25687510"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="25687510"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 05:05:28 -0700
X-CSE-ConnectionGUID: eHzSr8QnTrOGq6siniPUTA==
X-CSE-MsgGUID: EOaQZ0YJQWKX91BPPYwWaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="69634441"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 18 Sep 2024 05:05:25 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 18 Sep 2024 15:05:24 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v2 02/18] lib/rendercopy: Add specific support for
 2:10:10:10 formats
Date: Wed, 18 Sep 2024 15:05:02 +0300
Message-ID: <20240918120518.30258-3-ville.syrjala@linux.intel.com>
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

Use B10G10R10A2_UNORM instead of B8G8R8A8_UNORM when dealing
with actual 10bpc pixel formats.

This is needed on tgl+ because the display hardware decompressor
expects some magic bit shuffling to have taken place. If the
compressor didn't do that we get garbage.

Also if the clear color is involved then the hardware needs
to know the actual pixel format in order to correctly generate
the native version of the clear color (which will be consumed
by the display hardware.

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
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
index b8b7e5ad7e2c..951ddb5fbdc5 100644
--- a/lib/rendercopy_gen4.c
+++ b/lib/rendercopy_gen4.c
@@ -137,7 +137,7 @@ gen4_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst)
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
index ab33b3f00bcf..9c68d3773b19 100644
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

