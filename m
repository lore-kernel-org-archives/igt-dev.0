Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A68C54F30
	for <igt-dev@archiver.kernel.org>; Fri, 30 May 2025 06:41:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25C2110E78C;
	Fri, 30 May 2025 06:41:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JGkR3N2s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9729510E78C
 for <igt-dev@lists.freedesktop.org>; Fri, 30 May 2025 06:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748587267; x=1780123267;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EmCZJeHFmmLbAinjl92KdxIqwMdcN5lLVOryzT43v7g=;
 b=JGkR3N2smZCX6NjMu2UbrSmBfw9VXfin1pa9mGCJ6YiAbDuQ/2Q6irwK
 Idxd76XHOIHWli/WOTn65uyBh8WjwGQBpQIwJkCQR7aaUuGYvH2DeB8xd
 7imz7VSHp1U5I41GTJxP07DAxZfkZ2f7+9D+ede2/XKULPhfhU0ZLq7Ke
 rSdBt3Pr4Yt5An74SUwhQplYQQ7kAv1PvbzDQGvDYOEa46vuIPkWCtX2w
 2rxqF41btDj2ZVhH0EWAiZ+CLyvlf+NmKmCzwcolNBb+xwXrXy568HF8y
 5Q+A7Pzkl4T9t+4HycQxJHpRJy5V+HKYz+jD8/dQTtoiiy3g472lD8Luk w==;
X-CSE-ConnectionGUID: b2udMnK9RSiSwIWEY76sOg==
X-CSE-MsgGUID: u9pbrCh9Qb2pFbwHK5MusQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="38295938"
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="38295938"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 23:41:06 -0700
X-CSE-ConnectionGUID: dLMV7IGtRJCouM/CpZHXBQ==
X-CSE-MsgGUID: okVVnL9fSTWSRouV0om7vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,195,1744095600"; d="scan'208";a="143817614"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.174])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 23:41:05 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t v4 01/11] lib/intel_cmds_info: rename M to TYPE in
 blt_memop_type
Date: Fri, 30 May 2025 08:40:40 +0200
Message-ID: <20250530064050.1560398-2-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250530064050.1560398-1-zbigniew.kempczynski@intel.com>
References: <20250530064050.1560398-1-zbigniew.kempczynski@intel.com>
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

Documentation separates type and mode in mem-copy so rename prefix
to avoid ambiguity.

Cc: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_blt.c              |  2 +-
 lib/intel_cmds_info.c        |  8 ++++----
 lib/intel_cmds_info.h        | 10 ++++++++--
 tests/intel/xe_copy_basic.c  |  6 +++---
 tests/intel/xe_render_copy.c |  4 ++--
 tests/intel/xe_spin_batch.c  |  4 ++--
 6 files changed, 20 insertions(+), 14 deletions(-)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index 7010d3ff7d..33efbf1038 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -1827,7 +1827,7 @@ static void emit_blt_mem_copy(int fd, uint64_t ahnd, const struct blt_mem_data *
 					  0, mem->dst.pat_index);
 
 	batch = bo_map(fd, mem->bb.handle, mem->bb.size, mem->driver);
-	optype = mem->src.type == M_MATRIX ? 1 << 17 : 0;
+	optype = mem->src.type == TYPE_MATRIX ? 1 << 17 : 0;
 
 	i = 0;
 	batch[i++] = MEM_COPY_CMD | optype;
diff --git a/lib/intel_cmds_info.c b/lib/intel_cmds_info.c
index d581edb6eb..3bd5eab653 100644
--- a/lib/intel_cmds_info.c
+++ b/lib/intel_cmds_info.c
@@ -74,13 +74,13 @@ static const struct blt_cmd_info
 
 static const struct blt_cmd_info
 		pvc_mem_copy = BLT_INFO(MEM_COPY,
-					BIT(M_LINEAR) |
-					BIT(M_MATRIX));
+					BIT(TYPE_LINEAR) |
+					BIT(TYPE_MATRIX));
 
 static const struct blt_cmd_info
 		pvc_mem_set = BLT_INFO(MEM_SET,
-				       BIT(M_LINEAR) |
-				       BIT(M_MATRIX));
+				       BIT(TYPE_LINEAR) |
+				       BIT(TYPE_MATRIX));
 
 static const struct blt_cmd_info
 		pre_gen6_xy_color_blt = BLT_INFO(XY_COLOR_BLT, TILE_L_X);
diff --git a/lib/intel_cmds_info.h b/lib/intel_cmds_info.h
index 7960e0412e..88ba892645 100644
--- a/lib/intel_cmds_info.h
+++ b/lib/intel_cmds_info.h
@@ -19,9 +19,15 @@ enum blt_tiling_type {
 	__BLT_MAX_TILING
 };
 
