Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7901C369A2
	for <igt-dev@archiver.kernel.org>; Mon, 14 Apr 2025 16:40:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84A0D10E1E0;
	Mon, 14 Apr 2025 16:40:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QDX0rYzF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C96A710E14E
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Apr 2025 16:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744648832; x=1776184832;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QPY9FKQxJzBwe7CgLBDKVHU2QSMnFqrUJsYEdAu0nNA=;
 b=QDX0rYzFxR/bsyRzgyxz5VUW8eN4hCoBm/GuS2quYnT/O1Qy5UpmTVxz
 RVJLtNmqY5MwucTVpXrdy9WyiF0SJRVNWQoT/nmTWfkMHIDlAAaFrqIDP
 1cd58iKtHNfc2KhrKUFy2q5TDgVz24FZ8gQ2XeXVk1PotHeM3SJcFFKo8
 u7w5ww1fgVx6UymTxp6QHMGBeruTyagzKIeVHCmh79aJVluPxSwRHfMj0
 HU3lxYDdFCYc1oOSKZejXpQhh3K1R8x2nUl8K2pcU1dpEGMDyqDYV+YZD
 Z3eN2Lr3A8j/2cLosmIffDzPHC8+KMdla8Uo432UCj42Ec362dgH1r2Uy w==;
X-CSE-ConnectionGUID: QjGKARqTScaN6EHVzyNbZg==
X-CSE-MsgGUID: LvopPFjYSeilUQDepuxfkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="56789131"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="56789131"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 09:40:31 -0700
X-CSE-ConnectionGUID: LNwR0XQzTxynoQeA6woqkA==
X-CSE-MsgGUID: qCkwD8J0S9CeO4NMbnmqaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="134717141"
Received: from vpanait-mobl.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.246.184])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 09:40:30 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH i-g-t,
 v3 03/11] lib/intel_compute: Use common constant for indirect object
 size
Date: Mon, 14 Apr 2025 18:38:58 +0200
Message-ID: <20250414164007.57713-4-francois.dugast@intel.com>
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

Reduce magic values in the code, homogenize the size which has no
reason to be different among pipelines, define this value close to
the addresses to make it easier to spot potential overlaps in the
future.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 lib/intel_compute.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index b637ebaed..e7ccf4f27 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -30,6 +30,7 @@
 #define SIZE_BUFFER_OUTPUT		MAX(sizeof(float) * SIZE_DATA, 0x10000)
 #define SIZE_SURFACE_STATE		0x10000
 #define SIZE_DYNAMIC_STATE		0x100000
+#define SIZE_INDIRECT_OBJECT		0x10000
 
 #define ADDR_SYNC			0x010000ULL
 #define ADDR_SYNC2			0x020000ULL
@@ -698,7 +699,7 @@ static void compute_exec(int fd, const unsigned char *kernel,
 		  .size = SIZE_SURFACE_STATE,
 		  .name = "surface state base" },
 		{ .addr = ADDR_INDIRECT_OBJECT_BASE + OFFSET_INDIRECT_DATA_START,
-		  .size =  0x10000,
+		  .size = SIZE_INDIRECT_OBJECT,
 		  .name = "indirect data start" },
 		{ .addr = ADDR_INPUT,
 		  .size = SIZE_BUFFER_INPUT,
@@ -983,7 +984,7 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
 		  .size = SIZE_SURFACE_STATE,
 		  .name = "surface state base"},
 		{ .addr = ADDR_GENERAL_STATE_BASE + OFFSET_INDIRECT_DATA_START,
-		  .size =  0x10000,
+		  .size = SIZE_INDIRECT_OBJECT,
 		  .name = "indirect object base"},
 		{ .addr = ADDR_INPUT, .size = SIZE_BUFFER_INPUT,
 		  .name = "addr input"},
@@ -1200,7 +1201,7 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
 		{ .addr = ADDR_INSTRUCTION_STATE_BASE + OFFSET_KERNEL,
 		  .name = "instr state base"},
 		{ .addr = ADDR_GENERAL_STATE_BASE + OFFSET_INDIRECT_DATA_START,
-		  .size =  0x10000,
+		  .size = SIZE_INDIRECT_OBJECT,
 		  .name = "indirect object base"},
 		{ .addr = ADDR_INPUT, .size = SIZE_BUFFER_INPUT,
 		  .name = "addr input"},
@@ -1558,7 +1559,7 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
 		  .size = SIZE_SURFACE_STATE,
 		  .name = "surface state base"},
 		{ .addr = ADDR_GENERAL_STATE_BASE + OFFSET_INDIRECT_DATA_START,
-		  .size =  0x10000,
+		  .size = SIZE_INDIRECT_OBJECT,
 		  .name = "indirect object base"},
 		{ .addr = ADDR_INPUT, .size = SIZE_BUFFER_INPUT,
 		  .name = "addr input"},
@@ -1648,7 +1649,7 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 		  .size = SIZE_SURFACE_STATE,
 		  .name = "surface state base"},
 		{ .addr = ADDR_GENERAL_STATE_BASE + OFFSET_INDIRECT_DATA_START,
-		  .size =  0x1000,
+		  .size = SIZE_INDIRECT_OBJECT,
 		  .name = "indirect object base"},
 		{ .addr = ADDR_INPUT, .size = SIZE_BUFFER_INPUT,
 		  .name = "addr input"},
@@ -1903,7 +1904,7 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 		  .size = SIZE_SURFACE_STATE,
 		  .name = "surface state base"},
 		{ .addr = ADDR_GENERAL_STATE_BASE + OFFSET_INDIRECT_DATA_START,
-		  .size =  0x1000,
+		  .size = SIZE_INDIRECT_OBJECT,
 		  .name = "indirect object base"},
 		{ .addr = ADDR_INPUT, .size = SIZE_BUFFER_INPUT,
 		  .name = "addr input"},
-- 
2.43.0

