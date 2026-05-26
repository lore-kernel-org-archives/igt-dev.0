Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79601CD5BC8
	for <igt-dev@archiver.kernel.org>; Tue, 26 May 2026 14:45:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2931610E6B6;
	Tue, 26 May 2026 14:45:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ESCpFrPe";
	dkim-atps=neutral
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B245010E6BA
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 14:44:04 +0000 (UTC)
Received: by mail-dl1-f50.google.com with SMTP id
 a92af1059eb24-132830d8281so2191824c88.1
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 07:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779806644; x=1780411444; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q+J9oBKCzA3uefeUr3PMOyzYlxIwRipYXePvf0XnI6k=;
 b=ESCpFrPeg46in/6+7dhrZbC3WJOFv3ugtOM6ojtSApJmD9LY1EX/kXMX4dnErA+gn/
 63dnWWEhoB62SeIeEMdW3ZHLQinVEK+4lOF/MUtKA9nHjujra3Wn/3xgCtQim9GKht4D
 3yGrfUyrO4lz/oae5DcSSpYGiHXng0UjEWcRO2/2AJMkg4RYVq/um/aRyxk9klxPx9o2
 uOOhjdtTw0CDL796F56IHSYkiS6vY/RtQ9MIAh4MARPPMdAAjx7W1DKqniUYefpO/D6/
 AdMkRbPQAxQHspuaQz9oDr6umnIbFylLxn/EPyXjKOOMzoFd9iO58U4T3Kv8YBB2As6V
 sTSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779806644; x=1780411444;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=q+J9oBKCzA3uefeUr3PMOyzYlxIwRipYXePvf0XnI6k=;
 b=JI1Kaqo9mkg/mqo1nWlrRVzpwAcc1uEBwOwb7wDazvtFWoAXZQWknmlQCZlI7Yz1yU
 p1ZfXz3R9KxAgA5dSjudBJs+VEX/99AqhZU89WwzdHJvn3XaZ1sKzMjt6SxXt9RVKXWa
 7af/uoos8d97bZXwaLI7Y4yOsEkvE7oi3sM62hcwlSMZQdc3RgWG6Znm9Jj42QKt2Jmx
 MCZvgBEssJtaQRPy7sBXRPM9NE2zXYDkl7NlE2aTWrUf1hbzSP/E8BwcNiiKhhCLsFvy
 sDibH9nt5zIwVG09OHkmE3VNEbueI6Hw9f2H4LEVvLDb3Ml6ZuH1cQuc8Y31kGJOuAwv
 7EHQ==
X-Gm-Message-State: AOJu0YxwnWDV4YpoYmZfeTTNwc04lssS1q2flt3c1Ms86qwrw8wDKEFS
 L9x/eOBpJILhoXAjl1d8j3NKYbNlx4oDDaTrTobxgF6qAOfGsC+8sNP8l/l7jr7p
X-Gm-Gg: Acq92OEj7yVx888LMfTrtyWSTWBbItEy4S7gah+2nb3HFNftKK1rczu06vAp3KGz9Vw
 Rtxe8Woo+dThfY2Ba7uRBVH3BM25vpm+Ic97sJ3EVthGLsF0CmdA6qROWYE6Lb2aoKsnVpd5b4Y
 L4Vf+DbE11M2SiEcUSTnJ1OHSroCG48+8WrQH8uvhGmwSZLS97cd19c/Fh58j2P3I9Wlp3udXQi
 Nuf1vd0bGT+xxE5vJ2pAtYjEbNUvTNsoJAJYVrq84qD9GJsiM9hu1jbhl2IycCNLwTJ6Hw9MmN1
 q4JgsOQnz5daT8EAZiCB6j2UNKIUr2qFjTkf6qPDd4zb0JdmjMYfGAkxTjlwYEOxqd0HglWoeNA
 j/VIDko9h+61nmkmAwrFaeJ2zlTM7gIoeQU2QDiPMKVgfAzMmaXtKUoF28SwdcaKZ5SgqGW3Vb5
 KXYiMlhglP36doIyIatIuJ+nPomr6jrFm4tFPWpLnexOi7bFVYXiX2MT5sm4HJqnDvVo3SXQ==
X-Received: by 2002:a05:7300:bc97:b0:2ed:6f94:9d9d with SMTP id
 5a478bee46e88-304490264femr8248899eec.8.1779806643833; 
 Tue, 26 May 2026 07:44:03 -0700 (PDT)
Received: from localhost ([192.55.54.47]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-30452230b25sm13474047eec.15.2026.05.26.07.44.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2026 07:44:03 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t 2/9] lib/intel_batchbuffer: make __intel_bb_create gt
 aware
