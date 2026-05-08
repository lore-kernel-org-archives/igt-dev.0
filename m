Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F04CD3436
	for <igt-dev@archiver.kernel.org>; Fri,  8 May 2026 12:35:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E726B10F497;
	Fri,  8 May 2026 12:35:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HNn/qXoB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06CB610F497
 for <igt-dev@lists.freedesktop.org>; Fri,  8 May 2026 12:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778243740; x=1809779740;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=m6InrkvEd1r8nB82LXCNNRAmCXwlQ3HkQXBgQKmbvVk=;
 b=HNn/qXoBdf2kLtco6jZM08VYjUM4U3oUawi7+YvpGN6MmKbcSOJv0YT6
 bODBg7nv6FosI9Z0+/xFNmINRTQA3RIUr0Ie5OBoZensS0j6AFze3Sb4G
 S4n7sPEl1ufIBO1gmiLt0NI4e6ksKyf85MwmZDBOkfTm/Af1a2TOV4G5Y
 UY9+WgWJEEHUX7nFWUo5O6chFHH2YqzLLmDvic3yE/U9HekCB0lEignjs
 wo8zoM+P/rxfL7wV3dyo1EQVtbvlYp8s2hpTEyB5jEBzXjJQYDw5HnZf5
 gi66BM9XIL0IqufmaQSTfMiq+KAQc3ypT2+2pX/fTRgOGGpp7jJilJUJf Q==;
X-CSE-ConnectionGUID: 99BL4XYcQParx4mXuONEuw==
X-CSE-MsgGUID: gKkT4KiRRr+dOnFIuw8Gmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="96632839"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; d="scan'208";a="96632839"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2026 05:35:40 -0700
X-CSE-ConnectionGUID: J6ill0RlT7uWgdClg+Q4Qw==
X-CSE-MsgGUID: xo0iIOuASiCS93Nxu4pLUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; d="scan'208";a="236688025"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa008.jf.intel.com with ESMTP; 08 May 2026 05:35:38 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH i-g-t] lib/intel_blt: Replace CANONICAL() with
 xe_canonical_va() for Xe driver
Date: Fri,  8 May 2026 18:05:34 +0530
Message-ID: <20260508123534.819730-1-dnyaneshwar.bhadane@intel.com>
X-Mailer: git-send-email 2.54.0
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

