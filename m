Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C960EC28B20
	for <igt-dev@archiver.kernel.org>; Wed,  2 Apr 2025 15:23:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75FF210E811;
	Wed,  2 Apr 2025 15:23:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lQahiP8h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B1C10E811
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Apr 2025 15:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743607403; x=1775143403;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GnSyCm2frczzj6QkBXAo8XFBNstVL22EspuGUSExd+4=;
 b=lQahiP8h6TfbXLLEjwqhiYsK3Y5vspjGj+Xt5KyrbK/G1uY1zyhIQGGh
 IMSzoxC5+oAQ5VdrN1k3NQ0lohDenZk0I6YYXi0gucLbWdsisUbSNKOT9
 tZ+9QmCsgp94qCXzQYKBGhUrfDgZoahQYwaINnbiAnMKCYlz2W8HuSmCQ
 4fwxXhFmgza8aa9yCFONUaZ5kL1+ai7cREBty/RPsWaCJh20T0w7fvR5U
 uLQEsZtrUSzfGQllik4S5mXvlURGEW++rM4M9L+VOPY5d3CQPyG/OWdmA
 m9x/rVvCPrKnj5NtrFFJJBokzHMSAPGzLDPMq73CvaYa0oBoEFLVOI6Nj g==;
X-CSE-ConnectionGUID: yn9qktp5SlGp7e9dTlcQrA==
X-CSE-MsgGUID: 1rz+DUlURfGYKI//gGY9Sg==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="44885866"
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="44885866"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 08:23:23 -0700
X-CSE-ConnectionGUID: cYA7LQYoT6SuAnUx40LmHA==
X-CSE-MsgGUID: yfXLGpwMThaTYzt3TY+F3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="131717729"
Received: from carterle-desk.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.81])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 08:23:21 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH i-g-t,
 v2 04/11] lib/intel_compute: Use common constant for binding table
 size
Date: Wed,  2 Apr 2025 17:20:02 +0200
Message-ID: <20250402152256.173562-5-francois.dugast@intel.com>
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
 lib/intel_compute.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 747a74108..eafec7db4 100644
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
@@ -1909,7 +1910,7 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
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

