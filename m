Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C97A105F7A6
	for <igt-dev@archiver.kernel.org>; Fri, 13 Mar 2026 13:53:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 086A510E041;
	Fri, 13 Mar 2026 13:53:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="U8L4fRgH";
	dkim-atps=neutral
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com
 [74.125.82.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E96810E041
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Mar 2026 13:52:58 +0000 (UTC)
Received: by mail-dy1-f182.google.com with SMTP id
 5a478bee46e88-2bea8220c38so1560293eec.1
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Mar 2026 06:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773409978; x=1774014778; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uf9z1AtBUgv7hEo/ujZburcdlk7WaWM6HhieXA4rmn0=;
 b=U8L4fRgH/rJ7CHzLKkk6Ptn35Eus4aeFn5sWufaUU2tmjAWOZn25YeXZfhnogWjnuG
 MV9c1V8exo0cDAfBdtL19bX+qMMG3GbMXTWmdZMI9wtXX/SIFHRDi+UF7qpaPCoCR3yY
 QmNS92xzn23j8gAWZdKRYwr+xihF/hy83bj26hpuFQsgbDBntXAs0Yh0QSAxBvT/9Agt
 UCvyJsBzf9ookA4vpgyBBYz2/qL3CYwcSX4Vo92uSZp6HiO468fc2rzTqjeIaD2K79tx
 70rSd9V/PTyAY0Hsu+kbvAmUQtSVE7HZGEo5RIdiygHgW3HGc7m/OsbJUPKj9XcjcWyr
 3+pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773409978; x=1774014778;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uf9z1AtBUgv7hEo/ujZburcdlk7WaWM6HhieXA4rmn0=;
 b=QK0XvpJx6a/v9v1OhLc6ZOziSwvEq31SVTxC5900aMnSr1NEFI9VLpocb8FNB21dKC
 B4ZpGA/TIOAncIVUOBBGY4XQOjpeGTD/sHPojmGd9Jkl3TIcga4FG3Eb1CPV8SLhv1kA
 8N/eK3IGpi2TlagbTIF2cHRJU7+p7Uy5CzZkdyp5bPqbMkrgl0s8pRmFUHpmp6c4olg2
 kLx5wLjbiHZe4y8Men4wbcB9LGYgvXasONaEPBzCF0cxu+8r3cAsuP87SNbPNn5L4IcN
 BYN7BmtaT2aFTHjxkK1fFg8GDcsf63x/6Ml8PmFxjlNXuGOr7YlsM5I8PMu+DTDEWfNQ
 JOPQ==
X-Gm-Message-State: AOJu0YzBsWARvGIEmdT+Jpt7589HN3dFuHrDe/YdSdKp9dJeTK0arQDF
 8+e4AaffbvXDDt7k/FelBhaewaoG0XxqZYbAc4WYLmL3WbzBVfhXG0edRXqQ+A8t
X-Gm-Gg: ATEYQzwYayEZ1jtguOPtnmDjgl94R/zs4YHJDoF9BBI4KEnaJwpv9+rvqUmw8Eb/Dga
 APo/QFa0aJlvFDCkN38VrA0BM4ktvzsFL16smzDFvH+YvOA2wdDnwCefgE25hGU3g2VIrxPBlU2
 +89eQZOsmRTNQotpMrw9Te8kyc0oHMvMcM3M/VBY0Es+ReGp5Zh6JfS+ynguQB/f03FTuUFi/FG
 gyhYxoDwBY98YqKrJMQ2lgmo/kgFWVfhC/sm1m70gjp8VEKtT/F91zHT2FUFBKrraSYVsKTzjtu
 HTyfcPE7XaomIAcKJTyy9L/VvwYGJCmhGQGAwTv+OpyZbRdH4u/4/8QZXix9nxi6fsC573Y2O/q
 6s8RS98yE/adhKvnXP9AzTiOL9aLpo77OXaBbuoM8peb7BqMu135zFT1HwocimkfMndplQJXvyk
 Y7YCyd8yXo6UAmLs0+4D3ugfh1Lqakw0lMTlTkaMW0nMKs8xtbbCesENNoDhU=
X-Received: by 2002:a05:7300:d513:b0:2be:1dc7:999a with SMTP id
 5a478bee46e88-2bea5401bf0mr1715296eec.4.1773409975885; 
 Fri, 13 Mar 2026 06:52:55 -0700 (PDT)
Received: from localhost ([192.55.54.43]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2beab555846sm2494290eec.23.2026.03.13.06.52.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2026 06:52:55 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 8/8] lib/igt_fb: on Intel Xe force Vebox copy on yuv
 formats
Date: Fri, 13 Mar 2026 15:52:03 +0200
Message-ID: <20260313135203.1782240-9-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313135203.1782240-1-juhapekka.heikkila@gmail.com>
References: <20260313135203.1782240-1-juhapekka.heikkila@gmail.com>
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
 lib/igt_fb.c | 34 +++++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index cfd5d66fb..766d163e5 100644
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
@@ -2624,6 +2637,12 @@ static bool blitter_ok(const struct igt_fb *fb)
 	    is_xe_device(fb->fd))
 		return false;
 
+	/*
+	 * This is to utilize Vebox engine for testing on Xe driver.
+	 */
+	if (use_vebox_copy(fb, fb) && fb->modifier != DRM_FORMAT_MOD_NONE)
+		return false;
+
 	if (is_xe_device(fb->fd))
 		return true;
 
@@ -2664,6 +2683,12 @@ static bool use_enginecopy(const struct igt_fb *fb)
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
@@ -2874,15 +2899,6 @@ static void fini_buf(struct intel_buf *buf)
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

