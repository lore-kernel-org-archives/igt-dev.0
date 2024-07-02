Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD3EC3065C
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jul 2024 23:29:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2BE710E70D;
	Tue,  2 Jul 2024 23:29:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jeBAUGao";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83B1210E70D
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jul 2024 23:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719962965; x=1751498965;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=c7Awf4FJXhdnfiHIbjMBwUpI6eQ/K9PbYnuBAP6eyBs=;
 b=jeBAUGao5nCyp2PXnOc17CTevgZ38Pe2R1O/YAimFsjmfmti1eWQZhfY
 MhwAEyQojUYinS1MoPiW8bKc7g0cbpaV14aEF9Sd9NFibasGvMdNq9D8T
 lzmfizyKSjSfSz5WlBWSena1MnK+I9xEmP5hsPggveoPexZDvScfw0Vl9
 Z9Wrpa8epihTm4kaLgynboSWt0Dl81QGbRIoVIXH+cm8MIYuhtNZMyGdv
 yFgV9vza6eZ726tQ3suegQiVaqu8eKLQiXYahIk0neWR3GfK3KREZfKAC
 Aq4i7xpwxPHhyZpM9Vt5NoF0irVefGyiWT83Nnvl7T3V3M1ZFhHsnJFsz g==;
X-CSE-ConnectionGUID: MMQs5JpPSmeQiSLmkWqiDw==
X-CSE-MsgGUID: zAChLUxLRmmDjD5/3GwY3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="28559645"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="28559645"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 16:29:25 -0700
X-CSE-ConnectionGUID: yyvyY2EBS+Wf3/Rzg9OqXw==
X-CSE-MsgGUID: gCLs/DANSzStV7YtttUXFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="46043898"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Jul 2024 16:29:22 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 03 Jul 2024 02:29:21 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 23/37] lib/igt_fb: Fix planar block copy
Date: Wed,  3 Jul 2024 02:28:03 +0300
Message-ID: <20240702232817.31147-24-ville.syrjala@linux.intel.com>
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

The block copy code tries to handle planar formats by blitting
each color plane separately. But it incorrectly picks some of
the parameters (size, bpp, etc.) from the first color plane
instead of the one it's actually copying. Pick the parameters
from the correct color plane.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_fb.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index c0b157ee44fa..64be4bffdea8 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2802,7 +2802,8 @@ static struct blt_copy_object *allocate_and_initialize_blt(const struct igt_fb *
 		       igt_fb_is_ccs_modifier(fb->modifier) ? COMPRESSION_ENABLED : COMPRESSION_DISABLED,
 		       igt_fb_is_gen12_mc_ccs_modifier(fb->modifier) ? COMPRESSION_TYPE_MEDIA : COMPRESSION_TYPE_3D);
 
-	blt_set_geom(blt, stride, 0, 0, fb->width, fb->plane_height[plane], 0, 0);
+	blt_set_geom(blt, stride, 0, 0,
+		     fb->plane_width[plane], fb->plane_height[plane], 0, 0);
 	blt->plane_offset = fb->offsets[plane];
 
 	return blt;
@@ -2848,9 +2849,10 @@ static struct blt_copy_object *blt_fb_init(const struct igt_fb *fb,
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
@@ -2995,19 +2997,19 @@ static void do_block_copy(const struct igt_fb *src_fb,
 	igt_assert(src && dst);
 
 	blt_copy_init(src_fb->fd, &blt);
-	blt.color_depth = blt_get_bpp(src_fb);
+	blt.color_depth = blt_get_bpp(src_fb, i);
 	blt_set_copy_object(&blt.src, src);
 	blt_set_copy_object(&blt.dst, dst);
 
 	if (blt_uses_extended_block_copy(src_fb->fd)) {
 		blt_set_object_ext(&ext.src,
 				   blt_compression_format(&blt, src_fb),
-				   src_fb->width, src_fb->height,
+				   src_fb->plane_width[i], src_fb->plane_height[i],
 				   SURFACE_TYPE_2D);
 
 		blt_set_object_ext(&ext.dst,
 				   blt_compression_format(&blt, dst_fb),
-				   dst_fb->width, dst_fb->height,
+				   dst_fb->plane_width[i], dst_fb->plane_height[i],
 				   SURFACE_TYPE_2D);
 		pext = &ext;
 	}
-- 
2.44.2

