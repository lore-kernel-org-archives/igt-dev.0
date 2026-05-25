Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 046A1CD5BB1
	for <igt-dev@archiver.kernel.org>; Mon, 25 May 2026 16:39:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE6AE10E3B7;
	Mon, 25 May 2026 16:39:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aoLnv2yY";
	dkim-atps=neutral
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60D0510E3B6
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 16:39:08 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-2ba6485d219so74579675ad.3
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 09:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779727148; x=1780331948; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oUf9UIINSnN3RfKtvtGxgP2hRXsiG8gIrWzlDnC2HM0=;
 b=aoLnv2yYa+L3vgDYOFKd3adOlrUAZmLuVTtSOE5OJ0e9kW9EH3ctlNaKSOMp2jXG2T
 04BpCmdW8U8wx+lfjSKLVWixBkvoy6RWZe5vlaipfjCtkLoyp1uFSu6smifPNe9kRRvM
 7zrCXMkD0O0Y5yJ6NSLi4jVnITXdDERYxItwvh8c+pwGinN8Elm7W/MguVGd4kMDlggl
 zUNnbFbPTak2x1vhFV7YxlkBQMum1VMROGc+p0HYGXW0btTS6n/sro+sz4LiEZlLFgbC
 3/Id6Znn15bZFLf5ka/duvakL75Ow39JW0WGPwhmFUWSCLVx1jtRbNS2U7Ha1Or3D5xN
 mFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779727148; x=1780331948;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=oUf9UIINSnN3RfKtvtGxgP2hRXsiG8gIrWzlDnC2HM0=;
 b=XAbNBwz6RM5fhQdcaqEGtBZHGEjxcuyVjepU6MmpRnJyWY8Sz2slfA3ZjSvexpcMMj
 uLnmPVt32lUfyjt61kg8u2kXvltx1eLob7rZ6gZuHiNaH+pAZo3JPec5XpTxWt5krX+C
 uiZjevgO5PaIbgytnsWzDlCYRDM3uzAWLHnAfxFepFrTyhCd9NS0MNBvwrJmpT7y/Z/o
 Uf1mOzv6RipqifFED7e/eJgC7F0pS/J8ZsEQihiCob3wbaKFnZAXfcVqi+kJ7aS6C/rN
 +ZCH8CMwtJUKbTI2lC2LPbwjysBlwVg8QDFnGQfj8Bb8MDg1YLONicDwKMXpcKi+QJhN
 wJIA==
X-Gm-Message-State: AOJu0YyHq2814mYhfVvSQfUdX2zmuRzSUBkuHlJ9A/2tY0KI2/TI64jC
 NiV1XVazg6YgKv4L0bIy45OZjaHn1vbNPYfrK7Yj0ZoZJfIqVlZsgLjnUoYMCIF2
X-Gm-Gg: Acq92OHD5LKqfmdzNA8I+5D6Y6hOyIdxWXL/l34evT2PF8kGuGPB4NIcxor8s6mdknR
 dXI2KiRfQvVnfEVjvnE+fk2dtwsUvI5EBc5lJ7jfEbA6FNm/pVL9PpV9mQ5f0Tg5aTSTJyBXl+b
 MycsTWgYka8NHkCGfGd941d6MF9sANNpL7q3bFLJkmpBCJaAHJPxbNM1IuNXtEcdmCAGXhQM+51
 3a/8DitCOCqgol+T+oLJYqU7CNi1L6ZLqwnGQJjOwZ+0rrALp4Y8BwrtSA2BT4MpY/BAITrmKxK
 Rjwx9VhP3hnGo6urEEA7XudyZ1sKmhtof7II7Hn0DvmtVMO8cMsecTIX51Qdb7DKJibyNIwd4/9
 JQAdoX4BGdRVehAg8SkoP5dcWNqk7dJfXQ1qDI5f3z1k9cnNyvGBvX2QFK1kRDQBoxJjAdi/koi
 42VuJOONWj00jyCzYTL3WrcjWnPxgABhk6HLEwEBXpVDvwUq6GHtU6xjfEsS0DKmtyOUBjr6l5
X-Received: by 2002:a17:902:cf06:b0:2b4:6080:d4d0 with SMTP id
 d9443c01a7336-2beb05e4154mr174425315ad.22.1779727147813; 
 Mon, 25 May 2026 09:39:07 -0700 (PDT)
Received: from localhost ([134.134.137.76]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2beb56ce2cdsm101336315ad.29.2026.05.25.09.39.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2026 09:39:07 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 2/9] lib/intel_batchbuffer: make __intel_bb_create gt
 aware
