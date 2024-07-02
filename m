Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B8BC3065C
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jul 2024 23:29:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 453D710E70A;
	Tue,  2 Jul 2024 23:29:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FnKNvgB4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADB2F10E704
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jul 2024 23:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719962954; x=1751498954;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=4wOEdwcfrwrExJMPU5rkZ6rqdJKtAXvJTDlltIZixLM=;
 b=FnKNvgB4asJZEmlkBc1mukl3zHKguDz0MGUXkUyZoJSMhFGyCkOvTb40
 BBXHoMmJpRApSOLfnKIHubDOKJIWi9JH2CnNiM3M0W2sjT/+0HRptMXnM
 a6QuhJqSPcGLR4wcT6f8ZUMsf0lbtH57Vk3TUk/aVzN2QEfOqIFz41Y9g
 Ph2s1CjpRbGSUPirJdrtmgB/QeIe2lULSMZZGuRvnKrcVfSZcdbtwQjWw
 Ct3xXI3gy/iTRfF/PNT1yaVVmWUh/UG55WDaZ5vFeCMVsWBuqwORruyDB
 Bm4aYYEorlxzcnMBXMv1/d7exoUDWj5wV9rn+Br5/dbxdwZ2q+VXjebDQ A==;
X-CSE-ConnectionGUID: QUwYJgp7S9+IHEYC2snQ8w==
X-CSE-MsgGUID: src6X3RLTUmeW8PHBOlK+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="28559605"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="28559605"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 16:29:14 -0700
X-CSE-ConnectionGUID: LsMw15NES/usJjXYwaM5mQ==
X-CSE-MsgGUID: KGM0jbtAQlqGHN97Uy5sEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="46043866"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Jul 2024 16:29:11 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 03 Jul 2024 02:29:10 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 19/37] lib/igt_fb: Expose
 igt_fb_is_gen12_mc_ccs_modifier()
Date: Wed,  3 Jul 2024 02:27:59 +0300
Message-ID: <20240702232817.31147-20-ville.syrjala@linux.intel.com>
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

I'm going to need is_gen12_mc_ccs_modifier() outside of
igt_fb.c. Rename it to igt_fb_is_gen12_mc_ccs_modifier()
and expose it to everyone.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_fb.c | 12 ++++++------
 lib/igt_fb.h |  1 +
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index b95dc3278f23..4ef1945e4333 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -587,7 +587,7 @@ void igt_get_fb_tile_size(int fd, uint64_t modifier, int fb_bpp,
 	}
 }
 
-static bool is_gen12_mc_ccs_modifier(uint64_t modifier)
+bool igt_fb_is_gen12_mc_ccs_modifier(uint64_t modifier)
 {
 	return modifier == I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS ||
 		modifier == I915_FORMAT_MOD_4_TILED_DG2_MC_CCS ||
@@ -603,7 +603,7 @@ bool igt_fb_is_gen12_rc_ccs_cc_modifier(uint64_t modifier)
 
 static bool is_gen12_ccs_modifier(uint64_t modifier)
 {
-	return is_gen12_mc_ccs_modifier(modifier) ||
+	return igt_fb_is_gen12_mc_ccs_modifier(modifier) ||
 		igt_fb_is_gen12_rc_ccs_cc_modifier(modifier) ||
 		modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS ||
 		modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS ||
@@ -2499,7 +2499,7 @@ static bool ccs_needs_enginecopy(const struct igt_fb *fb)
 	if (igt_fb_is_gen12_rc_ccs_cc_modifier(fb->modifier))
 		return true;
 
-	if (is_gen12_mc_ccs_modifier(fb->modifier))
+	if (igt_fb_is_gen12_mc_ccs_modifier(fb->modifier))
 		return true;
 
 	if (igt_fb_is_ccs_modifier(fb->modifier) &&
@@ -2631,7 +2631,7 @@ igt_fb_create_intel_buf(int fd, struct buf_ops *bops,
 		} else
 			igt_assert_eq(fb->strides[1] & 127, 0);
 
-		if (is_gen12_mc_ccs_modifier(fb->modifier))
+		if (igt_fb_is_gen12_mc_ccs_modifier(fb->modifier))
 			compression = I915_COMPRESSION_MEDIA;
 		else
 			compression = I915_COMPRESSION_RENDER;
@@ -2725,7 +2725,7 @@ static bool use_vebox_copy(const struct igt_fb *src_fb,
 			   const struct igt_fb *dst_fb)
 {
 
-	return is_gen12_mc_ccs_modifier(dst_fb->modifier) ||
+	return igt_fb_is_gen12_mc_ccs_modifier(dst_fb->modifier) ||
 	       igt_format_is_yuv(src_fb->drm_format) ||
 	       igt_format_is_yuv(dst_fb->drm_format);
 }
@@ -2800,7 +2800,7 @@ static struct blt_copy_object *allocate_and_initialize_blt(const struct igt_fb *
 		       intel_get_pat_idx_uc(fb->fd),
 		       blt_tile,
 		       igt_fb_is_ccs_modifier(fb->modifier) ? COMPRESSION_ENABLED : COMPRESSION_DISABLED,
-		       is_gen12_mc_ccs_modifier(fb->modifier) ? COMPRESSION_TYPE_MEDIA : COMPRESSION_TYPE_3D);
+		       igt_fb_is_gen12_mc_ccs_modifier(fb->modifier) ? COMPRESSION_TYPE_MEDIA : COMPRESSION_TYPE_3D);
 
 	blt_set_geom(blt, stride, 0, 0, fb->width, fb->plane_height[plane], 0, 0);
 	blt->plane_offset = fb->offsets[plane];
diff --git a/lib/igt_fb.h b/lib/igt_fb.h
index 12c9574827f2..eb707cc34560 100644
--- a/lib/igt_fb.h
+++ b/lib/igt_fb.h
@@ -183,6 +183,7 @@ uint64_t igt_fb_tiling_to_mod(uint64_t tiling);
 
 bool igt_fb_is_ccs_modifier(uint64_t modifier);
 bool igt_fb_is_gen12_rc_ccs_cc_modifier(uint64_t modifier);
+bool igt_fb_is_gen12_mc_ccs_modifier(uint64_t modifier);
 bool igt_fb_is_ccs_plane(const struct igt_fb *fb, int plane);
 bool igt_fb_is_gen12_ccs_cc_plane(const struct igt_fb *fb, int plane);
 int igt_fb_ccs_to_main_plane(const struct igt_fb *fb, int ccs_plane);
-- 
2.44.2

