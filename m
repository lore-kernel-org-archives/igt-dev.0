Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C724C3600C
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 12:07:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A0AF10E6B6;
	Wed, 26 Mar 2025 12:07:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UuXWJVaX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D46310E6B5
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 12:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742990839; x=1774526839;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hVk8Jvz8ewINFk+foMQQiUgSrHtPOV1PDdg05kNI7Lc=;
 b=UuXWJVaXuFOlrrOlpzMdwdvbwqsa/Es9lKjIpWZ2VNl34G5re2d8Q34t
 +J3m1mJFFlStlX5Gvmq1vXMrk6iEYoEho3gKXIimpTgEBkU60V//pov1/
 BLoKLAvqwK6f/6BMiQ+l7Z3bPSnLhZYEhz9ylb3x78+2aEQ06DeMT9YUf
 jY+OBTcxKbxMnar8ZjcQKs/Gce+vGMUfrH0YJyv2Yb3bOn9TR6EFm8uZT
 H20yVl8MftWYLtlJw3xsmGhavGyF2JabtpCKkZ7dRH870kNuUbohkMIdd
 F/iz7h45UkvEhqgfGP0diCFX8b6YCcTNatJpzUKz5nB+f4YDBrpo5KWhd Q==;
X-CSE-ConnectionGUID: VSYUzJe7Q8OqPn1sEiW97A==
X-CSE-MsgGUID: nOYJpYMcT2a5TaEp3pcNSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="44162015"
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="44162015"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 05:07:14 -0700
X-CSE-ConnectionGUID: I7n6dYe8SPua0Q7hUJh/jw==
X-CSE-MsgGUID: ynL3mRYgQLmVxVR8ITeNVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,277,1736841600"; d="scan'208";a="155756697"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 05:07:12 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t,
 v3 2/5] lib/intel_blt: Allow forcing multiple runs in blt_mem_copy()
Date: Wed, 26 Mar 2025 13:02:57 +0100
Message-ID: <20250326120623.124595-3-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326120623.124595-1-francois.dugast@intel.com>
References: <20250326120623.124595-1-francois.dugast@intel.com>
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

Allowing to run the same copy multiple times presents no functional
advantage but it can be used to keep the copy functions busy longer
while other tests are being performed.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 lib/intel_blt.c  | 32 ++++++++++++++++++--------------
 lib/intel_blt.h  |  3 ++-
 lib/xe/xe_util.c |  2 +-
 3 files changed, 21 insertions(+), 16 deletions(-)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index b2fb3151e..d33cdd911 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -1815,10 +1815,10 @@ void blt_mem_init(int fd, struct blt_mem_data *mem)
 	mem->driver = get_intel_driver(fd);
 }
 
