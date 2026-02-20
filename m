Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF342C5ACD1
	for <igt-dev@archiver.kernel.org>; Fri, 20 Feb 2026 16:18:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6100410E813;
	Fri, 20 Feb 2026 16:18:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FQUdOZlx";
	dkim-atps=neutral
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com
 [74.125.82.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B014710E813
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 16:18:18 +0000 (UTC)
Received: by mail-dy1-f178.google.com with SMTP id
 5a478bee46e88-2baab3137bcso1989152eec.0
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 08:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771604298; x=1772209098; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oO8mBGHpRyngL6KZoGrDi19Ji1jFcGe9Y2PnTJL7pTE=;
 b=FQUdOZlxiFbV8aAH3/RV/w677vt7k1fBwGXrzAQesOk/p3sjk5GKvq7IH15RVB7uVC
 fFAW+x1bDQSheF8ucT7RTsgvDj5V8wOQBS50a6jMAXfWSGUASyMSlW3Gw6uPrczozMD0
 nqhvxOfafnNgLujEO5kdRPfDfwrmoN2UH15GkZM/yjgxOLdSIAAny/BvPJqQKzFkDQJZ
 3ujV15oRQ9E0pyFsAIVoxmGRYj+PKbjZHB2F9XlcotWE5aFRvfS2kwKK72sIYpbEtRe0
 pr11J5Rl58RkKRtrYBo3KR6lQei2h5Y+ixa49LpOYFtibeYWacBmOT/2EnstqOvIj0Ct
 yzDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771604298; x=1772209098;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=oO8mBGHpRyngL6KZoGrDi19Ji1jFcGe9Y2PnTJL7pTE=;
 b=FaFZWMBqPv84Ry1jMQGStcuiP6kCjHpKZiaSHbV/oVcrhK//aWoB1+J/sdQbm8kjsX
 LFkHFF+t/X6aN8p8ASCXc7zNMBQNSx8STLjY08F/5ldXk1nYjleAQUYBYP4zxy4awzf2
 xiEJVx6FqjYVKee45SRBaF9CpB0rcDVNsIBDHF5fjNbZn+ZoiviYhTaFS/TioePicVkr
 EILhDmqld3c+Ki8WJ5YOB5GM5OhEZqClBseIULh90s3Hd3HWM7tt5BYo/WTHYD81T2xm
 v35XU0KhCrZPtGGf6QuLzZg1XapBTD6odHQuUaqGfAMt266KVPC4XT1JmmOJEqqVghhk
 ZvZg==
X-Gm-Message-State: AOJu0YwzOph3Ex5h3gVCtnttBotfutQDkiXV+Y+jlwOcpW0oObv7quw8
 nvkW1ueVZws23rCaPWvvQu9vglDglm6tn5/2iP1V/pgwf97BSq/rTREJ8fz2mvXk
X-Gm-Gg: AZuq6aK3EoX8ZvgBshZQICM5Onn0CG44VlXpUftoG0e3qpwMxcwtKC1r+YFLBJZmWAK
 GNkzvngUGiM1jNfSqMH9Qf1G2UEeJVijA4PgbkRMeptlq4eBmOtFWZTd26XZTB6kJKP9A8cI+AV
 9+ufeC2AUxD+Vcm4+Iswh9INbiP84mLdIbjCDF+AuYc8iyb41nqcR3sU00Gpv3b0qoLDak8aC9P
 jFBD93XbyCU1RjVDdZ80FOMFHL0LpYh/H27SC1o/mimr5cHBBJ7XdWy8tVrEaSm+IfWb6Bbtg6P
 AUh8DeGBgdT3IdMPiiO3ReZjb+kLeyc/7S/OWpcxGcyT4bFzS6m7TrRiXhOXJVYrnV4tkPZ8Lv8
 0ftDS9B3JnWTw5oA6s1HMIa8d+Lo/8TWhYmN8NjpUPIr7vOpdYEuLpnil6/Qel59xkcmLufo9MN
 I5wAD35w3E5/iBkPMNs1hytdQ758M07imHy/1x2DVhy52rtg518GVOKhV1fLIPZoxVufUI0w==
X-Received: by 2002:a05:7300:8ca2:b0:2ba:9115:2fab with SMTP id
 5a478bee46e88-2bd7baea60emr66985eec.12.1771604297445; 
 Fri, 20 Feb 2026 08:18:17 -0800 (PST)
Received: from localhost ([192.55.54.43]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2bacb5622f2sm28371135eec.10.2026.02.20.08.18.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Feb 2026 08:18:17 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 8/8] lib/igt_fb: on Intel force Vebox copy on yuv formats
Date: Fri, 20 Feb 2026 18:17:18 +0200
Message-ID: <20260220161718.652862-9-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260220161718.652862-1-juhapekka.heikkila@gmail.com>
References: <20260220161718.652862-1-juhapekka.heikkila@gmail.com>
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
forced to be used when tiling convert is needed and destination
is not linear.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/igt_fb.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index cfd5d66fb..0499dd590 100644
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
+	 * This is to utilize Vebox engine for testing on Xe driver.
+	 */
+	if (use_vebox_copy(fb, fb) && fb->modifier != DRM_FORMAT_MOD_NONE)
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

