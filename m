Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72664C27C4F
	for <igt-dev@archiver.kernel.org>; Thu, 30 May 2024 14:20:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AABCA113621;
	Thu, 30 May 2024 14:20:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="idlGV5hz";
	dkim-atps=neutral
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com
 [209.85.161.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6443113621
 for <igt-dev@lists.freedesktop.org>; Thu, 30 May 2024 14:20:14 +0000 (UTC)
Received: by mail-oo1-f43.google.com with SMTP id
 006d021491bc7-5b53bb4bebaso542188eaf.0
 for <igt-dev@lists.freedesktop.org>; Thu, 30 May 2024 07:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717078813; x=1717683613; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oRh86uXVFfbnJIrGQD2NaEyInrp1LHKxnp1L6awZk4c=;
 b=idlGV5hz/VYi8mFtdE+B2XqOXcSr052wspZSn47UcRyWonrABijeL20qEXqIaxAYho
 LzQcv77vzSFEomZXIBGHT/r6THjjm3d07eru5JaIBy1J8GkaXkCTweE3rVARUbRPQHdQ
 LiYP7uxydzlqyzMAcfBCu+LNWFzd5npD8tMtmgiSkyXMw+ZPbNxLjYY2yJbpUR/JyMu2
 C/BECbG4SUaVpCrD4GxO4jbSIdAsaXE0XT0GORd9wAyIqnZWfKgVlij2vru+3Gb+odSM
 4940AGoLWVnEhYsKCdkp6JB4qiLVnTJcsIHg323B6YRSb8/B5bNtkC8mtj4g7ONvEG7j
 QM+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717078813; x=1717683613;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oRh86uXVFfbnJIrGQD2NaEyInrp1LHKxnp1L6awZk4c=;
 b=SaLkz5PAWwd9VXNZuRUa0B/gTy+esBTrM86Y+mjKAUXH3gRsfuJH5hbQDzSOy920KN
 5XK0HiQTjQjlaW5fdFDqd3N/VIsKPgLDrThABajJQD3Togoo7O+nTzbxhLStNw664y0n
 2SYOT3tAgAclsvPJzXZkjZNhfLaVPblIA98GVKdpM1OmkHF0MwAz1kComd+ig2ZNbpDp
 sZpIFDKFFoC4dwOu1Kwlq9EtcqLSscr0zs1+iO8AYmiH69sgjR0Y8ghepK3IDyNweV06
 VpMilHZsLOnxHDDCx9o4dpRxOLxaOp/42kAGjTmvGb9enk8E9Gck3/vbW+Ci7Dy1+YU6
 kosA==
X-Gm-Message-State: AOJu0Ywwzzo40O/eHEwoffvCR3+j6nxQzhf3i9H4Z31aXNgpeXpL/7GC
 5wv5W4Mn9/v27/wX/6OVaHPLI7dq/OdV/nlIp1wsFJZ0WYXO4UEjByk6zzMI
X-Google-Smtp-Source: AGHT+IEtyoarbORvAmwaxTl0aKHz3OVT7CNdpf5jG1sO+gJCVh3f2Umt70GWHbGHDgdxNr4sdu4xBQ==
X-Received: by 2002:a05:6358:6b8b:b0:199:3938:d78 with SMTP id
 e5c5f4694b2df-199b93943edmr233559955d.13.1717078812855; 
 Thu, 30 May 2024 07:20:12 -0700 (PDT)
Received: from localhost ([134.134.139.78]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-6bd11192ab7sm1979098a12.79.2024.05.30.07.20.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 07:20:12 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v4 3/5] lib/igt_fb: separate intel blitter context setup
 from blitter function
Date: Thu, 30 May 2024 17:23:44 +0300
Message-ID: <20240530142346.1511811-4-juhapekka.heikkila@gmail.com>
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

separate context and memory region setup to setup_context_and_memory_region()
helper to reduce blitcopy() overall size.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/igt_fb.c | 73 ++++++++++++++++++++++++++++++----------------------
 1 file changed, 42 insertions(+), 31 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 588144579..e225b9090 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2900,6 +2900,45 @@ static uint32_t blt_compression_format(struct blt_copy_data *blt,
 	igt_assert_f(0, "unknown compression\n");
 }
 
+static void setup_context_and_memory_region(const struct igt_fb *fb, uint32_t *ctx,
+					    uint64_t *ahnd, uint32_t *mem_region,
+					    uint32_t *vm, uint32_t *bb,
+					    uint64_t *bb_size,
+					    const intel_ctx_t **ictx,
+					    uint32_t *exec_queue,
+					    intel_ctx_t **xe_ctx)
+{
+	struct drm_xe_engine_class_instance inst = {
+		.engine_class = DRM_XE_ENGINE_CLASS_COPY,
+	};
+
+	if (is_i915_device(fb->fd) && !gem_has_relocations(fb->fd)) {
+		igt_require(gem_has_contexts(fb->fd));
+		*ictx = intel_ctx_create_all_physical(fb->fd);
+		*mem_region = HAS_FLATCCS(intel_get_drm_devid(fb->fd)) ?
+			REGION_LMEM(0) : REGION_SMEM;
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
@@ -2920,11 +2959,6 @@ static void blitcopy(const struct igt_fb *dst_fb,
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
@@ -2932,32 +2966,9 @@ static void blitcopy(const struct igt_fb *dst_fb,
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
2.43.2

