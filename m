Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 886ECD111A8
	for <igt-dev@archiver.kernel.org>; Fri, 28 Nov 2025 01:03:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 365B010E89A;
	Fri, 28 Nov 2025 01:03:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HpLYA8Re";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91A8910E855
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Nov 2025 01:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764291787; x=1795827787;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=yOcsHofDfLELEoegnFjfGoMOy+1MQx/EuAd3SJNmapg=;
 b=HpLYA8ReiRxAUcI2zC1SkeUmtPmo6P/bTUg91MvybtFlopHst760s8yu
 3cFZd5SyAOY6RJAO7rFtspnqSPiwQRSoG+Aj87GSiIh437XfJkhTGwHxV
 y/L+KiTnBV4aUD+vS0RQxHWgcjaRQGZ4UWA1C3FwGBsoN8ZIA0BSKWE8c
 5VSHEm8kcLDCZowP+3h3TmDPzOPLyWPLdXeDiqB3tKF9KwaPeVGA7QOZa
 ARFbQ3wWN7bbeoLoVt74eiiUU5y96kZKzCmMOJF4dgyJzA3+faKWLWo0E
 IAN0bzeaBx0ymqyiwgDCSDUT7SFSVVAcmyFkjk0eKGcIwgF1xw2Ltode1 Q==;
X-CSE-ConnectionGUID: FxUAYgkuQniI0WShcjiBeA==
X-CSE-MsgGUID: byQ7gpqNRmu1+Py67Hi9QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="53897943"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; d="scan'208";a="53897943"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 17:03:06 -0800
X-CSE-ConnectionGUID: LQmBLLvCSquYrRYElEfKag==
X-CSE-MsgGUID: 0sPV82HQTkCFllYowdi5Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; d="scan'208";a="193439712"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.140])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 17:03:05 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 3/3] intel/i915: Allocate batch buffers from system RAM
Date: Fri, 28 Nov 2025 03:02:51 +0200
Message-ID: <20251128010251.18988-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251128010251.18988-1-ville.syrjala@linux.intel.com>
References: <20251128010251.18988-1-ville.syrjala@linux.intel.com>
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

I have no idea why we're allocating batch buffers from VRAM.
Just stick them into system memory like a normal person and
let the GPU DMA them in.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_fb.c                   | 2 +-
 tests/intel/gem_ccs.c          | 6 +++---
 tests/intel/gem_exercise_blt.c | 4 ++--
 tools/intel_tiling_detect.c    | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 78d49aed8283..f7743d05f62a 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -3017,7 +3017,7 @@ static void setup_context_and_memory_region(const struct igt_fb *fb, uint32_t *c
 		igt_assert(__gem_create_in_memory_regions(fb->fd,
 							  bb,
 							  bb_size,
-							  *mem_region) == 0);
+							  REGION_SMEM) == 0);
 	} else if (is_xe_device(fb->fd)) {
 		*vm = xe_vm_create(fb->fd, 0, 0);
 		*exec_queue = xe_exec_queue_create(fb->fd, *vm, &inst, 0);
diff --git a/tests/intel/gem_ccs.c b/tests/intel/gem_ccs.c
index 68632372d8f5..885e043540c1 100644
--- a/tests/intel/gem_ccs.c
+++ b/tests/intel/gem_ccs.c
@@ -341,7 +341,7 @@ static void block_copy(int i915,
 	uint8_t uc_mocs = intel_get_uc_mocs_index(i915);
 	int result;
 
-	igt_assert(__gem_create_in_memory_regions(i915, &bb, &bb_size, region1) == 0);
+	igt_assert(__gem_create_in_memory_regions(i915, &bb, &bb_size, REGION_SMEM) == 0);
 
 	if (!blt_uses_extended_block_copy(i915))
 		pext = NULL;
@@ -464,7 +464,7 @@ static void block_multicopy(int i915,
 	uint8_t uc_mocs = intel_get_uc_mocs_index(i915);
 	int result;
 
-	igt_assert(__gem_create_in_memory_regions(i915, &bb, &bb_size, region1) == 0);
+	igt_assert(__gem_create_in_memory_regions(i915, &bb, &bb_size, REGION_SMEM) == 0);
 
 	if (!blt_uses_extended_block_copy(i915))
 		pext3 = NULL;
@@ -551,7 +551,7 @@ static void block_copy_large(int i915,
 	bool result = true;
 	int i;
 
-	igt_assert(__gem_create_in_memory_regions(i915, &bb, &bb_size, region1) == 0);
+	igt_assert(__gem_create_in_memory_regions(i915, &bb, &bb_size, REGION_SMEM) == 0);
 
 	if (!blt_uses_extended_block_copy(i915))
 		pext = NULL;
diff --git a/tests/intel/gem_exercise_blt.c b/tests/intel/gem_exercise_blt.c
index 74388f7f05cf..7cacb5b7a6d9 100644
--- a/tests/intel/gem_exercise_blt.c
+++ b/tests/intel/gem_exercise_blt.c
@@ -151,7 +151,7 @@ static void fast_copy_emit(int i915, const intel_ctx_t *ctx,
 	uint32_t bb, width = param.width, height = param.height;
 	int result;
 
-	igt_assert(__gem_create_in_memory_regions(i915, &bb, &bb_size, region1) == 0);
+	igt_assert(__gem_create_in_memory_regions(i915, &bb, &bb_size, REGION_SMEM) == 0);
 
 	blt_copy_init(i915, &bltinit);
 	src = blt_create_object(&bltinit, region1, width, height, bpp, 0,
@@ -212,7 +212,7 @@ static void fast_copy(int i915, const intel_ctx_t *ctx,
 	uint32_t width = param.width, height = param.height;
 	int result;
 
-	igt_assert(__gem_create_in_memory_regions(i915, &bb, &bb_size, region1) == 0);
+	igt_assert(__gem_create_in_memory_regions(i915, &bb, &bb_size, REGION_SMEM) == 0);
 
 	blt_copy_init(i915, &blt);
 	src = blt_create_object(&blt, region1, width, height, bpp, 0,
diff --git a/tools/intel_tiling_detect.c b/tools/intel_tiling_detect.c
index a72999057088..fac8a2f590c5 100644
--- a/tools/intel_tiling_detect.c
+++ b/tools/intel_tiling_detect.c
@@ -117,7 +117,7 @@ static void blt_copy(int fd,
 		bb_size = SZ_4K;
 		src_region = REGION_SMEM;
 		dst_region = gem_has_lmem(fd) ? REGION_LMEM(0) : REGION_SMEM;
-		igt_assert(__gem_create_in_memory_regions(fd, &bb, &bb_size, src_region) == 0);
+		igt_assert(__gem_create_in_memory_regions(fd, &bb, &bb_size, REGION_SMEM) == 0);
 	}
 
 	if (!blt_uses_extended_block_copy(fd))
-- 
2.51.2

