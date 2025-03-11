Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 969D6C28B2F
	for <igt-dev@archiver.kernel.org>; Tue, 11 Mar 2025 15:23:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ADC610E5C3;
	Tue, 11 Mar 2025 15:23:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e9qIxxCu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 067B310E5C0
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Mar 2025 15:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741706624; x=1773242624;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2oWjhbjRir2Ule60W93onemp0IK0uc1ZGpvVJrC35U4=;
 b=e9qIxxCuQFZAHpiQDPuGhkS0ApVdtF5HdHB1FOhPTDH2hGoG8BjA/IQA
 lGhVFriCinu2r/bXNr2eG6wbcXazL1JqreY9zQlEfBbUs0KERArdZri8O
 hHVXsdqcLgAr0ymxt9nMlJixxo87I2s1D8g+RyRgu6fGEbLl7bVy5CVhE
 6ewX/5Y5hPQv4mmUcWMgDUfy9SNE9Crc8BSVZ/77dnBca9Cv2DsOcIAh3
 0upQSKR43NRxk/wUKcY9uUgQmP6KcLiewnlSkODI1XVk1i8cU6yFoW7N6
 HyI2HZ55X07vyVVbOJxxAwUfV/4nhHgMIP2CsYeF8DznXPgDfKexskz9G Q==;
X-CSE-ConnectionGUID: OyuuxPj5R0adsLL7SpbSFA==
X-CSE-MsgGUID: KvpezKFOQ76inFPpd7o5Sg==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="53377148"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="53377148"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 08:23:43 -0700
X-CSE-ConnectionGUID: sNAe2krDRI+01FSq1H6TAQ==
X-CSE-MsgGUID: wiUbT842TfGrw6OlOYak/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="120066302"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.217])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 08:23:43 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 06/11] lib/intel_compute: Use constant for binding table
 address
Date: Tue, 11 Mar 2025 16:21:26 +0100
Message-ID: <20250311152321.16497-7-francois.dugast@intel.com>
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

The binding address is the same, no need to duplicate its definition
for each pipeline.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 lib/intel_compute.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 302a1d35c..79c0f0f00 100644
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
@@ -1915,7 +1916,7 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
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

