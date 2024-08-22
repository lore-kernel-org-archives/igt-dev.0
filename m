Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C910CC52D7C
	for <igt-dev@archiver.kernel.org>; Thu, 22 Aug 2024 11:19:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AF5910E858;
	Thu, 22 Aug 2024 11:19:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EyQpA3m8";
	dkim-atps=neutral
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com
 [209.85.161.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0845A10E86D
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Aug 2024 11:19:20 +0000 (UTC)
Received: by mail-oo1-f53.google.com with SMTP id
 006d021491bc7-5daa93677e1so450388eaf.3
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Aug 2024 04:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724325559; x=1724930359; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ijNhiVjukMTuW1tNiGEdco1xkkjHGOhbF9ToZNWnGZ0=;
 b=EyQpA3m8xePrnlOeHLbtCiMmOM8j8C6a7tPpbAIKmLs89tYtmc7KtXm/jacnkGjTBG
 pagvJ9+jelU1CJJjE1I3o+/0ahtXhmnlUN5XBSmRVpryFyH3hfP0c6s/gzGKg+1orCJR
 fixRhumUlUaGsW2pNg8k592d1yAR0rC65cuhweuAm53gW8LJWfq/t13sDYF/VEF8XtCj
 mIXpd416uuLUtOXWF8lI32bHlotB+H2FTsx4oM0WF0jUrE2CQiPrUqsrrOOZNXXY7Zcr
 9wZDbXvf6APqAFkvC7BMG0k+9DDE9XxKQDz6UaMSUqIc1am1XN427EW5jUtG3ZeT5S6I
 tZIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724325559; x=1724930359;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ijNhiVjukMTuW1tNiGEdco1xkkjHGOhbF9ToZNWnGZ0=;
 b=puLvV6YB0FrgevC3tnz0MVjbqGrgq77eWydEm6k6/vcyUxhX8OOMWmEN+9Sa1ZBPQS
 42S63PmVZFT5yYAR11juCPupQZ9bbter+dGRnbFlBtShi7elGUYBGASOghfSxQb5TNjG
 bwESTY4bnsVGWbn7VwEa2/+JjOQF1laFJk9w9zSwS4uckaB9GuwxB+dWwyrTHOZXEA0u
 ot1F1Bs0g86bsuNQyC0UfhAScVzj8dopWsFHrFcQ5910VBj9kiPNh0UZkwXmK4kZ74Dz
 LmKbyKqGpJdiR2jqfbNieRnxeqw5tLvfbJLa2U+BhaGCRxMxTv2LkaHMv1kvGlKBqgUC
 Ng9w==
X-Gm-Message-State: AOJu0YyZTuUSR2IXHsOHsBoxtyDnCxhPWIC8TxNhMt0HmiYSBx5unjVF
 OPc307ZZSnqKM8BSRLKfvKg25PLyo/Nr2L0F2/oNjQYUoZnAtSyQU/2SY+ExIdI=
X-Google-Smtp-Source: AGHT+IGgvdUz3UXRhjwrHvHPGHwic/l7iSDOFdhMPS/Ra96mO5oE+FNP87aN/NB5fL2EtZ/O8BpG+w==
X-Received: by 2002:a05:6870:b406:b0:260:fb01:5651 with SMTP id
 586e51a60fabf-2737ef0016bmr5159378fac.12.1724325558861; 
 Thu, 22 Aug 2024 04:19:18 -0700 (PDT)
Received: from localhost ([134.134.139.73]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-714340d06c5sm1165671b3a.0.2024.08.22.04.19.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 04:19:18 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t 2/3] lib/igt_fb: add Xe2 ccs modifier support
Date: Thu, 22 Aug 2024 14:22:51 +0300
Message-ID: <20240822112252.4148114-3-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240822112252.4148114-1-juhapekka.heikkila@gmail.com>
References: <20240822112252.4148114-1-juhapekka.heikkila@gmail.com>
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

Here is added support for I915_FORMAT_MOD_4_TILED_BMG_CCS and
I915_FORMAT_MOD_4_TILED_LNL_CCS modifiers for Intel Xe2 hardware.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/igt_fb.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index addff2cfb..b7fc6c346 100644
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

