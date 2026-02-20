Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BACFC5ACD1
	for <igt-dev@archiver.kernel.org>; Fri, 20 Feb 2026 16:17:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C97810E806;
	Fri, 20 Feb 2026 16:17:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FrPbF7D4";
	dkim-atps=neutral
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BBEF10E806
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 16:17:48 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-354c19bf64bso1048854a91.1
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 08:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771604268; x=1772209068; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9piveDDs0mtCXV5s/tBsLJpwvjym02tPMnQtUWwgFgg=;
 b=FrPbF7D46PxNJWmJ7F6ajY/Ea+5mj4vqF/pTmhhHZsrWWKhaA0Dhwc1RMrO/FvMz2I
 Gvi1FlzkpsFxSRkSrXq13zOI/+OR9P3yRCjTp+X7hpQ4PL9lUbXj4hZPtrCh9AxDLU2m
 3Z1pM8xCc7+XBAXALQFJQQfRwfBBRgIYtt2ZXFOETEyS9x3ofuxnN9aVJeFVRkZWkhXG
 pzmVpvgrcMXKhyeNLVutNPsu4npWPhis249zIGIPqWVM0jdwXTArwJkCyKplBirdBucj
 6plFpZZ1Rl6SBb9wCjqXdHQQn/TlVMdUfIaEnOt0Ptfm6oHIKsPjyDgl8q6Vf7FqevT4
 +8gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771604268; x=1772209068;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9piveDDs0mtCXV5s/tBsLJpwvjym02tPMnQtUWwgFgg=;
 b=d2Ff3QAnT1dpGFdmLkgpa2L3PLHVePshP+LOulmoH98+/eaPwlCR0IKzD8DqLMboFg
 sKShJCnWAXJWAYftxOCq2F661+DfEBs0FgWHgM7pFYqz9haSXAB2V9mSOqz+GSfcNzq5
 epbFbagUGllfSzWFBOr3+H/xM8XRlaw/7EsY6w3F/a01YQGjMEGuIhKXncslw80AOH3Y
 6F7/5IZ9xrr7+1VIriMafHbcO/+F9D4D/zliKE95nBID9h6ESH3Xwz3jPs5vBoEku+TU
 3XQ32SMBye30lWGhW/MZ83vzFTHiYza1Tp3ZOyVNdOJbu2Q/F/fiNyQ9GS0XghUDSARI
 uhsw==
X-Gm-Message-State: AOJu0Yw/dGEoFToUPUJDdBc1F0iTCb4/R3floimi3xpaYjiiyInglbL9
 lSuKycH17JmgJ9N7lqxR1uEWsnPYmrNYBRqm35QPUoqBuNAlKIZZ18gyBf9i61H7
X-Gm-Gg: AZuq6aKCDhezpH3QsqjguraiRJwQMYQXKDj+8/Z/fKvi9D5rKdQQearqQZcSq4P8ddi
 Ujr350Hm1/tnJvhyqozkgK8dz+CvL4W8REStIUfqlRbV1Ev1swE3DcjKnpwmXMOlPpNVlHv5Uoz
 tg9KzroItH4FBpDSuh2RcVnZXPMXNkw8mgD9CYRbjiw4Ejm1TDADMaEC7BbGKUZAGJQak1POaFt
 ufPPNmkRBHehGnjX79l49+MtP3tOMbqP/LU9Rcmc4zzyj1u6B0BrEf8Y86P4/nurpfMrWkjM404
 gGdaRgG7d+IMzwlfwmvz3oKcaTUTJ22xDsnVHic8U4b3h+yC8+jt8V1v5mOsLfrczPPWCtMQMYX
 IXjALYu4JicxVBGMsZx7UFt3zRpH7c+ie3l/Vw9yXOgwV2JLEW6kVF1pTTxkpFQu/b8XRJaEfqc
 WUuQHMvZkW0V5aFrlZrJHJKzKeV04O8I27Kvpxxar9jruN+VlWkNzjLeKx+3WqLfhcEzfBMKvG
X-Received: by 2002:a17:90b:5281:b0:32e:4716:d551 with SMTP id
 98e67ed59e1d1-358aeace834mr134897a91.6.1771604267744; 
 Fri, 20 Feb 2026 08:17:47 -0800 (PST)
Received: from localhost ([134.134.137.72]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3589d80d5c0sm3502921a91.4.2026.02.20.08.17.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Feb 2026 08:17:47 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 2/8] lib/intel_batchbuffer: make __intel_bb_create gt
 aware
Date: Fri, 20 Feb 2026 18:17:12 +0200
Message-ID: <20260220161718.652862-3-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260220161718.652862-1-juhapekka.heikkila@gmail.com>
References: <20260220161718.652862-1-juhapekka.heikkila@gmail.com>
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

