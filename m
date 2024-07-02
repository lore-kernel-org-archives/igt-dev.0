Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA97C30658
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jul 2024 23:29:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE38510E702;
	Tue,  2 Jul 2024 23:29:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lm7VY1dX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A65510E702
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jul 2024 23:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719962990; x=1751498990;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=fpEOrUtnSh8tLGAmu7wPqGdPg43DuUJgAXvRy5UURZs=;
 b=Lm7VY1dXDHwAw4A6IkaoySbokiu8YypZunvco6rfYxjHOt/SP0Kg+xOZ
 ZMlY8/+VkNcz9vjuLlccuRe/z0FMN1cCLH/TsXnTzlyO1ik8lkQfUw8U2
 QBv4w4Pg/5l2iD3jdO0eGZRRIdbs2MGReHeky/XRcUxrixle3ZNQWgGkG
 DnWp7v9OOMWjHTdsEA3zOj3z3Vek/2UL9Uqh+rylCbBGHbevv2gRrc/jw
 qWDpeF0//mcL8uvG3i3mZT3A3gbNxLueLhwTHDYvaS5+FnPrmHDAUBeeN
 1NERR/2XLVZ0Jioi/h7F8f/O9ExY7lLlFOVr6ylwHxrdldxB9RWm7WLuD A==;
X-CSE-ConnectionGUID: CinNu5J/SPipwNyWJn5mgA==
X-CSE-MsgGUID: kwQ1dvxrSCe7cljO5HxnPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="28559693"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="28559693"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 16:29:49 -0700
X-CSE-ConnectionGUID: K5hKk2XmSjSMrAcSpzWYiA==
X-CSE-MsgGUID: jAO7wFXzSAmqbNsKDgnEsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="46043924"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Jul 2024 16:29:47 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 03 Jul 2024 02:29:46 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 32/37] tests/kms_ccs: Reuse
 igt_fb_is_gen12_rc_ccs_cc_modifier()
Date: Wed,  3 Jul 2024 02:28:12 +0300
Message-ID: <20240702232817.31147-33-ville.syrjala@linux.intel.com>
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

Replace the hand rolled version of igt_fb_is_gen12_rc_ccs_cc_modifier()
with the real thing.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_ccs.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index c91370a9abe7..30b61f132834 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -277,13 +277,6 @@ create_fb_prepare_add(int drm_fd, int width, int height,
 	addfb_init(fb, f);
 }
 
-static bool is_ccs_cc_modifier(uint64_t modifier)
-{
-	return modifier == I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC ||
-	       modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC ||
-	       modifier == I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC;
-}
-
 /*
  * The CCS planes of compressed framebuffers contain non-zero bytes if the
  * engine compressed effectively the framebuffer. The actual encoding of these
@@ -752,7 +745,7 @@ static void generate_fb(data_t *data, struct igt_fb *fb,
 		srand(data->seed);
 		fill_fb_random(data->drm_fd, fb);
 	} else {
-		bool do_fast_clear = is_ccs_cc_modifier(data->ccs_modifier);
+		bool do_fast_clear = igt_fb_is_gen12_rc_ccs_cc_modifier(data->ccs_modifier);
 		bool do_solid_fill = do_fast_clear || data->plane;
 		int c = !!data->plane;
 
@@ -850,7 +843,7 @@ static bool try_config(data_t *data, enum test_fb_flags fb_flags,
 				      data->ccs_modifier))
 		return false;
 
-	if (is_ccs_cc_modifier(data->ccs_modifier) &&
+	if (igt_fb_is_gen12_rc_ccs_cc_modifier(data->ccs_modifier) &&
 	    data->format != DRM_FORMAT_XRGB8888 &&
 	    data->format != DRM_FORMAT_XRGB2101010)
 		return false;
-- 
2.44.2

