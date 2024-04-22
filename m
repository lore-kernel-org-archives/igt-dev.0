Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D77C10F15
	for <igt-dev@archiver.kernel.org>; Mon, 22 Apr 2024 20:45:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0FBF112D71;
	Mon, 22 Apr 2024 20:45:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HBoIi2HD";
	dkim-atps=neutral
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39835112D6F
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Apr 2024 20:45:08 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-51ab4ee9df8so4695816e87.1
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Apr 2024 13:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713818706; x=1714423506; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=O9Nk5ktvEA9n7DTPjsK8AR8CmsNE+bOrLzJg8fisn3U=;
 b=HBoIi2HDe8tKJPW/D112jmdIefro16D6CT9amJMkKh2DyhJLYxkkCl0lQkOByzdmdD
 lLU55moMr4g5K0P9aH6hHmHk4meKqhKmie7Dxb+sXiy3dK1xU6Xjvy8+mq7XCuZ+5Cq7
 Z+Lz12fambA3z2p6N45jqPlyoI5+9ujQ8XsaXS4cf0bLdpmTU+zrJMXKxZXAtwQBceVK
 wic+NaWBX/i/wKUemfdaOw7gd+uO4ABRMzbMXS42R0e4cKFZ3xcTKFbbJIxwpJ7Nmgqa
 NqcmOTuZhGt2wI9307jt6CZTn2DXnedDoJRvZkFmErI2QxSmnKkVtaxK+wTyP7pgEGgs
 y6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713818706; x=1714423506;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=O9Nk5ktvEA9n7DTPjsK8AR8CmsNE+bOrLzJg8fisn3U=;
 b=dRtx2e1vBqWLQqx9sEE+B3A33QZkkBaQ2YwPqID18vm8m9/2DVhbGNs1MiCgM6zqCU
 wa4d5ZmGEFMiB4OslkkyXhefF0YzbB3qXn8LKF4kVOaxkb6pEr6RSj6yO0lbbEY1lWk0
 iqdb9DW1yyUa1Cz4Naayvh0yfUHR/JlbniwMECsLY4OmRijmWOMj0S8zmZo6CzM7VipG
 pJOrvULd9sH+/xy62vbgTLrbB0rAHGAE0qlVqLg/bMvzAmktTkQVT/KrlYAxKJXkCJPN
 cC3UA9cwH1fH+j7EnkdBkq2GOLfhrq+y0x/omoIINbyOQILrPMWW0AddrFEP8MHOpswq
 lrlQ==
X-Gm-Message-State: AOJu0Yy1kFOch6uZZiEl2sugayuEBdYItfCrhZfmIZELZIkr7ujLehx7
 OXgWr6BjcAEsVh97i35wfooGCSp80S/mkVTwmi1VlUPRJrtplb0KFtpT7Hxx2fI=
X-Google-Smtp-Source: AGHT+IGjdosFk5phdhpBzSKgsJw3i6iKjlp4OeMJ4+WAggh453PxvbtT0P4BIzAwoZUOMqDU0GM6Jw==
X-Received: by 2002:a05:6512:246:b0:513:ca77:82cc with SMTP id
 b6-20020a056512024600b00513ca7782ccmr8461317lfo.8.1713818705738; 
 Mon, 22 Apr 2024 13:45:05 -0700 (PDT)
Received: from jheikkil-mobl1.. (91-156-196-125.elisa-laajakaista.fi.
 [91.156.196.125]) by smtp.gmail.com with ESMTPSA id
 z9-20020a19f709000000b00515cc918069sm1816413lfe.150.2024.04.22.13.45.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 13:45:05 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 6/6] lib/igt_fb: unify intel blitter fb block copies
 between xe and i915
Date: Mon, 22 Apr 2024 23:44:41 +0300
Message-Id: <20240422204441.106197-7-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240422204441.106197-1-juhapekka.heikkila@gmail.com>
References: <20240422204441.106197-1-juhapekka.heikkila@gmail.com>
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