Date: Tue, 26 May 2026 17:43:36 +0300
Message-ID: <20260526144343.2531299-3-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260526144343.2531299-1-juhapekka.heikkila@gmail.com>
References: <20260526144343.2531299-1-juhapekka.heikkila@gmail.com>
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
Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 lib/intel_batchbuffer.c | 21 ++++++++++++---------
 lib/intel_batchbuffer.h |  1 +
 2 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index ec0a7108b..d53e3e5b8 100644
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
@@ -918,6 +920,7 @@ __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
 	ibb->gen = intel_gen(ibb->devid);
 	ibb->ctx = ctx;
 	ibb->usable_size = size;
+	ibb->gt_id = gt_id;
 
 	ibb->fd = fd;
 	ibb->driver = is_i915_device(fd) ? INTEL_DRIVER_I915 :
@@ -1062,7 +1065,7 @@ struct intel_bb *intel_bb_create_full(int fd, uint32_t ctx, uint32_t vm,
 				      enum allocator_strategy strategy, uint64_t region)
 {
 	return __intel_bb_create(fd, ctx, vm, cfg, size, false, start, end,
-				 alignment, allocator_type, strategy, region);
+				 alignment, allocator_type, strategy, region, 0);
 }
 
 /**
@@ -1089,7 +1092,7 @@ struct intel_bb *intel_bb_create_with_allocator(int fd, uint32_t ctx, uint32_t v
 {
 	return __intel_bb_create(fd, ctx, vm, cfg, size, false, 0, 0, 0,
 				 allocator_type, ALLOC_STRATEGY_HIGH_TO_LOW,
-				 is_i915_device(fd) ? REGION_SMEM : vram_if_possible(fd, 0));
+				 is_i915_device(fd) ? REGION_SMEM : vram_if_possible(fd, 0), 0);
 }
 
 static bool aux_needs_softpin(int fd)
@@ -1131,7 +1134,7 @@ struct intel_bb *intel_bb_create(int fd, uint32_t size)
 				 relocs && !aux_needs_softpin(fd), 0, 0, 0,
 				 INTEL_ALLOCATOR_SIMPLE,
 				 ALLOC_STRATEGY_HIGH_TO_LOW,
-				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0));
+				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0), 0);
 }
 
 /**
@@ -1160,7 +1163,7 @@ intel_bb_create_with_context(int fd, uint32_t ctx, uint32_t vm,
 				 relocs && !aux_needs_softpin(fd), 0, 0, 0,
 				 INTEL_ALLOCATOR_SIMPLE,
 				 ALLOC_STRATEGY_HIGH_TO_LOW,
-				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0));
+				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0), 0);
 }
 
 /**
@@ -1187,7 +1190,7 @@ intel_bb_create_with_context_in_region(int fd, uint32_t ctx, uint32_t vm,
 	return __intel_bb_create(fd, ctx, vm, cfg, size,
 				 relocs && !aux_needs_softpin(fd), 0, 0, 0,
 				 INTEL_ALLOCATOR_SIMPLE,
-				 ALLOC_STRATEGY_HIGH_TO_LOW, region);
+				 ALLOC_STRATEGY_HIGH_TO_LOW, region, 0);
 }
 
 /**
@@ -1208,7 +1211,7 @@ struct intel_bb *intel_bb_create_with_relocs(int fd, uint32_t size)
 
 	return __intel_bb_create(fd, 0, 0, NULL, size, true, 0, 0, 0,
 				 INTEL_ALLOCATOR_NONE, ALLOC_STRATEGY_NONE,
-				 REGION_SMEM);
+				 REGION_SMEM, 0);
 }
 
 /**
@@ -1234,7 +1237,7 @@ intel_bb_create_with_relocs_and_context(int fd, uint32_t ctx,
 
 	return __intel_bb_create(fd, ctx, 0, cfg, size, true, 0, 0, 0,
 				 INTEL_ALLOCATOR_NONE, ALLOC_STRATEGY_NONE,
-				 REGION_SMEM);
+				 REGION_SMEM, 0);
 }
 
 /**
@@ -1259,7 +1262,7 @@ struct intel_bb *intel_bb_create_no_relocs(int fd, uint32_t size)
 	return __intel_bb_create(fd, 0, 0, NULL, size, false, 0, 0, 0,
 				 INTEL_ALLOCATOR_SIMPLE,
 				 ALLOC_STRATEGY_HIGH_TO_LOW,
-				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0));
+				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0), 0);
 }
 
 static void __intel_bb_destroy_relocations(struct intel_bb *ibb)
diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
index d26d58aba..1e8b5b96d 100644
--- a/lib/intel_batchbuffer.h
+++ b/lib/intel_batchbuffer.h
@@ -270,6 +270,7 @@ struct intel_bb {
 	struct igt_pxp pxp;
 	uint32_t ctx;
 	uint32_t vm_id;
+	uint16_t gt_id;
 
 	bool xe_bound;
 	uint32_t engine_syncobj;
-- 
2.43.0

