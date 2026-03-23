Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F58F483C8
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 16:30:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 401AD10E4CE;
	Mon, 23 Mar 2026 16:30:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SUKs2Ofa";
	dkim-atps=neutral
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com
 [74.125.82.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02F5110E49D
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 16:30:08 +0000 (UTC)
Received: by mail-dy1-f180.google.com with SMTP id
 5a478bee46e88-2c0fa90d47bso1619343eec.0
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 09:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1774283407; x=1774888207; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6yDt9HWg5xAxXSI8Lj3iUSBdL415O5ExHTv2AlBbhXY=;
 b=SUKs2OfagX/2mPaznVxpZpgEh+Dz7UDS/vr3VTG1kbyhkYFVhFI2c7WBV7rCM4vZGB
 9WJu2zyAaQcl1IKUBsrUQ7DuSP4Wd5yQA2PvzAOBwoH3b7LhKD4I+J0C7MdWzdi0n7UI
 VV0lQFthLF/Z3TnWUJbxrVUKlQHp4GOQvtiAWsvQ4YiACHgJjcTiSxWOPYb291KHz0Sq
 ONI5cG2KrcF7h8sN4Tq02btQakAKnGCWBlKFeKnvn27g1Sej+Zq99U9LnkiLVVamtQ+T
 grzTWmRr9UZ6wAO0eN1lUvXZa3V/qqfPtypl5+krWdXn0SWDaLG39ReUWdFAJT46u0dD
 Q/DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774283407; x=1774888207;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6yDt9HWg5xAxXSI8Lj3iUSBdL415O5ExHTv2AlBbhXY=;
 b=TUzcpJrDIcCOnQA4VLXqHwklz3+nXmEwXpf96BsL8lHvYDYVUgcn9AOYQE69Dzl5RX
 sW9UskYnOU21uHANW1J/xNL9Hzk05VV9Eg5FDkOZcWVETrK47oozjL+DIS/+BPjNTmSY
 A754S1t63xc8bWOdutA7IgepniAleDA5t6zmJUKjrVcFS8eUZk9/7gqI4LhxdNTYQD40
 dh+vqmSVqy3XIE2ZtL/P6/Adn80CR63xUlbielqTihxMVBTR72CL98tlHRz+Yz/1I7L+
 NBR2ai6ezlyuJIhwenJhnKoMbWQ8I+vLfJ0ZrmTd0tEOAeLin3c6r5wTXcYb2uUD8hQC
 OfzQ==
X-Gm-Message-State: AOJu0YxFGB8HBhRFzGcM4ilmvd7ZohZ/SIzGRi4vG9wjeDrvhPVXLXn0
 5ToLBQhMdAAPXnXPTuR5Y52N3qrO6FZGDHGJ6cEm4CJkc9BFTovHihjODZATMsx2
X-Gm-Gg: ATEYQzzRtQRoa9FbHrtWhXTk+/mNAqifHKq+r0zc+x6vcbGgTZBCs1R1ozLZ/4LIWFS
 SFWuTl9iI/Mx330QvH0/fzase6dz6Azgqj+iGDV+znoNtxHSex3537wUr5DfmL2n5SFY0wuHPyz
 cZ0IoRw42OtBJy52lxe6kz2G5ycONYhI+xPaZyzHan5pTrqalNBO0WHCvw1Wkv1sSrkVa0w/3np
 kTGYtJYtsbSOY7MHlqKxxL4osZYOR5Mp0gThKCBy5t4SKIZhB4NL8DRZ2i8d9Lbpkpt3F25HKjp
 bLGLZkKvWmSlxa1D6/o0IKjPRv+z5Xf2OmmmyyW5UWbxWn1HXrAxxGEqO7VTfxlYzL9WTa14Vbo
 3K7xNVvegbPZXgUvjgaUXEyR3h2baFplsXiwPnCw6MXWvLmKTzWy3nFsVGPtlSSg7YSAeuNrSOz
 JXhPuSeJrWmF31JxEY4FZVUyAwGqhVSj2H5jSfwgsrjh4UDd7vbOGk2VDL9W0=
X-Received: by 2002:a05:7301:fa0e:b0:2be:b50b:7dac with SMTP id
 5a478bee46e88-2c14b46ae03mr94475eec.1.1774283407037; 
 Mon, 23 Mar 2026 09:30:07 -0700 (PDT)
Received: from localhost ([192.55.54.47]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2c10b14caf3sm17172568eec.5.2026.03.23.09.30.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2026 09:30:06 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 8/8] lib/igt_fb: on Intel Xe force Vebox copy on yuv
 formats
Date: Mon, 23 Mar 2026 18:29:11 +0200
Message-ID: <20260323162911.1912755-9-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323162911.1912755-1-juhapekka.heikkila@gmail.com>
References: <20260323162911.1912755-1-juhapekka.heikkila@gmail.com>
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
index 0f7ebc6b4..504cb6806 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2596,6 +2596,24 @@ static bool block_copy_ok(const struct igt_fb *fb)
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
@@ -2624,8 +2642,9 @@ static bool blitter_ok(const struct igt_fb *fb)
 	    is_xe_device(fb->fd))
 		return false;
 
+	/* use blitter on xe device except 4tile yuv where utilize vebox */
 	if (is_xe_device(fb->fd))
-		return true;
+		return !use_vebox_copy(fb, fb);
 
 	for (int i = 0; i < fb->num_planes; i++) {
 		int width = fb->plane_width[i];
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

