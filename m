Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFDA31098781
	for <igt-dev@archiver.kernel.org>; Fri, 20 Mar 2026 13:46:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A68EB10E466;
	Fri, 20 Mar 2026 13:46:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Trpi6c3k";
	dkim-atps=neutral
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D61CA10E466
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 13:46:35 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-82c20f1e890so258727b3a.3
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Mar 2026 06:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1774014395; x=1774619195; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XQmYAeM7rbwAT1pVtONr6FfH7izaTz399BRtV7it6B4=;
 b=Trpi6c3kSWIiVmVgriLceM1YZ8yqLQ/pAZOlrYKg+8AWviU2ixGMKAYWRQGnEKlUxT
 1/K309NaDcZZ2GzPOiQSLegCuKDgTvauYuI/sE0fas6rhgqh79uudHfAtyoFXfRIYW0B
 O8J5HQ7DnXElNymdGuMtIuEX3BXDeqfYE9W/uqvim1zHSng+NXpmc6BbmE6F/sTHyG+5
 Bh7Ubld+y2Zan/FZelgukVA9ISJkjvspPOL5CDver3oFqpORAjQPdCUptVMOIwjbe37J
 pe8KIzYuGJJqHUP/q4JySM0X9mEAmASRFcBMKK4YmeC3QI/V4LLxLvQaLH5fVVwEX29S
 pfDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774014395; x=1774619195;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XQmYAeM7rbwAT1pVtONr6FfH7izaTz399BRtV7it6B4=;
 b=UocyuPDI+WXxZ7tRnE7IHyMe5LQefMb+EH2vUsZUV4i1if1rF3eQgU/SSfBwubBlaa
 X8QT93Ub5jZkzExe9HeRaZa+/qO3gV6pfLecF3vP+vRvmPO1VwtE3B2LwgfxT1bADzzQ
 5c5sM4aNaU0YYHi7TQnDR6tWAYPzDqeVoUspelvthgEmUgSA5Oomy1E99CJbhXyi/RNX
 lJYrBStmDrBY8C0umYMmYykpD4SftCmFMS1cNd7l9/n5oD3u3VswWTjI1+JIlroCFjgM
 YOUb4IbvS4vMw+qsSYUAv5Ha6HfNjJC8nimzcbgbsMNx1I2g5E/u0KnA1U3oQPrl58cP
 z21A==
X-Gm-Message-State: AOJu0Yw1VdkA89rgP9gagdWKn8SaOquhKiQb/fEuWoZsQ1c+4w4Jpwxb
 HevI+2bFslI0/F2R0Vmsm6XWDlHV1FABaaA+79nbYj33BcaWPh0YRwdDaHdxejVJ
X-Gm-Gg: ATEYQzzDTgWzojAtLellNYN+Y+CBBhYOtgsjGlbIDpT5+pZt/sI/+qc6NQAScksfZ5e
 AHXFnhKkVPY/9hKPRToeOij8BU0TrACrdpDVZMFbSOVqq+sSUC0k0XvyTlW6LIJfrpvcEdKdbCD
 Skzbl759axcx3dRWV7jLqfkglMCJ0RCof80oXBjuwuKkn2mIpWuGfQU6XH7r2ty7MKDlroB3nrd
 9SS3u7kyQDQKRYR5ntDKOQayvEyNlJiwwG6Nol40cX61jmJ+/2EZN6nOzRrMCRTBerWGW8wXEfz
 1myYrqCn2Hc4wx3OXy8DW+UpMkY+yylPiwegxi9E1OF9y+PrmmkGH/7dz/JzK513HAsPExxlTgJ
 U71PPRuztNmJIEV2RRfcB//XmhpLZN1SNG0Ztgn8d9+/M078ErhFxCyGsAOCF7wSBUbsfdwK2Kv
 gyiTSUya9SYCk//ib5t8NGkgx2bQ0f0H8ytnspKanOflVXoE3yOZCeis+DSwY6d/u996u1Oyb1
X-Received: by 2002:a05:6a00:2195:b0:7f1:4:66b with SMTP id
 d2e1a72fcca58-82a8c37f940mr2463167b3a.44.1774014394940; 
 Fri, 20 Mar 2026 06:46:34 -0700 (PDT)
Received: from localhost ([134.134.137.74]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82b0409c6besm2535931b3a.32.2026.03.20.06.46.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2026 06:46:34 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 2/8] lib/intel_batchbuffer: make __intel_bb_create gt
 aware
Date: Fri, 20 Mar 2026 15:46:05 +0200
Message-ID: <20260320134611.876379-3-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260320134611.876379-1-juhapekka.heikkila@gmail.com>
References: <20260320134611.876379-1-juhapekka.heikkila@gmail.com>
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

add possibility to use gt id in __intel_bb_create

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/intel_batchbuffer.c | 20 +++++++++++---------
 lib/intel_batchbuffer.h |  1 +
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index b09506574..802e771a4 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -905,7 +905,8 @@ static struct intel_bb *
 __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
 		  uint32_t size, bool do_relocs,
 		  uint64_t start, uint64_t end, uint64_t alignment,
