Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEFF1105F7A6
	for <igt-dev@archiver.kernel.org>; Fri, 13 Mar 2026 13:52:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA4610E041;
	Fri, 13 Mar 2026 13:52:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MZ9kNT35";
	dkim-atps=neutral
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6515F10E120
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Mar 2026 13:52:29 +0000 (UTC)
Received: by mail-dl1-f44.google.com with SMTP id
 a92af1059eb24-12732165d1eso2891545c88.1
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Mar 2026 06:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773409948; x=1774014748; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9piveDDs0mtCXV5s/tBsLJpwvjym02tPMnQtUWwgFgg=;
 b=MZ9kNT35GfRtf22DUe9Oze0kj8Phff8o13EPTRh2gkm76eCpJc4BXDvYoxSEGic/o5
 K9/Px+VidlAJMCrVCUFcJHQh2CX40VmK+FSiGZh/p34uoF41R6+150b/pa0N51zhQ/Tl
 8JF4rjBJZD8DEPI1UYOUhJA0zOYLjaN8jCSO5Bpivf+sbwoMCjuBCJtzPYU4D8K/h0xB
 8Glh/dDlLrsYjmpmBO5doiRgJIkyKcWq9tWUCkfhJpFrTayeKYOAwhET1i2KtTeJM6sp
 cei+J6WX39/fPpk6yI96YvMYlA5YTAwzYPV6kVAbbgLUONMYHWBBrdggePSngbJYEqyI
 xBKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773409948; x=1774014748;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9piveDDs0mtCXV5s/tBsLJpwvjym02tPMnQtUWwgFgg=;
 b=h8MN9x14YgdUl6bxoELgiy7q0QTStBCGqjNiujIm5kR49zqji18ydeAMLNAOOqi7S1
 EUwwuJzAuJWhejXDSexhDa/RsQm4AsfBmUylI6fRCj6PEY0vViHowVXJX2HcsHKtvwtM
 TpX3Q4PVKpQVuzzC7MmcYSfU312pEu6qSu0Ip3l2eftxOFWWz8ztnULiFAZhkcqW9hWr
 3x3Zlz8gO3NyHyAPNoHehd3Hq4GuguLX/GgiFIg6u/3Zba49bobfL3l7w8r3hiw67q/r
 1hp5etclRByp6RxYb+I0eTKdySh0xQ/0gQ/iRYjNqvqpIqs6mUO22XSf/jFAviG9/HHN
 aM9w==
X-Gm-Message-State: AOJu0YymcbgUaj0eucUGvC7/Mc9Aqu4sSW07o9islqpcuXXrlEnARzZn
 DLzWO5Jkj94AYjZmtUsulXK1sJJn20L39IgDpWrvBF2RxvFiMsrCHz+yWN6bi9e7
X-Gm-Gg: ATEYQzwqgaRLOPmOIB/ouAU0hB4R9SOG+BM0M0ZndCpBeJK6UXWU0pDkLiMYUCMrjOr
 /lD9Px6Do2zaZmZdkZZdFyJBJYswLN5ee9gbB7ZlUHn9st1UhVxzZcLjhgM0MayGZjuuQYDcPZy
 tP48XhXRtEtvv8lHylCmf3Mony2YQwaUyTjmvqcTt36G7oDO5fdvsCovIsy+oJl5kgOhcjZUjrO
 xy5RXY8HImttYZ/In9xrK4q3MUe/Xa81iThxtXhDLk9/UVRktnKbAnHkOlsTvsWgesV70bzLfKI
 d78WLKK8YfenSKW+4tNN1MTlKbfZp/L1D/fCtBXp8QMUBE9UEG3ggwzB53palPB3MAuXqCULEz6
 s0tgvOHB1+wubFIuYhZ9FNG7UqDqEebi0xnLa4sYwuKMOVSnKhEFQC7GK91K0d6oMagVGN8mgSq
 5kFLMnlnGF+ZL3yoBORGH4u4ABgo2xavG1NX86RQ+wrrfjt4DVJkJ6eHwh7IE=
X-Received: by 2002:a05:7300:e887:b0:2be:2043:614b with SMTP id
 5a478bee46e88-2bea554ad84mr1513243eec.18.1773409948316; 
 Fri, 13 Mar 2026 06:52:28 -0700 (PDT)
Received: from localhost ([192.55.54.43]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2beab3eec52sm2908855eec.14.2026.03.13.06.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2026 06:52:27 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 2/8] lib/intel_batchbuffer: make __intel_bb_create gt
 aware
