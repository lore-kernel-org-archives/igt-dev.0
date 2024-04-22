Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9200AC1746D
	for <igt-dev@archiver.kernel.org>; Mon, 22 Apr 2024 20:45:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81049112D75;
	Mon, 22 Apr 2024 20:45:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NDaEW55U";
	dkim-atps=neutral
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CEC7112D6F
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Apr 2024 20:45:06 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-51b2f105829so2051881e87.3
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Apr 2024 13:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713818704; x=1714423504; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WKBkSw/npu4ETSiXEHbVza6HZYHPiJWNHXHd2FYGbbU=;
 b=NDaEW55UgOSM9r8wk+GhX+NJwzcJzqrk7MgvMMCk6CXAcpYIZfH+qWaGAryU6Fiwoo
 0K3KTGN0lJQsj6k1/nhfjRxW1BYtQ15FowZIqUkKD5JvfjVQv/8KRmxohzM++JteCy0+
 42sXQtnuRJhEMmi5oph/QiJ5605Lvo1zwcEokoxHJ8vkQPks7IpQRjj4avNRSNlnsM4C
 ++HO8XmlijVv6g5PxX6/i3PECLc7nbUr5XzmIPMkMV5NzluOuJ9PuijhpRkBcr2w0oRo
 tMuPkmbPThY1LOObyfQWs27udv2MxK7hL1GoxutWIwxotC9w6hUlDiLXZUSkvygCk31X
 wovA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713818704; x=1714423504;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WKBkSw/npu4ETSiXEHbVza6HZYHPiJWNHXHd2FYGbbU=;
 b=GsxtB/fG5uMppUrwhKgPay86e4GKmtUF2V6giWSHVVY3bAOMwfASzjcz7uSzEW+KKK
 iC0PE1WPty0LEiVF9ZKrwYBQBSyoX6J5353Vw4fRNhHu+gxivTukvf5UsQ7WVSKaAEKf
 9x4Q2/UUhQ9znF9DGHovfF0ft8K4UKmedtkcERXl85chIco0A0dyqyF1ZwRXMZjOEnqf
 cu7my8pZx3k0xv3LSyA791AAg6tQVqTYoeCYsAmcEeFBTc4SH0uh5cgQkKxv4SiTgEaO
 41S+QYlzAN6l+JtG8FcyThULXDzRtba6xJAkaWAxNnrEUDL2PsztgqbH2NQcfHPKsHuV
 9T3A==
X-Gm-Message-State: AOJu0Yz+BiYQli0bShzzgNZbQE73h318bDSMm6bFy+mAmNNA4H/BAXve
 e79j2TrwtP3BFl0bAOiJoGCpdzKLAF2mNVrKcbCr+jYZyqOlMV3O010ZVyOQ2w8=
X-Google-Smtp-Source: AGHT+IE3dHxjjwtT5lLdlBDzxYSkRoccN2i53DQ76WPxCaTaxGDjba7I7cOAO5MXjVbJKhBb4ApMFw==
X-Received: by 2002:a05:6512:3daa:b0:51a:d74b:f122 with SMTP id
 k42-20020a0565123daa00b0051ad74bf122mr9650891lfv.59.1713818704029; 
 Mon, 22 Apr 2024 13:45:04 -0700 (PDT)
Received: from jheikkil-mobl1.. (91-156-196-125.elisa-laajakaista.fi.
 [91.156.196.125]) by smtp.gmail.com with ESMTPSA id
 z9-20020a19f709000000b00515cc918069sm1816413lfe.150.2024.04.22.13.45.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Apr 2024 13:45:03 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 4/6] lib/igt_fb: separate intel blitter context setup
 from blitter function
Date: Mon, 22 Apr 2024 23:44:39 +0300
Message-Id: <20240422204441.106197-5-juhapekka.heikkila@gmail.com>
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

separate context and memory region setup to setup_context_and_memory_region()
helper to reduce blitcopy() overall size.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/igt_fb.c | 72 ++++++++++++++++++++++++++++++----------------------
 1 file changed, 41 insertions(+), 31 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 491cbdaa9..50ca6b81d 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2896,6 +2896,44 @@ static uint32_t blt_compression_format(struct blt_copy_data *blt,
 	igt_assert_f(0, "unknown compression\n");
 }
 
