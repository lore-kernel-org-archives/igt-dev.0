Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1001AECE564
	for <igt-dev@archiver.kernel.org>; Tue, 10 Sep 2024 13:13:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC64A10E7C3;
	Tue, 10 Sep 2024 13:13:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZS2MdSP2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EEF610E7C3
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Sep 2024 13:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725973990; x=1757509990;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7816d4NmkTtYvR4mas/tQIj/bW7chL83qb5Ya2HBNb4=;
 b=ZS2MdSP2mkmbgrm2PHQV7D3mcaM0z65qEee1xu3p/DPMhSvCuSoHW5FG
 eE5BMBCqfBA0B01jrj8yqJbgCbASyvKwgof9Ytmzqo/NjRf5WMmIpW0Bq
 nnlFg/2bW6j0aP5qiA/pBu+ID0vysRZnECZejBevg+NILvbWL9jJROW8l
 wIbN28RHaohKDlvQ6rBIOCru7yGP3GgPl1kLDiR4Q5W5ZunLFlVhJWCNH
 hVctYYMRb5fX1Ti3zLeOrNZGQprO1fAFlTzfAU54MzlpVi+Jgzot4Nkgk
 UMjWvBSBmV2QaOgneDvQgQ43Rge7IQxoyM62PPWn6FYz/nM8w3HfJD1JV w==;
X-CSE-ConnectionGUID: gSufaMqxQX+TePukNS0WTg==
X-CSE-MsgGUID: /GMouHUCT6izndvd6CBQ4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24823259"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="24823259"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 06:13:10 -0700
X-CSE-ConnectionGUID: 29ztsr7mR/WdGiphtSFs1w==
X-CSE-MsgGUID: eE34tYZVQbmWpnRzWpO53A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; d="scan'208";a="66820835"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.245.145])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 06:13:09 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramanaidu.naladala@intel.com, =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, 
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v2 2/4] lib/intel_batchbuffer: Introduce
 intel_bb_create_with_context_in_region
Date: Tue, 10 Sep 2024 16:12:46 +0300
Message-Id: <20240910131248.334521-3-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240910131248.334521-1-jouni.hogander@intel.com>
References: <20240910131248.334521-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

From: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

This patch extends __intel_bb_create to take memory region as argument,
making it possible to create batchbuffer in given memory region.
Existing helper functions preserve original behavior.

To make use of this extension, intel_bb_create_with_context_in_region
is introduced, that creates bb with given context in given memory region.

v2:
 - Support both i915 and xe in intel_bb_create_with_context_in_region
 - Extend intel_bb_create_full to use region argument
v3:
 - Introduce is_i915 variable to avoid calling is_i915_device() twice
 - Squash "Fix igt_require in intel_bb_create_no_relocs"
   gem_uses_full_ppgtt() calls gem_gtt_type(), that expects i915 drm
   file descriptor. Wrap the igt_require in is_i915_device() check
   to fix the issue.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Link: https://lore.kernel.org/r/20240904084249.4365-2-dominik.karol.piatkowski@intel.com
