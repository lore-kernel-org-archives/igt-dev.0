Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F76CD5BC8
	for <igt-dev@archiver.kernel.org>; Tue, 26 May 2026 14:46:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9B8810E6D6;
	Tue, 26 May 2026 14:46:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RXKx/G7P";
	dkim-atps=neutral
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com
 [74.125.82.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F56210E012
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 14:44:31 +0000 (UTC)
Received: by mail-dy1-f176.google.com with SMTP id
 5a478bee46e88-2f0ad52830cso13557546eec.1
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 07:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779806671; x=1780411471; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NzY6OdIzFLoGEDR0Kye72CA1W4Q/GM2SM4qUAa4R+58=;
 b=RXKx/G7PHsrfuOQxxkGgk9h+oWflUOXFqiVVxxIzdxgRZ0IhvrtTD+98G3x3hvcCk6
 v9y19kO+FpLRlh9txCfHnT3YQIuWHmimZ1KZKtijxdt++FkkBR6o/HRrZasN9+uUCVb4
 CndPtHwPBSoGoeqcuG1KuQkoVvBgojHG6+WQ+j8/08+g+Wzls1soGxIjmpiujm/s1vST
 T6npV93JJAYf/KZZv20PlaKMl1s7kQkN7Q3lFBlFRrQhnDmlAIhGKTSI+/g4x5eR8KcG
 /FStv4PqHre2GNHRUS4LdYpIH2DIxMDhalsz01cc5XFCPsZDN8fPR7MvlwIfVEs3WywX
 IsIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779806671; x=1780411471;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NzY6OdIzFLoGEDR0Kye72CA1W4Q/GM2SM4qUAa4R+58=;
 b=OOOfPG6neUbspU/LXLPLfjifxMgDXfY2Za9cQvNHwxhHw3gps8qLjD+dM8sd17YWUl
 ZnpwIuiYKkCF2Wj7usEbOgOI3UqC3/CL0OAhhTWu7jJ2XNy39I3VXO5LthVoJ02Ao0Ym
 YQGLnePOHtUO3+tHfq6C7lydu5fq5yQ/oePOOLTzeylQdBMosjn00VnZ56BoEkfUz9l7
 DANdwGQpnoWe+toO7yWz/hpIwgZzq70o/5y2yU+Qczkwae/1RRUIG19PGLnWz8Y8PbA2
 VhNB8FqBOdogPhvyDxk2qWj1cb7T3OXT7qHst7j8G+6oZaa1pkmCFmDm+7d+7w9v/fLa
 SVcQ==
X-Gm-Message-State: AOJu0Yyit+D3NrgZrn1nTSIkZb0IYmoPH1F81ENo5QJLKyuLeIr953Ro
 4fPQVzxqtKDDmVJ3Qevv8iVce94Xg+HywImTRVUT8I/Ayi3niEc9ocGUSB2k1KWz
X-Gm-Gg: Acq92OEDv1cWclvv9gGxXjIChmOJH5LInOkOhKOaCk36/KX4QkePtfxAkVtzOQOWMGb
 qw1DQgXhTacGTeEHCRjuK0bg0c+AzuJ50elgF9kIiRiYiuRLUXqm+X+c2AIHj+o/P02S4F5BoZJ
 LEdP628/uYHtrPHL23a+NccbVPfOK5Zy2k52UXeY2NZnq8SElmHUK4JRrMHs4YoNEToCZh3PFoR
 p3lhTvtbopCcvaGMJNYb98uTbTtQIltKMCCtQMLpbVQji933ts1o9dEwVsqrrMv9F9SzUvXa9iC
 9SbmAxBWuTqJLR+sKVe2FPnJjRPN9er5XNhh7OPFFOZIZryhGw8nDvm5GsmO/SojnhLTT7qCOjz
 VQT7+2yh5xUlq7fRCTmXqupMhf9Lv//WpCq9N80FAaNxJkZs6d71TtZbs4u8ufZRh0sqG+/zqGK
 c9s7MKxrEx8CjXjlkFm59y1LJ/LK3XOKaIIGRwv+3yzn3U74TZUopC9QPCRfI=
X-Received: by 2002:a05:7300:6d07:b0:304:9b48:53c8 with SMTP id
 5a478bee46e88-3049b485794mr2340153eec.2.1779806670387; 
 Tue, 26 May 2026 07:44:30 -0700 (PDT)
Received: from localhost ([192.55.54.47]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-304522547fesm10861893eec.21.2026.05.26.07.44.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 07:44:29 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 8/9] lib/igt_fb: on Intel Xe force Vebox copy on yuv
 formats
Date: Tue, 26 May 2026 17:43:42 +0300
Message-ID: <20260526144343.2531299-9-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526144343.2531299-1-juhapekka.heikkila@gmail.com>
References: <20260526144343.2531299-1-juhapekka.heikkila@gmail.com>
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

This is to test Vebox engine along with other engines. Vebox is
forced to be used when use tile4 needing tile convert and pixel
format is yuv.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/igt_fb.c | 36 ++++++++++++++++++++++++++----------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 44d2ff89e..e623b2f64 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2632,6 +2632,24 @@ static bool block_copy_ok(const struct igt_fb *fb)
 					       fb_tile_to_blt_tile(fb->modifier));
 }
 
