Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54775C3ABC3
	for <igt-dev@archiver.kernel.org>; Tue, 13 May 2025 18:58:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F1A910E5E3;
	Tue, 13 May 2025 18:58:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UTH9YS+N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE7E510E5E3
 for <igt-dev@lists.freedesktop.org>; Tue, 13 May 2025 18:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747162719; x=1778698719;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c0xJfD+8IOrqDnYVSF4K9WhzLr1eooS3ijXIromnJHA=;
 b=UTH9YS+Nq/OS5UzvNBdRhAofqPjdCOta8/CHYNfwMTYN6E0+Q+9zt0/7
 6AU428UNowhEgel2kYh/hi3FTxvH8auoc5cBQ/ZXEqKk7S/7/6a3SWxn7
 GmrNKAj7MP0t+KNJMEhdqfgnjqHjBN8rpPVAtIHeLj9Qz/GDY9NPoLW51
 rNk3aW/C8n4JB80P8nl1EWh7lruObhCTV7LBwXFF8CBVLq/2mbofsZaOQ
 ZvKxli/3PVrnE4wIiMiGF5V2tGwpk2mbk/gGFTBmaachF3w4BybFeV9Ye
 GETbDeo2EwSKteNhutr+09YjijMk8VroQu4OSUpUnHcthefsEMdbHhOec A==;
X-CSE-ConnectionGUID: bbvjrFvIRcCdKg/qg06B3Q==
X-CSE-MsgGUID: j/WCaAIsSnqrAHvwA178/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48960613"
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="48960613"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 11:58:39 -0700
X-CSE-ConnectionGUID: 4fcx+4saRvymsxNL+GmiTQ==
X-CSE-MsgGUID: pH5v9qC2RomPzVTBrIhlXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="137679173"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.60])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 11:58:38 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 06/15] lib/intel_blt: separate mem-copy and mem-set
Date: Tue, 13 May 2025 20:58:01 +0200
Message-ID: <20250513185811.897232-7-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250513185811.897232-1-zbigniew.kempczynski@intel.com>
References: <20250513185811.897232-1-zbigniew.kempczynski@intel.com>
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

Move operation type (linear or matrix) from buffer to command part.
Mem-copy additionally uses mode (byte or page) so separate them
for extending them independently.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
---
 lib/intel_blt.c              | 39 +++++++++++++++++++++++++++---------
 lib/intel_blt.h              | 24 ++++++++++++++++------
 tests/intel/xe_copy_basic.c  | 16 +++++++--------
 tests/intel/xe_render_copy.c |  4 ++--
 tests/intel/xe_spin_batch.c  |  6 ++----
 5 files changed, 59 insertions(+), 30 deletions(-)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index 33efbf1038..4c90d157c9 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -1799,22 +1799,25 @@ int blt_fast_copy(int fd,
 }
 
 /**
- * blt_mem_init:
+ * blt_mem_copy_init:
  * @fd: drm fd
  * @mem: structure for initialization
+ * @copy_type: linear or matrix
  *
  * Function is zeroing @mem and sets fd and driver fields (INTEL_DRIVER_I915 or
  * INTEL_DRIVER_XE).
  */
-void blt_mem_init(int fd, struct blt_mem_data *mem)
+void blt_mem_copy_init(int fd, struct blt_mem_copy_data *mem,
+		       enum blt_memop_type copy_type)
 {
 	memset(mem, 0, sizeof(*mem));
 
 	mem->fd = fd;
 	mem->driver = get_intel_driver(fd);
+	mem->copy_type = copy_type;
 }
 
