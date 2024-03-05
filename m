Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C577C54E5D
	for <igt-dev@archiver.kernel.org>; Tue,  5 Mar 2024 12:18:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 030F3112A87;
	Tue,  5 Mar 2024 12:18:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f0t21WlD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0458C112A87
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Mar 2024 12:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709641100; x=1741177100;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qo8CnF8PgSxFTvsJ6lgsVMIgSWmyvE0sDrbfxgWrpcQ=;
 b=f0t21WlDRnheTKk7ud28rE5+Olq+5+kIvUYz/6++mKtqSqGtVBWvvvm/
 Vnrd3F0xvib91alySUnxVml+ZoyAS+WsqmQz4oM7vVq+/LTByp8eaDMtO
 y5v2u8rki703v3IUVwKOMmkjnM7YaRM+0jAQOAEORY5Bah3E18idCz013
 QQpqB94yowT2F4AeHgb87NJP67xATEdLHGItwKqVkGZHyaker1Sk5TvAc
 8DD+7DOGnN1i1uwW5bO3GbJ8oo2Iq2wqx4DFdzymWfo1ln/n3NHo+lrMh
 3ZUZkGT/5qROgh3aQg2EydWu3tjU/sNIjJWWeDezPx3zjghQbnAidfxWR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="15616297"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; d="scan'208";a="15616297"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 04:18:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9779440"
Received: from pkunieck-mobl.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.249.140.91])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 04:18:18 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v2 3/6] lib/intel_buf: revamp MOCS usage
Date: Tue,  5 Mar 2024 12:17:51 +0000
Message-ID: <20240305121754.182425-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240305121754.182425-1-matthew.auld@intel.com>
References: <20240305121754.182425-1-matthew.auld@intel.com>
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

We want to allow the caller the set any valid MOCS index as part of the
the intel_buf. Drop the MOCS enum in favour of raw mocs_index. Also drop
the getter/setter interface, for which there are no current callers for
the setter part. In the next patch we will expose the raw mocs_index.
Should be no functional changes here.

v2 (Zbigniew):
  - Rather just pass along UC directly to lower layers.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/gpu_cmds.c        | 18 +++---------------
 lib/intel_bufops.c    |  3 ++-
 lib/intel_bufops.h    | 23 +++--------------------
 lib/rendercopy_gen9.c |  5 ++---
 4 files changed, 10 insertions(+), 39 deletions(-)

diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
index d909efde8..da41121ce 100644
--- a/lib/gpu_cmds.c
+++ b/lib/gpu_cmds.c
@@ -194,7 +194,6 @@ gen9_fill_surface_state(struct intel_bb *ibb,
 	struct gen9_surface_state *ss;
 	uint32_t write_domain, read_domain, offset;
 	uint64_t address;
-	enum intel_buf_mocs mocs = intel_buf_get_mocs(buf);
 
 	if (is_dst) {
 		write_domain = read_domain = I915_GEM_DOMAIN_RENDER;
@@ -214,10 +213,7 @@ gen9_fill_surface_state(struct intel_bb *ibb,
 	ss->ss0.vertical_alignment = 1; /* align 4 */
 	ss->ss0.horizontal_alignment = 1; /* align 4 */
 
-	if (mocs == INTEL_BUF_MOCS_WB)
-		ss->ss1.mocs_index = intel_get_wb_mocs_index(ibb->fd);
-	else
-		ss->ss1.mocs_index = intel_get_uc_mocs_index(ibb->fd);
+	ss->ss1.mocs_index = buf->mocs_index;
 
 	if (buf->tiling == I915_TILING_X)
 		ss->ss0.tiled_mode = 2;
@@ -255,7 +251,6 @@ gen11_fill_surface_state(struct intel_bb *ibb,
 	struct gen9_surface_state *ss;
 	uint32_t write_domain, read_domain, offset;
 	uint64_t address;
-	enum intel_buf_mocs mocs = intel_buf_get_mocs(buf);
 
 	if (is_dst) {
 		write_domain = read_domain = I915_GEM_DOMAIN_RENDER;
@@ -275,10 +270,7 @@ gen11_fill_surface_state(struct intel_bb *ibb,
 	ss->ss0.vertical_alignment = vertical_alignment; /* align 4 */
 	ss->ss0.horizontal_alignment = horizontal_alignment; /* align 4 */
 
-	if (mocs == INTEL_BUF_MOCS_WB)
-		ss->ss1.mocs_index = intel_get_wb_mocs_index(ibb->fd);
-	else
-		ss->ss1.mocs_index = intel_get_uc_mocs_index(ibb->fd);
+	ss->ss1.mocs_index = buf->mocs_index;
 
 	if (buf->tiling == I915_TILING_X)
 		ss->ss0.tiled_mode = 2;
@@ -911,7 +903,6 @@ xehp_fill_surface_state(struct intel_bb *ibb,
 	struct xehp_surface_state *ss;
 	uint32_t write_domain, read_domain, offset;
 	uint64_t address;
-	enum intel_buf_mocs mocs = intel_buf_get_mocs(buf);
 
 	if (is_dst) {
 		write_domain = read_domain = I915_GEM_DOMAIN_RENDER;
@@ -931,10 +922,7 @@ xehp_fill_surface_state(struct intel_bb *ibb,
 	ss->ss0.vertical_alignment = 1; /* align 4 */
 	ss->ss0.horizontal_alignment = 1; /* align 4 */
 
-	if (mocs == INTEL_BUF_MOCS_WB)
-		ss->ss1.mocs_index = intel_get_wb_mocs_index(ibb->fd);
-	else
-		ss->ss1.mocs_index = intel_get_uc_mocs_index(ibb->fd);
+	ss->ss1.mocs_index = buf->mocs_index;
 
 	if (buf->tiling == I915_TILING_X)
 		ss->ss0.tiled_mode = 2;
diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index 5e2701a7d..c34d778a1 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -29,6 +29,7 @@
 #include "igt.h"
 #include "igt_x86.h"
 #include "intel_bufops.h"
+#include "intel_mocs.h"
 #include "intel_pat.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
@@ -877,8 +878,8 @@ static void __intel_buf_init(struct buf_ops *bops,
 	buf->bpp = bpp;
 	buf->compression = compression;
 	buf->addr.offset = INTEL_BUF_INVALID_ADDRESS;
-	buf->mocs = INTEL_BUF_MOCS_DEFAULT;
 	buf->pat_index = pat_index;
+	buf->mocs_index = intel_get_uc_mocs_index(bops->fd);
 	IGT_INIT_LIST_HEAD(&buf->link);
 
 	tile_width = __get_min_stride(width, bpp, tiling);
diff --git a/lib/intel_bufops.h b/lib/intel_bufops.h
index 363f7abaa..60f7785fe 100644
--- a/lib/intel_bufops.h
+++ b/lib/intel_bufops.h
@@ -12,12 +12,6 @@ struct buf_ops;
 #define INTEL_BUF_NAME_MAXSIZE 32
 #define INVALID_ADDR(x) ((x) == INTEL_BUF_INVALID_ADDRESS)
 
-enum intel_buf_mocs {
-	INTEL_BUF_MOCS_DEFAULT,
-	INTEL_BUF_MOCS_UC,
-	INTEL_BUF_MOCS_WB,
-};
-
 struct intel_buf {
 	struct buf_ops *bops;
 
@@ -31,7 +25,6 @@ struct intel_buf {
 	uint32_t compression;
 	uint32_t swizzle_mode;
 	uint32_t yuv_semiplanar_bpp;
-	enum intel_buf_mocs mocs;
 	bool format_is_yuv;
 	bool format_is_yuv_semiplanar;
 	struct {
@@ -68,6 +61,9 @@ struct intel_buf {
 	/* pat_index to use for mapping this buf. Only used in Xe. */
 	uint8_t pat_index;
 
+	/* mocs_index to use for operations using this intel_buf, like render_copy  */
+	uint8_t mocs_index;
+
 	/* For debugging purposes */
 	char name[INTEL_BUF_NAME_MAXSIZE + 1];
 };
@@ -227,17 +223,4 @@ void intel_buf_draw_pattern(struct buf_ops *bops, struct intel_buf *buf,
 			    int cx, int cy, int cw, int ch,
 			    bool use_alternate_colors);
 
-static inline enum intel_buf_mocs intel_buf_get_mocs(const struct intel_buf *buf)
-{
-	igt_assert(buf);
-	return buf->mocs;
-}
-
-static inline void intel_buf_set_mocs(struct intel_buf *buf,
-				      enum intel_buf_mocs mocs)
-{
-	igt_assert(buf);
-	buf->mocs = mocs;
-}
-
 #endif
diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index 404406e5f..caf4623af 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -153,7 +153,6 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
 	struct gen9_surface_state *ss;
 	uint32_t write_domain, read_domain;
 	uint64_t address;
-	int i915 = buf_ops_get_fd(buf->bops);
 
 	igt_assert_lte(buf->surface[0].stride, 256*1024);
 	igt_assert_lte(intel_buf_width(buf), 16384);
@@ -179,12 +178,12 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
 	ss->ss0.vertical_alignment = 1; /* align 4 */
 	ss->ss0.horizontal_alignment = 1; /* align 4 or HALIGN_32 on display ver >= 13*/
 
+	ss->ss1.mocs_index = buf->mocs_index;
+
 	if (HAS_4TILE(ibb->devid)) {
-		ss->ss1.mocs_index = intel_get_uc_mocs_index(i915);
 		ss->ss5.mip_tail_start_lod = 0;
 	} else {
 		ss->ss0.render_cache_read_write = 1;
-		ss->ss1.mocs_index = intel_get_uc_mocs_index(i915);
 		ss->ss5.mip_tail_start_lod = 1; /* needed with trmode */
 	}
 
-- 
2.43.2

