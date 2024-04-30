Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D451C10F16
	for <igt-dev@archiver.kernel.org>; Tue, 30 Apr 2024 16:29:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E884D112C02;
	Tue, 30 Apr 2024 16:29:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MQzHPpCT";
	dkim-atps=neutral
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D40EA112BCE
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Apr 2024 16:29:48 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2dd19c29c41so72437651fa.3
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Apr 2024 09:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714494587; x=1715099387; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zDF/z+QkZ36f2uK/kdBfRtwNQWLf5CQT1K3dW3K6HvY=;
 b=MQzHPpCT4J4QKq5lJLZU8XK1eIOJdQITyZNuiUjsAZTX7D5fnZj8TWOnb/1aeHZ4Q6
 kqCmtF+HDwMa2sz3qatO4Y3SkRBbx4IEPwJ6A5htKTQ2AqBAN1Hu8NYzkM38Fu7GeojX
 xc0mqOPPVgO43WlxU9xQBoK3lNJB4s3wiQHXMAyewFIvAlAukbn2kX0VypB/QFkmazq8
 gHk+NTq+lidxJGh2xbgGv8xPvZVmfj+b6diN/6nb7ksbOQtDFjEhlziKkvD2Nzz5PbZv
 4aqXkh4YEZE/Ov4WXsQPdWinDX+v38UeHr7BkJEgDFcHuW4VDsWXVcFSGS3dGaPYyId/
 wbNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714494587; x=1715099387;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zDF/z+QkZ36f2uK/kdBfRtwNQWLf5CQT1K3dW3K6HvY=;
 b=B75frOfDxHqW/8MFBblciZUnaeMuYdTJoPsei5pPy3UXIZS63yShEAjRNAnTodR2rj
 QcJF4TNPkYx1VRckuY8+SWTNozyuUCVv5g3n+3J+4lAy1Ivjhobx12zLZSY2U3bvHYGk
 QOc8eBoAWOyBfR9Q8jAuWuqv9Vd/rBpjP5N8AvRBQUT1w2Dx6rwErna00yBbW1WeqS4H
 ho+YRziMIsQW9aEZLoMnEPajLpl1vZKBjCSyjeRmaqn3pQZYr1rINA0gcSqaYAkMNM+S
 spFRTg9ZiJv7PtvmWwm4aCEqigtCc+PJ0hYP7GjB6Z/dg3TOArlHiHt6C4TBOkgQPl4O
 wYhg==
X-Gm-Message-State: AOJu0YxXWNHHJzJ98NQ8I042ODBUjvJGjrE04Ka7xRszkn5K3Mcawj6M
 2vImtpTLe5flRDJma7hYi+Ha5LOIuE32FWKRNn64AzyDgia6FIyL2faaVIie3sE=
X-Google-Smtp-Source: AGHT+IEyU1wns3MWY86vyzsXgrDTWE7tpCxckRntM2FQi7mePOMgN+swQMuttUb9A5m062468ZbYmQ==
X-Received: by 2002:a2e:9907:0:b0:2dc:d2c5:ed0 with SMTP id
 v7-20020a2e9907000000b002dcd2c50ed0mr98805lji.12.1714494586445; 
 Tue, 30 Apr 2024 09:29:46 -0700 (PDT)
Received: from jheikkil-mobl1.. (91-156-196-125.elisa-laajakaista.fi.
 [91.156.196.125]) by smtp.gmail.com with ESMTPSA id
 z19-20020a2e9b93000000b002e0e410ad06sm302814lji.138.2024.04.30.09.29.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 09:29:45 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v3 4/6] lib/igt_fb: separate intel blitter context setup
 from blitter function
Date: Tue, 30 Apr 2024 19:29:37 +0300
Message-Id: <20240430162939.272990-5-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240430162939.272990-1-juhapekka.heikkila@gmail.com>
References: <20240430162939.272990-1-juhapekka.heikkila@gmail.com>
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
index b4afcaacb..1730f6394 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2900,6 +2900,44 @@ static uint32_t blt_compression_format(struct blt_copy_data *blt,
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
@@ -2920,11 +2958,6 @@ static void blitcopy(const struct igt_fb *dst_fb,
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
@@ -2932,32 +2965,9 @@ static void blitcopy(const struct igt_fb *dst_fb,
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