Date: Mon, 25 May 2026 19:38:43 +0300
Message-ID: <20260525163850.3493602-3-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260525163850.3493602-1-juhapekka.heikkila@gmail.com>
References: <20260525163850.3493602-1-juhapekka.heikkila@gmail.com>
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
 lib/intel_batchbuffer.c | 21 ++++++++++++---------
 lib/intel_batchbuffer.h |  1 +
 2 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 17b2b8625..536e8e402 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -864,6 +864,7 @@ static inline uint64_t __intel_bb_get_offset(struct intel_bb *ibb,
  * @do_relocs: use relocations or allocator
  * @allocator_type: allocator type, must be INTEL_ALLOCATOR_NONE for relocations
  * @region: memory region
+ * @gt_id: gt slice id for xe, unused for i915
  *
  * intel-bb assumes it will work in one of two modes - with relocations or
  * with using allocator (currently RELOC and SIMPLE are implemented).
@@ -907,7 +908,8 @@ static struct intel_bb *
 __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
 		  uint32_t size, bool do_relocs,
 		  uint64_t start, uint64_t end, uint64_t alignment,
-		  uint8_t allocator_type, enum allocator_strategy strategy, uint64_t region)
+		  uint8_t allocator_type, enum allocator_strategy strategy,
+		  uint64_t region, uint16_t gt_id)
 {
 	struct drm_i915_gem_exec_object2 *object;
 	struct intel_bb *ibb = calloc(1, sizeof(*ibb));
@@ -917,6 +919,7 @@ __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
 	ibb->devid = intel_get_drm_devid(fd);
 	ibb->gen = intel_gen(ibb->devid);
 	ibb->ctx = ctx;
+	ibb->gt_id = gt_id;
 
 	ibb->fd = fd;
 	ibb->driver = is_i915_device(fd) ? INTEL_DRIVER_I915 :
@@ -1061,7 +1064,7 @@ struct intel_bb *intel_bb_create_full(int fd, uint32_t ctx, uint32_t vm,
 				      enum allocator_strategy strategy, uint64_t region)
 {
 	return __intel_bb_create(fd, ctx, vm, cfg, size, false, start, end,
-				 alignment, allocator_type, strategy, region);
+				 alignment, allocator_type, strategy, region, 0);
 }
 
 /**
@@ -1088,7 +1091,7 @@ struct intel_bb *intel_bb_create_with_allocator(int fd, uint32_t ctx, uint32_t v
 {
 	return __intel_bb_create(fd, ctx, vm, cfg, size, false, 0, 0, 0,
 				 allocator_type, ALLOC_STRATEGY_HIGH_TO_LOW,
-				 is_i915_device(fd) ? REGION_SMEM : vram_if_possible(fd, 0));
+				 is_i915_device(fd) ? REGION_SMEM : vram_if_possible(fd, 0), 0);
 }
 
 static bool aux_needs_softpin(int fd)
@@ -1130,7 +1133,7 @@ struct intel_bb *intel_bb_create(int fd, uint32_t size)
 				 relocs && !aux_needs_softpin(fd), 0, 0, 0,
 				 INTEL_ALLOCATOR_SIMPLE,
 				 ALLOC_STRATEGY_HIGH_TO_LOW,
-				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0));
+				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0), 0);
 }
 
 /**
@@ -1159,7 +1162,7 @@ intel_bb_create_with_context(int fd, uint32_t ctx, uint32_t vm,
 				 relocs && !aux_needs_softpin(fd), 0, 0, 0,
 				 INTEL_ALLOCATOR_SIMPLE,
 				 ALLOC_STRATEGY_HIGH_TO_LOW,
-				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0));
+				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0), 0);
 }
 
 /**
@@ -1186,7 +1189,7 @@ intel_bb_create_with_context_in_region(int fd, uint32_t ctx, uint32_t vm,
 	return __intel_bb_create(fd, ctx, vm, cfg, size,
 				 relocs && !aux_needs_softpin(fd), 0, 0, 0,
 				 INTEL_ALLOCATOR_SIMPLE,
-				 ALLOC_STRATEGY_HIGH_TO_LOW, region);
+				 ALLOC_STRATEGY_HIGH_TO_LOW, region, 0);
 }
 
 /**
@@ -1207,7 +1210,7 @@ struct intel_bb *intel_bb_create_with_relocs(int fd, uint32_t size)
 
 	return __intel_bb_create(fd, 0, 0, NULL, size, true, 0, 0, 0,
 				 INTEL_ALLOCATOR_NONE, ALLOC_STRATEGY_NONE,
-				 REGION_SMEM);
+				 REGION_SMEM, 0);
 }
 
 /**
@@ -1233,7 +1236,7 @@ intel_bb_create_with_relocs_and_context(int fd, uint32_t ctx,
 
 	return __intel_bb_create(fd, ctx, 0, cfg, size, true, 0, 0, 0,
 				 INTEL_ALLOCATOR_NONE, ALLOC_STRATEGY_NONE,
-				 REGION_SMEM);
+				 REGION_SMEM, 0);
 }
 
 /**
@@ -1258,7 +1261,7 @@ struct intel_bb *intel_bb_create_no_relocs(int fd, uint32_t size)
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