-static void emit_blt_mem_copy(int fd, uint64_t ahnd, const struct blt_mem_data *mem)
+static void emit_blt_mem_copy(int fd, uint64_t ahnd, const struct blt_mem_data *mem, int ncopies)
 {
 	uint64_t dst_offset, src_offset;
-	int i;
+	int i, j;
 	uint32_t *batch;
 	uint32_t optype;
 
@@ -1831,16 +1831,18 @@ static void emit_blt_mem_copy(int fd, uint64_t ahnd, const struct blt_mem_data *
 	optype = mem->src.type == M_MATRIX ? 1 << 17 : 0;
 
 	i = 0;
-	batch[i++] = MEM_COPY_CMD | optype;
-	batch[i++] = mem->src.width - 1;
-	batch[i++] = mem->src.height - 1;
-	batch[i++] = mem->src.pitch - 1;
-	batch[i++] = mem->dst.pitch - 1;
-	batch[i++] = src_offset;
-	batch[i++] = src_offset << 32;
-	batch[i++] = dst_offset;
-	batch[i++] = dst_offset << 32;
-	batch[i++] = mem->src.mocs_index << MEM_COPY_MOCS_SHIFT | mem->dst.mocs_index;
+	for (j = 0; j < ncopies; j++) {
+		batch[i++] = MEM_COPY_CMD | optype;
+		batch[i++] = mem->src.width - 1;
+		batch[i++] = mem->src.height - 1;
+		batch[i++] = mem->src.pitch - 1;
+		batch[i++] = mem->dst.pitch - 1;
+		batch[i++] = src_offset;
+		batch[i++] = src_offset << 32;
+		batch[i++] = dst_offset;
+		batch[i++] = dst_offset << 32;
+		batch[i++] = mem->src.mocs_index << MEM_COPY_MOCS_SHIFT | mem->dst.mocs_index;
+	}
 	batch[i++] = MI_BATCH_BUFFER_END;
 
 	munmap(batch, mem->bb.size);
@@ -1853,6 +1855,7 @@ static void emit_blt_mem_copy(int fd, uint64_t ahnd, const struct blt_mem_data *
  * @e: blitter engine for @ctx
  * @ahnd: allocator handle
  * @blt: blitter data for mem-copy.
+ * @ncopies: how many times copy is run, > 1 can be used to stress the copy function
  *
  * Function does mem blit between @src and @dst described in @blt object.
  *
@@ -1862,7 +1865,8 @@ static void emit_blt_mem_copy(int fd, uint64_t ahnd, const struct blt_mem_data *
 int blt_mem_copy(int fd, const intel_ctx_t *ctx,
 		 const struct intel_execution_engine2 *e,
 		 uint64_t ahnd,
-		 const struct blt_mem_data *mem)
+		 const struct blt_mem_data *mem,
+		 int ncopies)
 {
 	struct drm_i915_gem_execbuffer2 execbuf = {};
 	struct drm_i915_gem_exec_object2 obj[3] = {};
@@ -1875,7 +1879,7 @@ int blt_mem_copy(int fd, const intel_ctx_t *ctx,
 					  0, mem->dst.pat_index);
 	bb_offset = get_offset(ahnd, mem->bb.handle, mem->bb.size, 0);
 
-	emit_blt_mem_copy(fd, ahnd, mem);
+	emit_blt_mem_copy(fd, ahnd, mem, ncopies);
 
 	if (mem->driver == INTEL_DRIVER_XE) {
 		intel_ctx_xe_exec(ctx, ahnd, CANONICAL(bb_offset));
diff --git a/lib/intel_blt.h b/lib/intel_blt.h
index 5d6191ac9..1c463b35b 100644
--- a/lib/intel_blt.h
+++ b/lib/intel_blt.h
@@ -269,7 +269,8 @@ void blt_mem_init(int fd, struct blt_mem_data *mem);
 int blt_mem_copy(int fd, const intel_ctx_t *ctx,
 			 const struct intel_execution_engine2 *e,
 			 uint64_t ahnd,
-			 const struct blt_mem_data *mem);
+			 const struct blt_mem_data *mem,
+			 int ncopies);
 
 int blt_mem_set(int fd, const intel_ctx_t *ctx,
 			const struct intel_execution_engine2 *e, uint64_t ahnd,
diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
index ba23bd7d8..2d9e67955 100644
--- a/lib/xe/xe_util.c
+++ b/lib/xe/xe_util.c
@@ -319,7 +319,7 @@ void xe_blt_mem_copy(int fd, uint32_t src_handle, uint32_t dst_handle, const int
 	blt_set_batch(&mem.bb, bb, bb_size, region);
 	igt_assert(mem.src.width == mem.dst.width);
 
-	blt_mem_copy(fd, ctx, NULL, ahnd, &mem);
+	blt_mem_copy(fd, ctx, NULL, ahnd, &mem, 1);
 	result = memcmp(mem.src.ptr, mem.dst.ptr, mem.src.size);
 
 	intel_allocator_bind(ahnd, 0, 0);
-- 
2.43.0

