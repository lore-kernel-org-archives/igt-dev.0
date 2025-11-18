Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF163CED63B
	for <igt-dev@archiver.kernel.org>; Tue, 18 Nov 2025 14:24:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5294589E3F;
	Tue, 18 Nov 2025 14:24:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hOGoj9sv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67B3D89950
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Nov 2025 14:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763475886; x=1795011886;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eEwsiA5n0JQqswwghukU5+61qqgaeQNv+gB7a80Lh+k=;
 b=hOGoj9svCJTtGXM5gN0KLqawiqNLkRF+jofQz1bXF4m0yytkdNgNM+/G
 ekD3IUG80uP5/Qv0JS+5phO26+tNg6C9OXac64VvQ2za/4mlh9NPbQxVT
 xhChnRpdFgpmllBco1sizRzcLadlPkZJ4UT2oi26C14zQpI1V1DkPRHQ7
 GytpxWArlClh0TttazFnemHaJ1zmacezya1SQFxFz1X2AqCwL4ab1Ntm9
 lzlG1kpknkb/pLiBIMPI3lMp++cXIzMC79V2l9Cu7DKRkcTMjR/KfQUY+
 2s5o5m/1cGqAW5sqefdWC8CcOWtXy4Wt1zNbEiNjwb/zFSIwzdj4Nx+Zt g==;
X-CSE-ConnectionGUID: 0/PUTlVwRwGDOCAalnLAnw==
X-CSE-MsgGUID: haHcuA1BRz+5y7ztslZZ0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65587304"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="65587304"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 06:24:46 -0800
X-CSE-ConnectionGUID: Ige80ZyPTT+3sDHajb8BYQ==
X-CSE-MsgGUID: npsWNdtMQCexxZQv+gNywA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="214168191"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 06:24:44 -0800
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH 2/2] lib/xe_spin: Fix mocs index field in mem_copy for Xe2
 platforms
Date: Tue, 18 Nov 2025 19:55:25 +0530
Message-ID: <20251118142522.3957318-6-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251118142522.3957318-4-balasubramani.vivekanandan@intel.com>
References: <20251118142522.3957318-4-balasubramani.vivekanandan@intel.com>
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

The source and destination mocs index fields has changed in the MEM_COPY
instruction in platforms after Xe2. So we need to check for the IP
version before placing the mocs index in the instruction.

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 lib/intel_blt.h  |  4 +++-
 lib/xe/xe_spin.c | 11 +++++++++--
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/lib/intel_blt.h b/lib/intel_blt.h
index 54a096c03..2fae045bc 100644
--- a/lib/intel_blt.h
+++ b/lib/intel_blt.h
@@ -53,7 +53,9 @@
 #include "intel_cmds_info.h"
 
 #define CCS_RATIO(fd) (intel_gen(intel_get_drm_devid(fd)) >= 20 ? 512 : 256)
-#define XE2_MEM_COPY_MOCS_SHIFT                     25
+#define GEN12_MEM_COPY_MOCS_SHIFT		25
+#define XE2_MEM_COPY_SRC_MOCS_SHIFT		28
+#define XE2_MEM_COPY_DST_MOCS_SHIFT		3
 
 enum blt_color_depth {
 	CD_8bit,
diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index 72b13ef42..1b12ce991 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -54,6 +54,7 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
 	uint64_t pad_addr = opts->addr + offsetof(struct xe_spin, pad);
 	uint64_t timestamp_addr = opts->addr + offsetof(struct xe_spin, timestamp);
 	int b = 0;
+	uint32_t devid;
 
 	spin->start = 0;
 	spin->end = 0xffffffff;
@@ -163,8 +164,14 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
 		spin->batch[b++] = opts->mem_copy->src_offset << 32;
 		spin->batch[b++] = opts->mem_copy->dst_offset;
 		spin->batch[b++] = opts->mem_copy->dst_offset << 32;
-		spin->batch[b++] = opts->mem_copy->src->mocs_index << XE2_MEM_COPY_MOCS_SHIFT |
-				   opts->mem_copy->dst->mocs_index;
+
+		devid = intel_get_drm_devid(opts->mem_copy->fd);
+		if (intel_graphics_ver(devid) >= IP_VER(20, 0))
+			spin->batch[b++] = opts->mem_copy->src->mocs_index << XE2_MEM_COPY_SRC_MOCS_SHIFT |
+					   opts->mem_copy->dst->mocs_index << XE2_MEM_COPY_DST_MOCS_SHIFT;
+		else
+			spin->batch[b++] = opts->mem_copy->src->mocs_index << GEN12_MEM_COPY_MOCS_SHIFT |
+					   opts->mem_copy->dst->mocs_index;
 	}
 
 	spin->batch[b++] = MI_COND_BATCH_BUFFER_END | MI_DO_COMPARE | 2;
-- 
2.43.0

