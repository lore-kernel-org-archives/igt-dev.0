Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ECF1C36008
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 12:07:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D571210E6B3;
	Wed, 26 Mar 2025 12:07:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mH/m1MTS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3486210E6B3
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 12:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742990838; x=1774526838;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XgQT88OXpqRMoUBr/0bmYKS9AqrXl0k+ifAFvQ+COqQ=;
 b=mH/m1MTSSdN5Vs9z4zGzNX8uxFDiN+QNRfi/P/9gzoSwBntCL4SR6bh3
 c0Z7jyGyX8ty4TBRGfqKhPhPFMb1LL5H6KGb832HkqZ5cRXPuSpSI8JKI
 B8UlwYfPNrfofmQtoAXaREOhqcvJxupfzmi4FBQ+um5aAANeFmIMbFS8E
 jjngiGtRKkeKim9nvoePXnE+AE3+U1zlKhCzL1K/F20/QV0xmgu7dHaZE
 zgCmMUFzutYFEB2yPJY9mnFgz4R9kCY3Zc7OQlATDv+9VT6j7fgBs6CBG
 LuLG1KQBWtzBIN+nYka3d6+SeGDseQg2a8HlEimuUf2ZsdQpAnF8HU2T7 Q==;
X-CSE-ConnectionGUID: zyRa1w35Sr+KAbqLZ45YwQ==
X-CSE-MsgGUID: vcSPo3yCSFudyCBzlQXrnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="44162008"
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="44162008"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 05:07:13 -0700
X-CSE-ConnectionGUID: 2CUrL3gGTASoyWPmWa09Bw==
X-CSE-MsgGUID: 7zmJtXs3TLyRj7mH3Q0J8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="155756675"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 05:07:11 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t,v3 1/5] lib/xe/xe_util: Promote xe_blt_mem_copy()
Date: Wed, 26 Mar 2025 13:02:56 +0100
Message-ID: <20250326120623.124595-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326120623.124595-1-francois.dugast@intel.com>
References: <20250326120623.124595-1-francois.dugast@intel.com>
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

This function abstracts copy with mem blt. Move it to xe_util so
that it can be also be used elsewhere without code duplication.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 lib/xe/xe_util.c            | 55 +++++++++++++++++++++++++++++++++++++
 lib/xe/xe_util.h            |  3 ++
 tests/intel/xe_copy_basic.c | 36 +-----------------------
 3 files changed, 59 insertions(+), 35 deletions(-)

diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
index 06b378ce0..ba23bd7d8 100644
--- a/lib/xe/xe_util.c
+++ b/lib/xe/xe_util.c
@@ -7,6 +7,8 @@
 #include "igt_core.h"
 #include "igt_syncobj.h"
 #include "igt_sysfs.h"
+#include "intel_blt.h"
+#include "intel_mocs.h"
 #include "intel_pat.h"
 
 #include "xe/xe_ioctl.h"
@@ -275,3 +277,56 @@ uint32_t xe_nsec_to_ticks(int fd, int gt_id, uint64_t nsec)
 
 	return div64_u64_round_up(nsec * refclock, NSEC_PER_SEC);
 }
