Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23CC5CA0ED3
	for <igt-dev@archiver.kernel.org>; Mon,  2 Sep 2024 14:38:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D943E10E325;
	Mon,  2 Sep 2024 14:38:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FUof4+5f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D0510E325
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Sep 2024 14:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725287889; x=1756823889;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YgUxAj2z3wPab2w1521h5W2Zup+YrQEm+U0sixWjSFo=;
 b=FUof4+5fQ2mj21G/Q/HPwROorhTpyrHO/Ed/VvEQ6Y5Q6ZLxTk1IA9ST
 jC3X2F75gAMwRptO2n6CxkVlD8MFwnRwgVhkOlAq4+TSVNJevTt07Vpd5
 Y+WNt+saSsDjFwS1vpEgBKyI81nbfR6UnyKAViqbi+tOLqtqWeMRh3Xlp
 jJbWiVXVxOxHBjTsvOd+9OiEE4yRK4qfRvwEfH4DgTHX9AePbzxQqoqaq
 hYeeGhasLM6Qeqj8OTMQtOZRSo+8cvfULDFT2XX4z8hr1BiLli4wJcc84
 mR8tHmPRhY0NU7XmvywYZksb1V9G4/ZabCpjSo2LIl9bgfdZEhYKlG6PT g==;
X-CSE-ConnectionGUID: e6CHgo27Sl6Nn6VoEVCeOA==
X-CSE-MsgGUID: 8I+kbd1lSbyDaLaZRgU0JQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="24009425"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="24009425"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 07:38:09 -0700
X-CSE-ConnectionGUID: A1oQ3rEQSCOELcjYuBXrbA==
X-CSE-MsgGUID: tWb76ItKTs2pTgDczzTFsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="64639373"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Sep 2024 07:38:07 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 02 Sep 2024 17:38:06 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 03/23] tests/kms_frontbuffer_tracking: Use
 igt_create_fb()
Date: Mon,  2 Sep 2024 17:37:38 +0300
Message-ID: <20240902143758.21036-4-ville.syrjala@linux.intel.com>
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

Calling igt_calc_fb_size() and igt_create_fb_with_bo_size() like
this back to back is the same as just calling igt_create_fb().

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
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

