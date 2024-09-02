Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80575CD13CF
	for <igt-dev@archiver.kernel.org>; Mon,  2 Sep 2024 11:51:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2261F10E2B3;
	Mon,  2 Sep 2024 11:51:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a/017Moq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF5F510E2B1
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Sep 2024 11:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725277870; x=1756813870;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ndxXBhe74BdgRQ4SaCWVpZe6l4/xTwbK+9wiTFnczUE=;
 b=a/017MoqqSCgfBoybyPu/vmr04frUlNXDFYQHy6sxkxt5d3kvJYnYWtk
 V5LpQRD/yrL/8k1nvobP638uQL8lpEyYY/D6G9cmuvM6y40qjSpX7dtUl
 t+ZE4Wp7yL6CFZgu6gncJF/v2/37v+qF85rBusVUsh3Ra5wy/QzIRcuA8
 obks1/i8p/cRFBNJL8sSQBZYfiaQTCQQaobluzhwjFf1jW9kmVZNhgLyH
 WlbkBOxqxO8kO/oARsonTg7LdPGHsvwIpBbhaltf0eRjF+VWQuhuWov5h
 WUW5u0TSEwAkRenJO/C8uAIVVXIN7Cc49xBWrIP+lbXAKV+Jz8pzevgIp Q==;
X-CSE-ConnectionGUID: s5ZoOUVaSMyRdvWDcUJ6gQ==
X-CSE-MsgGUID: Hhik/+jJRl+nKXO87FrsqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="23370223"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="23370223"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 04:47:13 -0700
X-CSE-ConnectionGUID: fenndS6WSkyNcDnIVCVUpQ==
X-CSE-MsgGUID: QbDaPvOhSMyWATkh6xeMMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="69390045"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.246.240])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 04:47:12 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH i-g-t 1/1] lib/intel_batchbuffer: Introduce
 intel_bb_create_with_context_in_memory
Date: Mon,  2 Sep 2024 13:46:56 +0200
Message-Id: <20240902114656.9779-2-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240902114656.9779-1-dominik.karol.piatkowski@intel.com>
References: <20240902114656.9779-1-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This patch extends __intel_bb_create to take memory region as argument,
making it possible to create batchbuffer in non-vram memory on GPUs
that have vram. Existing helper functions preserve original behavior.