-		  uint8_t allocator_type, enum allocator_strategy strategy, uint64_t region)
+		  uint8_t allocator_type, enum allocator_strategy strategy,
+		  uint64_t region, uint16_t gt_id)
 {
 	struct drm_i915_gem_exec_object2 *object;
 	struct intel_bb *ibb = calloc(1, sizeof(*ibb));
@@ -915,6 +916,7 @@ __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
 	ibb->devid = intel_get_drm_devid(fd);
 	ibb->gen = intel_gen(ibb->devid);
 	ibb->ctx = ctx;
+	ibb->gt_id = gt_id;
 
 	ibb->fd = fd;
 	ibb->driver = is_i915_device(fd) ? INTEL_DRIVER_I915 :
@@ -1059,7 +1061,7 @@ struct intel_bb *intel_bb_create_full(int fd, uint32_t ctx, uint32_t vm,
 				      enum allocator_strategy strategy, uint64_t region)
 {
 	return __intel_bb_create(fd, ctx, vm, cfg, size, false, start, end,
-				 alignment, allocator_type, strategy, region);
+				 alignment, allocator_type, strategy, region, 0);
 }
 
 /**
@@ -1086,7 +1088,7 @@ struct intel_bb *intel_bb_create_with_allocator(int fd, uint32_t ctx, uint32_t v
 {
 	return __intel_bb_create(fd, ctx, vm, cfg, size, false, 0, 0, 0,
 				 allocator_type, ALLOC_STRATEGY_HIGH_TO_LOW,
-				 is_i915_device(fd) ? REGION_SMEM : vram_if_possible(fd, 0));
+				 is_i915_device(fd) ? REGION_SMEM : vram_if_possible(fd, 0), 0);
 }
 
 static bool aux_needs_softpin(int fd)
@@ -1128,7 +1130,7 @@ struct intel_bb *intel_bb_create(int fd, uint32_t size)
 				 relocs && !aux_needs_softpin(fd), 0, 0, 0,
 				 INTEL_ALLOCATOR_SIMPLE,
 				 ALLOC_STRATEGY_HIGH_TO_LOW,
-				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0));
+				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0), 0);
 }
 
 /**
@@ -1157,7 +1159,7 @@ intel_bb_create_with_context(int fd, uint32_t ctx, uint32_t vm,
 				 relocs && !aux_needs_softpin(fd), 0, 0, 0,
 				 INTEL_ALLOCATOR_SIMPLE,
 				 ALLOC_STRATEGY_HIGH_TO_LOW,
-				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0));
+				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0), 0);
 }
 
 /**
@@ -1184,7 +1186,7 @@ intel_bb_create_with_context_in_region(int fd, uint32_t ctx, uint32_t vm,
 	return __intel_bb_create(fd, ctx, vm, cfg, size,
 				 relocs && !aux_needs_softpin(fd), 0, 0, 0,
 				 INTEL_ALLOCATOR_SIMPLE,
-				 ALLOC_STRATEGY_HIGH_TO_LOW, region);
+				 ALLOC_STRATEGY_HIGH_TO_LOW, region, 0);
 }
 
 /**
@@ -1205,7 +1207,7 @@ struct intel_bb *intel_bb_create_with_relocs(int fd, uint32_t size)
 
 	return __intel_bb_create(fd, 0, 0, NULL, size, true, 0, 0, 0,
 				 INTEL_ALLOCATOR_NONE, ALLOC_STRATEGY_NONE,
-				 REGION_SMEM);
+				 REGION_SMEM, 0);
 }
 
 /**
@@ -1231,7 +1233,7 @@ intel_bb_create_with_relocs_and_context(int fd, uint32_t ctx,
 
 	return __intel_bb_create(fd, ctx, 0, cfg, size, true, 0, 0, 0,
 				 INTEL_ALLOCATOR_NONE, ALLOC_STRATEGY_NONE,
-				 REGION_SMEM);
+				 REGION_SMEM, 0);
 }
 
 /**
@@ -1256,7 +1258,7 @@ struct intel_bb *intel_bb_create_no_relocs(int fd, uint32_t size)
 	return __intel_bb_create(fd, 0, 0, NULL, size, false, 0, 0, 0,
 				 INTEL_ALLOCATOR_SIMPLE,
 				 ALLOC_STRATEGY_HIGH_TO_LOW,
-				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0));
+				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0), 0);
 }
 
 static void __intel_bb_destroy_relocations(struct intel_bb *ibb)
diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
index d0a7c8dc7..7049dd2d0 100644
--- a/lib/intel_batchbuffer.h
+++ b/lib/intel_batchbuffer.h
@@ -269,6 +269,7 @@ struct intel_bb {
 	struct igt_pxp pxp;
 	uint32_t ctx;
 	uint32_t vm_id;
+	uint16_t gt_id;
 
 	bool xe_bound;
 	uint32_t engine_syncobj;
-- 
2.43.0