+static bool use_vebox_copy(const struct igt_fb *src_fb,
+			   const struct igt_fb *dst_fb)
+{
+	/* TODO:
+	 * X-Tile will need to be fixed for Vebox engine on
+	 * Xe2+ devices
+	 */
+	bool vebox_fix = (is_xe_device(src_fb->fd) &&
+		HAS_4TILE(intel_get_drm_devid(src_fb->fd))) ?
+		(src_fb->modifier == I915_FORMAT_MOD_4_TILED ||
+		 dst_fb->modifier == I915_FORMAT_MOD_4_TILED) : true;
+
+	return (igt_fb_is_gen12_mc_ccs_modifier(dst_fb->modifier) ||
+		igt_format_is_yuv(src_fb->drm_format) ||
+		igt_format_is_yuv(dst_fb->drm_format)) &&
+		vebox_fix;
+}
+
 static bool ccs_needs_enginecopy(const struct igt_fb *fb)
 {
 	if (igt_fb_is_gen12_rc_ccs_cc_modifier(fb->modifier))
@@ -2660,8 +2678,9 @@ static bool blitter_ok(const struct igt_fb *fb)
 	    is_xe_device(fb->fd))
 		return false;
 
+	/* use blitter on xe device except 4tile yuv where utilize vebox */
 	if (is_xe_device(fb->fd))
-		return true;
+		return !use_vebox_copy(fb, fb);
 
 	for (int i = 0; i < fb->num_planes; i++) {
 		int width = fb->plane_width[i];
@@ -2700,6 +2719,12 @@ static bool use_enginecopy(const struct igt_fb *fb)
 	if (ccs_needs_enginecopy(fb))
 		return true;
 
+	/*
+	 * This is to utilize Vebox for testing
+	 */
+	if (use_vebox_copy(fb, fb))
+		return true;
+
 	return fb->modifier == I915_FORMAT_MOD_Yf_TILED ||
 		fb->modifier == I915_FORMAT_MOD_X_TILED;
 }
@@ -2910,15 +2935,6 @@ static void fini_buf(struct intel_buf *buf)
 	intel_buf_destroy(buf);
 }
 
-static bool use_vebox_copy(const struct igt_fb *src_fb,
-			   const struct igt_fb *dst_fb)
-{
-
-	return igt_fb_is_gen12_mc_ccs_modifier(dst_fb->modifier) ||
-	       igt_format_is_yuv(src_fb->drm_format) ||
-	       igt_format_is_yuv(dst_fb->drm_format);
-}
-
 /**
  * copy_with_engine:
  * @blit: context for the copy operation
-- 
2.43.0

