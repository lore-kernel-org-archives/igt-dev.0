Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77252C369B4
	for <igt-dev@archiver.kernel.org>; Tue, 15 Apr 2025 10:15:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E5C810E704;
	Tue, 15 Apr 2025 10:15:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m2gm6HoL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C28110E704
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Apr 2025 10:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744712121; x=1776248121;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N5HU4Cq/My25JWrvDtVN+7V8ag3x6hm/3iqki6gB410=;
 b=m2gm6HoLRVTuL6JH29ydfYRkbf7jP2kxOBoPJIWdx+AHhjLxAz2q4hdW
 1psDqBdQdbEyyrG+xLeLl2dC92zuXn2c3uVc5qfHUwu2cfuzR6nS+FRgn
 ZmTWc9c2BZZRe7TQztOj9WLsBk/DtsxzREs+Cu/3q6FLkZK55ARFAb5tD
 OV5F4zt4HZSnFl8FHA8Atw9ko2rtI334qz9m6Vdg9uw9DpEtVZFPyHk36
 KuR5lokInZIbPQpFUAH+st/J0I7gFIlNLG2mSDjHI35gl1PM9qVTp/SG2
 f8FNB/dxSIJOO7w2tYyxpWhc2v21iRLI0RfnCFTTFq/xEEmlRRzZjr8H5 A==;
X-CSE-ConnectionGUID: YB2nngX6SjardSmbhHBOCw==
X-CSE-MsgGUID: GdOgH5soT3602Kw+zwhZrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="45927062"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="45927062"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 03:15:21 -0700
X-CSE-ConnectionGUID: 8x7hGnJRTWSpZsODNUNDdA==
X-CSE-MsgGUID: TYMaTar4RWKOSi3Uc6/Pjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="131059957"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.8])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 03:15:20 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH i-g-t,
 v3 04/11] lib/intel_compute: Use common constant for binding table
 size
Date: Tue, 15 Apr 2025 12:13:20 +0200
Message-ID: <20250415101457.141107-5-francois.dugast@intel.com>
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
 lib/intel_compute.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index e7ccf4f27..4cea5388f 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -31,6 +31,7 @@
 #define SIZE_SURFACE_STATE		0x10000
 #define SIZE_DYNAMIC_STATE		0x100000
 #define SIZE_INDIRECT_OBJECT		0x10000
+#define SIZE_BINDING_TABLE		0x10000
 
 #define ADDR_SYNC			0x010000ULL
 #define ADDR_SYNC2			0x020000ULL
@@ -993,7 +994,7 @@ static void xehp_compute_exec(int fd, const unsigned char *kernel,
 		{ .addr = ADDR_GENERAL_STATE_BASE, .size = 0x100000,
 		  .name = "general state base" },
 		{ .addr = ADDR_SURFACE_STATE_BASE + OFFSET_BINDING_TABLE,
-		  .size = 0x10000,
+		  .size = SIZE_BINDING_TABLE,
 		  .name = "binding table" },
 		{ .addr = ADDR_BATCH, .size = SIZE_BATCH,
 		  .name = "batch" },
@@ -1568,7 +1569,7 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
 		{ .addr = ADDR_GENERAL_STATE_BASE, .size = 0x100000,
 		  .name = "general state base" },
 		{ .addr = ADDR_SURFACE_STATE_BASE + OFFSET_BINDING_TABLE,
-		  .size = 0x10000,
+		  .size = SIZE_BINDING_TABLE,
 		  .name = "binding table" },
 		{ .addr = ADDR_BATCH,
 		  .size = SIZE_BATCH,
@@ -1658,7 +1659,7 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
 		{ .addr = ADDR_GENERAL_STATE_BASE, .size = 0x100000,
 		  .name = "general state base" },
 		{ .addr = ADDR_SURFACE_STATE_BASE + OFFSET_BINDING_TABLE,
-		  .size = 0x1000,
+		  .size = SIZE_BINDING_TABLE,
 		  .name = "binding table" },
 		{ .addr = ADDR_BATCH,
 		  .size = SIZE_BATCH,
@@ -1913,7 +1914,7 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
 		{ .addr = ADDR_GENERAL_STATE_BASE, .size = 0x100000,
 		  .name = "general state base" },
 		{ .addr = ADDR_SURFACE_STATE_BASE + OFFSET_BINDING_TABLE,
-		  .size = 0x1000,
+		  .size = SIZE_BINDING_TABLE,
 		  .name = "binding table" },
 		{ .addr = ADDR_BATCH,
 		  .size = SIZE_BATCH,
-- 
2.43.0

