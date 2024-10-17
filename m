Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D56AD2126D
	for <igt-dev@archiver.kernel.org>; Thu, 17 Oct 2024 10:14:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 495DA10E7E2;
	Thu, 17 Oct 2024 10:14:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nE7eRHky";
	dkim-atps=neutral
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9215F10E7E2
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Oct 2024 10:14:55 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-71e61b47c6cso600340b3a.2
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Oct 2024 03:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729160095; x=1729764895; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x81XpL8lanEmruyxYi4P4oXNSL7tVb1Md2S9A5KFX60=;
 b=nE7eRHky9qUYUdgZNG8u6A3oq7oDlMLMyjsVAMtPAgjXa+zv1UVuSrDs8HJaP96vbc
 0klhCX8N5jdjZNvgtllayPdh3Lv5kkW8DFqWL5/CbXUORI7tWmq2PyEmQZs4JFm4yYOh
 1ggxy9ynHZAHxdHexLLnaGNsZylz6To8Fp6e8xpknAKwL3owHI63AifTSMIv/nLei6pR
 CXVQ5u72M/y5SmPu2V7Cf4TUixIg98toM0bss17vYjOpqki7rTHq4t/N0D9oIICVHhi5
 2RtJNQLEKlsavK66riSRc6Kf9PRXIRuxDL7KfUvqNXK59d0XP7C10BoI9hL1aG6tT7Ra
 34dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729160095; x=1729764895;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x81XpL8lanEmruyxYi4P4oXNSL7tVb1Md2S9A5KFX60=;
 b=rzE6ddUK15fvM+EqLH8GX6UF7qllIxrCOt85PogcPKnchGBL+hLDiGlXekqGpXdLqS
 E+A7ea8+J0SdLUXZbX2eCkWhl0W3PuNNV8eDuJbhngsubkJK/+oRYDccqzOKf4XPbA9P
 GqFGg94iGUyWcOzpIIoQlFqiQTuSCd5p0HQL1ssjMgB4wZtcqHHQ31/sb4EAKUZzx+Vf
 wPxkuG937KfIWoYQ/GfxtNUZ0zFVQxCTlRMbf1z9pknZJFijB3Iqa2HY7gDjMzFzcCk6
 X8YwcFi/9LPfy8ZxFqOupfzNMX++rBuQPrLBp/3d5WYV6HxOkNWowuOqUnXWq3xATjZH
 GXmw==
X-Gm-Message-State: AOJu0Yz9FfW7v3fjMsCycqkdH/KhomxRbt08vq78SxD2z0F27rCzxgSb
 VRIsdg0kEUx7PEaLZO1lScKCxj2gmVtluEDm7rjYINzCY6EntvY+NgG6PnefsEY=
X-Google-Smtp-Source: AGHT+IFAHBsV0XQmShd4YcA9Po2Hzf1Wxz7P2nA8n9odtUrg45WSnDV3h3QTsx2jgD5ofMnMGPo55w==
X-Received: by 2002:a05:6a00:1253:b0:71e:6d1c:8ded with SMTP id
 d2e1a72fcca58-71e7db0907bmr10224347b3a.27.1729160094462; 
 Thu, 17 Oct 2024 03:14:54 -0700 (PDT)
Received: from localhost ([192.55.55.48]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71e773b15f4sm4431338b3a.85.2024.10.17.03.14.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2024 03:14:54 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 2/3] lib/igt_fb: add igt_xe2_blit_with_dst_pat function
Date: Thu, 17 Oct 2024 13:18:31 +0300
Message-ID: <20241017101832.3471966-3-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241017101832.3471966-1-juhapekka.heikkila@gmail.com>
References: <20241017101832.3471966-1-juhapekka.heikkila@gmail.com>
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
index b8ffd7cfb..a265398d9 100644
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
+		       pat_index, /*intel_get_pat_idx_uc(fb->fd),*/
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

