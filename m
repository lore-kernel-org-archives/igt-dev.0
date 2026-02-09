Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A77CE7E0BC
	for <igt-dev@archiver.kernel.org>; Mon,  9 Feb 2026 16:32:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E01F810E434;
	Mon,  9 Feb 2026 16:32:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BIPQOU6n";
	dkim-atps=neutral
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A999010E439
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Feb 2026 16:32:57 +0000 (UTC)
Received: by mail-dl1-f48.google.com with SMTP id
 a92af1059eb24-1233c155a42so5589477c88.1
 for <igt-dev@lists.freedesktop.org>; Mon, 09 Feb 2026 08:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770654777; x=1771259577; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GQh5+rsf4DaykYrV9NH0Jiv0RMDBgbldZZ5mjuISJUw=;
 b=BIPQOU6n1XGOmdd189y12e8E8Dw00AwJ6pL/DBSwQGgg7mM3vK9BNz1xxnNsnZd8i6
 bKoQKpQECIwiuEwJyyOfKv9dgwveVXx4aa5PO49jHDVnw/LiPcFcBxJuwmQOWlha8AMJ
 PxeejYLD0Phlgr7MW2rJbAhOzNLyDb0DZ0Bf9abXjWsgYJ4HUpViHqtQKmFGU6Y8aPXO
 ldycwFpFbGEJMV4u6a85GfyHmV7YuVizhG+ePjidgA67jxYvF3qlaxlMivxnPhDaJOxP
 N071Tx5TxrjtcEqCnodRrFU7mYHV+lq5XMF1MBXzLvKxD9E2lpEQ976B+qrY0N7hVKpi
 QuTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770654777; x=1771259577;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GQh5+rsf4DaykYrV9NH0Jiv0RMDBgbldZZ5mjuISJUw=;
 b=jcALNIWBNQILijPDdE4MOmaGmxHpENl5jEBW0rrxNokfkD+XbmxSZKKgQja6GGoT3P
 aHwS+9XkFR50nqCZIufwXptPlwV63x0Txe7X25q+tbI0RNX65yDQGdX2w22fW4LNk/lH
 cLeKgSJ1IWJ0SeXwO+Al1GFiW5Nmm/W3BOA3afPiJjsM7woG2RrfwT5Nwc+PzO86lVw8
 Gb8dwYs0HJNM+XDghrG6w2AxOgpDRfT6jJgtOkxfrmdmIl17rpDQ8MMWo1d2puPA6U2j
 jpQZgfc3JHZhxveZ03flxNOWbsf/s8DVNohRowLhamI+3od4ho4jk1owWr3iXPpA9nIm
 kuPQ==
X-Gm-Message-State: AOJu0YyGaMlhlL6Z7ma96jRWQZtTdFsAYFk1S9F6aF+544Ejpok1QeQ9
 3lzM6VALigB41dQswxgEvwoy+d7mKE93aroiTNvZQmScSHpHt13ANsvBbP9RZE5Y
X-Gm-Gg: AZuq6aKM3EMovdMYZfbKg+lGgxOLUisdLpYJYw7iLs2R9XVioB4sIO7RtAnMNF0QHtU
 txZy0qC5lJGz2FJ3w2MJtlGYYvWce/2SShqreLXBfwc52oZVh6BeN9oXiShUKCW4nmEYZimtecy
 ebhURfw7+L3DsWMYU+yoyBnura18IefTgDGMi/xEe1HhEFZ3kjaC+cdDvMm8MtXPpxF7E3/UVjQ
 mgLFHUrnOBSrMUQoj53HLdtW7Trg7ch1Pv7vMV42y6BJxkFUks8E0w5LuzP9CS/B+OFUuzbuRvP
 HOIPzI09fIYR0tyrftqQL4OWJEjlc/5o6kyO9/xuWtfdFB4Aqq0XLaQLJIoHL5nYCM2Osq4U3m0
 hhB41GE7KDXekF2m+2GEQL5mcD6ABDLlg4RnuCXIuLE2ZrqXokUfPuGM1HDxJes2ktpjAvSwq2/
 PepvDfBpNIP9Ye0L1LN3yo45l2A0H2QA1YyNiR4L1joGEkE+Qh
X-Received: by 2002:a05:7022:920:b0:11d:f44d:401d with SMTP id
 a92af1059eb24-12704002359mr5432738c88.22.1770654776520; 
 Mon, 09 Feb 2026 08:32:56 -0800 (PST)
Received: from localhost ([192.55.54.41]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-12717d89610sm3915132c88.16.2026.02.09.08.32.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Feb 2026 08:32:56 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 7/7] lib/igt_fb: on Intel force Vebox copy on yuv formats
Date: Mon,  9 Feb 2026 18:32:13 +0200
Message-ID: <20260209163213.1483598-8-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260209163213.1483598-1-juhapekka.heikkila@gmail.com>
References: <20260209163213.1483598-1-juhapekka.heikkila@gmail.com>
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

This is to test Vebox engine along with other engines

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/igt_fb.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index cfd5d66fb..728c8cf71 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2596,6 +2596,14 @@ static bool block_copy_ok(const struct igt_fb *fb)
 					       fb_tile_to_blt_tile(fb->modifier));
 }
 
+static bool use_vebox_copy(const struct igt_fb *src_fb,
+			   const struct igt_fb *dst_fb)
+{
+	return igt_fb_is_gen12_mc_ccs_modifier(dst_fb->modifier) ||
+		igt_format_is_yuv(src_fb->drm_format) ||
+		igt_format_is_yuv(dst_fb->drm_format);
+}
+
 static bool ccs_needs_enginecopy(const struct igt_fb *fb)
 {
 	if (igt_fb_is_gen12_rc_ccs_cc_modifier(fb->modifier))
@@ -2624,6 +2632,12 @@ static bool blitter_ok(const struct igt_fb *fb)
 	    is_xe_device(fb->fd))
 		return false;
 
+	/*
+	 * This is to utilize Vebox for testing
+	 */
+	if (use_vebox_copy(fb, fb))
+		return false;
+
 	if (is_xe_device(fb->fd))
 		return true;
 
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

