Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D9DC369B5
	for <igt-dev@archiver.kernel.org>; Tue, 15 Apr 2025 10:15:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49AE710E709;
	Tue, 15 Apr 2025 10:15:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vimpviab";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA64A10E707
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Apr 2025 10:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744712126; x=1776248126;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iEIWb1nYkV7kw3nZEKLJaAGtDdUWlQCu11UY3gMHVIg=;
 b=VimpviabMh96OrXDLCvmK3USXwYLguX2mgzGDEp209dsL/cAl/1SbVCo
 vSQUUAjKgKHNeTWh3ebioDf5JPcRIIHO1mgFmA9FiAGcd0dhOCZiEOQ9w
 t7TmLUDX6trrORuo1hr6GG5ghQCdFEic2L2XkM6PpQYg7LUxexr+0GcNE
 c/eDODlzYOwp+rpZ2p0xWKlR7tOgwWZUIgmvr+brPNpg2gK1e8UjhJlxt
 nPnnAGzu/ae5L759JBY4OV4P9P8JpOk194uXTvSPOo32blx8cNRuKprad
 3XXYhXu1vrrxz18TqAcMKWX77ct6iIIVO8KrYTpkgHPFe6pYcbfm6kvgD A==;
X-CSE-ConnectionGUID: fpJe/fiDTTWJ++SqNB+hhg==
X-CSE-MsgGUID: 62B3qIJ+Td2Ts20nfXTBow==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="45927070"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="45927070"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 03:15:25 -0700
X-CSE-ConnectionGUID: usfZZOblRHK7ObwdDT2OWA==
X-CSE-MsgGUID: IOy59jV4QGa4xJ2YA3ByMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="131059996"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.8])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 03:15:25 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH i-g-t, v3 07/11] lib/intel_compute: Compact memory map
Date: Tue, 15 Apr 2025 12:13:23 +0200
Message-ID: <20250415101457.141107-8-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250415101457.141107-1-francois.dugast@intel.com>
References: <20250415101457.141107-1-francois.dugast@intel.com>
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

Bring the objects close to each other at the beginning of the memory
space to reduce distribution and make room for very large contiguous
memory ranges for user buffers.

For compute square, memory after ADDR_INSTRUCTION_STATE_BASE + kernel
size is now free.

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 lib/intel_compute.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 50eb4e3fa..7620ce18e 100644
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

