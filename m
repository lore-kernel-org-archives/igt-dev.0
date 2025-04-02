Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D84BC36017
	for <igt-dev@archiver.kernel.org>; Wed,  2 Apr 2025 15:23:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E6C110E80C;
	Wed,  2 Apr 2025 15:23:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CsQ6Pi9T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73B6310E81D
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Apr 2025 15:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743607410; x=1775143410;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3RMCwnOGn7RffP/8A6/ixjooPSjHWo9obUg2WT5lk1c=;
 b=CsQ6Pi9Tt5IM/9uSMmIdfS8VAnS7dDlPqYobRqlnV65eza8rYCkJLeJB
 pk0gAlGJtQ3+fxRZm9jkJ3nvI8s2oboRRwS6ZF7vmyguZL/gv2I4X25wH
 QQhrJbEHxFodawWuKknYO9s/OR4+ok/M7wYSaRshhZqB6BuyWmBKmxY7k
 6dEjxNa4LmSeyE+wgmYyu468aZpig7ETORWw7vhLxLUliNOKoWXqjzDa7
 LIBDtU8Q4e34qYauk3aLGFXCM2xcNa1VfTI2BQbTB5JlHRwYeyXW3XFMU
 FyDvzZ839Y5Ed1Z/me7gXVdmyvM1/btAFBxN56qF7Lj2qcEv6T6Fyno20 g==;
X-CSE-ConnectionGUID: vuNZ9zJnSzCg8/o3/EE79g==
X-CSE-MsgGUID: +TBPaqxMSFylTsvkazaTCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="44885881"
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="44885881"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 08:23:30 -0700
X-CSE-ConnectionGUID: yaU1A+kBSt2bgzAAR5P5ug==
X-CSE-MsgGUID: 62y3y958QPKA7wD1rLvJtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="131717744"
Received: from carterle-desk.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.81])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 08:23:28 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH i-g-t,
 v2 08/11] lib/intel_compute: Relocate input and output objects
Date: Wed,  2 Apr 2025 17:20:06 +0200
Message-ID: <20250402152256.173562-9-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250402152256.173562-1-francois.dugast@intel.com>
References: <20250402152256.173562-1-francois.dugast@intel.com>
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

Move those objects after other objects and add space between them to
make it possible to increase their dimension without overlapping
between input and output.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 lib/intel_compute.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 1f8c2ac1b..d723ecd0c 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -37,20 +37,20 @@
 #define ADDR_SYNC			0x010000ULL
 #define ADDR_SYNC2			0x020000ULL
 #define ADDR_BATCH			0x100000ULL
-#define ADDR_INPUT			0x200000ULL
-#define ADDR_OUTPUT			0x300000ULL
-#define ADDR_SURFACE_STATE_BASE		0x400000ULL
-#define ADDR_DYNAMIC_STATE_BASE		0x500000ULL
-#define ADDR_INDIRECT_OBJECT_BASE	0x600000ULL
+#define ADDR_INPUT			0x40000000ULL
+#define ADDR_OUTPUT			0x80000000ULL
+#define ADDR_SURFACE_STATE_BASE		0x200000ULL
+#define ADDR_DYNAMIC_STATE_BASE		0x300000ULL
+#define ADDR_INDIRECT_OBJECT_BASE	0x400000ULL
 #define ADDR_BINDING_TABLE		(ADDR_SURFACE_STATE_BASE + OFFSET_BINDING_TABLE)
-#define OFFSET_INDIRECT_DATA_START	0x5D0000ULL
-#define OFFSET_KERNEL			0x5E0000ULL
+#define OFFSET_INDIRECT_DATA_START	0x3D0000ULL
+#define OFFSET_KERNEL			0x3E0000ULL
 
-#define ADDR_GENERAL_STATE_BASE		0x8000000ULL
-#define ADDR_INSTRUCTION_STATE_BASE	0xa000000ULL
+#define ADDR_GENERAL_STATE_BASE		0x6000000ULL
+#define ADDR_INSTRUCTION_STATE_BASE	0x8000000ULL
 #define OFFSET_BINDING_TABLE		0x10000
 
-#define XE2_ADDR_STATE_CONTEXT_DATA_BASE	0xb000000ULL
+#define XE2_ADDR_STATE_CONTEXT_DATA_BASE	0x9000000ULL
 #define OFFSET_STATE_SIP			0xFFFF0000
 
 #define USER_FENCE_VALUE			0xdeadbeefdeadbeefull
-- 
2.43.0

