Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A22C3601A
	for <igt-dev@archiver.kernel.org>; Wed,  2 Apr 2025 11:51:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 727EC10E75B;
	Wed,  2 Apr 2025 11:51:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gQhW4qGD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E55CA10E75A
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Apr 2025 11:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743594685; x=1775130685;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CpVGAF3LzlrG5qbSHlKWKXOXIqRHikyLcHU8pzG8YJY=;
 b=gQhW4qGD3o64ttKI0cbsMFZ1svBYDlFcpMyjkP06sqKH8f4Ef1RoUk2m
 r1QJu4j4zg+pCgR4gD4OJ2dy0tUy3khsNVtEejKju/xQQCcd3FbKMXMgd
 vMyhKxwbXZHHhlzl7WSmIk+T9XdY1rppzMOHv53Z7QsrqqY88uta79v0W
 2vJg/sSueoCuqLddW4H26gw0LISKTmqo5haxjpN4kplRM91kYUUGV6qOd
 w1SED+rC2lRxKLGSJnfXyRn1/tk4BYoMh7nqUclwQk5lRoWlHP1qTeVSR
 hab7dFI3SiJeZ+bkrCOXOl3ccPv3a77VZsSYbXk2clyBsObnfHEmqirpR w==;
X-CSE-ConnectionGUID: Is3jvEvbRyKonWcxNrXegg==
X-CSE-MsgGUID: Q90bbyF2TIi+Hb65eVt/zQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="48743543"
X-IronPort-AV: E=Sophos;i="6.14,182,1736841600"; d="scan'208";a="48743543"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 04:51:25 -0700
X-CSE-ConnectionGUID: T9SYBDfLSUag58npgW0hxQ==
X-CSE-MsgGUID: pQK/XHPSQ+2EhHiRtx4hag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,182,1736841600"; d="scan'208";a="127184645"
Received: from carterle-desk.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.81])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 04:51:24 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t,v5 1/5] lib/intel_blt: Promote MEM_COPY_MOCS_SHIFT
Date: Wed,  2 Apr 2025 13:49:59 +0200
Message-ID: <20250402115055.156765-2-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250402115055.156765-1-francois.dugast@intel.com>
References: <20250402115055.156765-1-francois.dugast@intel.com>
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

Move MEM_COPY_MOCS_SHIFT to the header to use it elsewhere without code
duplication. Add XE2_ prefix to make purpose clearer.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
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

