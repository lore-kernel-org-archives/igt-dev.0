Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 298D1C04FFE
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 14:33:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D11F2113405;
	Tue, 23 Apr 2024 14:33:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cVCNTMlY";
	dkim-atps=neutral
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4AC9113405
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 14:33:03 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-516d1ecaf25so7502782e87.2
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Apr 2024 07:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713882782; x=1714487582; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+pasxyCj3/teaKviOMlASMiZcwX3BOB1nh8sPDoVkBc=;
 b=cVCNTMlY1UZDpAQFeKaCbB6UYaxVlKiLZ53Lm/95pVcPy3npXZ8/Y8N3hHKfHnS7YF
 Xr1f6JWM7RJ1iPJKok6PkevQvauZLoLe9GZ31ZSxccn0s6haXTHZyE2luy7QRcu9qTuU
 VFDA+Aa6z5S391qcGTJhAXNovEzyKAed+EO2gx0r7gC8bHwA00wjU+Pg406flpgGBOTp
 4KapaSsKCg3PVQxhGArU7bcCcQOQ7JoGUQS9ZpvEBSat4UG2yCiDRQhGn21JKiBEOXAf
 a4z4TdxpLSFXSYHAmpki0gQiqnks5hmjd0PqnecApymPU7WRn/ght43dcp1a7Df6R9rq
 7zyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713882782; x=1714487582;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+pasxyCj3/teaKviOMlASMiZcwX3BOB1nh8sPDoVkBc=;
 b=Y3QWWamVMGJfyVTMBWTlO/INf1pJGoJtmqI1apLcq8miOziuZgy0bt0D3uq+xbZTKg
 fnpx7bABVgS7uTl33l05tjB69/5wgELGE4+ge0sEV04CjogOrJNTBZ+o7UkZ8UQNVDyx
 158EdE7uJ/UBJeRUE2s71NEohMKEwd3nN5Y3EPAdTaRWxUZU7WqiGTj9Evi4qjO6oWPJ
 2nefF3GTB8KPYj2s1ykd0wzv8QVoV56AAZ9MU8y7gOKdjZP9AI07oqI8lQ6dO4l34yov
 zVzGGYXVt9m44kTmJ06Y1uT0Mup90jry0qMWVYIF8WlCQGfpqT+V3SU2SDMn3jczc1DS
 CbNg==
X-Gm-Message-State: AOJu0Yw0jquTqbqsfbORQPfA/ETUsrpXDeHpGFfUhX0T0IR6s8BgFtV9
 MRMDvq0dk6Z7X2KLI19QVHOQ5FF5ijPCvinXaaJ9ZIkr5ycTQD8iSBmL7jtmih4=
X-Google-Smtp-Source: AGHT+IEhRWyiYAIGc2AdENjqKuQXbOUoZqbzfdq4UWi51akTOzTZF7iwoin1cmIXeeBr9Rg0LaA2qw==
X-Received: by 2002:ac2:414e:0:b0:519:22f3:be78 with SMTP id
 c14-20020ac2414e000000b0051922f3be78mr7143081lfi.59.1713882781266; 
 Tue, 23 Apr 2024 07:33:01 -0700 (PDT)
Received: from jheikkil-mobl1.. (91-156-196-125.elisa-laajakaista.fi.
 [91.156.196.125]) by smtp.gmail.com with ESMTPSA id
 d25-20020a196b19000000b0051af5cba0f3sm988781lfa.11.2024.04.23.07.33.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Apr 2024 07:33:00 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v2 4/6] lib/igt_fb: separate intel blitter context setup
 from blitter function
Date: Tue, 23 Apr 2024 17:32:44 +0300
Message-Id: <20240423143246.130884-5-juhapekka.heikkila@gmail.com>
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

separate context and memory region setup to setup_context_and_memory_region()
helper to reduce blitcopy() overall size.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/igt_fb.c | 72 ++++++++++++++++++++++++++++++----------------------
 1 file changed, 41 insertions(+), 31 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index ef21095ce..0dec6ce42 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2899,6 +2899,44 @@ static uint32_t blt_compression_format(struct blt_copy_data *blt,
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
@@ -2919,11 +2957,6 @@ static void blitcopy(const struct igt_fb *dst_fb,
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
@@ -2931,32 +2964,9 @@ static void blitcopy(const struct igt_fb *dst_fb,
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

