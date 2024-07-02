Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E7B5C30658
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jul 2024 23:28:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2357710E6F9;
	Tue,  2 Jul 2024 23:28:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jTCBwiET";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9009610E701
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jul 2024 23:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719962927; x=1751498927;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=XF12pVhpbVdX3479/ysPD8Fgpuw49o4OOInoOXthTdQ=;
 b=jTCBwiET/hUMw5sE9L9KG6J+AHopGwIsRUm2lHANmS1d09+5EQ9n0/FL
 OMZRiaq9icEiGUXDprLikjoAlVnQnzlMEjJRA70/Q320sIKZhMwbJQhqm
 IJ9XXnjiYNFbggUTBNDM/5BtTfKpqa17gzOB3OgYB+ixow/UtnfMkGAVZ
 sWLYnpJ+fXvdbhTF5I+H2J+gCn0BtnSx5zYAGu2uzvCSfislTl6Q4QQ1x
 c/hSK9Nf4c1PWNJn30IbtZXkQ47S5E+F8Y8yC+uspWwOXHg345H0064fb
 /azsa0te7P/W18a7WffYztDrpuk1CGeKtF3neANzOKp3zCBkSk4eoqsFN g==;
X-CSE-ConnectionGUID: 7JOTS14nQyqZVAWx397C4Q==
X-CSE-MsgGUID: y/bxdpA3SV6tgqZUKW6Ogw==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="28559531"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="28559531"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 16:28:47 -0700
X-CSE-ConnectionGUID: 3tzCiE18Taq5q5VHuo5j6g==
X-CSE-MsgGUID: eJOFS2mJQ8qKAfw1Wq5POw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="46043783"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Jul 2024 16:28:44 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 03 Jul 2024 02:28:43 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 09/37] lib/rendercopy: Extract gen4_surface_format()
Date: Wed,  3 Jul 2024 02:27:49 +0300
Message-ID: <20240702232817.31147-10-ville.syrjala@linux.intel.com>
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

All the rendercopy implementation can use the same code to
determine the surface format. Extract said code to a helper.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/rendercopy_gen4.c | 10 ++--------
 lib/rendercopy_gen6.c | 10 +---------
 lib/rendercopy_gen7.c | 12 ++----------
 lib/rendercopy_gen8.c |  8 +-------
 lib/rendercopy_gen9.c |  8 +-------
 lib/surfaceformat.h   | 16 ++++++++++++++++
 6 files changed, 23 insertions(+), 41 deletions(-)

diff --git a/lib/rendercopy_gen4.c b/lib/rendercopy_gen4.c
index 8582e0efb886..8289abbabe0f 100644
--- a/lib/rendercopy_gen4.c
+++ b/lib/rendercopy_gen4.c
@@ -116,6 +116,7 @@ static int gen4_max_wm_threads(uint32_t devid)
 	return IS_GEN5(devid) ? 72 : IS_G4X(devid) ? 50 : 32;
 }
 
+
 static uint32_t
 gen4_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst)
 {
@@ -137,14 +138,7 @@ gen4_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst)
 	ss = intel_bb_ptr_align(ibb, 32);
 
 	ss->ss0.surface_type = SURFACE_2D;
-	switch (buf->bpp) {
-		case 8: ss->ss0.surface_format = SURFACEFORMAT_R8_UNORM; break;
-		case 16: ss->ss0.surface_format = SURFACEFORMAT_R8G8_UNORM; break;
-		case 32: ss->ss0.surface_format = SURFACEFORMAT_B8G8R8A8_UNORM; break;
-		case 64: ss->ss0.surface_format = SURFACEFORMAT_R16G16B16A16_FLOAT; break;
-		default: igt_assert(0);
-	}
-
+	ss->ss0.surface_format = gen4_surface_format(buf->bpp);
 	ss->ss0.data_return_format = SURFACERETURNFORMAT_FLOAT32;
 	ss->ss0.color_blend = 1;
 
diff --git a/lib/rendercopy_gen6.c b/lib/rendercopy_gen6.c
index ec197661702f..0c71bd9cbf19 100644
--- a/lib/rendercopy_gen6.c
+++ b/lib/rendercopy_gen6.c
@@ -79,15 +79,7 @@ gen6_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst)
 
 	ss = intel_bb_ptr_align(ibb, 32);
 	ss->ss0.surface_type = SURFACE_2D;
-
-	switch (buf->bpp) {
-		case 8: ss->ss0.surface_format = SURFACEFORMAT_R8_UNORM; break;
-		case 16: ss->ss0.surface_format = SURFACEFORMAT_R8G8_UNORM; break;
-		case 32: ss->ss0.surface_format = SURFACEFORMAT_B8G8R8A8_UNORM; break;
-		case 64: ss->ss0.surface_format = SURFACEFORMAT_R16G16B16A16_FLOAT; break;
-		default: igt_assert(0);
-	}
-
+	ss->ss0.surface_format = gen4_surface_format(buf->bpp);
 	ss->ss0.data_return_format = SURFACERETURNFORMAT_FLOAT32;
 	ss->ss0.color_blend = 1;
 
