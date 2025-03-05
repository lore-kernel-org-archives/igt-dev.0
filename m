Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF771C28B22
	for <igt-dev@archiver.kernel.org>; Wed,  5 Mar 2025 13:58:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C44610E2AC;
	Wed,  5 Mar 2025 13:58:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T5XciVo4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48C1C10E2AC
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Mar 2025 13:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741183116; x=1772719116;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yKAFWDSSk2GNcArizZJ+9IkYt0UskRydsbzEcuztH4E=;
 b=T5XciVo4x5DrRtXJtdYC7mnTvWljdBTO0fr8fD5CB27tvu4hKwKa8/rO
 5E64LsZmjswMwHa8OTSpYKLzLoiTl9oduWyERtPZ0MUUF0mzhfM9HwdTx
 JJXBbZKBBITUAPRzecEt9xHE47ugSgVnQiIiLeil0Q+kSqr68TDAj+PEy
 SHXey/fpGxVu9NgAG/HH0ZMSq/SabPKQ2gImv626bv98OFYKPpf56UleG
 Z5aUhIirT6Adtad/psCyZ4cb8o8ZtEu0WXeHLOzDL6o4LoXE+kJNS66rm
 3jxpFSJH7umx/vXJDcTpOB9kAc/2WL8p7UHz/+fT1gLBMA/R5plxToDDW w==;
X-CSE-ConnectionGUID: 5+0tzF7iRl2KUhUkgs30PA==
X-CSE-MsgGUID: JWwd9VcdTbGeFiEW3DJbWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="52350137"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="52350137"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 05:58:36 -0800
X-CSE-ConnectionGUID: dy4VxmSnTs6NLjxZFKPNsQ==
X-CSE-MsgGUID: uIWYNfSlQECT8zCIg1qHdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="118517114"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.38])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 05:58:35 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 1/5] lib/intel_blt: Promote blt_bo_copy()
Date: Wed,  5 Mar 2025 14:57:56 +0100
Message-ID: <20250305135821.37517-2-francois.dugast@intel.com>
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

This function abstracts copy with mem blt. Move it to the library so
that it can be also be used elsewhere without code duplication.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 lib/intel_blt.c             | 53 +++++++++++++++++++++++++++++++++++++
 lib/intel_blt.h             |  3 +++
 tests/intel/xe_copy_basic.c | 36 +------------------------
 3 files changed, 57 insertions(+), 35 deletions(-)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index b2fb3151e..84318a557 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -1903,6 +1903,59 @@ int blt_mem_copy(int fd, const intel_ctx_t *ctx,
 	return ret;
 }
 
+/**
+ * blt_bo_copy:
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
+void blt_bo_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ctx,
+		 uint32_t size, uint32_t width, uint32_t height, uint32_t region)
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
+
 static void emit_blt_mem_set(int fd, uint64_t ahnd, const struct blt_mem_data *mem,
 			     uint8_t fill_data)
 {
diff --git a/lib/intel_blt.h b/lib/intel_blt.h
index 5d6191ac9..4357d70eb 100644
--- a/lib/intel_blt.h
+++ b/lib/intel_blt.h
@@ -271,6 +271,9 @@ int blt_mem_copy(int fd, const intel_ctx_t *ctx,
 			 uint64_t ahnd,
 			 const struct blt_mem_data *mem);
 
+void blt_bo_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ctx,
+		 uint32_t size, uint32_t width, uint32_t height, uint32_t region);
+
 int blt_mem_set(int fd, const intel_ctx_t *ctx,
 			const struct intel_execution_engine2 *e, uint64_t ahnd,
 			const struct blt_mem_data *mem, uint8_t fill_data);
diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
index a43842e39..458106b0b 100644
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
+	blt_bo_copy(fd, src_handle, dst_handle, ctx, size, width, height, region);
 }
 
 /**
-- 
2.43.0