Date: Fri, 13 Mar 2026 15:51:57 +0200
Message-ID: <20260313135203.1782240-3-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313135203.1782240-1-juhapekka.heikkila@gmail.com>
References: <20260313135203.1782240-1-juhapekka.heikkila@gmail.com>
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
index 3b25a385b..2e1c45335 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -903,7 +903,8 @@ static struct intel_bb *
 __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
 		  uint32_t size, bool do_relocs,
 		  uint64_t start, uint64_t end, uint64_t alignment,
-		  uint8_t allocator_type, enum allocator_strategy strategy, uint64_t region)
+		  uint8_t allocator_type, enum allocator_strategy strategy,
+		  uint64_t region, uint16_t gt_id)
 {
 	struct drm_i915_gem_exec_object2 *object;
 	struct intel_bb *ibb = calloc(1, sizeof(*ibb));
@@ -913,6 +914,7 @@ __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
 	ibb->devid = intel_get_drm_devid(fd);
 	ibb->gen = intel_gen(ibb->devid);
 	ibb->ctx = ctx;
+	ibb->gt_id = gt_id;
 
 	ibb->fd = fd;
 	ibb->driver = is_i915_device(fd) ? INTEL_DRIVER_I915 :
@@ -1057,7 +1059,7 @@ struct intel_bb *intel_bb_create_full(int fd, uint32_t ctx, uint32_t vm,
 				      enum allocator_strategy strategy, uint64_t region)
 {
 	return __intel_bb_create(fd, ctx, vm, cfg, size, false, start, end,
-				 alignment, allocator_type, strategy, region);
+				 alignment, allocator_type, strategy, region, 0);
 }
 
 /**
@@ -1084,7 +1086,7 @@ struct intel_bb *intel_bb_create_with_allocator(int fd, uint32_t ctx, uint32_t v
 {
 	return __intel_bb_create(fd, ctx, vm, cfg, size, false, 0, 0, 0,
 				 allocator_type, ALLOC_STRATEGY_HIGH_TO_LOW,
-				 is_i915_device(fd) ? REGION_SMEM : vram_if_possible(fd, 0));
+				 is_i915_device(fd) ? REGION_SMEM : vram_if_possible(fd, 0), 0);
 }
 
 static bool aux_needs_softpin(int fd)
@@ -1126,7 +1128,7 @@ struct intel_bb *intel_bb_create(int fd, uint32_t size)
 				 relocs && !aux_needs_softpin(fd), 0, 0, 0,
 				 INTEL_ALLOCATOR_SIMPLE,
 				 ALLOC_STRATEGY_HIGH_TO_LOW,
-				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0));
+				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0), 0);
 }
 
 /**
@@ -1155,7 +1157,7 @@ intel_bb_create_with_context(int fd, uint32_t ctx, uint32_t vm,
 				 relocs && !aux_needs_softpin(fd), 0, 0, 0,
 				 INTEL_ALLOCATOR_SIMPLE,
 				 ALLOC_STRATEGY_HIGH_TO_LOW,
-				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0));
+				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0), 0);
 }
 
 /**
@@ -1182,7 +1184,7 @@ intel_bb_create_with_context_in_region(int fd, uint32_t ctx, uint32_t vm,
 	return __intel_bb_create(fd, ctx, vm, cfg, size,
 				 relocs && !aux_needs_softpin(fd), 0, 0, 0,
 				 INTEL_ALLOCATOR_SIMPLE,
-				 ALLOC_STRATEGY_HIGH_TO_LOW, region);
+				 ALLOC_STRATEGY_HIGH_TO_LOW, region, 0);
 }
 
 /**
@@ -1203,7 +1205,7 @@ struct intel_bb *intel_bb_create_with_relocs(int fd, uint32_t size)
 
 	return __intel_bb_create(fd, 0, 0, NULL, size, true, 0, 0, 0,
 				 INTEL_ALLOCATOR_NONE, ALLOC_STRATEGY_NONE,
-				 REGION_SMEM);
+				 REGION_SMEM, 0);
 }
 
 /**
@@ -1229,7 +1231,7 @@ intel_bb_create_with_relocs_and_context(int fd, uint32_t ctx,
 
 	return __intel_bb_create(fd, ctx, 0, cfg, size, true, 0, 0, 0,
 				 INTEL_ALLOCATOR_NONE, ALLOC_STRATEGY_NONE,
-				 REGION_SMEM);
+				 REGION_SMEM, 0);
 }
 
 /**
@@ -1254,7 +1256,7 @@ struct intel_bb *intel_bb_create_no_relocs(int fd, uint32_t size)
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