block copies are almost the same. make them into one helper

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/igt_fb.c | 116 ++++++++++++++++++++++-----------------------------
 1 file changed, 49 insertions(+), 67 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index fed9c7339..03b523f88 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2953,35 +2953,70 @@ static void cleanup_blt_resources(uint32_t ctx, uint64_t ahnd, bool is_xe,
 	intel_ctx_destroy(fd, ictx);
 }
 
+static void do_block_copy(const struct igt_fb *src_fb,
+			    const struct igt_fb *dst_fb,
+			    uint32_t mem_region, uint32_t i, uint64_t ahnd,
+			    uint32_t xe_bb, uint64_t bb_size,
+			    const intel_ctx_t *ctx,
+			    struct intel_execution_engine2 *e)
+{
+	struct blt_copy_data blt = {};
+	struct blt_copy_object *src = blt_fb_init(src_fb, i, mem_region);
+	struct blt_copy_object *dst = blt_fb_init(dst_fb, i, mem_region);
+	struct blt_block_copy_data_ext ext = {}, *pext = NULL;
+
+	blt_copy_init(src_fb->fd, &blt);
+	blt.color_depth = blt_get_bpp(src_fb);
+	blt_set_copy_object(&blt.src, src);
+	blt_set_copy_object(&blt.dst, dst);
+
+	if (blt_uses_extended_block_copy(src_fb->fd)) {
+		blt_set_object_ext(&ext.src,
+				blt_compression_format(&blt, src_fb),
+				src_fb->width, src_fb->height,
+				SURFACE_TYPE_2D);
+
+		blt_set_object_ext(&ext.dst,
+				blt_compression_format(&blt, dst_fb),
+				dst_fb->width, dst_fb->height,
+				SURFACE_TYPE_2D);
+		pext = &ext;
+	}
+
+	blt_set_batch(&blt.bb, xe_bb, bb_size, mem_region);
+	blt_block_copy(src_fb->fd, ctx, e, ahnd, &blt, pext);
+
+	if (e)
+		gem_sync(src_fb->fd, blt.dst.handle);
+
+	blt_destroy_object(src_fb->fd, src);
+	blt_destroy_object(dst_fb->fd, dst);
+}
+
 static void blitcopy(const struct igt_fb *dst_fb,
 		     const struct igt_fb *src_fb)
 {
-	uint32_t src_tiling, dst_tiling;
+	uint32_t src_tiling = igt_fb_mod_to_tiling(src_fb->modifier);
+	uint32_t dst_tiling = igt_fb_mod_to_tiling(dst_fb->modifier);
 	uint32_t ctx = 0;
 	uint64_t ahnd = 0;
 	const intel_ctx_t *ictx = NULL;
 	struct intel_execution_engine2 *e;
-	uint32_t bb, xe_bb;
+	uint32_t bb;
 	uint64_t bb_size = 4096;
-	struct blt_copy_data blt = {};
-	struct blt_copy_object *src, *dst;
-	struct blt_block_copy_data_ext ext = {}, *pext = NULL;
 	uint32_t mem_region;
 	/* To ignore CC plane */
 	uint32_t src_cc = src_fb->modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC ? 1 : 0;
 	uint32_t dst_cc = dst_fb->modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC ? 1 : 0;
-	intel_ctx_t *xe_ctx;
+	const intel_ctx_t *xe_ctx = NULL;
 	uint32_t vm, exec_queue;
 	bool is_xe = is_xe_device(dst_fb->fd);
 
 	igt_assert_eq(dst_fb->fd, src_fb->fd);
 	igt_assert_eq(dst_fb->num_planes - dst_cc, src_fb->num_planes - src_cc);
 
-	src_tiling = igt_fb_mod_to_tiling(src_fb->modifier);
-	dst_tiling = igt_fb_mod_to_tiling(dst_fb->modifier);
-
 	setup_context_and_memory_region(dst_fb, &ctx, &ahnd, &mem_region,
-					&vm, &xe_bb, &bb_size, &ictx,
+					&vm, &bb, &bb_size, &ictx,
 					&exec_queue, &xe_ctx);
 
 	for (int i = 0; i < dst_fb->num_planes - dst_cc; i++) {
@@ -2990,34 +3025,8 @@ static void blitcopy(const struct igt_fb *dst_fb,
 		igt_assert_eq(dst_fb->plane_height[i], src_fb->plane_height[i]);
 
 		if (is_xe) {
-			src = blt_fb_init(src_fb, i, mem_region);
-			dst = blt_fb_init(dst_fb, i, mem_region);
-
-			blt_copy_init(src_fb->fd, &blt);
-			blt.color_depth = blt_get_bpp(src_fb);
-			blt_set_copy_object(&blt.src, src);
-			blt_set_copy_object(&blt.dst, dst);
-
-			if (blt_uses_extended_block_copy(src_fb->fd)) {
-				blt_set_object_ext(&ext.src,
-						blt_compression_format(&blt, src_fb),
-						src_fb->width, src_fb->height,
-						SURFACE_TYPE_2D);
-
-				blt_set_object_ext(&ext.dst,
-						blt_compression_format(&blt, dst_fb),
-						dst_fb->width, dst_fb->height,
-						SURFACE_TYPE_2D);
-
-				pext = &ext;
-			}
-
-			blt_set_batch(&blt.bb, xe_bb, bb_size, mem_region);
-
-			blt_block_copy(src_fb->fd, xe_ctx, NULL, ahnd, &blt, pext);
-
-			blt_destroy_object(src_fb->fd, src);
-			blt_destroy_object(dst_fb->fd, dst);
+			do_block_copy(src_fb, dst_fb, mem_region, i, ahnd,
+				      bb, bb_size, xe_ctx, NULL);
 		} else if (fast_blit_ok(src_fb) && fast_blit_ok(dst_fb)) {
 			igt_blitter_fast_copy__raw(dst_fb->fd,
 						   ahnd, ctx, NULL,
@@ -3043,35 +3052,8 @@ static void blitcopy(const struct igt_fb *dst_fb,
 			}
 			igt_assert_f(e, "No block copy capable engine found!\n");
 
-			src = blt_fb_init(src_fb, i, mem_region);
-			dst = blt_fb_init(dst_fb, i, mem_region);
-
-			blt_copy_init(src_fb->fd, &blt);
-			blt.color_depth = blt_get_bpp(src_fb);
-			blt_set_copy_object(&blt.src, src);
-			blt_set_copy_object(&blt.dst, dst);
-
-			if (HAS_FLATCCS(intel_get_drm_devid(src_fb->fd))) {
-				blt_set_object_ext(&ext.src,
-						   blt_compression_format(&blt, src_fb),
-						   src_fb->width, src_fb->height,
-						   SURFACE_TYPE_2D);
-
-				blt_set_object_ext(&ext.dst,
-						   blt_compression_format(&blt, dst_fb),
-						   dst_fb->width, dst_fb->height,
-						   SURFACE_TYPE_2D);
-
-				pext = &ext;
-			}
-
-			blt_set_batch(&blt.bb, bb, bb_size, mem_region);
-
-			blt_block_copy(src_fb->fd, ictx, e, ahnd, &blt, pext);
-			gem_sync(src_fb->fd, blt.dst.handle);
-
-			blt_destroy_object(src_fb->fd, src);
-			blt_destroy_object(dst_fb->fd, dst);
+			do_block_copy(src_fb, dst_fb, mem_region, i, ahnd,
+				      bb, bb_size, ictx, e);
 		} else {
 			igt_blitter_src_copy(dst_fb->fd,
 					     ahnd, ctx, NULL,
-- 
2.25.1

