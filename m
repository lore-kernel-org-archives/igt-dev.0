Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD7AD2127D
	for <igt-dev@archiver.kernel.org>; Thu, 17 Oct 2024 11:23:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10AD710E7ED;
	Thu, 17 Oct 2024 11:23:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iUTTQl5H";
	dkim-atps=neutral
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEA3810E7ED
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Oct 2024 11:23:51 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-7ea7e250c54so566416a12.0
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Oct 2024 04:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729164231; x=1729769031; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3JLtcNP14AN5QgjSFUAaQLhQdHmSwA3X0B6r6n3bmss=;
 b=iUTTQl5HWc4oQJylLd20y262TcRwaegey6iKg8g3nKung+kpeFZi17KCuqx4dWg6Jw
 zQhILstY8ObOVmUs8MmkrzOA2h8YafCGSmp2+DQdvcNKhpElqB5PnLOt4ZAdBP3TTg+r
 7+T0l2m4MPadqq2xjvkx3d1EXFxEX+xHNcJvr4vUBmpznbYTUC5+1cZLP3OyLcC2zmg5
 ZUYalSqCPmnqvhX6weXRgT9Y3k146hEr4m6JSBuca2S88Xx2MHO+tqsMslS//2bvKs3/
 8q1gggGFkVrZN4Rn3ilG+7MGGQ7UL6IMPM1CZc3CswAo1IVGRg3iUtxyUYRRvWvjqNVj
 dVCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729164231; x=1729769031;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3JLtcNP14AN5QgjSFUAaQLhQdHmSwA3X0B6r6n3bmss=;
 b=I36RLNj3w1Do4xHY/UPYnNqY0/0/NCA7WDXLRqlYN/3sxbJfLmFHnXJhdp2hDGV3Yw
 oGeL95M2rPuxzAlnORl4XQ9gn/8H1xqnovLNkwbqDZFPiuKzdrBBH01nxW3ui8OaH0R2
 kIO4WKVQ6mVJ5jKfvfSeXvh3KEO/yiU6Oc+n9avYY24N95WhRgU/erFS5ZDcng+wE42r
 LKftQE2c7B6UaAyG6/c4Dm6sW12sEcGUsBbGKtGatQKJdHDItE/9fDuV7Q9Hwlh+MWtK
 IMpSKnEG1v2/j9nlbXRbVB2I6Pj2m3T3RIzgbuBeOOkYrgw8gtxawaofhIWJhDyQ+Z95
 Guog==
X-Gm-Message-State: AOJu0YzKrTRUaMgu3akLI0xX4A004MQofk31sgZyR9URrq0TMNMD8m66
 nc05Y/kI2NMXT+xXuDX7MVONX1+vIvLAmD0pNcvRcYmb4X5WPNZnkRY+mvoulB0=
X-Google-Smtp-Source: AGHT+IE5byoQXtLpwRdkqdXYgf1Wj/MSnzyyI+bpgFscXn3Ps8CeBGeeE6VnNUjB7AX+W9+BE3vIQQ==
X-Received: by 2002:a05:6a20:438d:b0:1d6:2378:cffd with SMTP id
 adf61e73a8af0-1d8c93f5dbemr28421076637.0.1729164231168; 
 Thu, 17 Oct 2024 04:23:51 -0700 (PDT)
Received: from localhost ([134.134.139.75]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7ea9c715d7dsm4736878a12.88.2024.10.17.04.23.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2024 04:23:50 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v2 2/3] lib/igt_fb: add igt_xe2_blit_with_dst_pat
 function
Date: Thu, 17 Oct 2024 14:27:27 +0300
Message-ID: <20241017112728.3503205-3-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241017112728.3503205-1-juhapekka.heikkila@gmail.com>
References: <20241017112728.3503205-1-juhapekka.heikkila@gmail.com>
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

