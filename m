Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1425EA8130
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 16:10:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9666D10E5D5;
	Tue, 10 Feb 2026 16:10:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cwcp/RrT";
	dkim-atps=neutral
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0822110E5D4
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 16:10:38 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id
 41be03b00d2f7-c06cb8004e8so2363129a12.0
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 08:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770739837; x=1771344637; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hXMkMnOfM7OO8r3cmRFh0JFr9KQwzH3FlYlzIy9qB84=;
 b=cwcp/RrTBH93GFfV4pP4z4S9nlmWVWsARE4IcWIxIqxn9h9nDWqenrw3qafKIqm4Il
 8Lx+52VDYN+US5nESgc8B1TswV+OnuZDWICnLfB/XPmfuNoO5ZedJc+JtBEvVvdSkDhK
 TtIqSknMwlj1/qdyEIxMTVuSKQ6ceLmO6fnbsugWSjkdAqI6TdQJqQnSNW6BtiusrRUY
 YdeWNrmVvCHaOrGYmPlARrn2jPZZ10sHEDn51sj0vsN6pO+RgtQleM7Bd//vOp/0GKjF
 0F9oF5aRN2A1g42qpND6Ez5JBkJTGcGyDGOxNIvFAKMXjKrcn7WL1mN6CovqFeBCIyOs
 eltA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770739837; x=1771344637;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hXMkMnOfM7OO8r3cmRFh0JFr9KQwzH3FlYlzIy9qB84=;
 b=r3IjbZ94C7K5MtOcuP2e7we/zgtKiaJqxaeccf3Mn/R6VWfIOtvg5o7su4OByNqVHf
 I2ORYYRmz7WCRYDQAsM9/r4gTL9KpCH9Y3eFU8XisVox/X+WeS6Cvvw+uNYjd2ljoYId
 NeRBaTYipMGCt9VUhXqGecv4V0iObAm1sPtKx5mRRktQ8VPHl/n+i+m3bBAd9nVkoVkD
 vi+lFcfs4r1o8UCYNKhGmjuhMqTPWHwl9zJUGswjZlMQovTchzu1eAXdlLKfXeyA76fZ
 B1aT5HcKt+6MNiQPKWEGnt0l3mNsDLagcDIcv2yRQGx4+TLJ1VBFVNbX4CtNa81lxK1v
 5Xdg==
X-Gm-Message-State: AOJu0YyprmGTpp5vxu2JK84GAfbwVAOzksKKSEJFj60hWXpyy6CmAwD+
 kRTBcC0we+h4V0Xq3DkvCgeIGAdLwgmzx7dTucc/MorYfqlvKXQ/yGWJqcBBfgYe
X-Gm-Gg: AZuq6aI3eYiwuqvecEqTUi1FqUbsQ/kF7Xd5ImNsIUvaZNwTW+y26epLTbQ0h8cJZJR
 Pg+UR/IczrT9IpAOQgoCaLntW4REn0eJokLUtvNwBGCD8DUOKNeF3jSDekvfsOu1kBLOesFSZM7
 1dS0BjHHAQsxHUJ8huzQ1jwUFZloSA6LzSbKNnH48SNQEQmaGGtSBjvGSgME8sEz04cTYi3va/c
 OT2wgL6oOpFvTA/eL9LtVnT9WxCyAykmF+Payg5FgnvRXu21yXaQtZELCWPt54Ezc4Dp4B8bpoH
 52nMtPejbsX2T3ldbVPaPo0x7UwVKZKYVZTOgTllAZ+HyAkG2PRIWG7KPWmj8YO2FgRHAbnCV4p
 0+MLmT/jdsNAnrO6MONYC9saWfMbiMTBhED2FI6AICvus+v5a/FcfbYUxWdSk7fSX2Tg3V9y3PY
 JXgFo3W7/ev3nGaNCHfuGJxItmF0PGCjqWlvEuPwI8tK1U8I35iO0AvXRRvYelQA==
X-Received: by 2002:a17:90b:58e6:b0:340:d1a1:af8e with SMTP id
 98e67ed59e1d1-35667d8630dmr2488289a91.37.1770739837106; 
 Tue, 10 Feb 2026 08:10:37 -0800 (PST)
Received: from localhost ([134.134.139.69]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-354b465df51sm6834054a91.9.2026.02.10.08.10.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Feb 2026 08:10:36 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 7/7] lib/igt_fb: on Intel force Vebox copy on yuv formats
Date: Tue, 10 Feb 2026 18:09:41 +0200
Message-ID: <20260210160942.2219370-8-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260210160942.2219370-1-juhapekka.heikkila@gmail.com>
References: <20260210160942.2219370-1-juhapekka.heikkila@gmail.com>
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
 lib/igt_fb.c | 31 ++++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index cfd5d66fb..47645ecd5 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2596,6 +2596,16 @@ static bool block_copy_ok(const struct igt_fb *fb)
 					       fb_tile_to_blt_tile(fb->modifier));
 }
 
+static bool use_vebox_copy(const struct igt_fb *src_fb,
+			   const struct igt_fb *dst_fb)
+{
+	return igt_fb_is_gen12_mc_ccs_modifier(dst_fb->modifier) ||
+		(dst_fb->modifier != DRM_FORMAT_MOD_NONE &&
+		dst_fb->modifier != src_fb->modifier &&
+		(igt_format_is_yuv(src_fb->drm_format) ||
+		igt_format_is_yuv(dst_fb->drm_format)));
+}
+
 static bool ccs_needs_enginecopy(const struct igt_fb *fb)
 {
 	if (igt_fb_is_gen12_rc_ccs_cc_modifier(fb->modifier))
@@ -2624,6 +2634,12 @@ static bool blitter_ok(const struct igt_fb *fb)
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
 
@@ -2664,6 +2680,12 @@ static bool use_enginecopy(const struct igt_fb *fb)
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
@@ -2874,15 +2896,6 @@ static void fini_buf(struct intel_buf *buf)
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

