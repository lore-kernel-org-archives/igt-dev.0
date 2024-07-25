Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E80C3DA5D
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jul 2024 18:13:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B89E310E8C5;
	Thu, 25 Jul 2024 18:13:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="G2rmGin4";
	dkim-atps=neutral
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D08AA10E8C5
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jul 2024 18:13:20 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-70d2b921c48so156130b3a.1
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jul 2024 11:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721931200; x=1722536000; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4wrvxOeykKJdylJBMN7l1K3iNa+JsZONeczxfQU6lbM=;
 b=G2rmGin4UF4Uc/TytWgsNpaunGSAPrwK9NCMkKp5uNS7QQDORKmICqClZ7/XiV1IUj
 eleC7JLjd95/oenW1sZka0a/YaMntuk/pKa7rwQ5hODmFh3qFWaKfAeMgR1PJsFOSdDj
 H9iI1oajUjJLPpI9esdVLbct9aGW2e0Azpzfpp6uZnfRg6zGGfdQCL9ubpz/7VAusrXR
 5ubofnRn1nook/5aLOeYDFJJO/GviOU80p2lRKSfoU/QBKadYutfa5+KI4Eo2MJulzv/
 Pa27KWma9Y66X9SarP0IRadxw6piD1H58h70S5RkUCXDLqG6qUVLdeGmOlw5aQJvOLiN
 oO6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721931200; x=1722536000;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4wrvxOeykKJdylJBMN7l1K3iNa+JsZONeczxfQU6lbM=;
 b=LizpFncELmX6EHONOPZk/LPpzsmsdcDZXzHbUrOt+UPCRRex4V5RFaBeHz4VXnip4q
 QJZasQGleWdNOyXCGQJkHdfLCbXTCSVDvtrULVijp2c0/mPK+NhtNDr4H2V+rTuJ12Q3
 txnkUIpHg7t63vlTl3gsDBu+J1InTg/O9GwU9sjGn9q56sRJf6blxjWfUARo4CJvdsxd
 QLr8e6S5PTWmlu98nA6OzU0Zpj9NH0n0qej34PChJivoC8XeLNcU/cSqiHNsMdpo/quJ
 FYwaVST6y/gJTHkgDd3Jk+RtEz43N78f0yMW1v+0pK4BMoer0IffS2G0/DXpvl8z97Ch
 okTA==
X-Gm-Message-State: AOJu0YwX7dH/poHTyc4c/zFxbiygQXyUtvAthez7uydVDJDSd6BWahUg
 Ih7Du52YqDo2mxnTR2bLtEG9VOMi1NNcwFv3Lj5WLXaI+GKFk2oCdQ6W7dR5LuI=
X-Google-Smtp-Source: AGHT+IHzAoEeu8+enxX7ao+7LeTaHxL+WNgMdcCKi8aHaLLPvg9jk+Zw2Cmr7KFV7LXAr1xNH9AtHw==
X-Received: by 2002:a05:6a21:328e:b0:1c3:b1e3:eb42 with SMTP id
 adf61e73a8af0-1c4727fb229mr5090622637.15.1721931199870; 
 Thu, 25 Jul 2024 11:13:19 -0700 (PDT)
Received: from localhost ([134.134.139.75]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7a9f884afa2sm1490689a12.44.2024.07.25.11.13.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 11:13:19 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 2/3] lib/igt_fb: add I915_FORMAT_MOD_4_TILED_XE2_CCS
 modifier support
Date: Thu, 25 Jul 2024 21:16:21 +0300
Message-ID: <20240725181622.3457403-3-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240725181622.3457403-1-juhapekka.heikkila@gmail.com>
References: <20240725181622.3457403-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
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

Here is added support for I915_FORMAT_MOD_4_TILED_XE2_CCS modifier
for Intel Xe2 hardware.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/igt_fb.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index ab162a5b7..5bbdbfa72 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -481,6 +481,7 @@ void igt_get_fb_tile_size(int fd, uint64_t modifier, int fb_bpp,
 	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
 	case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
 	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC:
+	case I915_FORMAT_MOD_4_TILED_XE2_CCS:
 		igt_require_intel(fd);
 		if (intel_display_ver(intel_get_drm_devid(fd)) == 2) {
 			*width_ret = 128;
@@ -955,8 +956,11 @@ static uint64_t calc_fb_size(struct igt_fb *fb)
 		size += calc_plane_size(fb, plane);
 	}
 
-	if (is_xe_device(fb->fd))
+	if (is_xe_device(fb->fd)) {
 		size = ALIGN(size, xe_get_default_alignment(fb->fd));
+		if (fb->modifier == I915_FORMAT_MOD_4_TILED_XE2_CCS)
+			size = ALIGN(size, SZ_64K);
+	}
 
 	return size;
 }
@@ -1020,6 +1024,7 @@ uint64_t igt_fb_mod_to_tiling(uint64_t modifier)
 	case I915_FORMAT_MOD_4_TILED_MTL_RC_CCS:
 	case I915_FORMAT_MOD_4_TILED_MTL_MC_CCS:
 	case I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC:
+	case I915_FORMAT_MOD_4_TILED_XE2_CCS:
 		return I915_TILING_4;
 	case I915_FORMAT_MOD_Yf_TILED:
 	case I915_FORMAT_MOD_Yf_TILED_CCS:
@@ -2564,7 +2569,8 @@ static bool use_blitter(const struct igt_fb *fb)
 	if (!blitter_ok(fb))
 		return false;
 
-	return fb->modifier == I915_FORMAT_MOD_4_TILED ||
+	return fb->modifier == I915_FORMAT_MOD_4_TILED_XE2_CCS ||
+	       fb->modifier == I915_FORMAT_MOD_4_TILED ||
 	       fb->modifier == I915_FORMAT_MOD_Y_TILED ||
 	       fb->modifier == I915_FORMAT_MOD_Yf_TILED ||
 	       (is_i915_device(fb->fd) && !gem_has_mappable_ggtt(fb->fd)) ||
@@ -5000,6 +5006,7 @@ const char *igt_fb_modifier_name(uint64_t modifier)
 		return "4";
 	case I915_FORMAT_MOD_4_TILED_MTL_RC_CCS:
 	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
+	case I915_FORMAT_MOD_4_TILED_XE2_CCS:
 		return "4-rc-ccs";
 	case I915_FORMAT_MOD_4_TILED_MTL_MC_CCS:
 	case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
-- 
2.43.2

