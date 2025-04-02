Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB9AC3601C
	for <igt-dev@archiver.kernel.org>; Wed,  2 Apr 2025 15:23:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D37C110E810;
	Wed,  2 Apr 2025 15:23:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IJY3mk7F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1364E10E80D
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Apr 2025 15:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743607401; x=1775143401;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E4EqbiO8e7vookj0V3Vjw0pq66HrLBzc4KXlsGMlY00=;
 b=IJY3mk7FWYraKwg+4DtIYtlrYSfohbijxC03iIe/ymsbi6OV/Hg/wUgY
 yadTfXMkzmNKdFI6KqY0H8PA3lwjlQbR0++vn/XnK740S3Oij6WUOQB5f
 O3D84imcKbJGL0Axz9mWMjCh0WILcg5MwzraQP+LIvPgCXJ08rNbrdtGf
 rsqSq96cr6cmYeRNqhRHmRyXpr4U94pLBPaWFf1eE/2dklqqJSRmH6D6a
 D37urSRRlBOLQhmuDdUBIonzLX2UjYWyw01OoDaWbaZBnMWmFQCd7cePH
 OI4yGdwsRbf7GLVgaqDTemvstNG0UCh+jzHuVtNrfBTe28IAsp8kviLHw Q==;
X-CSE-ConnectionGUID: yEj6jDiNQl20ieW0K671nw==
X-CSE-MsgGUID: j3Rn0G7VRqy7c1BIvh/Dzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="44885865"
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="44885865"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 08:23:21 -0700
X-CSE-ConnectionGUID: MYj652vmTkSrvhBCfxBg4w==
X-CSE-MsgGUID: jbd6j1MjRqeqzR/hWrszPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="131717726"
Received: from carterle-desk.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.81])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 08:23:20 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH i-g-t,
 v2 03/11] lib/intel_compute: Use common constant for indirect object
 size
Date: Wed,  2 Apr 2025 17:20:01 +0200
Message-ID: <20250402152256.173562-4-francois.dugast@intel.com>
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
 lib/intel_compute.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 941a6d9ed..747a74108 100644
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
@@ -1899,7 +1900,7 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
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

