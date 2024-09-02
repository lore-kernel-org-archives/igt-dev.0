Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844AFCD3427
	for <igt-dev@archiver.kernel.org>; Mon,  2 Sep 2024 14:38:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48B7A10E33A;
	Mon,  2 Sep 2024 14:38:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VdI3Urej";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F57C10E33A
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Sep 2024 14:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725287930; x=1756823930;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Fq/A9G1Unpy/NKhqthjPCMFkQWSCP2o34oTT/o8ldTI=;
 b=VdI3Urejw5S/uMEqSq1yTxdW/bXWaUhJ5mmudICH//JVokwnYxv/RuX+
 PfeCU4qhe01PDyXL5OSUy7SkYKauTsgyzf8SOyiVVfsq4AZvTI0B5FnK6
 vlltub/cex/I4fdsR0LCEazwns4dW3jVgO5fW3fPDLuw3IPibanNj02M4
 vCs9TgP8eja829YWbhPTidOkWpjwK40njBv8slZHYtBY85Ctj9xAh1o6X
 x6SbaCpg+Jnk2lNZWGLO9vIYo6/iQP1gS8JlL7YHxWW063dFXXTtu1U1U
 6peGaCVkltKGdOA6XT/+498oOvOiM6dtFWGCJ/VxR5o465lAKIqQK+v1W A==;
X-CSE-ConnectionGUID: rwbwgFOjTrm9PzZzfckG/w==
X-CSE-MsgGUID: H6XQ7J4fRgaHWwpUQgjlvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="24009513"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="24009513"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 07:38:50 -0700
X-CSE-ConnectionGUID: zZ/GzXpGTga8OpMFek/X/w==
X-CSE-MsgGUID: m1QQZwBSSg2sjXep1M16Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="64639468"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Sep 2024 07:38:48 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 02 Sep 2024 17:38:47 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 17/23] lib/igt_fb: Fix planar block copy
Date: Mon,  2 Sep 2024 17:37:52 +0300
Message-ID: <20240902143758.21036-18-ville.syrjala@linux.intel.com>
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

The block copy code tries to handle planar formats by blitting
each color plane separately. But it incorrectly picks some of
the parameters (size, bpp, etc.) from the first color plane
instead of the one it's actually copying. Pick the parameters
from the correct color plane.

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_fb.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 8d9d1bbe3508..2d53b317afc2 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2829,7 +2829,8 @@ static struct blt_copy_object *allocate_and_initialize_blt(const struct igt_fb *
 		       igt_fb_is_ccs_modifier(fb->modifier) ? COMPRESSION_ENABLED : COMPRESSION_DISABLED,
 		       igt_fb_is_gen12_mc_ccs_modifier(fb->modifier) ? COMPRESSION_TYPE_MEDIA : COMPRESSION_TYPE_3D);
 
-	blt_set_geom(blt, stride, 0, 0, fb->width, fb->plane_height[plane], 0, 0);
+	blt_set_geom(blt, stride, 0, 0,
+		     fb->plane_width[plane], fb->plane_height[plane], 0, 0);
 	blt->plane_offset = fb->offsets[plane];
 
 	return blt;
@@ -2875,9 +2876,10 @@ static struct blt_copy_object *blt_fb_init(const struct igt_fb *fb,
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
@@ -3020,19 +3022,19 @@ static void do_block_copy(const struct igt_fb *src_fb,
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

