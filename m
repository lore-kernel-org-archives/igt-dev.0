Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A0EC36017
	for <igt-dev@archiver.kernel.org>; Wed,  2 Apr 2025 15:23:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2983910E81B;
	Wed,  2 Apr 2025 15:23:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QespZgvy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15C8A10E812
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Apr 2025 15:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743607406; x=1775143406;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NZV6AsMj5cHrkVs/iQqYyfKSk/iSgXegFtXqI9bX0I4=;
 b=QespZgvyq4eu7pgsD2g1TNXV/U0UuTrJFEandWWdSqXAhQNQusqaVhBR
 GA4LPD/517eY2FVu4Q5zQS4WtNtNmHSTNlg1UP0nXNrjJvzKGjO8szbOo
 HtLXb0tm7LC8IdmmhUIKlbugJdhsdzxOlltSZAf0iwaHRr1HwYntvdHnR
 Gvp3JEoBclJnMYvLARHLPRDgw5m18jfsXIz9TPjO6bh3uWxPYjGXxixCy
 BzZGuxeR1NZlszalqwh0XiFlgPm/udxOuBIpBFHkm/tFi0x/hCI2aLX7v
 c/89Xif2dG3s0bBgfmN/r48cQ+gVgPP0v5RJ+aIl3kQk+6J1o7Oc/rToq Q==;
X-CSE-ConnectionGUID: si0NwoYFRxGULj7zNk4vsw==
X-CSE-MsgGUID: ofZ3kSOFTvOc1fgztY6CnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="44885870"
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="44885870"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 08:23:25 -0700
X-CSE-ConnectionGUID: /jblnGBeTsCd33Rv+Ef+ig==
X-CSE-MsgGUID: JwDMgQxkS9a+qt/eHCbsiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="131717732"
Received: from carterle-desk.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.81])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 08:23:23 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH i-g-t,
 v2 05/11] lib/intel_compute: Use common constant for general state
 size
Date: Wed,  2 Apr 2025 17:20:03 +0200
Message-ID: <20250402152256.173562-6-francois.dugast@intel.com>
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

Reduce magic values in the code, homogenize the size which has no
reason to be different among pipelines, define this value close to
the addresses to make it easier to spot potential overlaps in the
future.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 lib/intel_compute.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index eafec7db4..46f2ca127 100644
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

