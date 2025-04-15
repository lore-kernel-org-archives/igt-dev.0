Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE129C369AB
	for <igt-dev@archiver.kernel.org>; Tue, 15 Apr 2025 10:15:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 724C910E702;
	Tue, 15 Apr 2025 10:15:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eT+edIqp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCF6410E701
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Apr 2025 10:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744712118; x=1776248118;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=giKJ3MPz0WaUjc0Vlnvr466je+oS63E9IHJNYqTJPeQ=;
 b=eT+edIqp+23anr8ncEvdBBHuNzpyBJyGeI+6DUswXsdsyubRx/2pXkB8
 +PF5mEnhUU+Yz+5uAIqJGrv9otbZFIXfxntkqB/iT8xfBbeZN9cpcQz6C
 YIQ28Qf7ZHqSky3aO7Jpdf797Q0Mw9ak7w6q3HbygoBcUMQoSrDOvbG3h
 dfRAR+rxkaZJUhSLzMNoRN57nBjIjoOLDQFJdpkoYx4mm4EFbWzvzVY9d
 UqgeRjLTAJO9BKc4Zmj63iXTsVQGN5VlpHC+xAARF1nrBlgNDRVm7JMXN
 h3IaHf27F39F8ccWOtwKaYoqhynSbxHjxysD+f63tZh0v3HxWwpUr0zTQ w==;
X-CSE-ConnectionGUID: upFx4fAwTLSRHWeHlryp7A==
X-CSE-MsgGUID: S0huRqqLTA2wPm6F8gitmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="45927053"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="45927053"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 03:15:17 -0700
X-CSE-ConnectionGUID: iP04MEG4TAC9SZ8lNCRVPw==
X-CSE-MsgGUID: +FoFlsVFTLGfjhOWfEibBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="131059945"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.8])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 03:15:17 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH i-g-t,
 v3 02/11] lib/intel_compute: Use common constant for dynamic state
 size
Date: Tue, 15 Apr 2025 12:13:18 +0200
Message-ID: <20250415101457.141107-3-francois.dugast@intel.com>
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

Reduce magic values in the code, homogenize the size which has no
reason to be different among pipelines, define this value close to
the addresses to make it easier to spot potential overlaps in the
future.

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 lib/intel_compute.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 755ef20a4..b637ebaed 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -29,6 +29,7 @@
 #define SIZE_BUFFER_INPUT		MAX(sizeof(float) * SIZE_DATA, 0x10000)
 #define SIZE_BUFFER_OUTPUT		MAX(sizeof(float) * SIZE_DATA, 0x10000)
 #define SIZE_SURFACE_STATE		0x10000
+#define SIZE_DYNAMIC_STATE		0x100000
 
 #define ADDR_SYNC			0x010000ULL
 #define ADDR_SYNC2			0x020000ULL
@@ -691,7 +692,7 @@ static void compute_exec(int fd, const unsigned char *kernel,
 		{ .addr = ADDR_INDIRECT_OBJECT_BASE + OFFSET_KERNEL,
 		  .name = "kernel" },
 		{ .addr = ADDR_DYNAMIC_STATE_BASE,
-		  .size =  0x1000,
+		  .size = SIZE_DYNAMIC_STATE,
 		  .name = "dynamic state base" },
 		{ .addr = ADDR_SURFACE_STATE_BASE,
 		  .size = SIZE_SURFACE_STATE,
@@ -976,7 +977,7 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
 		{ .addr = ADDR_INSTRUCTION_STATE_BASE + OFFSET_KERNEL,
 		  .name = "instr state base"},
 		{ .addr = ADDR_DYNAMIC_STATE_BASE,
-		  .size = 0x100000,
+		  .size = SIZE_DYNAMIC_STATE,
 		  .name = "dynamic state base"},
 		{ .addr = ADDR_SURFACE_STATE_BASE,
 		  .size = SIZE_SURFACE_STATE,
@@ -1551,7 +1552,7 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
 		{ .addr = ADDR_INSTRUCTION_STATE_BASE + OFFSET_KERNEL,
 		  .name = "instr state base"},
 		{ .addr = ADDR_DYNAMIC_STATE_BASE,
-		  .size = 0x100000,
+		  .size = SIZE_DYNAMIC_STATE,
 		  .name = "dynamic state base"},
 		{ .addr = ADDR_SURFACE_STATE_BASE,
 		  .size = SIZE_SURFACE_STATE,
@@ -1641,7 +1642,7 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 		{ .addr = ADDR_INSTRUCTION_STATE_BASE + OFFSET_KERNEL,
 		  .name = "instr state base"},
 		{ .addr = ADDR_DYNAMIC_STATE_BASE,
-		  .size = 0x100000,
+		  .size = SIZE_DYNAMIC_STATE,
 		  .name = "dynamic state base"},
 		{ .addr = ADDR_SURFACE_STATE_BASE,
 		  .size = SIZE_SURFACE_STATE,
@@ -1896,7 +1897,7 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 		{ .addr = ADDR_INSTRUCTION_STATE_BASE + OFFSET_KERNEL,
 		  .name = "instr state base"},
 		{ .addr = ADDR_DYNAMIC_STATE_BASE,
-		  .size = 0x100000,
+		  .size = SIZE_DYNAMIC_STATE,
 		  .name = "dynamic state base"},
 		{ .addr = ADDR_SURFACE_STATE_BASE,
 		  .size = SIZE_SURFACE_STATE,
-- 
2.43.0

