Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D573C28B30
	for <igt-dev@archiver.kernel.org>; Tue, 11 Mar 2025 15:23:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EAFF10E5C1;
	Tue, 11 Mar 2025 15:23:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rd2Cnf+e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6DEA10E5BF
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Mar 2025 15:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741706622; x=1773242622;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=49/MYmCEnIJz4U/rcxwFTygy8u080OvFdLoM2g+R/qE=;
 b=Rd2Cnf+eNkPCmrAxHrky+szNpJZFhUmMHlUREiiTEPRZEQk8kyRwOPgD
 F6EcW7nqKZd5Q+1t8d6BkDMwFrAguCxsxJbox51+NXvNOl3C60OfmWjKi
 lvfmh7+QoP7WuQdme7iOS2yVsQfzb0hE89/Df1Qs7Ley6hm0N/Y5sPoXn
 Jxj2F9NN6JozzokJIDXMFgt9/sijd1cfqBLov+16S0ExoZ1pFQ7TFZwVW
 G/3K8vXyGxQ2sa4mwNnOSXxN9LFO/v88dOtDX/hivWSA+45BOrqZjpJhA
 5yrmbjk0Y6Cv4YJ+vxEuZDj2QaInb/+jb/qwR3+uyox0WCCCzNMNX55q4 A==;
X-CSE-ConnectionGUID: i2M/4ZBLTZ2QPH6eYnTwNQ==
X-CSE-MsgGUID: rjRC1Xa4QoC5hf0SKkLWCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="53377137"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="53377137"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 08:23:42 -0700
X-CSE-ConnectionGUID: XlwwchHZT+qkzQdu57lLmA==
X-CSE-MsgGUID: TK2i0LOURDeIOHReSKbpLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="120066298"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.217])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 08:23:42 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 05/11] lib/intel_compute: Use common constant for
 general state size
Date: Tue, 11 Mar 2025 16:21:25 +0100
Message-ID: <20250311152321.16497-6-francois.dugast@intel.com>
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

Reduce magic values in the code, homogenize the size which has no
reason to be different among pipelines, define this value close to
the addresses to make it easier to spot potential overlaps in the
future.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 lib/intel_compute.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index a85fd8121..302a1d35c 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -32,6 +32,7 @@
 #define SIZE_DYNAMIC_STATE		0x100000
 #define SIZE_INDIRECT_OBJECT		0x10000
 #define SIZE_BINDING_TABLE		0x10000
+#define SIZE_GENERAL_STATE		0x100000
 
 #define ADDR_SYNC			0x010000ULL
 #define ADDR_SYNC2			0x020000ULL
@@ -991,7 +992,8 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
 		  .name = "addr input"},
 		{ .addr = ADDR_OUTPUT, .size = SIZE_BUFFER_OUTPUT,
 		  .name = "addr output" },
-		{ .addr = ADDR_GENERAL_STATE_BASE, .size = 0x100000,
+		{ .addr = ADDR_GENERAL_STATE_BASE,
+		  .size = SIZE_GENERAL_STATE,
 		  .name = "general state base" },
 		{ .addr = ADDR_SURFACE_STATE_BASE + OFFSET_BINDING_TABLE,
 		  .size = SIZE_BINDING_TABLE,
@@ -1208,7 +1210,8 @@ static void xehpc_compute_exec(int fd, const unsigned char *kernel,
 		  .name = "addr input"},
 		{ .addr = ADDR_OUTPUT, .size = SIZE_BUFFER_OUTPUT,
 		  .name = "addr output" },
-		{ .addr = ADDR_GENERAL_STATE_BASE, .size = 0x10000,
+		{ .addr = ADDR_GENERAL_STATE_BASE,
+		  .size = SIZE_GENERAL_STATE,
 		  .name = "general state base" },
 		{ .addr = ADDR_BATCH, .size = SIZE_BATCH,
 		  .name = "batch" },
@@ -1566,7 +1569,8 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
 		  .name = "addr input"},
 		{ .addr = ADDR_OUTPUT, .size = SIZE_BUFFER_OUTPUT,
 		  .name = "addr output" },
-		{ .addr = ADDR_GENERAL_STATE_BASE, .size = 0x100000,
+		{ .addr = ADDR_GENERAL_STATE_BASE,
+		  .size = SIZE_GENERAL_STATE,
 		  .name = "general state base" },
 		{ .addr = ADDR_SURFACE_STATE_BASE + OFFSET_BINDING_TABLE,
 		  .size = SIZE_BINDING_TABLE,
@@ -1656,7 +1660,8 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 		  .name = "addr input"},
 		{ .addr = ADDR_OUTPUT, .size = SIZE_BUFFER_OUTPUT,
 		  .name = "addr output" },
-		{ .addr = ADDR_GENERAL_STATE_BASE, .size = 0x100000,
+		{ .addr = ADDR_GENERAL_STATE_BASE,
+		  .size = SIZE_GENERAL_STATE,
 		  .name = "general state base" },
 		{ .addr = ADDR_SURFACE_STATE_BASE + OFFSET_BINDING_TABLE,
 		  .size = SIZE_BINDING_TABLE,
@@ -1907,7 +1912,8 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 		  .name = "addr input"},
 		{ .addr = ADDR_OUTPUT, .size = SIZE_BUFFER_OUTPUT,
 		  .name = "addr output" },
-		{ .addr = ADDR_GENERAL_STATE_BASE, .size = 0x100000,
+		{ .addr = ADDR_GENERAL_STATE_BASE,
+		  .size = SIZE_GENERAL_STATE,
 		  .name = "general state base" },
 		{ .addr = ADDR_SURFACE_STATE_BASE + OFFSET_BINDING_TABLE,
 		  .size = SIZE_BINDING_TABLE,
-- 
2.43.0

