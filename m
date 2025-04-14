Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0783AC369B4
	for <igt-dev@archiver.kernel.org>; Mon, 14 Apr 2025 16:40:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4A8F10E247;
	Mon, 14 Apr 2025 16:40:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="igoQNj7K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EED2E10E21F
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Apr 2025 16:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744648837; x=1776184837;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oWHULtB2/jwyMgwzzTpc/mW41z/IWAQgGT8DVCID5ro=;
 b=igoQNj7K7spKHCG2BanuKF3z99h2/UYYmO8YW6BM1X8K/RC2eZTrLfaT
 PHIRyq1UDj9R+cOO75fMb+HygF9h69MYhRvafKPPsfbWoFowVdp/mtBo9
 eZaPDO9NY72o4jYGfEaiY744wwMLNO7U69b8u33sKYp57s2IYPFwlB1mO
 up2zmfoXwIeeneN/LwkiixpmUjYUslPAZG1IsDfsOuSqSOJ7Y1Q9iUlON
 4nkzzEy4Ynvy70wJ3lHQNF2AJejQqFlA5GYeKpF38xtJDaqiDlyx2z7qT
 LhXmVoJrByB2T8ZqoipFh2fXrBDSVs9+i4Z24AenaUw5MH0s4+NAC348O g==;
X-CSE-ConnectionGUID: WNcL8EZARGK1haepJFSdbQ==
X-CSE-MsgGUID: 7KScNqjgTMq+O+H8Dc5sFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="56789139"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="56789139"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 09:40:37 -0700
X-CSE-ConnectionGUID: cHSWwNUaQhCa5Umw5zzFXw==
X-CSE-MsgGUID: Y12ILGYRRX67qdpc6DkfqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="134717154"
Received: from vpanait-mobl.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.246.184])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 09:40:35 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH i-g-t,
 v3 06/11] lib/intel_compute: Use constant for binding table address
Date: Mon, 14 Apr 2025 18:39:01 +0200
Message-ID: <20250414164007.57713-7-francois.dugast@intel.com>
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

The binding address is the same, no need to duplicate its definition
for each pipeline.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 lib/intel_compute.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index d64ac72ec..50eb4e3fa 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -42,6 +42,7 @@
 #define ADDR_SURFACE_STATE_BASE		0x400000ULL
 #define ADDR_DYNAMIC_STATE_BASE		0x500000ULL
 #define ADDR_INDIRECT_OBJECT_BASE	0x100000000
+#define ADDR_BINDING_TABLE		(ADDR_SURFACE_STATE_BASE + OFFSET_BINDING_TABLE)
 #define OFFSET_INDIRECT_DATA_START	0xFFFD0000
 #define OFFSET_KERNEL			0xFFFE0000
 
@@ -995,7 +996,7 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
 		{ .addr = ADDR_GENERAL_STATE_BASE,
 		  .size = SIZE_GENERAL_STATE,
 		  .name = "general state base" },
-		{ .addr = ADDR_SURFACE_STATE_BASE + OFFSET_BINDING_TABLE,
+		{ .addr = ADDR_BINDING_TABLE,
 		  .size = SIZE_BINDING_TABLE,
 		  .name = "binding table" },
 		{ .addr = ADDR_BATCH, .size = SIZE_BATCH,
@@ -1572,7 +1573,7 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
 		{ .addr = ADDR_GENERAL_STATE_BASE,
 		  .size = SIZE_GENERAL_STATE,
 		  .name = "general state base" },
-		{ .addr = ADDR_SURFACE_STATE_BASE + OFFSET_BINDING_TABLE,
+		{ .addr = ADDR_BINDING_TABLE,
 		  .size = SIZE_BINDING_TABLE,
 		  .name = "binding table" },
 		{ .addr = ADDR_BATCH,
@@ -1663,7 +1664,7 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 		{ .addr = ADDR_GENERAL_STATE_BASE,
 		  .size = SIZE_GENERAL_STATE,
 		  .name = "general state base" },
-		{ .addr = ADDR_SURFACE_STATE_BASE + OFFSET_BINDING_TABLE,
+		{ .addr = ADDR_BINDING_TABLE,
 		  .size = SIZE_BINDING_TABLE,
 		  .name = "binding table" },
 		{ .addr = ADDR_BATCH,
@@ -1919,7 +1920,7 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 		{ .addr = ADDR_GENERAL_STATE_BASE,
 		  .size = SIZE_GENERAL_STATE,
 		  .name = "general state base" },
-		{ .addr = ADDR_SURFACE_STATE_BASE + OFFSET_BINDING_TABLE,
+		{ .addr = ADDR_BINDING_TABLE,
 		  .size = SIZE_BINDING_TABLE,
 		  .name = "binding table" },
 		{ .addr = ADDR_BATCH,
-- 
2.43.0

