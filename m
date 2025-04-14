Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C33C369A2
	for <igt-dev@archiver.kernel.org>; Mon, 14 Apr 2025 16:40:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCB8D10E27D;
	Mon, 14 Apr 2025 16:40:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ktKwKZqd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B5A810E21F
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Apr 2025 16:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744648840; x=1776184840;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YMMhYgXSlcqVHw+bbnmCfsCYZ5JQt8TGfC1lzWfyyZM=;
 b=ktKwKZqdJ5xOFGOVvg2noh4vXDOuibKhlZ5XkGHs0RUaXoEbldS1X18h
 C26LrFYQdYZzZAzP+rV981ABXr77leDnWfxGaSU4RLkGLWLf6qs531oh3
 Im/OqQPUxUU4aCe8tQ609IfLO9jVxvjno4NFbWPkwYpEtjKpxnZ5NTKJO
 ET0gIN8RshsllrkWB4hTg9mTWYkXXFSvrcBac+3s/daCn5bDyNSQMrRpI
 i8CuwshXY29dv+e7Zb40gq1Ibt9W+5dae3AcDPvcXEY6ubt9ERXwiV+AK
 C5QQZuBL9M4y+NsGyDtEqJNRGa6yuIWcBM21qlbrUIWj/b3kXEPpp87tO g==;
X-CSE-ConnectionGUID: f4c3/P8LQE6r2R/EF1Oyww==
X-CSE-MsgGUID: sI9wvdZ6QFmdO6o/xpXg+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="56789143"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="56789143"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 09:40:40 -0700
X-CSE-ConnectionGUID: PPOHsAegRRG9dHK1JYtNow==
X-CSE-MsgGUID: OQVcQjg2RYmpmuvUO97vVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="134717161"
Received: from vpanait-mobl.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.246.184])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 09:40:38 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH i-g-t,
 v3 08/11] lib/intel_compute: Relocate input and output objects
Date: Mon, 14 Apr 2025 18:39:03 +0200
Message-ID: <20250414164007.57713-9-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250414164007.57713-1-francois.dugast@intel.com>
References: <20250414164007.57713-1-francois.dugast@intel.com>
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
index 7620ce18e..b29f8d9f8 100644
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

