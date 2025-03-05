Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A5DC282D9
	for <igt-dev@archiver.kernel.org>; Wed,  5 Mar 2025 09:08:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD28910E71A;
	Wed,  5 Mar 2025 09:08:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XBlwoqoU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10B5A10E719
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Mar 2025 09:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741165696; x=1772701696;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yKAFWDSSk2GNcArizZJ+9IkYt0UskRydsbzEcuztH4E=;
 b=XBlwoqoUT3+f/561r6+Za9cQ5ewxhb5y7eR74kVTP9wNoHBqYSLX+Kjq
 4LXPc64P9LBPaozyIEPeoyeV3pm4IiYB8mO/fk0u7sV0mNAdB6sJxauIg
 MNHIUsDgGAhc2qjOxagpRvzyhnW6kpHZF9YqeslA0TY2GM7lRyUL6QeXO
 mtFnV+F/HggfCpzdU+BZVOUzuAUTtipfbj6Nd6MMz7VOHEycfDa7Hf7Qf
 uu3AmU4TRBZ6aWj0RQYmPNw1reeEfI3DHa+wl9hck3+b3sDEtv0mVZaEm
 lxE5TWTZ7CnEeKvGxggtLMOpYO10seicfdtz0BigxO1VO8eglyh9mg26m w==;
X-CSE-ConnectionGUID: 6m8ZIr+/SqGhbNz0KkeXBg==
X-CSE-MsgGUID: lVtcyg2DRU6FQmOiS4rwPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="44925841"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; d="scan'208";a="44925841"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 01:08:14 -0800
X-CSE-ConnectionGUID: zCK6ABfXTYC9dqLHst+gWA==
X-CSE-MsgGUID: Ma5QWDSsTC2JFV0EYm5lVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; d="scan'208";a="123651004"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.38])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 01:08:13 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 1/5] lib/intel_blt: Promote blt_bo_copy()
Date: Wed,  5 Mar 2025 10:06:11 +0100
Message-ID: <20250305090743.16894-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250305090743.16894-1-francois.dugast@intel.com>
References: <20250305090743.16894-1-francois.dugast@intel.com>
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

