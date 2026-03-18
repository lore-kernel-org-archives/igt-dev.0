Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F9B8103E195
	for <igt-dev@archiver.kernel.org>; Wed, 18 Mar 2026 15:06:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B65C610E859;
	Wed, 18 Mar 2026 15:06:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="b/M7YdQy";
	dkim-atps=neutral
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0241710E859
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 15:06:30 +0000 (UTC)
Received: by mail-dl1-f44.google.com with SMTP id
 a92af1059eb24-12776bebe9fso51693c88.1
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 08:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773846389; x=1774451189; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iTN18uNNxN5eTT0AlJiQrydpYsuWh21p6BXtk3iw0DA=;
 b=b/M7YdQyf5GqDeGyy1n0hldSWiEIyMmCM5Ni871WDqyBuJ5Bap3vZdrGpxViin+icR
 QSQEsXSkKc2DO5xU+lF44ijUMgsdK+U4/bkadOVh0bnff1CySlhr6B9c24wp2EEXj+Ye
 H6mQb9DCFAA6w4TAlZ3DKNpsAChvpLGrMbPel3rwxV9jEJpAwxzmAs//Evhta/i0zk4k
 5JeCoSI7bnm9t81IbO9bkukFeo2g478oGyMW78pnBk0EV4dIYae8T5SfA4J6bZ53+f4A
 cYWhABC6KWojR9YRbKdyby7tlvQ6Llgcgo8A9eG7QGNINof7KcFJB5YvWKcJN1ep3UDq
 uO6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773846389; x=1774451189;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=iTN18uNNxN5eTT0AlJiQrydpYsuWh21p6BXtk3iw0DA=;
 b=SZ4swoYWlvPDx/uhl7LLs29BDWcSsyYTuP0mUWJEksSBplUWBleyVHEgzJnINpoezU
 qwHImhpG6cEVAaA1RZ6b0AEXdr+9K2nwMwKBzBX0bQPZBWjyt2005jzHzIk7SHlOIDOy
 +nCnB8YV3FaLCZ75ERlhk5Sj8cuTpzdpG0fUv7HgYOZ31OLA4d4S+qErBXk6L6cSLYjt
 b5sReZFrPPxQIBiVLrEjh6qJAd0g6QGcceXsL+B2sX3JdNoDNTH+T2plmlsPjfMLFNs9
 TSP83XW6SLaM392xN/J1L9p2oOaEMCyBZuaxNYXzvWHnXYZMTXfEnkS4SS9rhlvdRRGK
 XrDw==
X-Gm-Message-State: AOJu0Yz01pjm9u0eAT8yiQVnmGjwmC8MjAFs7WaaQjR8fEzBeQRjbiaC
 8Q8yVS4thtbeZmmZ2V9g8RFPrpzv1YvpcYStHq6Rio4cQLL1Q2v4F7k5oZ8KY+T8
X-Gm-Gg: ATEYQzzI6JTwd54xOJxmkc1FT+pUnZDVDvTVPgL0MS+AorXInBxMj4AroCvYFNoIqvW
 J4wvIErObTDzqDIzGQl5Ng5Uj0xBU6OJf0sZRFUdHH/EbBO5CwOWlu1vwI2llb7Gnxm5KKthFAf
 cqphhE+jCka9hFOeQcdq809hBETtUrcq7XMchNtrhs92twLenGiEE64q9mXhgYR1kRSoU2XP6xb
 l0ehIMuAqBdPf2B5Pg9b66ZJTyYGF95EFhxFGFWONP505aJC6ae5bsgJh9tRw7Tgy1tHeusmmJO
 oM2DVN0BuSObA21dfNcahICSv5ZGFbG3B/wcJXwoJR8f0Arr8g/0wGODuIyyXyATgYVy9vAOJLz
 Wjr8S6vrecUvRvi569JewtPOrZk5Ye02tEw0pccL9JzdMbw0oYSh3f2pcMatUXUExLN45/GMopb
 j0bJB/yqwlj1nO18Uj79RNe/beFrOsyqtaUI2/4sSr5gbnHvTOktPqE0oEdYRl
X-Received: by 2002:a05:693c:2c04:b0:2c0:d9e6:7ebc with SMTP id
 5a478bee46e88-2c0e50a9192mr1943369eec.16.1773846388791; 
 Wed, 18 Mar 2026 08:06:28 -0700 (PDT)
Received: from localhost ([192.55.54.45]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2c0e536893fsm4154883eec.2.2026.03.18.08.06.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2026 08:06:28 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 8/8] lib/igt_fb: on Intel Xe force Vebox copy on yuv
 formats
Date: Wed, 18 Mar 2026 17:05:17 +0200
Message-ID: <20260318150517.4049206-9-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260318150517.4049206-1-juhapekka.heikkila@gmail.com>
References: <20260318150517.4049206-1-juhapekka.heikkila@gmail.com>
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
 lib/igt_fb.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index cfd5d66fb..f3094a8ad 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2596,6 +2596,19 @@ static bool block_copy_ok(const struct igt_fb *fb)
 					       fb_tile_to_blt_tile(fb->modifier));
 }
 
+static bool use_vebox_copy(const struct igt_fb *src_fb,
+			   const struct igt_fb *dst_fb)
+{
+	return (is_i915_device(src_fb->fd) &&
+		(igt_fb_is_gen12_mc_ccs_modifier(dst_fb->modifier) ||
+		 igt_format_is_yuv(src_fb->drm_format) ||
+		 igt_format_is_yuv(dst_fb->drm_format))) ||
+	       (is_xe_device(src_fb->fd) &&
+		(dst_fb->modifier == I915_FORMAT_MOD_4_TILED ||
+		 src_fb->modifier == I915_FORMAT_MOD_4_TILED) &&
+		 igt_format_is_yuv(dst_fb->drm_format));
+}
+
 static bool ccs_needs_enginecopy(const struct igt_fb *fb)
 {
 	if (igt_fb_is_gen12_rc_ccs_cc_modifier(fb->modifier))
@@ -2624,8 +2637,9 @@ static bool blitter_ok(const struct igt_fb *fb)
 	    is_xe_device(fb->fd))
 		return false;
 
+	/* use blitter on xe device except 4tile yuv where utilize vebox */
 	if (is_xe_device(fb->fd))
-		return true;
+		return !use_vebox_copy(fb, fb);
 
 	for (int i = 0; i < fb->num_planes; i++) {
 		int width = fb->plane_width[i];
@@ -2664,6 +2678,12 @@ static bool use_enginecopy(const struct igt_fb *fb)
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
@@ -2874,15 +2894,6 @@ static void fini_buf(struct intel_buf *buf)
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