To make use of this extension, intel_bb_create_with_context_in_memory
is introduced, that creates bb with given context in given memory
region.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 lib/intel_batchbuffer.c | 48 +++++++++++++++++++++++++++++++++--------
 lib/intel_batchbuffer.h |  3 +++
 2 files changed, 42 insertions(+), 9 deletions(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index f91091bc4..4c6fea4dd 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -850,6 +850,7 @@ static inline uint64_t __intel_bb_get_offset(struct intel_bb *ibb,
  * @size: size of the batchbuffer
  * @do_relocs: use relocations or allocator
  * @allocator_type: allocator type, must be INTEL_ALLOCATOR_NONE for relocations
+ * @memory: memory region bitmask, unused for i915
  *
  * intel-bb assumes it will work in one of two modes - with relocations or
  * with using allocator (currently RELOC and SIMPLE are implemented).
@@ -893,7 +894,7 @@ static struct intel_bb *
 __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
 		  uint32_t size, bool do_relocs,
 		  uint64_t start, uint64_t end, uint64_t alignment,
-		  uint8_t allocator_type, enum allocator_strategy strategy)
+		  uint8_t allocator_type, enum allocator_strategy strategy, uint64_t memory)
 {
 	struct drm_i915_gem_exec_object2 *object;
 	struct intel_bb *ibb = calloc(1, sizeof(*ibb));
@@ -954,7 +955,7 @@ __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
 
 		ibb->alignment = alignment;
 		size = ALIGN(size + xe_cs_prefetch_size(fd), ibb->alignment);
-		ibb->handle = xe_bo_create(fd, 0, size, vram_if_possible(fd, 0),
+		ibb->handle = xe_bo_create(fd, 0, size, memory,
 					   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 
 		/* Limit to 48-bit due to MI_* address limitation */
@@ -1045,7 +1046,7 @@ struct intel_bb *intel_bb_create_full(int fd, uint32_t ctx, uint32_t vm,
 				      enum allocator_strategy strategy)
 {
 	return __intel_bb_create(fd, ctx, vm, cfg, size, false, start, end,
-				 alignment, allocator_type, strategy);
+				 alignment, allocator_type, strategy, vram_if_possible(fd, 0));
 }
 
 /**
@@ -1071,7 +1072,8 @@ struct intel_bb *intel_bb_create_with_allocator(int fd, uint32_t ctx, uint32_t v
 						uint8_t allocator_type)
 {
 	return __intel_bb_create(fd, ctx, vm, cfg, size, false, 0, 0, 0,
-				 allocator_type, ALLOC_STRATEGY_HIGH_TO_LOW);
+				 allocator_type, ALLOC_STRATEGY_HIGH_TO_LOW,
+				 vram_if_possible(fd, 0));
 }
 
 static bool aux_needs_softpin(int fd)
@@ -1111,7 +1113,7 @@ struct intel_bb *intel_bb_create(int fd, uint32_t size)
 	return __intel_bb_create(fd, 0, 0, NULL, size,
 				 relocs && !aux_needs_softpin(fd), 0, 0, 0,
 				 INTEL_ALLOCATOR_SIMPLE,
-				 ALLOC_STRATEGY_HIGH_TO_LOW);
+				 ALLOC_STRATEGY_HIGH_TO_LOW, vram_if_possible(fd, 0));
 }
 
 /**
@@ -1138,7 +1140,33 @@ intel_bb_create_with_context(int fd, uint32_t ctx, uint32_t vm,
 	return __intel_bb_create(fd, ctx, vm, cfg, size,
 				 relocs && !aux_needs_softpin(fd), 0, 0, 0,
 				 INTEL_ALLOCATOR_SIMPLE,
-				 ALLOC_STRATEGY_HIGH_TO_LOW);
+				 ALLOC_STRATEGY_HIGH_TO_LOW, vram_if_possible(fd, 0));
+}
+
+/**
+ * intel_bb_create_with_context_in_memory:
+ * @fd: drm fd - xe
+ * @ctx: engine id
+ * @vm: vm_id
+ * @size: size of the batchbuffer
+ * @memory: memory region bitmask
+ *
+ * Creates bb with context passed in @ctx in memory region passed in @memory.
+ *
+ * Returns:
+ *
+ * Pointer the intel_bb, asserts on failure.
+ */
+struct intel_bb *
+intel_bb_create_with_context_in_memory(int fd, uint32_t ctx, uint32_t vm, uint32_t size,
+				       uint64_t memory)
+{
+	igt_require(is_xe_device(fd));
+
+	return __intel_bb_create(fd, ctx, vm, 0, size,
+				 0, 0, 0, 0,
+				 INTEL_ALLOCATOR_SIMPLE,
+				 ALLOC_STRATEGY_HIGH_TO_LOW, memory);
 }
 
 /**
@@ -1158,7 +1186,8 @@ struct intel_bb *intel_bb_create_with_relocs(int fd, uint32_t size)
 	igt_require(is_i915_device(fd) && gem_has_relocations(fd));
 
 	return __intel_bb_create(fd, 0, 0, NULL, size, true, 0, 0, 0,
-				 INTEL_ALLOCATOR_NONE, ALLOC_STRATEGY_NONE);
+				 INTEL_ALLOCATOR_NONE, ALLOC_STRATEGY_NONE,
+				 vram_if_possible(fd, 0));
 }
 
 /**
@@ -1183,7 +1212,8 @@ intel_bb_create_with_relocs_and_context(int fd, uint32_t ctx,
 	igt_require(is_i915_device(fd) && gem_has_relocations(fd));
 
 	return __intel_bb_create(fd, ctx, 0, cfg, size, true, 0, 0, 0,
-				 INTEL_ALLOCATOR_NONE, ALLOC_STRATEGY_NONE);
+				 INTEL_ALLOCATOR_NONE, ALLOC_STRATEGY_NONE,
+				 vram_if_possible(fd, 0));
 }
 
 /**
@@ -1204,7 +1234,7 @@ struct intel_bb *intel_bb_create_no_relocs(int fd, uint32_t size)
 
 	return __intel_bb_create(fd, 0, 0, NULL, size, false, 0, 0, 0,
 				 INTEL_ALLOCATOR_SIMPLE,
-				 ALLOC_STRATEGY_HIGH_TO_LOW);
+				 ALLOC_STRATEGY_HIGH_TO_LOW, vram_if_possible(fd, 0));
 }
 
 static void __intel_bb_destroy_relocations(struct intel_bb *ibb)
diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
index cb32206e5..152cda4d0 100644
--- a/lib/intel_batchbuffer.h
+++ b/lib/intel_batchbuffer.h
@@ -318,6 +318,9 @@ struct intel_bb *intel_bb_create(int fd, uint32_t size);
 struct intel_bb *
 intel_bb_create_with_context(int fd, uint32_t ctx, uint32_t vm,
 			     const intel_ctx_cfg_t *cfg, uint32_t size);
+struct intel_bb *
+intel_bb_create_with_context_in_memory(int fd, uint32_t ctx, uint32_t vm, uint32_t size,
+				       uint64_t memory);
 struct intel_bb *intel_bb_create_with_relocs(int fd, uint32_t size);
 struct intel_bb *
 intel_bb_create_with_relocs_and_context(int fd, uint32_t ctx,
-- 
2.34.1

