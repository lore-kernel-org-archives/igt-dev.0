Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 481B0CD4F3C
	for <igt-dev@archiver.kernel.org>; Mon, 18 May 2026 08:21:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9D2D10E706;
	Mon, 18 May 2026 08:21:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GIaVh95c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DC4910E71F
 for <igt-dev@lists.freedesktop.org>; Mon, 18 May 2026 08:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779092477; x=1810628477;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BXTH/p5qAtEwuYwoRR5I2wdFTTXfpXKRj9yekbfHb8c=;
 b=GIaVh95cV6X5oMxs/xJFy2TrySsZ4ea6rEWP8hb2RZKQDworLM9zohis
 V6GAB8OzYhD2oKo0+kd1p9pubW8tkP+hhrB9Z4pI+dkO7RO/+i6lE/2JY
 zEfuqiP8TNynFHWuOf+xfQ9O0ykRUmSc/M1BXdzQRvHXQy2MSE0A/gqI7
 r8C5tGdEmHd8KutDwjvL7dYLGM7xnEfRh+p7dVm//GecuzdwPTxUsDFFh
 Oi6xc383T0Yq3TI3HluBW3Pcy+pqPDg8zV6KBuoCNcf2vwa6bLurPWnJS
 mqkEgY521lbADDCJw5rMSGJMiepwhyfTAiLwGBw40cAKpdaVm4dXDQ/YC w==;
X-CSE-ConnectionGUID: euFWtMd2QXWHPcewvDLClw==
X-CSE-MsgGUID: swJQbHF5SVO+JAV5QVFE7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="90248313"
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="90248313"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 01:21:17 -0700
X-CSE-ConnectionGUID: dW8h9bRxTtWapmTvkflDug==
X-CSE-MsgGUID: qYfRdSgUSdGyGsKq+m5BNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,241,1770624000"; d="scan'208";a="243651949"
Received: from dbhadane-mobl1.iind.intel.com ([10.190.239.58])
 by orviesa004.jf.intel.com with ESMTP; 18 May 2026 01:21:16 -0700
From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH i-g-t v2] lib/intel_blt: Replace CANONICAL() with
 xe_canonical_va() for Xe driver
Date: Mon, 18 May 2026 13:51:13 +0530
Message-ID: <20260518082113.1275002-1-dnyaneshwar.bhadane@intel.com>
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

v2: Shorter assignment to dst_offset (Kamil)

Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
---
 benchmarks/xe_blt.c |  8 +++-----
 lib/intel_blt.c     | 16 +++++++++++-----
 lib/intel_ctx.c     |  3 ++-
 3 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/benchmarks/xe_blt.c b/benchmarks/xe_blt.c
index 555178380..56f155e37 100644
--- a/benchmarks/xe_blt.c
+++ b/benchmarks/xe_blt.c
@@ -99,8 +99,7 @@ static int blt_src_copy(int fd,
 		clock_gettime(CLOCK_MONOTONIC, &start);
 		do {
 			if (blt->driver == INTEL_DRIVER_XE)
-				intel_ctx_xe_exec(ctx, ahnd,
-						  CANONICAL(bb_offset));
+				intel_ctx_xe_exec(ctx, ahnd, bb_offset);
 			count++;
 			clock_gettime(CLOCK_MONOTONIC, &end);
 			if (elapsed(&start, &end) > (100 / 1000.))
@@ -109,13 +108,12 @@ static int blt_src_copy(int fd,
 	} else if (loop_count) {
 		for (int loop = 0; loop < count; loop++) {
 			if (blt->driver == INTEL_DRIVER_XE)
-				intel_ctx_xe_exec(ctx, ahnd,
-						  CANONICAL(bb_offset));
+				intel_ctx_xe_exec(ctx, ahnd, bb_offset);
 		}
 
 	} else {
 		if (blt->driver == INTEL_DRIVER_XE)
-			intel_ctx_xe_exec(ctx, ahnd, CANONICAL(bb_offset));
+			intel_ctx_xe_exec(ctx, ahnd, bb_offset);
 	}
 	return ret;
 }
diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index 2b59cc7e9..b14dcbf71 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -768,6 +768,9 @@ static void fill_data(struct gen12_block_copy_data *data,
 	data->dw03.dst_x2 = blt->dst.x2;
 	data->dw03.dst_y2 = blt->dst.y2;
 
+	if (blt->driver == INTEL_DRIVER_XE)
+		dst_offset = xe_canonical_va(blt->fd, dst_offset);
+
 	data->dw04.dst_address_lo = dst_offset;
 	data->dw05.dst_address_hi = dst_offset >> 32;
 
@@ -793,6 +796,9 @@ static void fill_data(struct gen12_block_copy_data *data,
 			data->dw08.src_ctrl_surface_type = blt->src.compression_type;
 	}
 
+	if (blt->driver == INTEL_DRIVER_XE)
+		src_offset =  xe_canonical_va(blt->fd, src_offset);
+
 	data->dw09.src_address_lo = src_offset;
 	data->dw10.src_address_hi = src_offset >> 32;
 
@@ -1091,7 +1097,7 @@ int blt_block_copy(int fd,
 	emit_blt_block_copy(fd, ahnd, blt, ext, 0, true);
 
 	if (blt->driver == INTEL_DRIVER_XE) {
-		intel_ctx_xe_exec(ctx, ahnd, CANONICAL(bb_offset));
+		intel_ctx_xe_exec(ctx, ahnd, bb_offset);
 	} else {
 		obj[0].offset = CANONICAL(dst_offset);
 		obj[1].offset = CANONICAL(src_offset);
@@ -1456,7 +1462,7 @@ int blt_ctrl_surf_copy(int fd,
 	emit_blt_ctrl_surf_copy(fd, ahnd, surf, 0, true);
 
 	if (surf->driver == INTEL_DRIVER_XE) {
-		intel_ctx_xe_exec(ctx, ahnd, CANONICAL(bb_offset));
+		intel_ctx_xe_exec(ctx, ahnd, bb_offset);
 	} else {
 		obj[0].offset = CANONICAL(dst_offset);
 		obj[1].offset = CANONICAL(src_offset);
@@ -1827,7 +1833,7 @@ int blt_fast_copy(int fd,
 	emit_blt_fast_copy(fd, ahnd, blt, 0, true);
 
 	if (blt->driver == INTEL_DRIVER_XE) {
-		intel_ctx_xe_exec(ctx, ahnd, CANONICAL(bb_offset));
+		intel_ctx_xe_exec(ctx, ahnd, bb_offset);
 	} else {
 		obj[0].offset = CANONICAL(dst_offset);
 		obj[1].offset = CANONICAL(src_offset);
@@ -2180,7 +2186,7 @@ int blt_mem_copy(int fd, const intel_ctx_t *ctx,
 	emit_blt_mem_copy(fd, ahnd, mem, 0, true);
 
 	if (mem->driver == INTEL_DRIVER_XE) {
-		intel_ctx_xe_exec(ctx, ahnd, CANONICAL(bb_offset));
+		intel_ctx_xe_exec(ctx, ahnd, bb_offset);
 	} else {
 		obj[0].offset = CANONICAL(dst_offset);
 		obj[1].offset = CANONICAL(src_offset);
@@ -2287,7 +2293,7 @@ int blt_mem_set(int fd, const intel_ctx_t *ctx,
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