---
 lib/intel_batchbuffer.c | 74 +++++++++++++++++++++++++++++++----------
 lib/intel_batchbuffer.h |  5 ++-
 tests/intel/xe_pat.c    |  4 +--
 3 files changed, 63 insertions(+), 20 deletions(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index f91091bc4..299e08926 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -850,6 +850,7 @@ static inline uint64_t __intel_bb_get_offset(struct intel_bb *ibb,
  * @size: size of the batchbuffer
  * @do_relocs: use relocations or allocator
  * @allocator_type: allocator type, must be INTEL_ALLOCATOR_NONE for relocations
+ * @region: memory region
  *
  * intel-bb assumes it will work in one of two modes - with relocations or
  * with using allocator (currently RELOC and SIMPLE are implemented).
@@ -893,7 +894,7 @@ static struct intel_bb *
 __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
 		  uint32_t size, bool do_relocs,
 		  uint64_t start, uint64_t end, uint64_t alignment,
-		  uint8_t allocator_type, enum allocator_strategy strategy)
+		  uint8_t allocator_type, enum allocator_strategy strategy, uint64_t region)
 {
 	struct drm_i915_gem_exec_object2 *object;
 	struct intel_bb *ibb = calloc(1, sizeof(*ibb));
@@ -922,7 +923,7 @@ __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
 
 		ibb->alignment = alignment;
 		ibb->gtt_size = gem_aperture_size(fd);
-		ibb->handle = gem_create(fd, size);
+		ibb->handle = gem_create_in_memory_regions(fd, size, region);
 
 		if (!ibb->uses_full_ppgtt)
 			do_relocs = true;
@@ -954,7 +955,7 @@ __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
 
 		ibb->alignment = alignment;
 		size = ALIGN(size + xe_cs_prefetch_size(fd), ibb->alignment);
-		ibb->handle = xe_bo_create(fd, 0, size, vram_if_possible(fd, 0),
+		ibb->handle = xe_bo_create(fd, 0, size, region,
 					   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 
 		/* Limit to 48-bit due to MI_* address limitation */
@@ -1027,12 +1028,13 @@ __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
  * @alignment: alignment to use for allocator, zero for default
  * @allocator_type: allocator type, SIMPLE, RELOC, ...
  * @strategy: allocation strategy
+ * @region: memory region
  *
  * Creates bb with context passed in @ctx, size in @size and allocator type
- * in @allocator_type. Relocations are set to false because IGT allocator
- * is used in that case. VM range is passed to allocator (@start and @end)
- * and allocation @strategy (suggestion to allocator about address allocation
- * preferences).
+ * in @allocator_type, in memory region passed in @region. Relocations are set
+ * to false because IGT allocator is used in that case. VM range is passed
+ * to allocator (@start and @end) and allocation @strategy (suggestion
+ * to allocator about address allocation preferences).
  *
  * Returns:
  *
@@ -1042,10 +1044,10 @@ struct intel_bb *intel_bb_create_full(int fd, uint32_t ctx, uint32_t vm,
 				      const intel_ctx_cfg_t *cfg, uint32_t size,
 				      uint64_t start, uint64_t end,
 				      uint64_t alignment, uint8_t allocator_type,
-				      enum allocator_strategy strategy)
+				      enum allocator_strategy strategy, uint64_t region)
 {
 	return __intel_bb_create(fd, ctx, vm, cfg, size, false, start, end,
-				 alignment, allocator_type, strategy);
+				 alignment, allocator_type, strategy, region);
 }
 
 /**
@@ -1071,7 +1073,8 @@ struct intel_bb *intel_bb_create_with_allocator(int fd, uint32_t ctx, uint32_t v
 						uint8_t allocator_type)
 {
 	return __intel_bb_create(fd, ctx, vm, cfg, size, false, 0, 0, 0,
-				 allocator_type, ALLOC_STRATEGY_HIGH_TO_LOW);
+				 allocator_type, ALLOC_STRATEGY_HIGH_TO_LOW,
+				 is_i915_device(fd) ? REGION_SMEM : vram_if_possible(fd, 0));
 }
 
 static bool aux_needs_softpin(int fd)
@@ -1106,12 +1109,14 @@ static bool has_ctx_cfg(struct intel_bb *ibb)
  */
 struct intel_bb *intel_bb_create(int fd, uint32_t size)
 {
-	bool relocs = is_i915_device(fd) && gem_has_relocations(fd);
+	bool is_i915 = is_i915_device(fd);
+	bool relocs = is_i915 && gem_has_relocations(fd);
 
 	return __intel_bb_create(fd, 0, 0, NULL, size,
 				 relocs && !aux_needs_softpin(fd), 0, 0, 0,
 				 INTEL_ALLOCATOR_SIMPLE,
-				 ALLOC_STRATEGY_HIGH_TO_LOW);
+				 ALLOC_STRATEGY_HIGH_TO_LOW,
+				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0));
 }
 
 /**
@@ -1132,13 +1137,42 @@ struct intel_bb *intel_bb_create(int fd, uint32_t size)
 struct intel_bb *
 intel_bb_create_with_context(int fd, uint32_t ctx, uint32_t vm,
 			     const intel_ctx_cfg_t *cfg, uint32_t size)
+{
+	bool is_i915 = is_i915_device(fd);
+	bool relocs = is_i915 && gem_has_relocations(fd);
+
+	return __intel_bb_create(fd, ctx, vm, cfg, size,
+				 relocs && !aux_needs_softpin(fd), 0, 0, 0,
+				 INTEL_ALLOCATOR_SIMPLE,
+				 ALLOC_STRATEGY_HIGH_TO_LOW,
+				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0));
+}
+
+/**
+ * intel_bb_create_with_context_in_region:
+ * @fd: drm fd - i915 or xe
+ * @ctx: for i915 context id, for xe engine id
+ * @vm: for xe vm_id, unused for i915
+ * @cfg: intel_ctx configuration, NULL for default context or legacy mode
+ * @size: size of the batchbuffer
+ * @region: memory region
+ *
+ * Creates bb with context passed in @ctx in memory region passed in @memory.
+ *
+ * Returns:
+ *
+ * Pointer the intel_bb, asserts on failure.
+ */
+struct intel_bb *
+intel_bb_create_with_context_in_region(int fd, uint32_t ctx, uint32_t vm,
+				       const intel_ctx_cfg_t *cfg, uint32_t size, uint64_t region)
 {
 	bool relocs = is_i915_device(fd) && gem_has_relocations(fd);
 
 	return __intel_bb_create(fd, ctx, vm, cfg, size,
 				 relocs && !aux_needs_softpin(fd), 0, 0, 0,
 				 INTEL_ALLOCATOR_SIMPLE,
-				 ALLOC_STRATEGY_HIGH_TO_LOW);
+				 ALLOC_STRATEGY_HIGH_TO_LOW, region);
 }
 
 /**
@@ -1158,7 +1192,8 @@ struct intel_bb *intel_bb_create_with_relocs(int fd, uint32_t size)
 	igt_require(is_i915_device(fd) && gem_has_relocations(fd));
 
 	return __intel_bb_create(fd, 0, 0, NULL, size, true, 0, 0, 0,
-				 INTEL_ALLOCATOR_NONE, ALLOC_STRATEGY_NONE);
+				 INTEL_ALLOCATOR_NONE, ALLOC_STRATEGY_NONE,
+				 REGION_SMEM);
 }
 
 /**
@@ -1183,7 +1218,8 @@ intel_bb_create_with_relocs_and_context(int fd, uint32_t ctx,
 	igt_require(is_i915_device(fd) && gem_has_relocations(fd));
 
 	return __intel_bb_create(fd, ctx, 0, cfg, size, true, 0, 0, 0,
-				 INTEL_ALLOCATOR_NONE, ALLOC_STRATEGY_NONE);
+				 INTEL_ALLOCATOR_NONE, ALLOC_STRATEGY_NONE,
+				 REGION_SMEM);
 }
 
 /**
@@ -1200,11 +1236,15 @@ intel_bb_create_with_relocs_and_context(int fd, uint32_t ctx,
  */
 struct intel_bb *intel_bb_create_no_relocs(int fd, uint32_t size)
 {
-	igt_require(gem_uses_full_ppgtt(fd));
+	bool is_i915 = is_i915_device(fd);
+
+	if (is_i915)
+		igt_require(gem_uses_full_ppgtt(fd));
 
 	return __intel_bb_create(fd, 0, 0, NULL, size, false, 0, 0, 0,
 				 INTEL_ALLOCATOR_SIMPLE,
-				 ALLOC_STRATEGY_HIGH_TO_LOW);
+				 ALLOC_STRATEGY_HIGH_TO_LOW,
+				 is_i915 ? REGION_SMEM : vram_if_possible(fd, 0));
 }
 
 static void __intel_bb_destroy_relocations(struct intel_bb *ibb)
