Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ABB8CA0ED3
	for <igt-dev@archiver.kernel.org>; Mon,  2 Sep 2024 14:38:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7F3310E339;
	Mon,  2 Sep 2024 14:38:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RHfYkUZf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92EE810E339
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Sep 2024 14:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725287927; x=1756823927;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PxU/FP5bvoASsmLyrmURbFfuBRp0x9Klzjjfd9GU4YM=;
 b=RHfYkUZfO0+B7Dh9EOQXm88F1hf8MizJhcjsOqCXFq5x1UsoCZELg5sw
 f1A2gk5bgJi6tZOr6kS/sJO7q5QFANf3RlQjB5IcsWt+bzyzNUfMNQ4r2
 2EAQmlLqOnHLyUyHi7iEk8/vU21jnRigUnStKvpcsGqRgPqIokzxRJ6XX
 ktJFPhctvDi90BzF2VFLKFwBjce2jjbcjnUHl7qUSBeuYpb/kZP2peCti
 /ib2IM7ec8Qr3t2MRGFaCVM6BF7NSETdvi4v2ninT8BkkNuZMxHzILCK3
 oV3ogcbp6eON7INaZI48T0eruqiCz9mgHrn7JmILM9Cf8imofnR8RzpyO g==;
X-CSE-ConnectionGUID: 1F/u+SygSKyXwJsbrEG44w==
X-CSE-MsgGUID: 3JXt+sdHQVKguYAarceQWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="24009504"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="24009504"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 07:38:47 -0700
X-CSE-ConnectionGUID: t7C8Big7SJOEIxRa1Cmbcg==
X-CSE-MsgGUID: PR1hb9oeTPKqIB4JZ8QAtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="64639457"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Sep 2024 07:38:45 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 02 Sep 2024 17:38:44 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 16/23] lib/igt_fb: Adjust how we pick the blitter
 compression format
Date: Mon,  2 Sep 2024 17:37:51 +0300
Message-ID: <20240902143758.21036-17-ville.syrjala@linux.intel.com>
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

Instead doing this bpp vs. format thing based on the compression
type, let's stick with the format. In order to avoid having to
populate the table with all the different swizzles we'll pass
the format through igt_reduce_format().

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_fb.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index dbf9b1035cfd..8d9d1bbe3508 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2902,23 +2902,22 @@ static enum blt_color_depth blt_get_bpp(const struct igt_fb *fb)
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
@@ -2935,11 +2934,11 @@ static uint32_t blt_compression_format(struct blt_copy_data *blt,
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

