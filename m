Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE8EF483CC
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 16:29:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2AB610E497;
	Mon, 23 Mar 2026 16:29:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TU8w7SvC";
	dkim-atps=neutral
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com
 [74.125.82.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D22610E497
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 16:29:38 +0000 (UTC)
Received: by mail-dy1-f180.google.com with SMTP id
 5a478bee46e88-2c0e3a2605fso385008eec.0
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 09:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1774283378; x=1774888178; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XQmYAeM7rbwAT1pVtONr6FfH7izaTz399BRtV7it6B4=;
 b=TU8w7SvCLnYm55N7EwnNYGWP5ahyAd65I+iwAlaTNx0Ro8WtprEr3DUCMTgXWW4sNz
 lcclqASC2mEhd7hAjyplgU7/PqfyqPgoWNAyxErHCv0Yc2PAMgqDm0fGeP6M/QiHqimK
 7Yj5DItX85UbNqDHUHITGNKRcKm0DNpYMR6bXS3a2EIcMKlS62nJQYXuSEtORaqatyye
 urph5ofUGncSoZKgopWnqxxCbzxqohyHGiQecfACj3eCwkFmDj2hPkYhXeNm5xhW3OTy
 FnKZkifB/uxwzRUAshVIpkpYul2seh4kHrJUpMGu1bc60SOxZhTiCpZ3TZBO3CfER3qW
 XBGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774283378; x=1774888178;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XQmYAeM7rbwAT1pVtONr6FfH7izaTz399BRtV7it6B4=;
 b=Sey3uIJNR6u8rLyv3nZcgLYIXlJwQAgJCD/weUh4odzM2y6bXXflN+bUjevIApcp3o
 WliE0Zr9Tp7mpyF5Qz3800shKTP0vVbe1HSqG4RZ7C2+GXKumWT0s/EHC8S4iG5L+5Ud
 PSnW1ZIPcYhmQm0gSR+jKNeJIfM6qtViZmIYrcFoUf9LjXzgzPD+zPUVclM1da2WKRc9
 xQHV5iTWkcfUb/EyTLS3JawI2JYECow3BbbhKUEKNxVIAV7Zz0iuTzEVNcETCP4hWbDm
 jjx9PJ8Q9OL0pO2Wx0ZCi/XNmIBGpwCWUNhcbgf48V6ukoS47D65mde9ISnqoZbY2qSs
 5QYw==
X-Gm-Message-State: AOJu0YxftHPR77a6Vw/RcStygMqISISCsSJpRZzhv/eqGAdNNuB4xQAC
 8H+/+HJv6JlKqg57UE8DmoJ3KMZISoNmW2kxG970vlsz9plY6kbEqsuQNrjo/N16
X-Gm-Gg: ATEYQzzIeUVeY2N15S5b9TVjWIovNJQ4fu6Hg7/wVRXvQaRaoSknOOD74JaylrglKJR
 RYj7K2ca0UPYI9tFo09TDc+RIKBA2OCxhaHn9F9O6gHRlR9U/1IxNvz6nbEl6cz04QX9JiJudWJ
 UJIGX8csm2SwDUUyrZ6NLog4Zt7ZpW9JmNKRWJUtGonXHAvyb+YrcI3ol4s0DeN5FeDTVOjZ6mp
 SJjbnjCqWf8wG5uchVG7F8+T4GUiajjLUCHPPoxnS76pua46eC+7QTp5HQzovE3lw4YAj0lB0Yg
 EC09Dx8FG0jQb8GoFT9LftaVinWZD4S2tOVgPALCrmbKeYFqshJwYtXXGiu32UYdhCUnupo8h/i
 77lIfRgMqggGwqmNYP7MDPlHPmhs4aRl5ZonwP1FiCe/ryBUoXaCeZ2uRtcGrLFW3mYyi3MEN6S
 0oTOrA87kuTti5JI8GHcGDbTTPALIwcJdSx0+YhF0aAYUJ6e9cyeA3x+/A9t0=
X-Received: by 2002:a05:7300:dc94:b0:2be:9886:d4cc with SMTP id
 5a478bee46e88-2c1095a64cfmr6103265eec.3.1774283377785; 
 Mon, 23 Mar 2026 09:29:37 -0700 (PDT)
Received: from localhost ([192.55.54.47]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2c10b2cf068sm12505945eec.22.2026.03.23.09.29.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2026 09:29:37 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 2/8] lib/intel_batchbuffer: make __intel_bb_create gt
 aware
Date: Mon, 23 Mar 2026 18:29:05 +0200
Message-ID: <20260323162911.1912755-3-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323162911.1912755-1-juhapekka.heikkila@gmail.com>
References: <20260323162911.1912755-1-juhapekka.heikkila@gmail.com>
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