The CANONICAL() macro uses a hardcoded bit width (48) for address
canonicalization, which is incorrect on platforms where the GPU virtual
address space differs. Replace CANONICAL() with xe_canonical_va() in the
Xe driver path, which queries the actual va_bits from the kernel via
xe_va_bits().

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
---
 lib/intel_blt.c | 28 +++++++++++++++++++---------
 lib/intel_ctx.c |  3 ++-
 2 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index 2b59cc7e9..77965e932 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -768,8 +768,13 @@ static void fill_data(struct gen12_block_copy_data *data,
 	data->dw03.dst_x2 = blt->dst.x2;
 	data->dw03.dst_y2 = blt->dst.y2;
 
-	data->dw04.dst_address_lo = dst_offset;
-	data->dw05.dst_address_hi = dst_offset >> 32;
+	if (blt->driver == INTEL_DRIVER_XE) {
+		data->dw04.dst_address_lo = (uint32_t) (xe_canonical_va(blt->fd, dst_offset));
+		data->dw05.dst_address_hi = (uint32_t) (xe_canonical_va(blt->fd, dst_offset) >> 32);
+	} else {
+		data->dw04.dst_address_lo = dst_offset;
+		data->dw05.dst_address_hi = dst_offset >> 32;
+	}
 
 	data->dw06.dst_x_offset = blt->dst.x_offset;
 	data->dw06.dst_y_offset = blt->dst.y_offset;
@@ -793,8 +798,13 @@ static void fill_data(struct gen12_block_copy_data *data,
 			data->dw08.src_ctrl_surface_type = blt->src.compression_type;
 	}
 
-	data->dw09.src_address_lo = src_offset;
-	data->dw10.src_address_hi = src_offset >> 32;
+	if (blt->driver == INTEL_DRIVER_XE) {
+		data->dw09.src_address_lo = (uint32_t) (xe_canonical_va(blt->fd, src_offset));
+		data->dw10.src_address_hi = (uint32_t) (xe_canonical_va(blt->fd, src_offset) >> 32);
+	} else {
+		data->dw09.src_address_lo = src_offset;
+		data->dw10.src_address_hi = src_offset >> 32;
+	}
 
 	data->dw11.src_x_offset = blt->src.x_offset;
 	data->dw11.src_y_offset = blt->src.y_offset;
@@ -1091,7 +1101,7 @@ int blt_block_copy(int fd,
 	emit_blt_block_copy(fd, ahnd, blt, ext, 0, true);
 
 	if (blt->driver == INTEL_DRIVER_XE) {
-		intel_ctx_xe_exec(ctx, ahnd, CANONICAL(bb_offset));
+		intel_ctx_xe_exec(ctx, ahnd, bb_offset);
 	} else {
 		obj[0].offset = CANONICAL(dst_offset);
 		obj[1].offset = CANONICAL(src_offset);
@@ -1456,7 +1466,7 @@ int blt_ctrl_surf_copy(int fd,
 	emit_blt_ctrl_surf_copy(fd, ahnd, surf, 0, true);
 
 	if (surf->driver == INTEL_DRIVER_XE) {
-		intel_ctx_xe_exec(ctx, ahnd, CANONICAL(bb_offset));
+		intel_ctx_xe_exec(ctx, ahnd, bb_offset);
 	} else {
 		obj[0].offset = CANONICAL(dst_offset);
 		obj[1].offset = CANONICAL(src_offset);
@@ -1827,7 +1837,7 @@ int blt_fast_copy(int fd,
 	emit_blt_fast_copy(fd, ahnd, blt, 0, true);
 
 	if (blt->driver == INTEL_DRIVER_XE) {
-		intel_ctx_xe_exec(ctx, ahnd, CANONICAL(bb_offset));
+		intel_ctx_xe_exec(ctx, ahnd, bb_offset);
 	} else {
 		obj[0].offset = CANONICAL(dst_offset);
 		obj[1].offset = CANONICAL(src_offset);
@@ -2180,7 +2190,7 @@ int blt_mem_copy(int fd, const intel_ctx_t *ctx,
 	emit_blt_mem_copy(fd, ahnd, mem, 0, true);
 
 	if (mem->driver == INTEL_DRIVER_XE) {
-		intel_ctx_xe_exec(ctx, ahnd, CANONICAL(bb_offset));
+		intel_ctx_xe_exec(ctx, ahnd, bb_offset);
 	} else {
 		obj[0].offset = CANONICAL(dst_offset);
 		obj[1].offset = CANONICAL(src_offset);
@@ -2287,7 +2297,7 @@ int blt_mem_set(int fd, const intel_ctx_t *ctx,
 	emit_blt_mem_set(fd, ahnd, mem, fill_data);
 
 	if (mem->driver == INTEL_DRIVER_XE) {
-		intel_ctx_xe_exec(ctx, ahnd, CANONICAL(bb_offset));
+		intel_ctx_xe_exec(ctx, ahnd, bb_offset);
 	} else {
 		obj[0].offset = CANONICAL(dst_offset);
 		obj[1].offset = CANONICAL(bb_offset);
diff --git a/lib/intel_ctx.c b/lib/intel_ctx.c
index 30325b906..ca0cd43d9 100644
--- a/lib/intel_ctx.c
+++ b/lib/intel_ctx.c
@@ -11,6 +11,7 @@
 #include "intel_ctx.h"
 #include "ioctl_wrappers.h"
 #include "xe/xe_ioctl.h"
+#include "xe/xe_util.h"
 
 /**
  * SECTION:intel_ctx
@@ -430,7 +431,7 @@ int __intel_ctx_xe_exec(const intel_ctx_t *ctx, uint64_t ahnd, uint64_t bb_offse
 		.exec_queue_id = ctx->exec_queue,
 		.syncs = (uintptr_t)syncs,
 		.num_syncs = 2,
-		.address = bb_offset,
+		.address = xe_canonical_va(ctx->fd, bb_offset),
 		.num_batch_buffer = 1,
 	};
 	uint32_t sync_in = ctx->sync_in;
-- 
2.54.0

