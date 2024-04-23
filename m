Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6EEEC04FFE
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 14:33:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A89910FC9D;
	Tue, 23 Apr 2024 14:33:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AMnn1vij";
	dkim-atps=neutral
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D689113409
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 14:33:05 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-51abd580902so3919075e87.1
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 07:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713882783; x=1714487583; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HyytRMTZt41rufLBWw4UG6c2SOGAu61R/ZRtFLqroHQ=;
 b=AMnn1vijBXRpmAoOFlrH3/YO8jiQHYiMshc0/16mkr45iQ1BuJa9wUhbUWXKke/mP/
 T4UdZkA9pWeOHAps1HIWYIqcieb37xI8Bo84R0BjosFjgJXuhQbrkPLXl/FQgc2axqaG
 zVPTwWQExsW7zA+Bw4qNPw4qkMv9Ri6r5bkLR0/klukbmHY2giOLh4ZyudMIqUxxDcZO
 Ow1VO5rzmJwgv/F+zKezhB8OeSNoBLzWD7yBmL2UHXCxq4KOtNTPaoFnoGj/1W6S5ql5
 kY1qANOANt+hyPmb87u0Wota+YTz9gBdsctNfJE7Xr85pnkbfvfYi74Iv5pbQkDwdoSc
 Poiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713882783; x=1714487583;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HyytRMTZt41rufLBWw4UG6c2SOGAu61R/ZRtFLqroHQ=;
 b=A7PDzVf3eNrSD0uqQtRyHHH+TOD3istlEc5tD2TRc3zUqNN8MVf+gQS80DUdzWs4+x
 0PNzsn3dsVBZk6F0ja1VCjqktT5CwJkRM7KgLgNTZprR3E6xHSOrivZly10FKlNI8h6k
 Oh+SzsEoQDTNHnMmiFLQbsmdngjryzNZGBq0Q3AcYGtZtrxC3DAiqBxhCIF6eICNBWF5
 G+F2NV+GzNiFmOkL9JureO970s+Gmt4R69hqOLSjqZth8m5sUYcyx1EIPXIFA9X9725V
 eezuSBX5D2Qk5PCGIP7W7cSy5D7Uc/LJJHZE4fGr4r1gC8eL5biUAtioDAuTyo5T7sKC
 2VJg==
X-Gm-Message-State: AOJu0Yw6rqsENjQEWWEryXDewdoGH9fTdmtvV4MbZoT/1Zf/s39rdKZ5
 IQclxlYBal18DNEA+mn0DkVDHDxadmzigsUEYjJ7c4fR4fkPcgakVDmZoAq7540=
X-Google-Smtp-Source: AGHT+IHCspiI2zNlkBiGZ2C62BpsJNUyIYMdhSKOsv60kBcDGrliGPl4VRMRWjZDIa4u/FBng8Ittg==
X-Received: by 2002:a05:6512:291:b0:51b:a86:ab57 with SMTP id
 j17-20020a056512029100b0051b0a86ab57mr929480lfp.22.1713882782885; 
 Tue, 23 Apr 2024 07:33:02 -0700 (PDT)
Received: from jheikkil-mobl1.. (91-156-196-125.elisa-laajakaista.fi.
 [91.156.196.125]) by smtp.gmail.com with ESMTPSA id
 d25-20020a196b19000000b0051af5cba0f3sm988781lfa.11.2024.04.23.07.33.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Apr 2024 07:33:02 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v2 6/6] lib/igt_fb: unify intel blitter fb block copies
 between xe and i915
Date: Tue, 23 Apr 2024 17:32:46 +0300
Message-Id: <20240423143246.130884-7-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240423143246.130884-1-juhapekka.heikkila@gmail.com>
References: <20240423143246.130884-1-juhapekka.heikkila@gmail.com>
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
 lib/igt_fb.c | 122 +++++++++++++++++++++------------------------------
 1 file changed, 50 insertions(+), 72 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 7aaeffeee..00be62287 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2956,35 +2956,66 @@ static void cleanup_blt_resources(uint32_t ctx, uint64_t ahnd, bool is_xe,
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
@@ -2993,34 +3024,8 @@ static void blitcopy(const struct igt_fb *dst_fb,
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
@@ -3046,35 +3051,8 @@ static void blitcopy(const struct igt_fb *dst_fb,
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

