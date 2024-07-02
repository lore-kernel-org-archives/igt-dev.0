Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4448EC3065C
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jul 2024 23:29:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 066AF10E704;
	Tue,  2 Jul 2024 23:29:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BdbhMf4E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6740710E70D
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jul 2024 23:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719962957; x=1751498957;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=yiuogXgeLleBriHZELNCNnO/A2zpUS0MBrkYZJyY/U0=;
 b=BdbhMf4EfbwQB35I+Xw2gojyuE2rm9/7aSu7QFWC9SFVGMBPC+HLvHQF
 odmci51ReACNLUi3Y9ZKsEcDGMooZ8GdHkUGxxjhdO1fICzNyCVpAndKb
 +tI3x8rkC7VRVuk78+mBc9M9GHiCemGpomMGjqwPu6EbwUgItDMP5UFB9
 LNNd12IFs5zEiNtCf/eFdeUqj9SlLKyYm/w053VV/cw7OD8mvrjx9L22H
 OQkuXcjpWL7xZ5cRSczR+bvObAcFKu8ynQWn9XK8fnJ7m3PDZPKSL7EeD
 sSwhqimy2hnNKSjiEZSoITQekHLc8fWGKI1+byEx/DY7sTmcIh4EYhdF0 Q==;
X-CSE-ConnectionGUID: 45AsyufjSHiOhFucz9QyOg==
X-CSE-MsgGUID: 7+n5XQhpS0SJF919/+EEQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="28559622"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="28559622"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 16:29:17 -0700
X-CSE-ConnectionGUID: cLoDDazQQtGnxLpwhw4U7Q==
X-CSE-MsgGUID: mFmmMECURAiIgJL1EEqC+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="46043875"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Jul 2024 16:29:14 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 03 Jul 2024 02:29:13 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 20/37] lib/igt_fb: Adjust how we pick the blitter
 compression format
Date: Wed,  3 Jul 2024 02:28:00 +0300
Message-ID: <20240702232817.31147-21-ville.syrjala@linux.intel.com>
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

Instead doing this bpp vs. format thing based on the compression
type, let's stick with the format. In order to avoid having to
populate the table with all the different swizzles we'll pass
the format through igt_reduce_format().

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_fb.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 4ef1945e4333..fd115f833bc5 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2875,23 +2875,22 @@ static enum blt_color_depth blt_get_bpp(const struct igt_fb *fb)
 			  x.compression_type == COMPRESSION_TYPE_MEDIA)
 
 const struct {
-	uint32_t key;
+	uint32_t format;
 	enum blt_compression_type type;
 	uint32_t return_value;
 } compression_mappings[] = {
-	{ CD_32bit, COMPRESSION_TYPE_3D, 8 },
+	{ DRM_FORMAT_XRGB8888, COMPRESSION_TYPE_3D, 0x8 },
 	{ DRM_FORMAT_XRGB8888, COMPRESSION_TYPE_MEDIA, 8 },
 	{ DRM_FORMAT_XYUV8888, COMPRESSION_TYPE_MEDIA, 9 },
 	{ DRM_FORMAT_NV12, COMPRESSION_TYPE_MEDIA, 9 },
 	{ DRM_FORMAT_P010, COMPRESSION_TYPE_MEDIA, 8 },
-	{ DRM_FORMAT_P012, COMPRESSION_TYPE_MEDIA, 8 },
-	{ DRM_FORMAT_P016, COMPRESSION_TYPE_MEDIA, 8 },
 };
 
-static uint32_t get_compression_return_value(uint32_t key, enum  blt_compression_type type)
+static uint32_t get_compression_return_value(uint32_t format,
+					     enum  blt_compression_type type)
 {
 	for (int i = 0; i < ARRAY_SIZE(compression_mappings); i++) {
-		if (compression_mappings[i].key == key &&
+		if (compression_mappings[i].format == format &&
 		    compression_mappings[i].type == type) {
 			return compression_mappings[i].return_value;
 		}
@@ -2908,11 +2907,11 @@ static uint32_t blt_compression_format(struct blt_copy_data *blt,
 		return 0;
 
 	if (BLT_TARGET_RC(blt->src) || BLT_TARGET_RC(blt->dst))
-		return get_compression_return_value(blt->color_depth,
+		return get_compression_return_value(igt_reduce_format(fb->drm_format),
 						    COMPRESSION_TYPE_3D);
 
 	if (BLT_TARGET_MC(blt->src))
-		return get_compression_return_value(fb->drm_format,
+		return get_compression_return_value(igt_reduce_format(fb->drm_format),
 						    COMPRESSION_TYPE_MEDIA);
 
 	if (BLT_TARGET_MC(blt->dst))
-- 
2.44.2

