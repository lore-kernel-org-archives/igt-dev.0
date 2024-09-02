Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E1B9CD13CF
	for <igt-dev@archiver.kernel.org>; Mon,  2 Sep 2024 14:38:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F90010E334;
	Mon,  2 Sep 2024 14:38:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wl/hlQAL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17CE010E334
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Sep 2024 14:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725287919; x=1756823919;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=87yZkdGF2XtYhS0FxkEUxPDyEXhq66ui0oUCc1hzjTg=;
 b=Wl/hlQALpXUCqphmQBNLv9JIK+PVchueHaaOdVRzcKK4qzHR5oIsuMWg
 hGU8s55KlpVsSyMqdWCVB5LmxxeFKoV/KZhX0c9eY+9U1QVSd3nv837uu
 gRra51uxv9hCfFTyRT2STf050ivFLOxJ5Jwkgdtuj5L7KcXDDU2ZBO93b
 JRcsJXpadlZZvZRYLIJcWzNIkETyV2qnVQh9IUli2MTXOr9XnWgfhMLBQ
 1ljDkPkNS3HtNGHgJDJi9V3ABl8aVxpjZCkGQSRmMaFI2sJ10L6d8vQlI
 986oZATPw513rUOV7F7ibldi/DRh9LL0DXK6V5dAV3zXC3A6+8Bw6ec3Y A==;
X-CSE-ConnectionGUID: Oy+UNs7pQRq2xSWB2EM+0Q==
X-CSE-MsgGUID: rgEsyZ4ZQcyPqHkGgYhGOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="24009480"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="24009480"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 07:38:39 -0700
X-CSE-ConnectionGUID: 7B0dPKU2SSqSt0sheecRwA==
X-CSE-MsgGUID: 61B0ILNGQyCQ4vB/KuJuMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="64639433"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Sep 2024 07:38:36 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 02 Sep 2024 17:38:35 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 13/23] lib/igt_fb: Expose igt_fb_is_ccs_modifier()
Date: Mon,  2 Sep 2024 17:37:48 +0300
Message-ID: <20240902143758.21036-14-ville.syrjala@linux.intel.com>
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

I'm going to need is_ccs_modifier() outside of igt_fb.c.
Rename it to igt_fb_is_ccs_modifier() and expose it to everyone.

v2: Add docs (J-P)

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_fb.c | 24 ++++++++++++++++--------
 lib/igt_fb.h |  1 +
 2 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 776c826c0d55..0cf8691d1d7d 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -612,7 +612,13 @@ static bool is_gen12_ccs_modifier(uint64_t modifier)
 		modifier == I915_FORMAT_MOD_4_TILED_MTL_RC_CCS;
 }
 