diff --git a/lib/intel_batchbuffer.h b/lib/intel_batchbuffer.h
index cb32206e5..64121011c 100644
--- a/lib/intel_batchbuffer.h
+++ b/lib/intel_batchbuffer.h
@@ -309,7 +309,7 @@ struct intel_bb *
 intel_bb_create_full(int fd, uint32_t ctx, uint32_t vm,
 		     const intel_ctx_cfg_t *cfg, uint32_t size, uint64_t start,
 		     uint64_t end, uint64_t alignment, uint8_t allocator_type,
-		     enum allocator_strategy strategy);
+		     enum allocator_strategy strategy, uint64_t region);
 struct intel_bb *
 intel_bb_create_with_allocator(int fd, uint32_t ctx, uint32_t vm,
 			       const intel_ctx_cfg_t *cfg, uint32_t size,
@@ -318,6 +318,9 @@ struct intel_bb *intel_bb_create(int fd, uint32_t size);
 struct intel_bb *
 intel_bb_create_with_context(int fd, uint32_t ctx, uint32_t vm,
 			     const intel_ctx_cfg_t *cfg, uint32_t size);
+struct intel_bb *
+intel_bb_create_with_context_in_region(int fd, uint32_t ctx, uint32_t vm,
+				       const intel_ctx_cfg_t *cfg, uint32_t size, uint64_t region);
 struct intel_bb *intel_bb_create_with_relocs(int fd, uint32_t size);
 struct intel_bb *
 intel_bb_create_with_relocs_and_context(int fd, uint32_t ctx,
diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 153d9ce1d..b0b3ad8a7 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -384,7 +384,7 @@ static void pat_index_render(struct xe_pat_param *p)
 	ibb = intel_bb_create_full(fd, 0, 0, NULL, xe_get_default_alignment(fd),
 				   0, 0, p->size->alignment,
 				   INTEL_ALLOCATOR_SIMPLE,
-				   ALLOC_STRATEGY_HIGH_TO_LOW);
+				   ALLOC_STRATEGY_HIGH_TO_LOW, vram_if_possible(fd, 0));
 
 	size = width * height * bpp / 8;
 	stride = width * 4;
@@ -479,7 +479,7 @@ static void pat_index_dw(struct xe_pat_param *p)
 	ibb = intel_bb_create_full(fd, ctx, vm, NULL, xe_get_default_alignment(fd),
 				   0, 0, p->size->alignment,
 				   INTEL_ALLOCATOR_SIMPLE,
-				   ALLOC_STRATEGY_LOW_TO_HIGH);
+				   ALLOC_STRATEGY_LOW_TO_HIGH, vram_if_possible(fd, 0));
 
 	size = width * height * bpp / 8;
 	stride = width * 4;
-- 
2.34.1

