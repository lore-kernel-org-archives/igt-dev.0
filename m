Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AAF2C282EC
	for <igt-dev@archiver.kernel.org>; Tue, 11 Mar 2025 15:23:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F5D010E5C2;
	Tue, 11 Mar 2025 15:23:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jcR6bAcE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 678DA10E5C2
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Mar 2025 15:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741706625; x=1773242625;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a+7lqMzmxTOxSWcYKK/D3ZYWVyDMbH7/04BVNNnRDkY=;
 b=jcR6bAcEF/vmXAJWRqCSN65VWe+B0VX8Rr9PksLzeLCS/a68pq8PHdLa
 WN0xqur2BqmR32tprOAAbY9oZx5eAMtpX8Bqq9c3J5GmMsX0CPupuHQWY
 YjwIon8MaxYljsB5Dgpur6dSFb2sR3/BJNDC/Umce5bkUNHSnpbRQ1r7N
 0KcZ5+0kGp3xgCM7cm484qExV4CfgpFLl57EVF5CZN2MsnE2G+rYjBAnR
 6wybpcQsYK5AiFgavsUSsSe9UOUwKgmL2arQpdVByxONJdSSc3aGrHBNT
 h+e8MPH79fZ26d7D8sa1f15pM/UB3tqyiV7aeXCPvCV+5NnJE4N19v8VL A==;
X-CSE-ConnectionGUID: 5tx39znxTxCFKDT04eGb9A==
X-CSE-MsgGUID: KgA8f5ZtS4SGiYM8tuk6rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="53377160"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="53377160"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 08:23:45 -0700
X-CSE-ConnectionGUID: Rh6g010HT26mj8b7NpsksQ==
X-CSE-MsgGUID: cQJZT6weR0m7ZmN3GWJWgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="120066305"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.217])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 08:23:45 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 07/11] lib/intel_compute: Compact memory map
Date: Tue, 11 Mar 2025 16:21:27 +0100
Message-ID: <20250311152321.16497-8-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250311152321.16497-1-francois.dugast@intel.com>
References: <20250311152321.16497-1-francois.dugast@intel.com>
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

Bring the objects close to each other at the beginning of the memory
space to reduce distribution and make room for very large contiguous
memory ranges for user buffers.

For compute square, memory after ADDR_INSTRUCTION_STATE_BASE + kernel
size is now free.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 lib/intel_compute.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 79c0f0f00..364388e20 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -41,16 +41,16 @@
 #define ADDR_OUTPUT			0x300000ULL
 #define ADDR_SURFACE_STATE_BASE		0x400000ULL
 #define ADDR_DYNAMIC_STATE_BASE		0x500000ULL
-#define ADDR_INDIRECT_OBJECT_BASE	0x100000000
+#define ADDR_INDIRECT_OBJECT_BASE	0x600000ULL
 #define ADDR_BINDING_TABLE		(ADDR_SURFACE_STATE_BASE + OFFSET_BINDING_TABLE)
-#define OFFSET_INDIRECT_DATA_START	0xFFFD0000
-#define OFFSET_KERNEL			0xFFFE0000
+#define OFFSET_INDIRECT_DATA_START	0x5D0000ULL
+#define OFFSET_KERNEL			0x5E0000ULL
 
-#define ADDR_GENERAL_STATE_BASE		0x80000000ULL
-#define ADDR_INSTRUCTION_STATE_BASE	0x90000000ULL
+#define ADDR_GENERAL_STATE_BASE		0x8000000ULL
+#define ADDR_INSTRUCTION_STATE_BASE	0xa000000ULL
 #define OFFSET_BINDING_TABLE		0x10000
 
-#define XE2_ADDR_STATE_CONTEXT_DATA_BASE	0x900000ULL
+#define XE2_ADDR_STATE_CONTEXT_DATA_BASE	0xb000000ULL
 #define OFFSET_STATE_SIP			0xFFFF0000
 
 #define USER_FENCE_VALUE			0xdeadbeefdeadbeefull
-- 
2.43.0

