Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D67C3600B
	for <igt-dev@archiver.kernel.org>; Tue, 25 Mar 2025 19:09:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17C9410E5E0;
	Tue, 25 Mar 2025 19:09:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CsqqKWoh";
	dkim-atps=neutral
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 116BF10E5DF
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Mar 2025 19:09:17 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-2241053582dso48783745ad.1
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Mar 2025 12:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742929756; x=1743534556; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TI3Tv5wgZflkqQ0nASkZw82BwZdiWCO05jWSispvOhs=;
 b=CsqqKWoh+9xzvcupRlVQA9ca0CVUQb9io0p1SUn16ry2UzO9t9tDMM561x3ZX5MtwS
 MEnZ27QjBzUAAjDphVvO15J0TjByM1zH5WZgm8pyHVkRHbT6AIJdN6ADUObjWJgCZ8vA
 cfcNKhqZSHDTxr/IHyxSbg3d9rKTGtpFCqU8r+4/ZKgu57UsC/55SWi4oz9YsPNw9rqT
 Zk9o4wjApAljJFp7hFKLtoK5UoJ0Q2++aGK2hPB/by1oW15ftNKcXCuxietppxJMOzt5
 Sqt53JYzQ/YJlGU23kQD6EQVb1PelCd/fEDNxp8IqOpKRPnGCVXl1G7CXeXB0Rn+V9wT
 2FEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742929756; x=1743534556;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TI3Tv5wgZflkqQ0nASkZw82BwZdiWCO05jWSispvOhs=;
 b=WQkkztDgZv2oqmcakLFp6xXt03u6KFeachdgdR96NtqRnTkXVKQlSTXCa1L4Jz6gId
 I4TQvJUsVYsEUelB7nZy3Z86WAc8aWcuQAm6XFIKF+oTk8HWSzdkIsvsbFkCBJekrsqz
 o7KsdTRUI/crwY8DqmJV/9A7jjdpcSXnzBYcWImcNUeOKiOa7t3AADiFi9w0lnwFmJ4N
 BoBSiLtWXGQ2Zuu/hm4g7eO75U3lHBfD0Xn94M8YyTAwmk3BPyPNXp+VGPVizJdEqpr6
 jgxU4Etse0tfQ292O9AWWxuuMaa/3nfIYywi6j9k50NUb0HD8H4z6eVJHpvb2lpphBek
 GINg==
X-Gm-Message-State: AOJu0YwquwmOxe0EE/PWnCErSbzATTYTWjn/gA3yYypJ0TQCBcGlR8t4
 vGkxU0FPIt9wA8aA+6dmtkq7YVjhvsP406FQikDwemiOPlc+0vS/h1aLSxfJH+k=
X-Gm-Gg: ASbGncsBf+mddFlqi1kwW72JrMCVhTJP01LDQmiuhrGHOqZPE1eY+dobIjg4SyGFyP1
 ygKHUAd05sYzkcdnHTcpoTyLjEehZkOXet3CAk5pTMYqbF2aWBNh+aHE/fCd1vKNW2UnJJrg/qc
 J78B+DLa7DMH46hwqd1Px5PIBGKROJkN/KEcJzUN7QgYMARmfv52VSz/2bF/DUGWpANe8p/avJD
 V8iDy2qXcdDvIlFzlLzRbk5Mlt0tc8hAXUD39M6OAFVcrn7au72q+sWvu0i+lOy8mEEJmc7MIJd
 THqIr4E+mahMTkYRuzu/2SCmt1Z61fN9AUcAotD75QXrpdxsIw==
X-Google-Smtp-Source: AGHT+IEhTRPFhesTbEkpE9lIMWCf1YIvNrJClZFsr+MeyD6TwYoep3yGe+NMjhCscCfEzmXMXiREFQ==
X-Received: by 2002:a05:6a20:9151:b0:1f3:47d6:aa05 with SMTP id
 adf61e73a8af0-1fe42c6bce5mr33599683637.0.1742929756313; 
 Tue, 25 Mar 2025 12:09:16 -0700 (PDT)
Received: from localhost ([192.55.55.46]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af8a2a5b402sm8133586a12.75.2025.03.25.12.09.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Mar 2025 12:09:16 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 7/7] lib/igt_fb: on Intel force Vebox copy on yuv formats
Date: Tue, 25 Mar 2025 21:08:39 +0200
Message-ID: <20250325190839.1984723-7-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250325190839.1984723-1-juhapekka.heikkila@gmail.com>
References: <20250325190839.1984723-1-juhapekka.heikkila@gmail.com>
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
index a09eb00a3..918a90d86 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2520,6 +2520,14 @@ static bool block_copy_ok(const struct igt_fb *fb)
 					       fb_tile_to_blt_tile(fb->modifier));
 }
 
+static bool use_vebox_copy(const struct igt_fb *src_fb,
+	const struct igt_fb *dst_fb)
+{
+	return igt_fb_is_gen12_mc_ccs_modifier(dst_fb->modifier) ||
+		igt_format_is_yuv(src_fb->drm_format) ||
+		igt_format_is_yuv(dst_fb->drm_format);
+}
+
 static bool ccs_needs_enginecopy(const struct igt_fb *fb)
 {
 	if (igt_fb_is_gen12_rc_ccs_cc_modifier(fb->modifier))
@@ -2548,6 +2556,12 @@ static bool blitter_ok(const struct igt_fb *fb)
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
 
@@ -2588,6 +2602,12 @@ static bool use_enginecopy(const struct igt_fb *fb)
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
@@ -2798,15 +2818,6 @@ static void fini_buf(struct intel_buf *buf)
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
2.45.2

