Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D420ECD13CF
	for <igt-dev@archiver.kernel.org>; Mon,  2 Sep 2024 14:38:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99EA810E33B;
	Mon,  2 Sep 2024 14:38:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GfJY368L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 971B310E33B
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Sep 2024 14:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725287936; x=1756823936;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T1jo486IcKZlRknkl/wx8rzZFc61pO1eM24tEkE9qLg=;
 b=GfJY368Lb6r66U82nsQheDdLRmD172j3wN/IU3S0PXaS9w2AJ2MA8tIv
 HpkDwn0qMqA7ouJsL7qNLJp1uZUQm/OG6+hl6jOLXd9TJtptPcOLYoGqC
 caTtbeQsSajGPeJI8IJzvoPffR9+/575x40V8sRWHp7UQlNBRiDpHPL6D
 OAHqerh0EOsA+gnavRDJPORMR7uXPxLEdXC6OxQb9sgGEJI+/FUiSU6Q9
 M3A3EFfiunO5xV8588ISQWeuFJrIytv5jqO66Z+WTKcoGzJPD/Dvmmxma
 flegv+anIrc0pFbAwy0EghhHowg6bsQ6sZzfsFSnZwhOK3Vr5CV4i4ex6 g==;
X-CSE-ConnectionGUID: zOzmMz4eRliTJNGZfZE3Lw==
X-CSE-MsgGUID: p/F3euxORFGnMZpXR4iUew==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="24009523"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="24009523"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 07:38:56 -0700
X-CSE-ConnectionGUID: 9b6hW9BGQoqAY3XMDYu/fw==
X-CSE-MsgGUID: 0YXZdDbORrOW6LSmPm4dLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="64639483"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Sep 2024 07:38:54 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 02 Sep 2024 17:38:53 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 19/23] lib/igt_fb: Assert that we have no clear color
 when using the bltter
Date: Mon,  2 Sep 2024 17:37:54 +0300
Message-ID: <20240902143758.21036-20-ville.syrjala@linux.intel.com>
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

The blitter code doesn't know how to deal with the clear color
currently. There is some preliminary code to simply skip the clear
color buffer for dg2, but that would just result in bogus rendering
if we even had to deal with fast cleared stuff.

Rip out the dg2 stuff, and just assert that we should never get
here with a clear color modifier.

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_fb.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 1ec16ab9d813..fcd655cf8ca9 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -3046,19 +3046,18 @@ static void blitcopy(const struct igt_fb *dst_fb,
 	const intel_ctx_t *ictx = NULL;
 	intel_ctx_t *xe_ctx = NULL;
 	struct intel_execution_engine2 *e;
-	/* To ignore CC plane */
-	uint32_t src_cc = src_fb->modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC ? 1 : 0;
-	uint32_t dst_cc = dst_fb->modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC ? 1 : 0;
 	bool is_xe = is_xe_device(dst_fb->fd);
 
 	igt_assert_eq(dst_fb->fd, src_fb->fd);
-	igt_assert_eq(dst_fb->num_planes - dst_cc, src_fb->num_planes - src_cc);
+	igt_assert_eq(dst_fb->num_planes, src_fb->num_planes);
+	igt_assert(!igt_fb_is_gen12_rc_ccs_cc_modifier(src_fb->modifier));
+	igt_assert(!igt_fb_is_gen12_rc_ccs_cc_modifier(dst_fb->modifier));
 
 	setup_context_and_memory_region(dst_fb, &ctx, &ahnd, &mem_region,
 					&vm, &bb, &bb_size, &ictx,
 					&exec_queue, &xe_ctx);
 
-	for (int i = 0; i < dst_fb->num_planes - dst_cc; i++) {
+	for (int i = 0; i < dst_fb->num_planes; i++) {
 		igt_assert_eq(dst_fb->plane_bpp[i], src_fb->plane_bpp[i]);
 		igt_assert_eq(dst_fb->plane_width[i], src_fb->plane_width[i]);
 		igt_assert_eq(dst_fb->plane_height[i], src_fb->plane_height[i]);
-- 
2.44.2

