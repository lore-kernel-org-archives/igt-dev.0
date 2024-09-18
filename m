Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00CEDCCD1A6
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 12:06:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2D0310E237;
	Wed, 18 Sep 2024 12:06:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HHrxKrl0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FFDC10E58E
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 12:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726661171; x=1758197171;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=xwCywCU+xygLdSSzRF+Sasc3kbrCaEN+iQ9oH93Svuc=;
 b=HHrxKrl0iHHg5bDKSd6C/MW+gO46eWVI1souquUE/eeh4CdLapwfHY5P
 cU3nZeLPPlvXfSVZKa6+tsCJKevDtgms9z4CCY39xtwLyfD+sq1uxbcj1
 7du2gFu0VZF0p5q2izEPBe/hjXOJDXr+U59T0cGIGRh0fEL0ji0Rr3a6c
 Uy4Y3j2SkQ9TimshnXCgZ3cN5AtCM59iSxwz5NAySFwv6ar6ZVYZg1WRW
 LSCaimpXon5yqdmz74O+rTNmk737UeHcDYerOVjBaCpyr4Lsy4iYI5Rsu
 /EmtdkDENkp89cr3iOpiJJ+pI+jyxMCbMXdjJYMx+51QV3XIr9vpgDNRD Q==;
X-CSE-ConnectionGUID: WWnv7LmBRW2CaCR4V6sqbw==
X-CSE-MsgGUID: l1oaB46uSLi0TvUqFPo/DQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25687576"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="25687576"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 05:06:10 -0700
X-CSE-ConnectionGUID: IR9H84C8Sv2ie3YgWekfdQ==
X-CSE-MsgGUID: tGjoiDYWSRqrA64UOzBWbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="69634466"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 18 Sep 2024 05:06:08 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 18 Sep 2024 15:06:07 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 17/18] tests/kms_ccs: Try to fix the xe2 blitter
 compression format
Date: Wed, 18 Sep 2024 15:05:17 +0300
Message-ID: <20240918120518.30258-18-ville.syrjala@linux.intel.com>
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

Pluck the compression format values from the LNL/BMG table.

TODO: or should be we using those stateful/stateless values or
      something? no idea
TODO: Move this into igt_fb.c

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_ccs.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index bb18784e6fac..835a3fe5aed2 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -651,19 +651,29 @@ static enum blt_color_depth blt_get_bpp(const struct igt_fb *fb,
 }
 
 static uint32_t blt_compression_format(struct blt_copy_data *blt,
-				       const struct igt_fb *fb)
+				       const struct igt_fb *fb,
+				       int color_plane)
 {
-	switch (fb->drm_format) {
-	case DRM_FORMAT_XRGB8888:
+	switch (igt_reduce_format(fb->drm_format)) {
+	case DRM_FORMAT_XRGB16161616F:
+		return 0x7; /* CMF_R16_G16_B16_A16 */
 	case DRM_FORMAT_XRGB2101010:
-	case DRM_FORMAT_P010:
-	case DRM_FORMAT_P012:
-	case DRM_FORMAT_P016:
-	case DRM_FORMAT_YUYV:
-		return 8;
+		return 0x3; /* CMF_R10_G10_B10_A2 */
+	case DRM_FORMAT_XRGB8888:
 	case DRM_FORMAT_XYUV8888:
+		return 0x2; /* CMF_R8_G8_B8_A8 */
+	case DRM_FORMAT_YUYV:
+		return 0x1; /* CMF_R8_G8 (treated as 16bpp format) */
 	case DRM_FORMAT_NV12:
-		return 9;
+		if (color_plane)
+			return 0x1; /* CMF_R8_G8 */
+		else
+			return 0x0; /* CMF_R8 */
+	case DRM_FORMAT_P010:
+		if (color_plane)
+			return 0x6; /* CMF_R16_G16 */
+		else
+			return 0x5; /* CMF_R16 */
 	default:
 		igt_assert_f(0, "Unknown format\n");
 	}
@@ -712,12 +722,12 @@ static void xe2_ccs_blit(data_t *data, struct igt_fb *fb, struct igt_fb *temp_fb
 		blt_set_copy_object(&blt.dst, dst);
 
 		blt_set_object_ext(&ext.src,
-				blt_compression_format(&blt, src_fb),
+				blt_compression_format(&blt, src_fb, i),
 				src_fb->plane_width[i], src_fb->plane_height[i],
 				SURFACE_TYPE_2D);
 
 		blt_set_object_ext(&ext.dst,
-				blt_compression_format(&blt, dst_fb),
+				blt_compression_format(&blt, dst_fb, i),
 				dst_fb->plane_width[i], dst_fb->plane_height[i],
 				SURFACE_TYPE_2D);
 
-- 
2.44.2

