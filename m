Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6353EC31D97
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jul 2024 23:29:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E92210E08E;
	Tue,  2 Jul 2024 23:29:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="alb8dhPh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B589810E1C7
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jul 2024 23:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719962973; x=1751498973;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ceRInF/wiwz51BZgmuRWK+kDd3W1PWM120qRaNjdOSA=;
 b=alb8dhPhF7LCWF5m0HKEulK34s/dpI8T9gDz87NDz50+N/BCT5aB5NbA
 VbZQ1Y03kpEjdFTxfwrDKqSsOuzKaToBOVOu+GxfESDesbhbDS34lyjHD
 xlguLSui3fw77NbkcduNaFtN9Yy6p6V2BogBtVPr3v46pPYhJsdRWmZiN
 X0U/YuAHKW2tXQXEZ2M/ekbhwPsvfZBYr5lruHd73uY2dA9MzOJ2DKFBG
 FBHRG6HuHqCC0dzkc4G4UYBa6t3gPh5lUTTcglpEUGZv7aYhmHC2d7WE6
 6Mb2HRoK+tPPz4/3vIPc79NFsugMGtqpBfx86kK36RTFUSyyAJ+V87cxn Q==;
X-CSE-ConnectionGUID: VZILvvoLQ7+ubWloYTP9jw==
X-CSE-MsgGUID: NVV457WXRryC7HKaIfV1Uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="28559665"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="28559665"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 16:29:33 -0700
X-CSE-ConnectionGUID: Uu/oCDrXR4y3ymQhwsjlsw==
X-CSE-MsgGUID: n+9hqyatRvy8EKgBycFJTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="46043902"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Jul 2024 16:29:30 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 03 Jul 2024 02:29:29 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 26/37] lib/igt_fb: Assert that we have no clear color
 when using the bltter
Date: Wed,  3 Jul 2024 02:28:06 +0300
Message-ID: <20240702232817.31147-27-ville.syrjala@linux.intel.com>
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

The blitter code doesn't know how to deal with the clear color
currently. There is some preliminary code to simply skip the clear
color buffer for dg2, but that would just result in bogus rendering
if we even had to deal with fast cleared stuff.

Rip out the dg2 stuff, and just assert that we should never get
here with a clear color modifier.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_fb.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 5a1f3d5d8207..ab04733fef61 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -3027,19 +3027,18 @@ static void blitcopy(const struct igt_fb *dst_fb,
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

