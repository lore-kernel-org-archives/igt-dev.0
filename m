Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23BBAC369B9
	for <igt-dev@archiver.kernel.org>; Tue, 15 Apr 2025 07:39:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC85010E66E;
	Tue, 15 Apr 2025 07:38:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="khKMEXA0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54E1C10E36E
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Apr 2025 07:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744702738; x=1776238738;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mZELCMIfFUqhpaSz/fMgzMe/LE3N28+YQ5Bwch8CUCs=;
 b=khKMEXA0ybbbImkd8nPbh4On52bGCChj3h59o3JEjcWVRSlFtst8QXZl
 ALcCbAesR9MQoByP98SUWY3vTy9RR0sUaoEiBLrnKiywyTdxwyQUcE3p1
 2nTIR+ctjzHiVCZpatwoKW+r5u96l93zWc6uXYxX2x7a3p9ZAlS44LFKT
 w06zgD7FUdfAQ6IFbJ6P1UIxjhK3+kUp0qxzVe7KroTOpS5q4YfS/ENwX
 BHvIXjcrVcd7EoXFEFVRWqaq1qpEqkZE5X5GD2PTF0bFxvZdu819bpioP
 NYsaQpxMj6wJMiteKA+Dk7aSVJbiyFJ3yIVqULKHKJhex/odO8AgUkEWN g==;
X-CSE-ConnectionGUID: dtEMrUOwRw+3y7DO2hEN4Q==
X-CSE-MsgGUID: NWam8OFjQn+GSI3qDxvbkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="46076392"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="46076392"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 00:38:58 -0700
X-CSE-ConnectionGUID: WthR/ybTTKmYB19yLWLeXg==
X-CSE-MsgGUID: 2XQefm8zQayI3LtqO6Lcew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="129806684"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.8])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 00:38:56 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t, v7 1/5] lib/intel_blt: Promote MEM_COPY_MOCS_SHIFT
Date: Tue, 15 Apr 2025 09:36:01 +0200
Message-ID: <20250415073833.121611-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250415073833.121611-1-francois.dugast@intel.com>
References: <20250415073833.121611-1-francois.dugast@intel.com>
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

Move MEM_COPY_MOCS_SHIFT to the header to use it elsewhere without code
duplication. Add XE2_ prefix to make purpose clearer.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_blt.c | 3 +--
 lib/intel_blt.h | 1 +
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index b2fb3151e..7010d3ff7 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -21,7 +21,6 @@
 
 #define BITRANGE(start, end) (end - start + 1)
 #define GET_CMDS_INFO(__fd) intel_get_cmds_info(intel_get_drm_devid(__fd))
-#define MEM_COPY_MOCS_SHIFT                     25
 
 /* Blitter tiling definitions sanity checks */
 static_assert(T_LINEAR == I915_TILING_NONE, "Linear definitions have to match");
@@ -1840,7 +1839,7 @@ static void emit_blt_mem_copy(int fd, uint64_t ahnd, const struct blt_mem_data *
 	batch[i++] = src_offset << 32;
 	batch[i++] = dst_offset;
 	batch[i++] = dst_offset << 32;
-	batch[i++] = mem->src.mocs_index << MEM_COPY_MOCS_SHIFT | mem->dst.mocs_index;
+	batch[i++] = mem->src.mocs_index << XE2_MEM_COPY_MOCS_SHIFT | mem->dst.mocs_index;
 	batch[i++] = MI_BATCH_BUFFER_END;
 
 	munmap(batch, mem->bb.size);
diff --git a/lib/intel_blt.h b/lib/intel_blt.h
index 5d6191ac9..4bae0b47b 100644
--- a/lib/intel_blt.h
+++ b/lib/intel_blt.h
@@ -53,6 +53,7 @@
 #include "intel_cmds_info.h"
 
 #define CCS_RATIO(fd) (intel_gen(intel_get_drm_devid(fd)) >= 20 ? 512 : 256)
+#define XE2_MEM_COPY_MOCS_SHIFT                     25
 
 enum blt_color_depth {
 	CD_8bit,
-- 
2.43.0

