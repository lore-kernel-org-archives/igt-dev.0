Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B86CA0ED3
	for <igt-dev@archiver.kernel.org>; Mon,  2 Sep 2024 14:39:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7855C10E34F;
	Mon,  2 Sep 2024 14:39:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XqMrtiqp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 874AB10E33D
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Sep 2024 14:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725287942; x=1756823942;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1XUL/oJV5GpGfL/fY3n4i8RcKs4YOMj7S7NNpv8TuoA=;
 b=XqMrtiqpF2KMxmJMqCcHvfnit+FYYXRfhT3LcTe3sIgXHQ2c8ZiS1STd
 l/RP3dBqSYxctO+E+7mnORgAi18CrTw9E6ySQ9QbHunq1ePHZyIw5be8z
 5kcvawCG8+JmNcow1wXiJX8Fi6dr8VCtakkXFAifmrFNKhKtC/zCcuOuM
 5CZAibFv2wIWciEVpOS2WpO6DZI7nUQTPY7pxpAamIxpMZNtbFGJ9Sqxn
 wfwQW+SsHe4+UJv48IhXdiWfIHMKusjmU1InVdJchK4yK54SV/GZDdqD7
 5SPglOZPYtgdhH93BZyUHAB7VViebEDJOssH1mcs1KRSATF+Eac/b1LfN w==;
X-CSE-ConnectionGUID: pTGx4ejETeObe8Z8MZfp8w==
X-CSE-MsgGUID: t1Mp9OD/S0KWwxistKDPyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="24009528"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="24009528"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 07:39:02 -0700
X-CSE-ConnectionGUID: h3LiH1nMTWi5LQG3AS8SSg==
X-CSE-MsgGUID: zCcs0AfkRtWSUpzbS2jCJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="64639512"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Sep 2024 07:39:00 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 02 Sep 2024 17:38:59 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 21/23] tests/kms_ccs: Reuse
 igt_fb_is_gen12_rc_ccs_cc_modifier()
Date: Mon,  2 Sep 2024 17:37:56 +0300
Message-ID: <20240902143758.21036-22-ville.syrjala@linux.intel.com>
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

Replace the hand rolled version of igt_fb_is_gen12_rc_ccs_cc_modifier()
with the real thing.

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_ccs.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index b1a9da8dacd2..1036666de2b6 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -280,13 +280,6 @@ create_fb_prepare_add(int drm_fd, int width, int height,
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
@@ -754,7 +747,7 @@ static void generate_fb(data_t *data, struct igt_fb *fb,
 		srand(data->seed);
 		fill_fb_random(data->drm_fd, fb);
 	} else {
-		bool do_fast_clear = is_ccs_cc_modifier(data->ccs_modifier);
+		bool do_fast_clear = igt_fb_is_gen12_rc_ccs_cc_modifier(data->ccs_modifier);
 		bool do_solid_fill = do_fast_clear || data->plane;
 		int c = !!data->plane;
 
@@ -847,7 +840,7 @@ static bool try_config(data_t *data, enum test_fb_flags fb_flags,
 				      data->ccs_modifier))
 		return false;
 
-	if (is_ccs_cc_modifier(data->ccs_modifier) &&
+	if (igt_fb_is_gen12_rc_ccs_cc_modifier(data->ccs_modifier) &&
 	    data->format != DRM_FORMAT_XRGB8888 &&
 	    data->format != DRM_FORMAT_XRGB2101010)
 		return false;
-- 
2.44.2