+
+/**
+ * xe_blt_mem_copy:
+ * @fd: drm fd
+ * @src_handle: handle of the source BO
+ * @dst_handle: handle of the destination BO
+ * @ctx: intel_ctx_t context
+ * @size: BO size
+ * @width: width
+ * @height: height
+ * @region: memory region
+ *
+ * Copy BO with mem blit from @src_handle into @dst_handle.
+ */
+void xe_blt_mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ctx,
+		     uint32_t size, uint32_t width, uint32_t height, uint32_t region)
+{
+	struct blt_mem_data mem = {};
+	uint64_t bb_size = xe_bb_size(fd, SZ_4K);
+	uint64_t ahnd = intel_allocator_open_full(fd, ctx->vm, 0, 0,
+						  INTEL_ALLOCATOR_SIMPLE,
+						  ALLOC_STRATEGY_LOW_TO_HIGH, 0);
+	uint8_t src_mocs = intel_get_uc_mocs_index(fd);
+	uint8_t dst_mocs = src_mocs;
+	uint32_t bb;
+	int result;
+
+	bb = xe_bo_create(fd, 0, bb_size, region, 0);
+
+	blt_mem_init(fd, &mem);
+	blt_set_mem_object(&mem.src, src_handle, size, 0, width, height,
+			   region, src_mocs, DEFAULT_PAT_INDEX, M_LINEAR,
+			   COMPRESSION_DISABLED);
+	blt_set_mem_object(&mem.dst, dst_handle, size, 0, width, height,
+			   region, dst_mocs, DEFAULT_PAT_INDEX, M_LINEAR,
+			   COMPRESSION_DISABLED);
+	mem.src.ptr = xe_bo_map(fd, src_handle, size);
+	mem.dst.ptr = xe_bo_map(fd, dst_handle, size);
+
+	blt_set_batch(&mem.bb, bb, bb_size, region);
+	igt_assert(mem.src.width == mem.dst.width);
+
+	blt_mem_copy(fd, ctx, NULL, ahnd, &mem);
+	result = memcmp(mem.src.ptr, mem.dst.ptr, mem.src.size);
+
+	intel_allocator_bind(ahnd, 0, 0);
+	munmap(mem.src.ptr, size);
+	munmap(mem.dst.ptr, size);
+	gem_close(fd, bb);
+	put_ahnd(ahnd);
+
+	igt_assert_f(!result, "source and destination differ\n");
+}
diff --git a/lib/xe/xe_util.h b/lib/xe/xe_util.h
index 06ebd3c2a..550c62101 100644
--- a/lib/xe/xe_util.h
+++ b/lib/xe/xe_util.h
@@ -49,4 +49,7 @@ void xe_bind_unbind_async(int fd, uint32_t vm, uint32_t bind_engine,
 
 uint32_t xe_nsec_to_ticks(int fd, int gt_id, uint64_t ns);
 
+void xe_blt_mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ctx,
+		     uint32_t size, uint32_t width, uint32_t height, uint32_t region);
+
 #endif /* XE_UTIL_H */
diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
index a43842e39..b7cee6f62 100644
--- a/tests/intel/xe_copy_basic.c
+++ b/tests/intel/xe_copy_basic.c
@@ -44,41 +44,7 @@ static void
 mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ctx,
 	 uint32_t size, uint32_t width, uint32_t height, uint32_t region)
 {
-	struct blt_mem_data mem = {};
-	uint64_t bb_size = xe_bb_size(fd, SZ_4K);
-	uint64_t ahnd = intel_allocator_open_full(fd, ctx->vm, 0, 0,
-						  INTEL_ALLOCATOR_SIMPLE,
-						  ALLOC_STRATEGY_LOW_TO_HIGH, 0);
-	uint8_t src_mocs = intel_get_uc_mocs_index(fd);
-	uint8_t dst_mocs = src_mocs;
-	uint32_t bb;
-	int result;
-
-	bb = xe_bo_create(fd, 0, bb_size, region, 0);
-
-	blt_mem_init(fd, &mem);
-	blt_set_mem_object(&mem.src, src_handle, size, 0, width, height,
-			   region, src_mocs, DEFAULT_PAT_INDEX, M_LINEAR,
-			   COMPRESSION_DISABLED);
-	blt_set_mem_object(&mem.dst, dst_handle, size, 0, width, height,
-			   region, dst_mocs, DEFAULT_PAT_INDEX, M_LINEAR,
-			   COMPRESSION_DISABLED);
-	mem.src.ptr = xe_bo_map(fd, src_handle, size);
-	mem.dst.ptr = xe_bo_map(fd, dst_handle, size);
-
-	blt_set_batch(&mem.bb, bb, bb_size, region);
-	igt_assert(mem.src.width == mem.dst.width);
-
-	blt_mem_copy(fd, ctx, NULL, ahnd, &mem);
-	result = memcmp(mem.src.ptr, mem.dst.ptr, mem.src.size);
-
-	intel_allocator_bind(ahnd, 0, 0);
-	munmap(mem.src.ptr, size);
-	munmap(mem.dst.ptr, size);
-	gem_close(fd, bb);
-	put_ahnd(ahnd);
-
-	igt_assert_f(!result, "source and destination differ\n");
+	xe_blt_mem_copy(fd, src_handle, dst_handle, ctx, size, width, height, region);
 }
 
 /**
-- 
2.43.0

