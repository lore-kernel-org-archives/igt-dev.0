Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BCF0C28B2F
	for <igt-dev@archiver.kernel.org>; Tue, 11 Mar 2025 15:23:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01BE710E5BE;
	Tue, 11 Mar 2025 15:23:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="az5xjGQY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31FBD10E5BE
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Mar 2025 15:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741706620; x=1773242620;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aTSRoV+P5zfmZAB+oyPDRa80osLcpea00cTpL0LZRIk=;
 b=az5xjGQYAaQjsEA0J0hVQnprilzM6034B5l3MiIs9b9vr1i0gpNF5L5V
 pazCDHx519Bv+JC4equ9LCd9fqO3BMw+ikpWQKMPj25149MrgBqMNgGNk
 LyLXCekuCZvg0FNSeDpmwR3Qjbma+GA/oUe2bdTZpmhm7LqGMpSN/WzK+
 yo7jPt7bEsIRHZTqzpuN1qaBpreZFTkqc+5L0iwsEAM+wkqkDwQUmXjzH
 yFAs7ARocrKobHUwqo+m0wJVcXo+y2nl+GTybm3IkWSRc0mK+nUaN93mk
 egZ2JX9dMX9FYm4LxMLvSUxttKFhdE2QIaR6kVZ07sLMMPUYtc7uEKZBY A==;
X-CSE-ConnectionGUID: Gm/n0Z2uQN+cbiHw/D+R9w==
X-CSE-MsgGUID: wMTBYbYISPmWqhD6eERZMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="53377124"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="53377124"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 08:23:39 -0700
X-CSE-ConnectionGUID: Rtlp85bxRZCV4hqhCDwQcw==
X-CSE-MsgGUID: EjxuqqT6Tgec6elzHSjwDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="120066289"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.217])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 08:23:39 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 03/11] lib/intel_compute: Use common constant for
 indirect object size
Date: Tue, 11 Mar 2025 16:21:23 +0100
Message-ID: <20250311152321.16497-4-francois.dugast@intel.com>
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
 lib/intel_compute.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index b4b022ae7..e3c8cf244 100644
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
-		  .size =  0x1000,
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

