Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13853C369B2
	for <igt-dev@archiver.kernel.org>; Mon, 14 Apr 2025 16:40:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC4B210E12E;
	Mon, 14 Apr 2025 16:40:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P1lbYNqI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B61610E21F
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Apr 2025 16:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744648838; x=1776184838;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OJvy4QsZ8qiYhRni7XiOrzVYGX7/h+9tJA9+fdGCdhk=;
 b=P1lbYNqIx9lkVmjLHcHIiqZxfcnSvjMmK0mj3Uxy7DSJYDjkLNEfQcoi
 IDSqOJbLrTqVjD9oxSsGhG7XbuPIFycPkZT8u1v6+vaOn3n77qAT/bVkY
 2uB/5Z8XRNrWRNBfxslb6VGecR+ScS1wljXXPymxJin8HRj+LnHM/6F6W
 Cl3kPIt+Nu8lJLlEKLd47FZ20d7loL9oSxLIesmWJGmQu/S7Y559w172d
 4N9xw9FJx9Ft58hn7yjxMNdr6giaxDz7Y+LbX4eGrZ4UUy8rP41WzSpFd
 HBQe/LGLUK6ami4Kw7SfeCInw99OY3cwJ3z6ezoDVVaxABS0CQ4jCql3S w==;
X-CSE-ConnectionGUID: Pgg8mJzLSke+febSbQrkzA==
X-CSE-MsgGUID: DncYuw7FSDKtyDLjDKAMEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="56789141"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="56789141"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 09:40:38 -0700
X-CSE-ConnectionGUID: p89BzGzMTi6+5NL23COf9w==
X-CSE-MsgGUID: KwB5Yo5yTyCGkpGCXaes4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="134717157"
Received: from vpanait-mobl.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.246.184])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 09:40:37 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH i-g-t, v3 07/11] lib/intel_compute: Compact memory map
Date: Mon, 14 Apr 2025 18:39:02 +0200
Message-ID: <20250414164007.57713-8-francois.dugast@intel.com>
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

Bring the objects close to each other at the beginning of the memory
space to reduce distribution and make room for very large contiguous
memory ranges for user buffers.

For compute square, memory after ADDR_INSTRUCTION_STATE_BASE + kernel
size is now free.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
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

