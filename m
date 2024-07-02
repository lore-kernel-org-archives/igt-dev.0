Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF99C30658
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jul 2024 23:29:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32BE310E717;
	Tue,  2 Jul 2024 23:29:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dWMUIdaS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80FA010E717
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jul 2024 23:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719962995; x=1751498995;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Q4oW1lw53f+k6aqA1nrZmaNDEed2XT9TWSI474b7chU=;
 b=dWMUIdaSQyw3bLUDIazL96r89+4eKVU4knFLBaQu8Q9NDdbw0SKDdXMA
 VKWiKASyWhjulvbW9+9Ye6YszMWDqTukuKl2XMfnLXlX67g14BoGXoxG7
 FyZluFccCkCGJds3CgovFrcHiV890QqLRapjOwNRRaeTyGiHe2TrjCw7+
 DHTuB3D1Hy4AJuiTnKP0bH7UKhV9ADS18Kz63kwUqV/TpN7urrN6SemAF
 oRTG2xUs6IGPV/PFeMAcvEqNIbCnBYDBvQqbHd17bg0iX+m02yufsO4GQ
 DiUJhwqXw3aFptXmQ/xPBW49BlVFAXAW3EzqIfXEaR55NZEoMYyJGM27s w==;
X-CSE-ConnectionGUID: zCgCTS7eQp6HIVsN85FBHw==
X-CSE-MsgGUID: L/+6cPuPRuG53KQeoRz/uQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="28559704"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="28559704"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 16:29:55 -0700
X-CSE-ConnectionGUID: dsPJ6UVGRrWy58lUlj5Knw==
X-CSE-MsgGUID: R2h7J0UrQ3yqXIFb0ewSHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="46043933"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Jul 2024 16:29:52 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 03 Jul 2024 02:29:51 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 34/37] tests/kms_ccs: Correctly check clear color for
 fp16 formats
Date: Wed,  3 Jul 2024 02:28:14 +0300
Message-ID: <20240702232817.31147-35-ville.syrjala@linux.intel.com>
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

The hardware generated clear color will be in the native
pixel format. Generate the reference correctly for fp16
formats.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_ccs.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index 4c1c78ee4e58..5c18868a062f 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -35,6 +35,7 @@
  */
 
 #include "igt.h"
+#include "igt_halffloat.h"
 
 #include "i915/gem_create.h"
 #include "intel_pat.h"
@@ -198,6 +199,7 @@ static const uint32_t formats[] = {
 	DRM_FORMAT_XYUV8888,
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_XRGB2101010,
+	DRM_FORMAT_XBGR16161616F,
 	DRM_FORMAT_YUYV,
 	DRM_FORMAT_NV12,
 	DRM_FORMAT_P012,
@@ -321,7 +323,8 @@ static void check_ccs_cc_plane(int drm_fd, igt_fb_t *fb, int plane, const float
 		uint32_t d;
 	} *cc_p;
 	void *map;
-	uint32_t native_color = 0;
+	uint32_t native_color[2] = {};
+	uint16_t half[4];
 
 	if (is_i915_device(drm_fd)) {
 		gem_set_domain(drm_fd, fb->gem_handle, I915_GEM_DOMAIN_CPU, 0);
@@ -338,25 +341,32 @@ static void check_ccs_cc_plane(int drm_fd, igt_fb_t *fb, int plane, const float
 
 	switch (fb->drm_format) {
 	case DRM_FORMAT_XRGB8888:
-		native_color = (uint32_t)(cc_color[3] * 0xff) << 24 |
+		native_color[0] = (uint32_t)(cc_color[3] * 0xff) << 24 |
 			(uint32_t)(cc_color[0] * 0xff) << 16 |
 			(uint32_t)(cc_color[1] * 0xff) << 8 |
 			(uint32_t)(cc_color[2] * 0xff);
 		break;
 	case DRM_FORMAT_XRGB2101010:
-		native_color = (uint32_t)(cc_color[3] * 0x3) << 30 |
+		native_color[0] = (uint32_t)(cc_color[3] * 0x3) << 30 |
 			(uint32_t)(cc_color[0] * 0x3ff) << 20 |
 			(uint32_t)(cc_color[1] * 0x3ff) << 10 |
 			(uint32_t)(cc_color[2] * 0x3ff);
 		break;
+	case DRM_FORMAT_XBGR16161616F:
+		igt_float_to_half(cc_color, half, 4);
+
+		native_color[1] = (uint64_t)half[3] << 16 | (uint64_t)half[2];
+		native_color[0] = (uint64_t)half[1] << 16 | (uint64_t)half[0];
+		break;
 	default:
 		break;
 	}
 
-	igt_assert(native_color == cc_p[4].d);
+	igt_assert(native_color[0] == cc_p[4].d);
+	igt_assert(native_color[1] == cc_p[5].d);
 
 	igt_assert(gem_munmap(map, fb->size) == 0);
-};
+}
 
 static void check_all_ccs_planes(int drm_fd, igt_fb_t *fb, const float *cc_color, bool check_cc_plane)
 {
@@ -857,7 +867,8 @@ static bool try_config(data_t *data, enum test_fb_flags fb_flags,
 
 	if (igt_fb_is_gen12_rc_ccs_cc_modifier(data->ccs_modifier) &&
 	    data->format != DRM_FORMAT_XRGB8888 &&
-	    data->format != DRM_FORMAT_XRGB2101010)
+	    data->format != DRM_FORMAT_XRGB2101010 &&
+	    data->format != DRM_FORMAT_XBGR16161616F)
 		return false;
 
 	if ((fb_flags & FB_MISALIGN_AUX_STRIDE) ||
-- 
2.44.2

