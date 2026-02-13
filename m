Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1192EDF170
	for <igt-dev@archiver.kernel.org>; Fri, 13 Feb 2026 15:17:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93AF810E167;
	Fri, 13 Feb 2026 15:17:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Of9pTZW/";
	dkim-atps=neutral
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACECB10E81E
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Feb 2026 15:17:11 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-2ab232cc803so5045515ad.3
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Feb 2026 07:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770995831; x=1771600631; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oO8mBGHpRyngL6KZoGrDi19Ji1jFcGe9Y2PnTJL7pTE=;
 b=Of9pTZW/PF8uS1I986od4bIExZ3ljwY/aoYmfqxSXKC4ofX5qzBBwPc8u6CciHTvqD
 uWzbQaE+29fMyRHOpkv1s2RYMFCGxbJzHQUv4NPdldED09XOcaBJSdw4dPtfNEcMXhpE
 U9qk3pPw/mR0Bqk3O63UuIgYvbmAACplyTS9JHluW6jdk08dbeV4E23WkBqUadsKRoXG
 fPYk4+z0VyyWSRMB/667ubxR+he8zKhmiSWCU5a9iOmsYEmV04sOVo92K4T1KQBnlScS
 wgkH7A6q03SdLyrsxGt+X2pAMwr2H8yvV7TQbjYgxN/pNjz1o/g42sscMEjzUQ2wZDMV
 nRAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770995831; x=1771600631;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=oO8mBGHpRyngL6KZoGrDi19Ji1jFcGe9Y2PnTJL7pTE=;
 b=j+xvBXCVwqacHD/5V16Irb75ZKvV3aZKxcbbcxgJ9qL6T4OlPG21mY8WyMjllEmKKs
 N5mtVcwBblBlGhPXaqd0MTlVKKr6/qAiBo9Hh6n71cP+l3isGROuwc3nIhZELtf8zJk6
 /1sOnHBWQNLhEsnu/7VJGAl4XDPpLiR3eLS+gpp91WXMbDDyzxICpG9iFaBnJVwK8hZb
 C6IuuDyfzJhrjr81G12xOpRRxwodxKJkEbyq0mbi/LN/HfzJjX9aiuly+3U4ogdkjBrx
 Y0nRXfrEg240AvR5/XKbuIdYajO9zi+u1kIsUzsG7y+zlraeVz9clmNErrSIEHQMrYz4
 ytsA==
X-Gm-Message-State: AOJu0Yx7FLgvy05kHD83rfw/Q5rJrPUiZCxLl59sgp+gDMMYFHCM3eG7
 N+bcfVd7R01QQs/kHTUMmcM9A35c1sGajsyiLJtIbtVAjUAiGTP6g5HAg/dgYiS2
X-Gm-Gg: AZuq6aKpasLmDU0zSKGdadPxSNx0CD/rzpz2u4Pkwphgn1bB3CQnQBtwlahleh7THb3
 yQHBxOWj9w0YObOKW1H/7OynG1tqpHZ/xeqjb62q7tWQOd+5R+M5dAAMnNqqsEO+a43ZQIuaAcm
 dNCW8ctJPllicRW2oOnDlLGfMohdTGKm3R5K5A67oqPaQ9xS3Bn2JcUJLYEKpy1nqa/OAa2uQP9
 wp1vSBWuL9XVXHGJY9D8evm4CIBjF6Lueek15CMaoqedZbNLpqK7K+oZnc9FMNV0ZiQNHzWezuv
 kmYHQjZ1qqqPcldPNbIJMjxVycBTu1y6GF2kwLwLayyBj1DOYyyEGkc4Ogaad353AsTsiq1FhL5
 WR6h6WkSG7NCDrcFvoVEdYT4RCyYuQFsrudzoE4cyIT7YwSfq1kuHb0J8oN9SHauWFNYclgdvut
 jLxmt/+SJTjWUVhUVMIFN9kR5ve2s54EvaVMOj6zQsr7vSmkYfhaFmkfK7m8zvYQ==
X-Received: by 2002:a17:902:e885:b0:2a9:62ce:1c16 with SMTP id
 d9443c01a7336-2ab505b3892mr20101335ad.43.1770995830799; 
 Fri, 13 Feb 2026 07:17:10 -0800 (PST)
Received: from localhost ([134.134.139.77]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ab2c522a60sm84073745ad.63.2026.02.13.07.17.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 07:17:10 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 7/7] lib/igt_fb: on Intel force Vebox copy on yuv formats
Date: Fri, 13 Feb 2026 17:16:21 +0200
Message-ID: <20260213151621.1552677-8-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260213151621.1552677-1-juhapekka.heikkila@gmail.com>
References: <20260213151621.1552677-1-juhapekka.heikkila@gmail.com>
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

