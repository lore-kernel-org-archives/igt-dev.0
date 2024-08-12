Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 530E2C52D7C
	for <igt-dev@archiver.kernel.org>; Mon, 12 Aug 2024 20:07:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F21A910E2A1;
	Mon, 12 Aug 2024 20:07:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="S9MR2I4y";
	dkim-atps=neutral
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com
 [209.85.160.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9BE010E2A1
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Aug 2024 20:07:52 +0000 (UTC)
Received: by mail-oa1-f50.google.com with SMTP id
 586e51a60fabf-268a9645e72so3403469fac.1
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Aug 2024 13:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723493272; x=1724098072; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=58oiFsVSqOaDVlRFMmB4XOfII9uXuvsRKG9cuikJZR0=;
 b=S9MR2I4yXFyQPi8urmz0glHmRhB1ILyosND9DXNEqir6WrG9aGC4B4IESCwzDcly9c
 KPpjR3S0FvDUrVDuMfc5R6YDsSksra4IJcO7QefwXKOeQi9H67OZukSMxUEqaeOrk3oX
 UDzn23ngSUSVS1t6xtA0CTM9vjbunRjvRg74aXaPloe7D0UFTUFOK6K3QKNbRdX4mvln
 x410a7IVkgVjeNpkHpEqdwzylo5QKFQQgYEisJd5OsYBPMldRkPb5t91T4ZwVWwglxko
 J8JiTFkBrd4zwT73fzkh9xu+39ntH13KyXvzOYLQrmawDhONCiP1fVNnYW6pvdD9vzDy
 8kLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723493272; x=1724098072;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=58oiFsVSqOaDVlRFMmB4XOfII9uXuvsRKG9cuikJZR0=;
 b=i9MXePBhv7fRo1OHkrirrITXnPa0Xo1FVTS2UB0QsZdPqiUDKHsubKFSEtMeM/Jpo3
 ++LXfdd/BobHhjy+841sTdtifa2YWrXWTo0bKJBpqktKxwlTbqW6RZuiwkUMQcMhivM5
 1RkDfX2npHR1s6nfFlk0wyhDL9iduxuyjiMGuQMU0y/kTVEzadEMyJdGqaKOksxthUOZ
 NMDPmxgMetsxZC2eCkqSXDYHzUMHcJQjm0fC13hUTpoEqmx2ZEcaCTmwH+5+YB1igzH3
 mnt9pa3LSe0iXJgiHsb8C0f1Hl+KVYJasDA46s7SXO5r6bI2DFjhN8qhCeq0bQuPVIx0
 N4Tg==
X-Gm-Message-State: AOJu0YyXRsma9YQshFapFrR9iQW/VHTU87zbVAPzY44qb726Q+cl7zaG
 Xci3RN7sXAa8X9nea1nHbwrLertUGJiNFp8gl+fXHA6qFXjJ3x7tg3S2ODHOsug=
X-Google-Smtp-Source: AGHT+IEfgx0ooZmUWmeXaDv8ylthtxUjk8kdTkAfjEXDXomF2kWtXaPHRYnOWrsesWkqxRszprN3NA==
X-Received: by 2002:a05:6870:1701:b0:25e:14e9:10c9 with SMTP id
 586e51a60fabf-26fcb6516cfmr1550952fac.6.1723493271855; 
 Mon, 12 Aug 2024 13:07:51 -0700 (PDT)
Received: from localhost ([134.134.137.76]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-710e8f53032sm4165585b3a.70.2024.08.12.13.07.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Aug 2024 13:07:51 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 2/3] lib/igt_fb: add Xe2 ccs modifier support
Date: Mon, 12 Aug 2024 23:11:23 +0300
Message-ID: <20240812201124.2013652-3-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240812201124.2013652-1-juhapekka.heikkila@gmail.com>
References: <20240812201124.2013652-1-juhapekka.heikkila@gmail.com>
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

Here is added support for I915_FORMAT_MOD_4_TILED_BMG_CCS and
I915_FORMAT_MOD_4_TILED_LNL_CCS modifiers for Intel Xe2 hardware.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/igt_fb.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index ab162a5b7..50b4ee5a3 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -481,6 +481,8 @@ void igt_get_fb_tile_size(int fd, uint64_t modifier, int fb_bpp,
 	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
 	case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
 	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC:
+	case I915_FORMAT_MOD_4_TILED_BMG_CCS:
+	case I915_FORMAT_MOD_4_TILED_LNL_CCS:
 		igt_require_intel(fd);
 		if (intel_display_ver(intel_get_drm_devid(fd)) == 2) {
 			*width_ret = 128;
@@ -955,8 +957,11 @@ static uint64_t calc_fb_size(struct igt_fb *fb)
 		size += calc_plane_size(fb, plane);
 	}
 
-	if (is_xe_device(fb->fd))
+	if (is_xe_device(fb->fd)) {
 		size = ALIGN(size, xe_get_default_alignment(fb->fd));
+		if (fb->modifier == I915_FORMAT_MOD_4_TILED_BMG_CCS)
+			size = ALIGN(size, SZ_64K);
+	}
 
 	return size;
 }
@@ -1020,6 +1025,8 @@ uint64_t igt_fb_mod_to_tiling(uint64_t modifier)
 	case I915_FORMAT_MOD_4_TILED_MTL_RC_CCS:
 	case I915_FORMAT_MOD_4_TILED_MTL_MC_CCS:
 	case I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC:
+	case I915_FORMAT_MOD_4_TILED_BMG_CCS:
+	case I915_FORMAT_MOD_4_TILED_LNL_CCS:
 		return I915_TILING_4;
 	case I915_FORMAT_MOD_Yf_TILED:
 	case I915_FORMAT_MOD_Yf_TILED_CCS:
@@ -2564,7 +2571,9 @@ static bool use_blitter(const struct igt_fb *fb)
 	if (!blitter_ok(fb))
 		return false;
 
-	return fb->modifier == I915_FORMAT_MOD_4_TILED ||
+	return fb->modifier == I915_FORMAT_MOD_4_TILED_BMG_CCS ||
+	       fb->modifier == I915_FORMAT_MOD_4_TILED_LNL_CCS ||
+	       fb->modifier == I915_FORMAT_MOD_4_TILED ||
 	       fb->modifier == I915_FORMAT_MOD_Y_TILED ||
 	       fb->modifier == I915_FORMAT_MOD_Yf_TILED ||
 	       (is_i915_device(fb->fd) && !gem_has_mappable_ggtt(fb->fd)) ||
@@ -5000,6 +5009,8 @@ const char *igt_fb_modifier_name(uint64_t modifier)
 		return "4";
 	case I915_FORMAT_MOD_4_TILED_MTL_RC_CCS:
 	case I915_FORMAT_MOD_4_TILED_DG2_RC_CCS:
+	case I915_FORMAT_MOD_4_TILED_BMG_CCS:
+	case I915_FORMAT_MOD_4_TILED_LNL_CCS:
 		return "4-rc-ccs";
 	case I915_FORMAT_MOD_4_TILED_MTL_MC_CCS:
 	case I915_FORMAT_MOD_4_TILED_DG2_MC_CCS:
-- 
2.45.2

