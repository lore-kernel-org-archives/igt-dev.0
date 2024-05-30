Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80399C27C43
	for <igt-dev@archiver.kernel.org>; Thu, 30 May 2024 14:20:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21380113746;
	Thu, 30 May 2024 14:20:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="N4kqFuta";
	dkim-atps=neutral
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43A051136D6
 for <igt-dev@lists.freedesktop.org>; Thu, 30 May 2024 14:20:21 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-681ad26f4a5so621746a12.2
 for <igt-dev@lists.freedesktop.org>; Thu, 30 May 2024 07:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717078820; x=1717683620; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TW++pIojELmK40DrOQKK3vfMBn6yl/U1uPHtCXwDUYg=;
 b=N4kqFuta+gpuuIVeSMPo2+Em0Pvah1Qj2/jfnLETUdR/D+pZR7PagA9B9gHlVqWhct
 eDKV9M683f4UT/b2k+qY+cL95u9fxZP1QWZCFQfisXRIBWBJ4ChKj7rW4H0c04Lh5Q9H
 a3EPBJFgjTFybxI2cGaBdaxGZkL3W5iAw7JWffP0SMCnrAZn8mti31RVAX1fnTZdqDhz
 KL539qSSsX3ENeNE59AmxJQbZX70PHUZhch1q/oFVu/29p+yvOgb8B2s9PYiZRsAiJIq
 CJ6SmlKdSxdRkzxQj+oayjNlu0BX+O8BI7eRZnpsYfnrxN/v3FCVtbomUTiDnlD3LRz3
 kJaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717078820; x=1717683620;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TW++pIojELmK40DrOQKK3vfMBn6yl/U1uPHtCXwDUYg=;
 b=G22+PKUVta37rJrZlKT6KJutZwCokt2EffW4rZP2S30mxTdRaakwa+/yE+IJCnN+eb
 kcot1rhhGyFBKIIf2gz9vXFWu7IcuhodDnfRRCnKRpUI4h+f0orKLxwMnk33R2imFwel
 Bxj8TOAJSa36geWa/edbmcpRtL4jFHYdTTvrd8uaFpPbU0ERx0Dt6iA5xJbVGoiHF+iL
 j+fFm2pJ4uJ3z95RnWQ44b52RX89JNE3Eik4lP8ReAQIGhTzXWVFnbgDMylk5vrn3V4Q
 UyGCIKU9lRpeZY5vti6mM75pJFy7IO0IO7XZAWlOwc6jb8r6gy9nIMpHvndo2rctdd5a
 /eMg==
X-Gm-Message-State: AOJu0YwX7ZiQnGQHc1oEJguntpWfBAAkAJtY1ew86dsN+ZmkX1vKZGeD
 cme+28fbnQ1D5xX12Kms0rIuuBK6+2GHZc/htew0qeQ13AeOM9/FRFSfGL7a
X-Google-Smtp-Source: AGHT+IGned83D4I5/EqNtqS+hITb9a3gg78A5qSPkDhDr6NQ4Zt0gEEG5pel5bmijUbnRhPvNO0CPA==
X-Received: by 2002:a17:90a:4894:b0:2ab:e45a:a27d with SMTP id
 98e67ed59e1d1-2c1abc40baamr2170827a91.39.1717078820193; 
 Thu, 30 May 2024 07:20:20 -0700 (PDT)
Received: from localhost ([192.55.55.56]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c1a777a976sm1823233a91.20.2024.05.30.07.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 07:20:19 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v4 5/5] lib/igt_fb: unify intel blitter fb block copies
 between xe and i915
Date: Thu, 30 May 2024 17:23:46 +0300
Message-ID: <20240530142346.1511811-6-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240530142346.1511811-1-juhapekka.heikkila@gmail.com>
References: <20240530142346.1511811-1-juhapekka.heikkila@gmail.com>
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
 lib/igt_fb.c | 124 +++++++++++++++++++++------------------------------
 1 file changed, 52 insertions(+), 72 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index d8608ef08..a1b798e7f 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2958,35 +2958,68 @@ static void cleanup_blt_resources(uint32_t ctx, uint64_t ahnd, bool is_xe,
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
+	igt_assert(src && dst);
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
-	uint32_t ctx = 0;
-	uint64_t ahnd = 0;
+	uint32_t src_tiling = igt_fb_mod_to_tiling(src_fb->modifier);
+	uint32_t dst_tiling = igt_fb_mod_to_tiling(dst_fb->modifier);
+	uint32_t ctx = 0, bb, mem_region, vm, exec_queue;
+	uint64_t ahnd = 0, bb_size = 4096;
 	const intel_ctx_t *ictx = NULL;
+	intel_ctx_t *xe_ctx = NULL;
 	struct intel_execution_engine2 *e;
-	uint32_t bb, xe_bb;
-	uint64_t bb_size = 4096;
-	struct blt_copy_data blt = {};
-	struct blt_copy_object *src, *dst;
-	struct blt_block_copy_data_ext ext = {}, *pext = NULL;
-	uint32_t mem_region;
 	/* To ignore CC plane */
 	uint32_t src_cc = src_fb->modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC ? 1 : 0;
 	uint32_t dst_cc = dst_fb->modifier == I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC ? 1 : 0;
-	intel_ctx_t *xe_ctx;
-	uint32_t vm, exec_queue;
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
@@ -2995,34 +3028,8 @@ static void blitcopy(const struct igt_fb *dst_fb,
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
@@ -3048,35 +3055,8 @@ static void blitcopy(const struct igt_fb *dst_fb,
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
2.43.2

