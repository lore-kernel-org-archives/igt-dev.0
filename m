Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4003C369B4
	for <igt-dev@archiver.kernel.org>; Tue, 15 Apr 2025 10:15:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88EC410E70A;
	Tue, 15 Apr 2025 10:15:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m/Xu7Vsl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62DD910E70A
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Apr 2025 10:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744712127; x=1776248127;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kjXmCN/Qllig78pdfQFYDIghTYF5YtKQOQCghgNYuZw=;
 b=m/Xu7VslXKZEFTwtrzUhzJrqUnIiG2XYwCkKvsn7lqOT2ZBq+v5G96QJ
 tFw3bh4EsoPGK9zN+klcUVXq1+GHWC2twVVhFen32E2cx0ktOnw5TexJR
 3SKbqRtrWJGlkYxMfAN2zGE0Yadzz/cCLeGk55xtwSVJkImERnRD5FvRs
 +rMq1KE/VRtf1sdoDpnMBv1KSCT42HJOSYA4UH90PUvFcI+U+n1TUB1ZO
 H+N9ZbbsnMKzU/JXnkqC5CbQPEgforSBgnFsPXbqt+Fc3VJLt5vTAp9/d
 EXjKl2lbT2rT+BhxKX9LfZZ2jTMSCPakN0HOMKHA7sKj5KDRAmaP4iLI9 A==;
X-CSE-ConnectionGUID: 4v+ckn2NT3eRpz46YzzdZg==
X-CSE-MsgGUID: JwUujg/GQWiOFkpHGNsLzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="45927073"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="45927073"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 03:15:27 -0700
X-CSE-ConnectionGUID: Hi+6u+4wSGK1KAe2kw8c1A==
X-CSE-MsgGUID: 7BKmL3EYRmyvL5LP3gvDxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="131060018"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.8])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 03:15:26 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH i-g-t,
 v3 08/11] lib/intel_compute: Relocate input and output objects
Date: Tue, 15 Apr 2025 12:13:24 +0200
Message-ID: <20250415101457.141107-9-francois.dugast@intel.com>
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

Move those objects after other objects and add space between them to
make it possible to increase their dimension without overlapping
between input and output.

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
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