diff --git a/lib/rendercopy_gen7.c b/lib/rendercopy_gen7.c
index e3657b5d1035..8fcbbc21cdd8 100644
--- a/lib/rendercopy_gen7.c
+++ b/lib/rendercopy_gen7.c
@@ -57,7 +57,7 @@ gen7_bind_buf(struct intel_bb *ibb,
 	      const struct intel_buf *buf,
 	      int is_dst)
 {
-	uint32_t format, *ss;
+	uint32_t *ss;
 	uint32_t write_domain, read_domain;
 	uint64_t address;
 
@@ -65,14 +65,6 @@ gen7_bind_buf(struct intel_bb *ibb,
 	igt_assert_lte(intel_buf_width(buf), 16384);
 	igt_assert_lte(intel_buf_height(buf), 16384);
 
-	switch (buf->bpp) {
-		case 8: format = SURFACEFORMAT_R8_UNORM; break;
-		case 16: format = SURFACEFORMAT_R8G8_UNORM; break;
-		case 32: format = SURFACEFORMAT_B8G8R8A8_UNORM; break;
-		case 64: format = SURFACEFORMAT_R16G16B16A16_FLOAT; break;
-		default: igt_assert(0);
-	}
-
 	if (is_dst) {
 		write_domain = read_domain = I915_GEM_DOMAIN_RENDER;
 	} else {
@@ -84,7 +76,7 @@ gen7_bind_buf(struct intel_bb *ibb,
 
 	ss[0] = (SURFACE_2D << GEN7_SURFACE_TYPE_SHIFT |
 		 gen7_tiling_bits(buf->tiling) |
-		format << GEN7_SURFACE_FORMAT_SHIFT);
+		 gen4_surface_format(buf->bpp) << GEN7_SURFACE_FORMAT_SHIFT);
 
 	address = intel_bb_offset_reloc_with_delta(ibb, buf->handle,
 						   read_domain, write_domain,
diff --git a/lib/rendercopy_gen8.c b/lib/rendercopy_gen8.c
index 23bea56ad1ba..28c703fca393 100644
--- a/lib/rendercopy_gen8.c
+++ b/lib/rendercopy_gen8.c
@@ -88,13 +88,7 @@ gen8_bind_buf(struct intel_bb *ibb,
 	ss = intel_bb_ptr_align(ibb, 64);
 
 	ss->ss0.surface_type = SURFACE_2D;
-	switch (buf->bpp) {
-		case 8: ss->ss0.surface_format = SURFACEFORMAT_R8_UNORM; break;
-		case 16: ss->ss0.surface_format = SURFACEFORMAT_R8G8_UNORM; break;
-		case 32: ss->ss0.surface_format = SURFACEFORMAT_B8G8R8A8_UNORM; break;
-		case 64: ss->ss0.surface_format = SURFACEFORMAT_R16G16B16A16_FLOAT; break;
-		default: igt_assert(0);
-	}
+	ss->ss0.surface_format = gen4_surface_format(buf->bpp);
 	ss->ss0.render_cache_read_write = 1;
 	ss->ss0.vertical_alignment = 1; /* align 4 */
 	ss->ss0.horizontal_alignment = 1; /* align 4 */
diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index 42a227916f15..11f456a70d2f 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -168,13 +168,7 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
 	ss = intel_bb_ptr_align(ibb, 64);
 
 	ss->ss0.surface_type = SURFACE_2D;
-	switch (buf->bpp) {
-		case 8: ss->ss0.surface_format = SURFACEFORMAT_R8_UNORM; break;
-		case 16: ss->ss0.surface_format = SURFACEFORMAT_R8G8_UNORM; break;
-		case 32: ss->ss0.surface_format = SURFACEFORMAT_B8G8R8A8_UNORM; break;
-		case 64: ss->ss0.surface_format = SURFACEFORMAT_R16G16B16A16_FLOAT; break;
-		default: igt_assert(0);
-	}
+	ss->ss0.surface_format = gen4_surface_format(buf->bpp);
 	ss->ss0.vertical_alignment = 1; /* align 4 */
 	ss->ss0.horizontal_alignment = 1; /* align 4 or HALIGN_32 on display ver >= 13*/
 
diff --git a/lib/surfaceformat.h b/lib/surfaceformat.h
index 32ea373262ca..58ef41e6d3cd 100644
--- a/lib/surfaceformat.h
+++ b/lib/surfaceformat.h
@@ -186,4 +186,20 @@
 #define SURFACE_MIPMAPLAYOUT_BELOW	0
 #define SURFACE_MIPMAPLAYOUT_RIGHT	1
 
+static inline uint32_t gen4_surface_format(int bpp)
+{
+	switch (bpp) {
+	case 8:
+		return SURFACEFORMAT_R8_UNORM;
+	case 16:
+		return SURFACEFORMAT_R8G8_UNORM;
+	case 32:
+		return SURFACEFORMAT_B8G8R8A8_UNORM;
+	case 64:
+		return SURFACEFORMAT_R16G16B16A16_FLOAT;
+	default:
+		return 0;
+	}
+}
+
 #endif
-- 
2.44.2

