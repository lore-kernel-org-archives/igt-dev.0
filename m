Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44163103E198
	for <igt-dev@archiver.kernel.org>; Wed, 18 Mar 2026 15:06:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1F6410E859;
	Wed, 18 Mar 2026 15:05:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="anPjytOc";
	dkim-atps=neutral
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C60C710E856
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 15:05:54 +0000 (UTC)
Received: by mail-dl1-f53.google.com with SMTP id
 a92af1059eb24-1271195d2a7so65503c88.0
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 08:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773846354; x=1774451154; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XQmYAeM7rbwAT1pVtONr6FfH7izaTz399BRtV7it6B4=;
 b=anPjytOcvGVDt4bojEiaYGstq67/B5HQsSJVlg6YKBKEaThAlPTvX0QYplTJ9dKRlk
 T96WQWqb8dYwV18K+H+6VxLzu6qVVqn4Z/M66ZzowsGqsbPK9zX4B8D57qcoKKXmr/hX
 yWck5bApEzCYNj2xe9Z/IxUMhxg7QGyV0lDIl8pVAkPsKTBoVZoYKo1UldLOCrt+F+bm
 VsOM3n2hotHuoi2B3/9NSaRtuZmsbBE1/CuQGOykYIA0tatdIcPdmgR4Jb7gjdz/FAS/
 ab0hqtExkX13NY/hkvDu8ONZpiLMI/EJ/AHa6n7+9F+B1h5YUXvCG/OChCZ8yQnShIm7
 i/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773846354; x=1774451154;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XQmYAeM7rbwAT1pVtONr6FfH7izaTz399BRtV7it6B4=;
 b=GxBHNQwR7Nx8a4MiMLciUjfAxwza4vtDd1EikRUJCQZnAOLUgQXPztcHiO2pGVlUhw
 mAfmReh6lA93EdV39myn4o51sqmxNxp4WIAk7qIb+toBzc2bHbKL4MOdQjGSLZfm4cw7
 Zpp2EjewnNkfBoQqc3So8H/cV6uG95XhUm2aa2kkiTAtJ8oIzGyvLFxEi+wAFLWTaWN+
 EMS3KUnEiEyzIFzKPro0OfFOtClv2rPC6vFf2gRXkRGmrvSjG4lSAIFL01rg42JpzW6C
 +nwQjOVPpleAEBocX8nO08xXAIXfp9+cb0scuDvI/dczQ1xE214yWZA0+4rfBbduUSYJ
 r7wQ==
X-Gm-Message-State: AOJu0Yw2OHylO5aC8YOtzLNa16k3z67/+IcsE0JbsjfHFoS1l7odL5rU
 3eYFgSRnNAXtP6PYVOtvE9n46AGe8onYZ7yP8h0H4p5Osp2XIseusxLOxcBvzOXX
X-Gm-Gg: ATEYQzyyJkmkDBLYp10hpaUIk6XU5KmWyOkpeTDd2usttJz2uoIECAeS1HpX1Hrbfsj
 j+fnFxoqT0tZVCHyu5J0jjS4xX+Lw5/S8NfMvz6KUdvW0Iegu3oC9icj0AV1ckzba2T9FEaVEOk
 iXful1Krsxm5VdvJ8YTy/D6yTsHYFftFTTldiY0hYyYp5zGTXEo+rUcGxHiWmXAoQnY890AsHhG
 mcf27b36dl4ZOcjhylQkxkvsxvKp8T2h9YoYrk+IpppRsO5ZWEM1nAuLnN2TVADLtEKVoCyL2nD
 9EWa/VdZCjKslEmUMUsYvRPCjnbYlKCf/gKMCPQTnjGHt31SBxrPgYoizoDcFLfTiLP14aNxqH1
 kytA+n84DbBOOJsG0l/0H49bqBRgnl6kZKe/Ut1eN4SdLT/jlywAEZrPJd4xe46TRJBIOc7JULd
 /jKYxBE/i5cXy4XfDpD/K61DeDPaigvLSZqR53SxnjBz6q1KUc4F4Nn4WsU+p9
X-Received: by 2002:a05:7022:439c:b0:128:cf86:d1cb with SMTP id
 a92af1059eb24-129a718fa57mr2066975c88.31.1773846353662; 
 Wed, 18 Mar 2026 08:05:53 -0700 (PDT)
Received: from localhost ([192.55.54.45]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-129a723e246sm3621206c88.3.2026.03.18.08.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2026 08:05:53 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 2/8] lib/intel_batchbuffer: make __intel_bb_create gt
 aware
Date: Wed, 18 Mar 2026 17:05:11 +0200
Message-ID: <20260318150517.4049206-3-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260318150517.4049206-1-juhapekka.heikkila@gmail.com>
References: <20260318150517.4049206-1-juhapekka.heikkila@gmail.com>
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

