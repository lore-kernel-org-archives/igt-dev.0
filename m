Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D7FC369B2
	for <igt-dev@archiver.kernel.org>; Mon, 14 Apr 2025 16:40:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B9B210E206;
	Mon, 14 Apr 2025 16:40:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mCIH1zMd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 752FE10E1A6
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Apr 2025 16:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744648833; x=1776184833;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L4iqDGRZB+O33VZPXRgdSRvJWGETyla9e3U+Fwo9cTA=;
 b=mCIH1zMd3HR3wqhkBTH72In3SrT2KDGnnEeoCPwgwCcLCHE9VcbK49ND
 Oe0PpGYSvnX4fmSriFMMB2siH9W5Bp1cL3PikK9GZ7giCqQ6v0jkfv8aT
 8DG9q1MjpUcAulAphtdx0JDvYylZrmss4ounJlYpabDiTkdURAVuKzezl
 /qIRuYd8/QP6p3JNlgGPzJQD7UL75jBje1HOPUZupSNa2JXRwFVaYdpaL
 dconQGfDhEjrR9wK4zi708U1mq561LcSFzTgsYU7S2zsNZZI4vOsOjydV
 MWinK7tijNOqbhpqBBZ/nzVS2WSi0R7Sj7s/tGwVLbAXItGRQX+m3Ldgi w==;
X-CSE-ConnectionGUID: MYSOgtg7T4e/zwlhSeAVBQ==
X-CSE-MsgGUID: ORMzCQI2RBOh2oXn7RktEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="56789134"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="56789134"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 09:40:33 -0700
X-CSE-ConnectionGUID: e3zEJQ0HQM24zwSDr49Zzw==
X-CSE-MsgGUID: naagK1S9RceT+1E12h6f8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="134717146"
Received: from vpanait-mobl.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.246.184])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 09:40:32 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH i-g-t,
 v3 04/11] lib/intel_compute: Use common constant for binding table
 size
Date: Mon, 14 Apr 2025 18:38:59 +0200
Message-ID: <20250414164007.57713-5-francois.dugast@intel.com>
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