-static bool is_ccs_modifier(uint64_t modifier)
+/**
+ * igt_fb_is_ccs_modifier:
+ * @modifier: drm modifier
+ *
+ * This function returns true if @modifier supports compression.
+ */
+bool igt_fb_is_ccs_modifier(uint64_t modifier)
 {
 	return is_gen12_ccs_modifier(modifier) ||
 		modifier == I915_FORMAT_MOD_Y_TILED_CCS ||
@@ -621,7 +627,8 @@ static bool is_ccs_modifier(uint64_t modifier)
 
 static bool is_ccs_plane(const struct igt_fb *fb, int plane)
 {
-	if (!is_ccs_modifier(fb->modifier) || HAS_FLATCCS(intel_get_drm_devid(fb->fd)))
+	if (!igt_fb_is_ccs_modifier(fb->modifier) ||
+	    HAS_FLATCCS(intel_get_drm_devid(fb->fd)))
 		return false;
 
 	return plane >= fb->num_planes / 2;
@@ -731,7 +738,8 @@ static int fb_num_planes(const struct igt_fb *fb)
 {
 	int num_planes = lookup_drm_format(fb->drm_format)->num_planes;
 
-	if (is_ccs_modifier(fb->modifier) && !HAS_FLATCCS(intel_get_drm_devid(fb->fd)))
+	if (igt_fb_is_ccs_modifier(fb->modifier) &&
+	    !HAS_FLATCCS(intel_get_drm_devid(fb->fd)))
 		num_planes *= 2;
 
 	if (fb->modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC ||
@@ -2489,7 +2497,7 @@ static enum blt_tiling_type fb_tile_to_blt_tile(uint64_t tile)
 static bool fast_blit_ok(const struct igt_fb *fb)
 {
 	return blt_has_fast_copy(fb->fd) &&
-		!is_ccs_modifier(fb->modifier) &&
+		!igt_fb_is_ccs_modifier(fb->modifier) &&
 		blt_fast_copy_supports_tiling(fb->fd,
 					      fb_tile_to_blt_tile(fb->modifier));
 }
@@ -2509,7 +2517,7 @@ static bool ccs_needs_enginecopy(const struct igt_fb *fb)
 	if (is_gen12_mc_ccs_modifier(fb->modifier))
 		return true;
 
-	if (is_ccs_modifier(fb->modifier) &&
+	if (igt_fb_is_ccs_modifier(fb->modifier) &&
 	    !HAS_FLATCCS(intel_get_drm_devid(fb->fd)))
 		return true;
 
@@ -2631,7 +2639,7 @@ igt_fb_create_intel_buf(int fd, struct buf_ops *bops,
 
 	igt_assert_eq(fb->offsets[0], 0);
 
-	if (is_ccs_modifier(fb->modifier)) {
+	if (igt_fb_is_ccs_modifier(fb->modifier)) {
 		igt_assert_eq(fb->strides[0] & 127, 0);
 
 		if (is_gen12_ccs_modifier(fb->modifier)) {
@@ -2675,7 +2683,7 @@ igt_fb_create_intel_buf(int fd, struct buf_ops *bops,
 	if (buf->format_is_yuv_semiplanar)
 		buf->yuv_semiplanar_bpp = yuv_semiplanar_bpp(fb->drm_format);
 
-	if (is_ccs_modifier(fb->modifier)) {
+	if (igt_fb_is_ccs_modifier(fb->modifier)) {
 		num_surfaces = fb->num_planes / (HAS_FLATCCS(intel_get_drm_devid(fb->fd)) ? 1 : 2);
 		for (i = 0; i < num_surfaces; i++)
 			init_buf_ccs(buf, i,
@@ -2808,7 +2816,7 @@ static struct blt_copy_object *allocate_and_initialize_blt(const struct igt_fb *
 		       intel_get_uc_mocs_index(fb->fd),
 		       intel_get_pat_idx_uc(fb->fd),
 		       blt_tile,
-		       is_ccs_modifier(fb->modifier) ? COMPRESSION_ENABLED : COMPRESSION_DISABLED,
+		       igt_fb_is_ccs_modifier(fb->modifier) ? COMPRESSION_ENABLED : COMPRESSION_DISABLED,
 		       is_gen12_mc_ccs_modifier(fb->modifier) ? COMPRESSION_TYPE_MEDIA : COMPRESSION_TYPE_3D);
 
 	blt_set_geom(blt, stride, 0, 0, fb->width, fb->plane_height[plane], 0, 0);
diff --git a/lib/igt_fb.h b/lib/igt_fb.h
index 2b5040ce3c6b..b1b40b858610 100644
--- a/lib/igt_fb.h
+++ b/lib/igt_fb.h
@@ -181,6 +181,7 @@ void igt_fb_calc_crc(struct igt_fb *fb, igt_crc_t *crc);
 uint64_t igt_fb_mod_to_tiling(uint64_t modifier);
 uint64_t igt_fb_tiling_to_mod(uint64_t tiling);
 
+bool igt_fb_is_ccs_modifier(uint64_t modifier);
 bool igt_fb_is_ccs_plane(const struct igt_fb *fb, int plane);
 bool igt_fb_is_gen12_ccs_cc_plane(const struct igt_fb *fb, int plane);
 int igt_fb_ccs_to_main_plane(const struct igt_fb *fb, int ccs_plane);
-- 
2.44.2

