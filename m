Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E50C3ABC3
	for <igt-dev@archiver.kernel.org>; Tue, 13 May 2025 18:58:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A58310E5E0;
	Tue, 13 May 2025 18:58:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i5gvB3Ph";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19FF010E5E0
 for <igt-dev@lists.freedesktop.org>; Tue, 13 May 2025 18:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747162716; x=1778698716;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3OIIuY3oe98VOHjHHN2ThBMcym7maVQaURAofbIYWIc=;
 b=i5gvB3PhVL33gPnc2MD1prmB6ncNR3gjG8lBJ47vm8IchzPEXQ6YIiPc
 +ieqEuu6CYf9i5AkHomsj8DtwlA7Nc42M+T6/gEsrfVXKIN8efrPezp3o
 a6QwACoXYAZp61pvgJKXIXdt7BeE1jDE0X+I86QT7fruKlEfFYSq75fk7
 6cXL7yVlMFfQ50DixlIssfv72+0TT3V+1tfNKduSYuMVvyh6vt+VYQZwS
 GEELuzSAcjFnOnQ8dczDAw+DVOr10MNBYNMnNYHGfMPkByhOoeJm2SzDC
 umMvSfn8pUFHkpbDUAuQbjr2hsMI0vV2RX0ziDFTi6N2+7FzMztj90FCI g==;
X-CSE-ConnectionGUID: agjUlFPGT7CeclEKIGmDzg==
X-CSE-MsgGUID: h8uGCxovRaGRfqJ/dJQluA==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48960606"
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="48960606"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 11:58:36 -0700
X-CSE-ConnectionGUID: X7uB4FQWRNiwWbrkd/gxbg==
X-CSE-MsgGUID: WJrIBUDGRP29OzLxkxX1HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="137679160"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.60])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 11:58:34 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 05/15] lib/intel_cmds_info: rename M to TYPE in
 blt_memop_type
Date: Tue, 13 May 2025 20:58:00 +0200
Message-ID: <20250513185811.897232-6-zbigniew.kempczynski@intel.com>
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

Documentation separates type and mode in mem-copy so rename prefix
to avoid ambiguity.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
---
 lib/intel_blt.c              | 2 +-
 lib/intel_cmds_info.c        | 8 ++++----
 lib/intel_cmds_info.h        | 4 ++--
 tests/intel/xe_copy_basic.c  | 6 +++---
 tests/intel/xe_render_copy.c | 4 ++--
 tests/intel/xe_spin_batch.c  | 4 ++--
 6 files changed, 14 insertions(+), 14 deletions(-)

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
index 7960e0412e..66f63d7e72 100644
--- a/lib/intel_cmds_info.h
+++ b/lib/intel_cmds_info.h
@@ -20,8 +20,8 @@ enum blt_tiling_type {
 };
 
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
index 9f16537c1e..f0a90e320c 100644
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