+/**
+ * enum blt_memop_type - memory operation type for mem-copy and mem-set.
+ *
+ * Mem-copy and mem-set support two types of object copy/fill -
+ * linear (1D buffer) and matrix (2D buffer).
+ */
 enum blt_memop_type {
-	M_LINEAR,
-	M_MATRIX,
+	TYPE_LINEAR,
+	TYPE_MATRIX,
 };
 
 enum blt_cmd_type {
diff --git a/tests/intel/xe_copy_basic.c b/tests/intel/xe_copy_basic.c
index d4300b85c0..a9e9bd2359 100644
--- a/tests/intel/xe_copy_basic.c
+++ b/tests/intel/xe_copy_basic.c
@@ -58,10 +58,10 @@ mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const intel_ctx_t *ct
 
 	blt_mem_init(fd, &mem);
 	blt_set_mem_object(&mem.src, src_handle, size, width, width, height,
-			   region, src_mocs, DEFAULT_PAT_INDEX, M_LINEAR,
+			   region, src_mocs, DEFAULT_PAT_INDEX, TYPE_LINEAR,
 			   COMPRESSION_DISABLED);
 	blt_set_mem_object(&mem.dst, dst_handle, size, width, width, height,
-			   region, dst_mocs, DEFAULT_PAT_INDEX, M_LINEAR,
+			   region, dst_mocs, DEFAULT_PAT_INDEX, TYPE_LINEAR,
 			   COMPRESSION_DISABLED);
 	mem.src.ptr = xe_bo_map(fd, src_handle, size);
 	mem.dst.ptr = xe_bo_map(fd, dst_handle, size);
@@ -109,7 +109,7 @@ mem_set(int fd, uint32_t dst_handle, const intel_ctx_t *ctx, uint32_t size,
 	bb = xe_bo_create(fd, 0, bb_size, region, 0);
 	blt_mem_init(fd, &mem);
 	blt_set_mem_object(&mem.dst, dst_handle, size, width, width, height, region,
-			   dst_mocs, DEFAULT_PAT_INDEX, M_LINEAR, COMPRESSION_DISABLED);
+			   dst_mocs, DEFAULT_PAT_INDEX, TYPE_LINEAR, COMPRESSION_DISABLED);
 	mem.dst.ptr = xe_bo_map(fd, dst_handle, size);
 	blt_set_batch(&mem.bb, bb, bb_size, region);
 	blt_mem_set(fd, ctx, NULL, ahnd, &mem, fill_data);
diff --git a/tests/intel/xe_render_copy.c b/tests/intel/xe_render_copy.c
index 60cd0fb457..7ebde01c44 100644
--- a/tests/intel/xe_render_copy.c
+++ b/tests/intel/xe_render_copy.c
@@ -470,10 +470,10 @@ static void mem_copy_busy(int fd, struct drm_xe_engine_class_instance *hwe, uint
 	dst_handle = xe_bo_create(fd, 0, copy_size, region, 0);
 	blt_set_mem_object(mem_copy.src, src_handle, copy_size, width, width, height, region,
 			   intel_get_uc_mocs_index(fd), DEFAULT_PAT_INDEX,
-			   M_LINEAR, COMPRESSION_DISABLED);
+			   TYPE_LINEAR, COMPRESSION_DISABLED);
 	blt_set_mem_object(mem_copy.dst, dst_handle, copy_size, width, width, height, region,
 			   intel_get_uc_mocs_index(fd), DEFAULT_PAT_INDEX,
-			   M_LINEAR, COMPRESSION_DISABLED);
+			   TYPE_LINEAR, COMPRESSION_DISABLED);
 	mem_copy.src->ptr = xe_bo_map(fd, src_handle, copy_size);
 	mem_copy.dst->ptr = xe_bo_map(fd, dst_handle, copy_size);
 	mem_copy.src_offset = get_offset_pat_index(ahnd, mem_copy.src->handle,
diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
index 4fff34a092..06c5f9d3f9 100644
--- a/tests/intel/xe_spin_batch.c
+++ b/tests/intel/xe_spin_batch.c
@@ -351,10 +351,10 @@ static void xe_spin_mem_copy_region(int fd, struct drm_xe_engine_class_instance
 	dst_handle = xe_bo_create(fd, 0, copy_size, region, 0);
 	blt_set_mem_object(mem_copy.src, src_handle, copy_size, width, width, height, region,
 			   intel_get_uc_mocs_index(fd), DEFAULT_PAT_INDEX,
-			   M_LINEAR, COMPRESSION_DISABLED);
+			   TYPE_LINEAR, COMPRESSION_DISABLED);
 	blt_set_mem_object(mem_copy.dst, dst_handle, copy_size, width, width, height, region,
 			   intel_get_uc_mocs_index(fd), DEFAULT_PAT_INDEX,
-			   M_LINEAR, COMPRESSION_DISABLED);
+			   TYPE_LINEAR, COMPRESSION_DISABLED);
 	mem_copy.src->ptr = xe_bo_map(fd, src_handle, copy_size);
 	mem_copy.dst->ptr = xe_bo_map(fd, dst_handle, copy_size);
 	mem_copy.src_offset = get_offset_pat_index(ahnd, mem_copy.src->handle,
-- 
2.43.0

