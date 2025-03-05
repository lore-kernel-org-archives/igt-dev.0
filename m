Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B03FC28B22
	for <igt-dev@archiver.kernel.org>; Wed,  5 Mar 2025 13:58:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A23810E733;
	Wed,  5 Mar 2025 13:58:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HerFgOhB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3F4110E723
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Mar 2025 13:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741183119; x=1772719119;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=to2Vw6NK7+XLvJonQHV3egc+h6DpCJfuQbj1uDY4nIY=;
 b=HerFgOhBpVIvmBI/OO/eioR6K+LXhps4PNJERMqKwBpjp/rCzeHJ1FlQ
 8JKlOcf+k1zvsgpwJPU7ed0jV8Eg/x64h6/t13hwaAayES+Z5queTIH6Q
 mYR4m0o9Ex9mr9N1BxGyDHYFKzmgw5dNwaWDkgr1JSICUUwDtxUzopuI4
 RP+RgrL+XrS9ZSdC4Jv4egFFzERLknb7PS1VwW91EP0F7iKyMvyJPcI4J
 Xbv3kN4qPDpZ00k/NY+pfOVcrt7+zhnqUyEf0nodZuISxBTjsSGkO6s3d
 u2VOz1xUDQfdsVtj4PwNM3C8drufuLbaXzvNwokHUZutgneRw/RYp/1IO g==;
X-CSE-ConnectionGUID: R0AHnLkSRwapPUYnToPKtg==
X-CSE-MsgGUID: Gk9m8r5+QaOjJbxVOC8fAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="52350145"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="52350145"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 05:58:39 -0800
X-CSE-ConnectionGUID: 4xIoDmXIRUq+IgrdLkt8Tw==
X-CSE-MsgGUID: /rC++u4MRmOmaoBcGKdmVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="118517121"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.38])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 05:58:37 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 3/5] lib/intel_blt: Use blt_mem_copy() to stress copy
 functions
Date: Wed,  5 Mar 2025 14:57:58 +0100
Message-ID: <20250305135821.37517-4-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250305135821.37517-1-francois.dugast@intel.com>
References: <20250305135821.37517-1-francois.dugast@intel.com>
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

The new blt_mem_copy() argument ncopies is handed over to the
underlying function blt_bo_copy() which actually runs the copy, so
that the caller of blt_mem_copy() can use a higher level function
to stress the hardware copy function.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 lib/intel_blt.c             | 5 +++--
 lib/intel_blt.h             | 2 +-
 tests/intel/xe_copy_basic.c | 2 +-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index 315a2e145..5cdf1ea8d 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -1917,11 +1917,12 @@ int blt_mem_copy(int fd, const intel_ctx_t *ctx,
  * @width: width
  * @height: height
  * @region: memory region
+ * @ncopies: how many times copy is run, > 1 can be used to stress the copy function
  *
  * Copy BO with mem blit from @src_handle into @dst_handle.
  */
 void blt_bo_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ctx,
-		 uint32_t size, uint32_t width, uint32_t height, uint32_t region)
+		 uint32_t size, uint32_t width, uint32_t height, uint32_t region, int ncopies)
 {
 	struct blt_mem_data mem = {};
 	uint64_t bb_size = xe_bb_size(fd, SZ_4K);
@@ -1948,7 +1949,7 @@ void blt_bo_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_c
 	blt_set_batch(&mem.bb, bb, bb_size, region);
 	igt_assert(mem.src.width == mem.dst.width);
 
-	blt_mem_copy(fd, ctx, NULL, ahnd, &mem, 1);
+	blt_mem_copy(fd, ctx, NULL, ahnd, &mem, ncopies);
 	result = memcmp(mem.src.ptr, mem.dst.ptr, mem.src.size);
 
 	intel_allocator_bind(ahnd, 0, 0);
diff --git a/lib/intel_blt.h b/lib/intel_blt.h
index 217cade02..86681f1dd 100644
--- a/lib/intel_blt.h
+++ b/lib/intel_blt.h
@@ -273,7 +273,7 @@ int blt_mem_copy(int fd, const intel_ctx_t *ctx,
 			 int ncopies);
 
 void blt_bo_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ctx,
-		 uint32_t size, uint32_t width, uint32_t height, uint32_t region);
+		 uint32_t size, uint32_t width, uint32_t height, uint32_t region, int ncopies);
 
 int blt_mem_set(int fd, const intel_ctx_t *ctx,
 			const struct intel_execution_engine2 *e, uint64_t ahnd,
diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
index 458106b0b..20926cbb7 100644
--- a/tests/intel/xe_copy_basic.c
+++ b/tests/intel/xe_copy_basic.c
@@ -44,7 +44,7 @@ static void
 mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ctx,
 	 uint32_t size, uint32_t width, uint32_t height, uint32_t region)
 {
-	blt_bo_copy(fd, src_handle, dst_handle, ctx, size, width, height, region);
+	blt_bo_copy(fd, src_handle, dst_handle, ctx, size, width, height, region, 1);
 }
 
 /**
-- 
2.43.0