-static void emit_blt_mem_copy(int fd, uint64_t ahnd, const struct blt_mem_data *mem)
+static void emit_blt_mem_copy(int fd, uint64_t ahnd, const struct blt_mem_copy_data *mem)
 {
 	uint64_t dst_offset, src_offset;
 	int i;
@@ -1827,7 +1830,7 @@ static void emit_blt_mem_copy(int fd, uint64_t ahnd, const struct blt_mem_data *
 					  0, mem->dst.pat_index);
 
 	batch = bo_map(fd, mem->bb.handle, mem->bb.size, mem->driver);
-	optype = mem->src.type == TYPE_MATRIX ? 1 << 17 : 0;
+	optype = mem->copy_type == TYPE_MATRIX ? 1 << 17 : 0;
 
 	i = 0;
 	batch[i++] = MEM_COPY_CMD | optype;
@@ -1861,7 +1864,7 @@ static void emit_blt_mem_copy(int fd, uint64_t ahnd, const struct blt_mem_data *
 int blt_mem_copy(int fd, const intel_ctx_t *ctx,
 		 const struct intel_execution_engine2 *e,
 		 uint64_t ahnd,
-		 const struct blt_mem_data *mem)
+		 const struct blt_mem_copy_data *mem)
 {
 	struct drm_i915_gem_execbuffer2 execbuf = {};
 	struct drm_i915_gem_exec_object2 obj[3] = {};
@@ -1902,7 +1905,26 @@ int blt_mem_copy(int fd, const intel_ctx_t *ctx,
 	return ret;
 }
 
-static void emit_blt_mem_set(int fd, uint64_t ahnd, const struct blt_mem_data *mem,
+/**
+ * blt_mem_set_init:
+ * @fd: drm fd
+ * @mem: structure for initialization
+ *
+ * Function is zeroing @mem and sets fd and driver fields (INTEL_DRIVER_I915 or
+ * INTEL_DRIVER_XE).
+ */
+void blt_mem_set_init(int fd, struct blt_mem_set_data *mem,
+		      enum blt_memop_type fill_type)
+{
+	memset(mem, 0, sizeof(*mem));
+
+	mem->fd = fd;
+	mem->driver = get_intel_driver(fd);
+	mem->fill_type = fill_type;
+}
+
+static void emit_blt_mem_set(int fd, uint64_t ahnd,
+			     const struct blt_mem_set_data *mem,
 			     uint8_t fill_data)
 {
 	uint64_t dst_offset;
@@ -1945,7 +1967,7 @@ static void emit_blt_mem_set(int fd, uint64_t ahnd, const struct blt_mem_data *m
 int blt_mem_set(int fd, const intel_ctx_t *ctx,
 		const struct intel_execution_engine2 *e,
 		uint64_t ahnd,
-		const struct blt_mem_data *mem,
+		const struct blt_mem_set_data *mem,
 		uint8_t fill_data)
 {
 	struct drm_i915_gem_execbuffer2 execbuf = {};
@@ -2101,14 +2123,13 @@ void blt_set_mem_object(struct blt_mem_object *obj,
 			uint32_t handle, uint64_t size, uint32_t pitch,
 			uint32_t width, uint32_t height, uint32_t region,
 			uint8_t mocs_index, uint8_t pat_index,
-			enum blt_memop_type type, enum blt_compression compression)
+			enum blt_compression compression)
 {
 	obj->handle = handle;
 	obj->region = region;
 	obj->size = size;
 	obj->mocs_index = mocs_index;
 	obj->pat_index = pat_index;
-	obj->type = type;
 	obj->compression = compression;
 	obj->width = width;
 	obj->height = height;
diff --git a/lib/intel_blt.h b/lib/intel_blt.h
index 4bae0b47b3..9efa799881 100644
--- a/lib/intel_blt.h
+++ b/lib/intel_blt.h
@@ -101,7 +101,6 @@ struct blt_mem_object {
 	uint64_t size;
 	uint8_t mocs_index;
 	uint8_t pat_index;
-	enum blt_memop_type type;
 	enum blt_compression compression;
 	uint32_t width;
 	uint32_t height;
@@ -128,14 +127,23 @@ struct blt_copy_data {
 	bool print_bb;
 };
 
-struct blt_mem_data {
+struct blt_mem_copy_data {
 	int fd;
 	enum intel_driver driver;
+	enum blt_memop_type copy_type;
 	struct blt_mem_object src;
 	struct blt_mem_object dst;
 	struct blt_copy_batch bb;
 };
 
+struct blt_mem_set_data {
+	int fd;
+	enum intel_driver driver;
+	enum blt_memop_type fill_type;
+	struct blt_mem_object dst;
+	struct blt_copy_batch bb;
+};
+
 enum blt_surface_type {
 	SURFACE_TYPE_1D,
 	SURFACE_TYPE_2D,
@@ -265,16 +273,20 @@ int blt_fast_copy(int fd,
 		  uint64_t ahnd,
 		  const struct blt_copy_data *blt);
 
-void blt_mem_init(int fd, struct blt_mem_data *mem);
+void blt_mem_copy_init(int fd, struct blt_mem_copy_data *mem,
+		       enum blt_memop_type copy_type);
+
+void blt_mem_set_init(int fd, struct blt_mem_set_data *mem,
+		      enum blt_memop_type fill_type);
 
 int blt_mem_copy(int fd, const intel_ctx_t *ctx,
 			 const struct intel_execution_engine2 *e,
 			 uint64_t ahnd,
-			 const struct blt_mem_data *mem);
+			 const struct blt_mem_copy_data *mem);
 
 int blt_mem_set(int fd, const intel_ctx_t *ctx,
 			const struct intel_execution_engine2 *e, uint64_t ahnd,
-			const struct blt_mem_data *mem, uint8_t fill_data);
+			const struct blt_mem_set_data *mem, uint8_t fill_data);
 
 void blt_set_geom(struct blt_copy_object *obj, uint32_t pitch,
 		  int16_t x1, int16_t y1, int16_t x2, int16_t y2,
@@ -302,7 +314,7 @@ void blt_set_mem_object(struct blt_mem_object *obj,
 			uint32_t handle, uint64_t size, uint32_t pitch,
 			uint32_t width, uint32_t height, uint32_t region,
 			uint8_t mocs_index, uint8_t pat_index,
-			enum blt_memop_type type, enum blt_compression compression);
+			enum blt_compression compression);
 
 void blt_set_object_ext(struct blt_block_copy_object_ext *obj,
 			uint8_t compression_format,
diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
index a9e9bd2359..5681d4d6ab 100644
--- a/tests/intel/xe_copy_basic.c
+++ b/tests/intel/xe_copy_basic.c
@@ -44,7 +44,7 @@ static void
 mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ctx,
 	 uint32_t size, uint32_t width, uint32_t height, uint32_t region)
 {
-	struct blt_mem_data mem = {};
+	struct blt_mem_copy_data mem = {};
 	uint64_t bb_size = xe_bb_size(fd, SZ_4K);
 	uint64_t ahnd = intel_allocator_open_full(fd, ctx->vm, 0, 0,
 						  INTEL_ALLOCATOR_SIMPLE,
@@ -56,13 +56,11 @@ mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ct
 
 	bb = xe_bo_create(fd, 0, bb_size, region, 0);
 
-	blt_mem_init(fd, &mem);
+	blt_mem_copy_init(fd, &mem, TYPE_LINEAR);
 	blt_set_mem_object(&mem.src, src_handle, size, width, width, height,
-			   region, src_mocs, DEFAULT_PAT_INDEX, TYPE_LINEAR,
-			   COMPRESSION_DISABLED);
+			   region, src_mocs, DEFAULT_PAT_INDEX, COMPRESSION_DISABLED);
 	blt_set_mem_object(&mem.dst, dst_handle, size, width, width, height,
-			   region, dst_mocs, DEFAULT_PAT_INDEX, TYPE_LINEAR,
-			   COMPRESSION_DISABLED);
+			   region, dst_mocs, DEFAULT_PAT_INDEX, COMPRESSION_DISABLED);
 	mem.src.ptr = xe_bo_map(fd, src_handle, size);
 	mem.dst.ptr = xe_bo_map(fd, dst_handle, size);
 
@@ -97,7 +95,7 @@ static void
 mem_set(int fd, uint32_t dst_handle, const intel_ctx_t *ctx, uint32_t size,
 	uint32_t width, uint32_t height, uint8_t fill_data, uint32_t region)
 {
-	struct blt_mem_data mem = {};
+	struct blt_mem_set_data mem = {};
 	uint64_t bb_size = xe_bb_size(fd, SZ_4K);
 	uint64_t ahnd = intel_allocator_open_full(fd, ctx->vm, 0, 0,
 						  INTEL_ALLOCATOR_SIMPLE,
@@ -107,9 +105,9 @@ mem_set(int fd, uint32_t dst_handle, const intel_ctx_t *ctx, uint32_t size,
 	uint8_t *result;
 
 	bb = xe_bo_create(fd, 0, bb_size, region, 0);
-	blt_mem_init(fd, &mem);
+	blt_mem_set_init(fd, &mem, TYPE_LINEAR);
 	blt_set_mem_object(&mem.dst, dst_handle, size, width, width, height, region,
-			   dst_mocs, DEFAULT_PAT_INDEX, TYPE_LINEAR, COMPRESSION_DISABLED);
+			   dst_mocs, DEFAULT_PAT_INDEX, COMPRESSION_DISABLED);
 	mem.dst.ptr = xe_bo_map(fd, dst_handle, size);
 	blt_set_batch(&mem.bb, bb, bb_size, region);
 	blt_mem_set(fd, ctx, NULL, ahnd, &mem, fill_data);
diff --git a/tests/intel/xe_render_copy.c b/tests/intel/xe_render_copy.c
index f0a90e320c..cafc05e19b 100644
--- a/tests/intel/xe_render_copy.c
+++ b/tests/intel/xe_render_copy.c
@@ -470,10 +470,10 @@ static void mem_copy_busy(int fd, struct drm_xe_engine_class_instance *hwe, uint
 	dst_handle = xe_bo_create(fd, 0, copy_size, region, 0);
 	blt_set_mem_object(mem_copy.src, src_handle, copy_size, width, width, height, region,
 			   intel_get_uc_mocs_index(fd), DEFAULT_PAT_INDEX,
-			   TYPE_LINEAR, COMPRESSION_DISABLED);
+			   COMPRESSION_DISABLED);
 	blt_set_mem_object(mem_copy.dst, dst_handle, copy_size, width, width, height, region,
 			   intel_get_uc_mocs_index(fd), DEFAULT_PAT_INDEX,
-			   TYPE_LINEAR, COMPRESSION_DISABLED);
+			   COMPRESSION_DISABLED);
 	mem_copy.src->ptr = xe_bo_map(fd, src_handle, copy_size);
 	mem_copy.dst->ptr = xe_bo_map(fd, dst_handle, copy_size);
 	mem_copy.src_offset = get_offset_pat_index(ahnd, mem_copy.src->handle,
diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
index 06c5f9d3f9..21b08ba067 100644
--- a/tests/intel/xe_spin_batch.c
+++ b/tests/intel/xe_spin_batch.c
@@ -350,11 +350,9 @@ static void xe_spin_mem_copy_region(int fd, struct drm_xe_engine_class_instance
 	src_handle = xe_bo_create(fd, 0, copy_size, region, 0);
 	dst_handle = xe_bo_create(fd, 0, copy_size, region, 0);
 	blt_set_mem_object(mem_copy.src, src_handle, copy_size, width, width, height, region,
-			   intel_get_uc_mocs_index(fd), DEFAULT_PAT_INDEX,
-			   TYPE_LINEAR, COMPRESSION_DISABLED);
+			   intel_get_uc_mocs_index(fd), DEFAULT_PAT_INDEX, COMPRESSION_DISABLED);
 	blt_set_mem_object(mem_copy.dst, dst_handle, copy_size, width, width, height, region,
-			   intel_get_uc_mocs_index(fd), DEFAULT_PAT_INDEX,
-			   TYPE_LINEAR, COMPRESSION_DISABLED);
+			   intel_get_uc_mocs_index(fd), DEFAULT_PAT_INDEX, COMPRESSION_DISABLED);
 	mem_copy.src->ptr = xe_bo_map(fd, src_handle, copy_size);
 	mem_copy.dst->ptr = xe_bo_map(fd, dst_handle, copy_size);
 	mem_copy.src_offset = get_offset_pat_index(ahnd, mem_copy.src->handle,
-- 
2.43.0