Add igt_xe2_blit_with_dst_pat() function which use blitter block copy
to copy src framebuffer to destination framebuffer setting destination
pat index to what is passed as parameter.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/igt_fb.c | 65 ++++++++++++++++++++++++++++++++++++++++++++--------
 lib/igt_fb.h |  3 +++
 2 files changed, 59 insertions(+), 9 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index b8ffd7cfb..e87809ba3 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2833,7 +2833,8 @@ static struct blt_copy_object *allocate_and_initialize_blt(const struct igt_fb *
 							   uint32_t handle,
 							   uint32_t memregion,
 							   enum blt_tiling_type blt_tile,
-							   uint32_t plane)
+							   uint32_t plane,
+							   uint8_t pat_index)
 {
 	uint64_t stride;
 	struct blt_copy_object *blt = calloc(1, sizeof(*blt));
@@ -2845,7 +2846,7 @@ static struct blt_copy_object *allocate_and_initialize_blt(const struct igt_fb *
 
 	blt_set_object(blt, handle, fb->size, memregion,
 		       intel_get_uc_mocs_index(fb->fd),
-		       intel_get_pat_idx_uc(fb->fd),
+		       pat_index,
 		       blt_tile,
 		       igt_fb_is_ccs_modifier(fb->modifier) ? COMPRESSION_ENABLED : COMPRESSION_DISABLED,
 		       igt_fb_is_gen12_mc_ccs_modifier(fb->modifier) ? COMPRESSION_TYPE_MEDIA : COMPRESSION_TYPE_3D);
@@ -2867,7 +2868,8 @@ static void *map_buffer(int fd, uint32_t handle, size_t size)
 }
 
 static struct blt_copy_object *blt_fb_init(const struct igt_fb *fb,
-					   uint32_t plane, uint32_t memregion)
+					   uint32_t plane, uint32_t memregion,
+					   uint8_t pat_index)
 {
 	uint32_t name, handle;
 	enum blt_tiling_type blt_tile;
@@ -2883,7 +2885,8 @@ static struct blt_copy_object *blt_fb_init(const struct igt_fb *fb,
 		return NULL;
 
 	blt_tile = fb_tile_to_blt_tile(fb->modifier);
-	blt = allocate_and_initialize_blt(fb, handle, memregion, blt_tile, plane);
+	blt = allocate_and_initialize_blt(fb, handle, memregion, blt_tile,
+					  plane, pat_index);
 
 	if (!blt)
 		return NULL;
@@ -3024,11 +3027,14 @@ static void do_block_copy(const struct igt_fb *src_fb,
 			  uint32_t mem_region, uint32_t i, uint64_t ahnd,
 			  uint32_t xe_bb, uint64_t bb_size,
 			  const intel_ctx_t *ctx,
-			  struct intel_execution_engine2 *e)
+			  struct intel_execution_engine2 *e,
+			  uint8_t dst_pat_index)
 {
 	struct blt_copy_data blt = {};
-	struct blt_copy_object *src = blt_fb_init(src_fb, i, mem_region);
-	struct blt_copy_object *dst = blt_fb_init(dst_fb, i, mem_region);
+	struct blt_copy_object *src = blt_fb_init(src_fb, i, mem_region,
+						  intel_get_pat_idx_uc(src_fb->fd));
+	struct blt_copy_object *dst = blt_fb_init(dst_fb, i, mem_region,
+						  dst_pat_index);
 	struct blt_block_copy_data_ext ext = {}, *pext = NULL;
 
 	igt_assert(src && dst);
@@ -3093,7 +3099,8 @@ static void blitcopy(const struct igt_fb *dst_fb,
 
 		if (is_xe) {
 			do_block_copy(src_fb, dst_fb, mem_region, i, ahnd,
-				      bb, bb_size, xe_ctx, NULL);
+				      bb, bb_size, xe_ctx, NULL,
+				      intel_get_pat_idx_uc(dst_fb->fd));
 		} else if (fast_blit_ok(src_fb) && fast_blit_ok(dst_fb)) {
 			igt_blitter_fast_copy__raw(dst_fb->fd,
 						   ahnd, ctx, NULL,
@@ -3116,7 +3123,8 @@ static void blitcopy(const struct igt_fb *dst_fb,
 			for_each_ctx_engine(src_fb->fd, ictx, e) {
 				if (gem_engine_can_block_copy(src_fb->fd, e)) {
 					do_block_copy(src_fb, dst_fb, mem_region, i, ahnd,
-						      bb, bb_size, ictx, e);
+						      bb, bb_size, ictx, e,
+						      intel_get_pat_idx_uc(dst_fb->fd));
 					break;
 				}
 			}
@@ -3146,6 +3154,45 @@ static void blitcopy(const struct igt_fb *dst_fb,
 			      src_fb->fd, ictx);
 }
 
+/**
+ * igt_xe2_blit_with_dst_pat:
+ * @dst_fb: pointer to a destination #igt_fb structure
+ * @src_fb: pointer to a source #igt_fb structure
+ * @dst_pat_index: uint8_t pat index to set for destination framebuffer
+ *
+ * Copy matching size src_fb to dst_fb with setting pat index to destination
+ * framebuffer
+ */
+void igt_xe2_blit_with_dst_pat(const struct igt_fb *dst_fb,
+			       const struct igt_fb *src_fb,
+			       uint8_t dst_pat_index)
+{
+	uint32_t ctx = 0, bb, mem_region, vm, exec_queue;
+	uint64_t ahnd = 0, bb_size = 4096;
+	intel_ctx_t *xe_ctx = NULL;
+
+	igt_assert_eq(dst_fb->fd, src_fb->fd);
+	igt_assert_eq(dst_fb->num_planes, src_fb->num_planes);
+	igt_assert(!igt_fb_is_gen12_rc_ccs_cc_modifier(src_fb->modifier));
+	igt_assert(!igt_fb_is_gen12_rc_ccs_cc_modifier(dst_fb->modifier));
+
+	setup_context_and_memory_region(dst_fb, &ctx, &ahnd, &mem_region,
+					&vm, &bb, &bb_size, NULL,
+					&exec_queue, &xe_ctx);
+
+	for (int i = 0; i < dst_fb->num_planes; i++) {
+		igt_assert_eq(dst_fb->plane_bpp[i], src_fb->plane_bpp[i]);
+		igt_assert_eq(dst_fb->plane_width[i], src_fb->plane_width[i]);
+		igt_assert_eq(dst_fb->plane_height[i], src_fb->plane_height[i]);
+
+		do_block_copy(src_fb, dst_fb, mem_region, i, ahnd, bb, bb_size,
+			      xe_ctx, NULL, dst_pat_index);
+	}
+
+	cleanup_blt_resources(ctx, ahnd, true, bb, exec_queue, vm, xe_ctx,
+			      src_fb->fd, NULL);
+}
+
 static void free_linear_mapping(struct fb_blit_upload *blit)
 {
 	int fd = blit->fd;
diff --git a/lib/igt_fb.h b/lib/igt_fb.h
index eb707cc34..d5aa1e88a 100644
--- a/lib/igt_fb.h
+++ b/lib/igt_fb.h
@@ -187,6 +187,9 @@ bool igt_fb_is_gen12_mc_ccs_modifier(uint64_t modifier);
 bool igt_fb_is_ccs_plane(const struct igt_fb *fb, int plane);
 bool igt_fb_is_gen12_ccs_cc_plane(const struct igt_fb *fb, int plane);
 int igt_fb_ccs_to_main_plane(const struct igt_fb *fb, int ccs_plane);
+void igt_xe2_blit_with_dst_pat(const struct igt_fb *dst_fb,
+			       const struct igt_fb *src_fb,
+			       uint8_t dst_pat_index);
 
 /* cairo-based painting */
 cairo_surface_t *igt_get_cairo_surface(int fd, struct igt_fb *fb);
-- 
2.45.2

