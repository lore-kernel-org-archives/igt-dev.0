Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E47B1098782
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 13:47:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3206C10E466;
	Fri, 20 Mar 2026 13:47:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QOxKIIw0";
	dkim-atps=neutral
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AFAB10EA0F
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 13:47:06 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-2addb31945aso12669735ad.1
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 06:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1774014426; x=1774619226; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H0Nf2XQy1W/BkdIFQKnGuqy6THNnQnO7JrSGSmTzodY=;
 b=QOxKIIw01Edi6QDgiMSAmNQw6g+lsb61sdnSHVcnvLBnpdgVUYDoB3sWm/oiKYuIlY
 WROwL8yRUtnu4u9AhnfKJOxdbT1+hsak/O/fvtD/Tuj7hbMPtcImc4lBL018Aw4aRGSu
 ZTx1Ln8NKH1QDdAL75YtsynQmXuduRwmgZvyoUkoyiNHGEFtEQidi6iWg5DjAv7sNmrF
 SbjZRk1oOwE74eyOqXnikDrS+dECmUXxQpfs5wSylPqYqlddJkjQXxgeOSO4SUurgTRf
 0BvBQpCYejRUsLRUuso+SDydYK3E46wXt3rqx/M/f+Bz7d3lNoxWGlvO9JE2YZcxI8vv
 MKDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774014426; x=1774619226;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=H0Nf2XQy1W/BkdIFQKnGuqy6THNnQnO7JrSGSmTzodY=;
 b=eQ2XRvapOV+R5ts2NPiO+In/LUnOoE84Y5hqqbVQGZCOLlDJlTdGz1Y+YfxpmcnY3p
 RUcKviLFeQp1CuAH1Rb/2NThHrnB6zdfgoQsnLUYr4seFFfhPkvqmf5ixOVMixH7GLWN
 pfDIqWIyP+JJFbiYyKNgapQR8HrUzeWTviuak7JJiwOeU7oKGTDjo99ntDD5rlhI+2QP
 I6bOhg18ScfN5dZ2DCMk/dSNyKQ06rnr2VtlQQBPsrW6da7PNoh+DLCVsFZ5AH/1YwRV
 8cIdScQ7HGvEejJJOPsaZcc5EmyAjwq2NcxD2aXqYL2cay+NPuOyxQVKog6hhPMhTQ3D
 FoaQ==
X-Gm-Message-State: AOJu0Yy1xx16EecsYnHOA4Rm3pOwgslXr3cgBrVw5Di6eIoGCp2uXOS9
 R+UFrwnosBWHjn+F7dlGW3L8nWkxWhOPmMYDuwjau+55fppcJFE0Gvid7bAqS4mC
X-Gm-Gg: ATEYQzz0eDFtGQC9xqID1IVlO283Og3112BplNM/QzApJSSplbD72LDnqhKXI/TEkD0
 2jFOzwpUdO0x/oiV9C3Ar+bKLYk9RbB22QO9OnlJaW4yRW9aNvV7KNkx6f4TwK7Jd3VHrtSA/CH
 l9G6UYDtBH/gFYN/2oZZ4hN9VkTYggYqxBezipAwS3REKRI6mqTTsC8VVp/y+Fo2F7AJshiPdwK
 N7LvXTW3oDUWYYGAqd7LSOIrclgzzdtQRGO/2WYemLyA3WAcHDf5nBfujVuM2Qf2vnEK1JIHtf9
 H4oVba1VurSMJRBWo83OJtZCjXi6Ryhv0QNl4MnjYhtChiT/rWDKvbwvpsfrVd3eI2pI9Fi/Sgo
 dnUwgJjhiNCoXat/CYJPCZhZOMD2MSaMMT6xwERYcwrGI6gPQy7Cwi358eokzks5/kUoA8qVHnt
 uarDjv8tAsVq4WK7JyCw6TeBX+XF7ACXBosb2aI6k8uCczXHbyiH1yrBMFzF1Evg==
X-Received: by 2002:a17:902:c950:b0:2b0:60f1:de58 with SMTP id
 d9443c01a7336-2b0827d1a18mr28664935ad.45.1774014425645; 
 Fri, 20 Mar 2026 06:47:05 -0700 (PDT)
Received: from localhost ([134.134.137.74]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b08352a17asm23114995ad.24.2026.03.20.06.47.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2026 06:47:05 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 8/8] lib/igt_fb: on Intel Xe force Vebox copy on yuv
 formats
Date: Fri, 20 Mar 2026 15:46:11 +0200
Message-ID: <20260320134611.876379-9-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260320134611.876379-1-juhapekka.heikkila@gmail.com>
References: <20260320134611.876379-1-juhapekka.heikkila@gmail.com>
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
 lib/igt_fb.c | 35 +++++++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 0f7ebc6b4..ffda1d564 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2596,6 +2596,23 @@ static bool block_copy_ok(const struct igt_fb *fb)
 					       fb_tile_to_blt_tile(fb->modifier));
 }
 
+static bool use_vebox_copy(const struct igt_fb *src_fb,
+			   const struct igt_fb *dst_fb)
+{
+	/* TODO:
+	 * X-Tile will need to be fixed for Vebox engine on
+	 * Xe2+ devices
+	 */
+	bool vebox_fix = HAS_4TILE(intel_get_drm_devid(src_fb->fd)) ?
+		(src_fb->modifier == I915_FORMAT_MOD_4_TILED ||
+		dst_fb->modifier == I915_FORMAT_MOD_4_TILED) : true;
+
+	return (igt_fb_is_gen12_mc_ccs_modifier(dst_fb->modifier) ||
+		 igt_format_is_yuv(src_fb->drm_format) ||
+		 igt_format_is_yuv(dst_fb->drm_format)) &&
+		 vebox_fix;
+}
+
 static bool ccs_needs_enginecopy(const struct igt_fb *fb)
 {
 	if (igt_fb_is_gen12_rc_ccs_cc_modifier(fb->modifier))
@@ -2624,8 +2641,9 @@ static bool blitter_ok(const struct igt_fb *fb)
 	    is_xe_device(fb->fd))
 		return false;
 
+	/* use blitter on xe device except 4tile yuv where utilize vebox */
 	if (is_xe_device(fb->fd))
-		return true;
+		return !use_vebox_copy(fb, fb);
 
 	for (int i = 0; i < fb->num_planes; i++) {
 		int width = fb->plane_width[i];
@@ -2664,6 +2682,12 @@ static bool use_enginecopy(const struct igt_fb *fb)
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
@@ -2874,15 +2898,6 @@ static void fini_buf(struct intel_buf *buf)
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