+static void setup_context_and_memory_region(const struct igt_fb *fb, uint32_t *ctx,
+					    uint64_t *ahnd, uint32_t *mem_region,
+					    uint32_t *vm, uint32_t *bb,
+					    uint64_t *bb_size,
+					    const intel_ctx_t **ictx,
+					    uint32_t *exec_queue,
+					    const intel_ctx_t **xe_ctx)
+{
+	struct drm_xe_engine_class_instance inst = {
+		.engine_class = DRM_XE_ENGINE_CLASS_COPY,
+	};
+
+	if (is_i915_device(fb->fd) && !gem_has_relocations(fb->fd)) {
+		*ictx = intel_ctx_create_all_physical(fb->fd);
+		igt_require(gem_has_contexts(fb->fd));
+		*mem_region = HAS_FLATCCS(intel_get_drm_devid(fb->fd)) ? REGION_LMEM(0) : REGION_SMEM;
+		*ctx = gem_context_create(fb->fd);
+		*ahnd = get_reloc_ahnd(fb->fd, *ctx);
+
+		igt_assert(__gem_create_in_memory_regions(fb->fd,
+							  bb,
+							  bb_size,
+							  *mem_region) == 0);
+	} else if (is_xe_device(fb->fd)) {
+		*vm = xe_vm_create(fb->fd, 0, 0);
+		*exec_queue = xe_exec_queue_create(fb->fd, *vm, &inst, 0);
+		*xe_ctx = intel_ctx_xe(fb->fd, *vm, *exec_queue, 0, 0, 0);
+		*mem_region = vram_if_possible(fb->fd, 0);
+
+		*ahnd = intel_allocator_open_full(fb->fd, (*xe_ctx)->vm, 0, 0,
+						 INTEL_ALLOCATOR_SIMPLE,
+						 ALLOC_STRATEGY_LOW_TO_HIGH, 0);
+
+		*bb_size = xe_bb_size(fb->fd, *bb_size);
+		*bb = xe_bo_create(fb->fd, 0, *bb_size, *mem_region, 0);
+	}
+}
+
 static void blitcopy(const struct igt_fb *dst_fb,
 		     const struct igt_fb *src_fb)
 {
@@ -2916,11 +2954,6 @@ static void blitcopy(const struct igt_fb *dst_fb,
 	intel_ctx_t *xe_ctx;
 	uint32_t vm, exec_queue;
 	bool is_xe = is_xe_device(dst_fb->fd);
-	bool is_i915 = is_i915_device(dst_fb->fd);
-
-	struct drm_xe_engine_class_instance inst = {
-		.engine_class = DRM_XE_ENGINE_CLASS_COPY,
-	};
 
 	igt_assert_eq(dst_fb->fd, src_fb->fd);
 	igt_assert_eq(dst_fb->num_planes - dst_cc, src_fb->num_planes - src_cc);
@@ -2928,32 +2961,9 @@ static void blitcopy(const struct igt_fb *dst_fb,
 	src_tiling = igt_fb_mod_to_tiling(src_fb->modifier);
 	dst_tiling = igt_fb_mod_to_tiling(dst_fb->modifier);
 
-	if (is_i915 && !gem_has_relocations(dst_fb->fd)) {
-		igt_require(gem_has_contexts(dst_fb->fd));
-		mem_region = HAS_FLATCCS(intel_get_drm_devid(src_fb->fd))
-			? REGION_LMEM(0) : REGION_SMEM;
-
-		ictx = intel_ctx_create_all_physical(src_fb->fd);
-		ctx = gem_context_create(dst_fb->fd);
-		ahnd = get_reloc_ahnd(dst_fb->fd, ctx);
-
-		igt_assert(__gem_create_in_memory_regions(src_fb->fd,
-							  &bb,
-							  &bb_size,
-							  mem_region) == 0);
-	} else if (is_xe) {
-		vm = xe_vm_create(dst_fb->fd, 0, 0);
-		exec_queue = xe_exec_queue_create(dst_fb->fd, vm, &inst, 0);
-		xe_ctx = intel_ctx_xe(dst_fb->fd, vm, exec_queue, 0, 0, 0);
-		mem_region = vram_if_possible(dst_fb->fd, 0);
-
-		ahnd = intel_allocator_open_full(dst_fb->fd, xe_ctx->vm, 0, 0,
-						 INTEL_ALLOCATOR_SIMPLE,
-						 ALLOC_STRATEGY_LOW_TO_HIGH, 0);
-
-		bb_size = xe_bb_size(dst_fb->fd, bb_size);
-		xe_bb = xe_bo_create(dst_fb->fd, 0, bb_size, mem_region, 0);
-	}
+	setup_context_and_memory_region(dst_fb, &ctx, &ahnd, &mem_region,
+					&vm, &xe_bb, &bb_size, &ictx,
+					&exec_queue, &xe_ctx);
 
 	for (int i = 0; i < dst_fb->num_planes - dst_cc; i++) {
 		igt_assert_eq(dst_fb->plane_bpp[i], src_fb->plane_bpp[i]);
-- 
2.25.1

