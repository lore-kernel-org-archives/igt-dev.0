Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C96CC28B30
	for <igt-dev@archiver.kernel.org>; Tue, 11 Mar 2025 15:23:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D80EA10E5C4;
	Tue, 11 Mar 2025 15:23:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZuoED8gD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8CEB10E5C3
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Mar 2025 15:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741706626; x=1773242626;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VzmgHpEMQvFwEuSosb74tjz9jnV4qJou0HXXmDEijDw=;
 b=ZuoED8gDygpyEHxf8YTFYqR7/Zk5mBdHsLOZFNhebohAi68BZpLiF3JH
 mo+arCygtdnIXgZptc4+tf1OQLePX5Fq5BvsvEkEv2KAsRnPdoZ66ZAC6
 XBfqQP6ZPBkedhMltTJ/JXZ2fchu1lbeyUGJ9pRzU6tuaAlNHW0Nx43Oc
 TAv3yNT4chWUG8c/Pcxd2h4I7dWaawPR34NdM5UDkTSSANzv5qy9widpV
 /DFeFsKakgUFa3C1udDDDq/9B2y7tDFbwIXkBvxp6a+Sd5jSvyeOSpTSv
 hAEvA2gKwu1StG+AoS9zh4+IMeYb85dyILUJW5L2YGSLS9h5Py7WKmoJN w==;
X-CSE-ConnectionGUID: LyD5yJSsRTCm/gB5YpY5Zg==
X-CSE-MsgGUID: rm+VtX26RVK1VNiTH3q5hQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="53377167"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="53377167"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 08:23:46 -0700
X-CSE-ConnectionGUID: n4TCawLbQJiWWG46ntNxWw==
X-CSE-MsgGUID: nASBkt9BQH6rcaYg9Irqag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="120066308"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.217])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 08:23:46 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 08/11] lib/intel_compute: Relocate input and output
 objects
Date: Tue, 11 Mar 2025 16:21:28 +0100
Message-ID: <20250311152321.16497-9-francois.dugast@intel.com>
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

Move those objects after other objects and add space between them to
make it possible to increase their dimension without overlapping
between input and output.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 lib/intel_compute.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 364388e20..7a2e04b10 100644
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

