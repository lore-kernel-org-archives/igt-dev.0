Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 874A5CD5BB1
	for <igt-dev@archiver.kernel.org>; Mon, 25 May 2026 16:42:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B1C210E3BA;
	Mon, 25 May 2026 16:42:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Jp3PoXge";
	dkim-atps=neutral
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 627F210E3DA
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 16:39:35 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-3665a90bcd3so10663586a91.1
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 09:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779727175; x=1780331975; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NzY6OdIzFLoGEDR0Kye72CA1W4Q/GM2SM4qUAa4R+58=;
 b=Jp3PoXgeC/zWXFLQvVh0K4npKB0cynNh3hftCZR5xVjv4JWqLA73moVWvOTkTnNelz
 JoOnhfFDhaaEUSWo0DubKUgrzNP+YxFy2zjWDJR9952WNcDRF5mtgI1ygwFIHCGEkSgQ
 AeWK/vaGhSC2UFgJh1LoHoL/n3yZGLgF4DWvw/IRtimLDWxUpVeqIafS9mL9wNjbbYpq
 FrjGolbz3CcSZEeZn4XiNDkLBhFBI0Hx8DRKkMmnvIur37XUKvHdmSfvqM4f3DFkAD9a
 Ka+qOY8FLlqjUunSsVB0t5wvLDzwXwyWVxiJGg9umkjKfad5CxDp98Tlus9PlHK3ZTzU
 Ns9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779727175; x=1780331975;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NzY6OdIzFLoGEDR0Kye72CA1W4Q/GM2SM4qUAa4R+58=;
 b=JqRHujXw86kZPDFKh40kNenoZ5bLyT5Xtk8trojUY3UFDA3hb48EMZ5QEUaXf+FTVr
 0rPunam3MyKrSmGhgKMKaRYAhhJbssZdRn0GBP8012Sa7TAjVRj2aZgdt3zpJZ2Fmgrs
 B37Cx7IS6ywNCd6IYFqMlbDC8wJBd4JUuwWBG1za+6snTh3wrtSNQEa1wfBQ+8LbZAJb
 jmQsXeER7o/vr+DY5bFDGMQU304157Vsryz2/Zhd5Dh34WD7HJcWfwIOqahCDcwnSm1X
 b6pF4ZipmmneDavOtOuscQampaIB+eLGMRx+/pu0fSyyGeMqF6R4+IScQbSDDQpLfvV1
 pkEA==
X-Gm-Message-State: AOJu0YyKlznvJ/IUyyQGcSc5CcSE/EHBvEedr586amhR+DgSVR32O/fo
 p352Z+YU5nBhPFxsKSfGmbw+jIj0KjGR+AZUIjQubrCzRZNJLOyNO0hE/okV1t1c
X-Gm-Gg: Acq92OHnQHmopKeXU5TDuqd27b/78gHm2+zd1X839RSSqQXqnvHLSA+N0WI9VVoYPIY
 O1E6abho3uzqicxBbat5fL79T8hkSRbE+vJHKdwpL/I+2xulpDGhdtVAAK2+OUAPA5l/WfPB6Y/
 tmaa3q4lHhwdUb8VhNfltX12gLekkUwxPlbKoxtYl8O/+KLUQiYbfBO2ch1MUROVkueMbhpCx+n
 WgdSPWRdOnoybQZio23pAjg52PZ9MYOaZAuvsWoGcYRrzd/EZxDNrtfY6FfAKF4rkJbhCRqN43D
 afl5rmdsh/cwn5gGGE/y8iht/TNoO6PCnhcwY2gmlKNz9EqHohKoFlCn4oHfFNmoygimV4RocxJ
 xjVVBGdQgzM/Fs0O8mW8+kxdh3hTIS7jTA0Dl7diKyJ8VnHliMMt6yr3e6f/S02fcPRDHy5wj7c
 62FR+mFS4aTmC4axQVi3FQqQ6Wp4YAS9pAS3uNCEhFPie0NffhjncqvUeGwAmECw==
X-Received: by 2002:a17:90b:358f:b0:36a:a62e:e50d with SMTP id
 98e67ed59e1d1-36aa62ef235mr6044622a91.6.1779727174857; 
 Mon, 25 May 2026 09:39:34 -0700 (PDT)
Received: from localhost ([134.134.137.76]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36a723cfb57sm13534641a91.15.2026.05.25.09.39.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2026 09:39:34 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 8/9] lib/igt_fb: on Intel Xe force Vebox copy on yuv
 formats
Date: Mon, 25 May 2026 19:38:49 +0300
Message-ID: <20260525163850.3493602-9-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260525163850.3493602-1-juhapekka.heikkila@gmail.com>
References: <20260525163850.3493602-1-juhapekka.heikkila@gmail.com>
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

