Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D9ACCD1A0
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 12:06:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCAD910E58B;
	Wed, 18 Sep 2024 12:06:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JWTBDpiq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8C7210E58B
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 12:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726661168; x=1758197168;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=2GSGkhcVPy6PCfmuuHy/7F9RUxQmh37rdOtRw0B3G6o=;
 b=JWTBDpiqJn8suxs9fce+0CFLSXS3neuLyylfFwG1dD73/0RfY1dgRHLM
 84db+voFUTpa6idP2aSZN7T9wK37I4JoOpwedey7lgaHzHRi0Edd8TfxC
 GiKoZcq2GCL2Mwak8xnuUOAGwpa2/x7WJ6J+itLyikNEdryXUF3mGWz47
 7bDekNWWlNYF99ZDva4b0AoLMPO6eefJXf/KUdVl2dub6Rme1DYrnjngk
 9O7OVhUwgWYNPW1NFgtqEyNKeijw24xumuUtDP3d41jK6227+jQDSpe58
 hdHG6HKnjdcF6BejI26q7lJS702B1+RbLIPtsFctaJ4DCyBnWGOCbD1fb g==;
X-CSE-ConnectionGUID: 2UTHAfK4R06bObuMv+fsJg==
X-CSE-MsgGUID: syoiHYiTQrerJAgWO2PfxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25687570"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="25687570"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 05:06:08 -0700
X-CSE-ConnectionGUID: eOpwz17tRvah7TpguLBSlg==
X-CSE-MsgGUID: zsWbReDLSr2bFcZFfR7HpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="69634462"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 18 Sep 2024 05:06:05 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 18 Sep 2024 15:06:04 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 16/18] tests/kms_ccs: Fix planar blits for xe2
Date: Wed, 18 Sep 2024 15:05:16 +0300
Message-ID: <20240918120518.30258-17-ville.syrjala@linux.intel.com>
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

Try to handle each color plane of planar formats
correctly in the xe2 blitter code.

TODO: combine with the blitter code in igt_fb.c

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_ccs.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index 971d9fe0fcae..bb18784e6fac 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -629,9 +629,10 @@ static struct blt_copy_object *blt_fb_init(const struct igt_fb *fb,
 	return blt;
 }
 
-static enum blt_color_depth blt_get_bpp(const struct igt_fb *fb)
+static enum blt_color_depth blt_get_bpp(const struct igt_fb *fb,
+					int color_plane)
 {
-	switch (fb->plane_bpp[0]) {
+	switch (fb->plane_bpp[color_plane]) {
 	case 8:
 		return CD_8bit;
 	case 16:
@@ -706,18 +707,18 @@ static void xe2_ccs_blit(data_t *data, struct igt_fb *fb, struct igt_fb *temp_fb
 		dst = blt_fb_init(dst_fb, i, mem_region, intel_get_pat_idx_wt(dst_fb->fd));
 
 		blt_copy_init(src_fb->fd, &blt);
-		blt.color_depth = blt_get_bpp(src_fb);
+		blt.color_depth = blt_get_bpp(src_fb, i);
 		blt_set_copy_object(&blt.src, src);
 		blt_set_copy_object(&blt.dst, dst);
 
 		blt_set_object_ext(&ext.src,
 				blt_compression_format(&blt, src_fb),
-				src_fb->width, src_fb->height,
+				src_fb->plane_width[i], src_fb->plane_height[i],
 				SURFACE_TYPE_2D);
 
 		blt_set_object_ext(&ext.dst,
 				blt_compression_format(&blt, dst_fb),
-				dst_fb->width, dst_fb->height,
+				dst_fb->plane_width[i], dst_fb->plane_height[i],
 				SURFACE_TYPE_2D);
 
 		pext = &ext;
-- 
2.44.2

