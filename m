Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EDF3C30658
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jul 2024 23:28:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F245210E50A;
	Tue,  2 Jul 2024 23:28:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RwpAewsO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C117C10E50A
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jul 2024 23:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719962913; x=1751498913;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=j2zk7cmlpUPTok0czl+D3h2y74qlLbtum8fcKRDOl8w=;
 b=RwpAewsO7dRhGvzcRl7yE2Fo6LTCFw39R0UJCI88m1uebdn5koyCTGP6
 oSq8uIUY+VOjuoXGT8xz8RZE1Wo6PQ21mKKbuEEUPdEEfjSoDgwh2g4tJ
 RRP9PYOcOP+u55o4TSVGhrav0+fscOB3Pm5iLm6SjHPFS+H9hI8ZxZmIn
 xFNV9iFUFATCQcRzdPtVRTjQTcjtfRnEDudZVyxgLt0NPmhIadWjxLUWL
 2LXNggMZ2FSGkkmu4W7PGLP18vqbriePLOjBqoaMsDiJy6VU7BUDEx9jr
 kCOtQ0W5cR0Kp9CxGaoe1LhKbGqQrqp4vWXZdIGDGHbkFBpqft67H+C8r Q==;
X-CSE-ConnectionGUID: BGTh1kEuT9qjeTpypzyyZA==
X-CSE-MsgGUID: B8+pxbvGRAWa+CT2/9lIFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="28559492"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="28559492"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 16:28:33 -0700
X-CSE-ConnectionGUID: MVcznNX1QmK/w+FbdZVdJw==
X-CSE-MsgGUID: Zwdsfm7cRxipZowmS/GcTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="46043769"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Jul 2024 16:28:30 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 03 Jul 2024 02:28:30 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 04/37] tests/kms_frontbuffer_tracking: Use
 igt_create_fb()
Date: Wed,  3 Jul 2024 02:27:44 +0300
Message-ID: <20240702232817.31147-5-ville.syrjala@linux.intel.com>
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

Calling igt_calc_fb_size() and igt_create_fb_with_bo_size() like
this back to back is the same as just calling igt_create_fb().

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index e45d17dd692d..da593c3aacc7 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -1630,8 +1630,7 @@ static void create_fb(enum pixel_format pformat, int width, int height,
 		      enum tiling_type tiling, int plane, struct igt_fb *fb)
 {
 	uint32_t format;
-	uint64_t size, modifier;
-	unsigned int stride;
+	uint64_t modifier;
 
 	switch (pformat) {
 	case FORMAT_RGB888:
@@ -1665,13 +1664,7 @@ static void create_fb(enum pixel_format pformat, int width, int height,
 
 	igt_warn_on(plane == PLANE_CUR && tiling != TILING_LINEAR);
 
-	igt_calc_fb_size(drm.fd, width, height, format, modifier, &size,
-			 &stride);
-
-	igt_create_fb_with_bo_size(drm.fd, width, height, format, modifier,
-				   IGT_COLOR_YCBCR_BT709,
-				   IGT_COLOR_YCBCR_LIMITED_RANGE,
-				   fb, size, stride);
+	igt_create_fb(drm.fd, width, height, format, modifier, fb);
 }
 
 static uint32_t pick_color(struct igt_fb *fb, enum color ecolor)
-- 
2.44.2

