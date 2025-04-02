Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3646C3601A
	for <igt-dev@archiver.kernel.org>; Wed,  2 Apr 2025 15:23:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BC6310E80D;
	Wed,  2 Apr 2025 15:23:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gkc9xWCa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C51110E80D
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Apr 2025 15:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743607400; x=1775143400;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9Eg5yed3Zhm8InvHH3ROqftoShLl32qgGHjvcoi6A6Y=;
 b=Gkc9xWCaJXzl1uJGdPywqVdFeBDAXx3oaUUCmCKYI1r63Tn5J7wJ7iI7
 brp8CRO6ov+aadbrM7TkmB69F7olb0hxizeV/Bq3N+C0fWUO2kwKdN/n2
 PyYkmIZgpVIvDInxOTzJ9eamYPsdYVQScS4bNUoIE6fNir2rCPeY760sk
 VMy1Ub39J14ZwDGICkh5Q/Z0fzsNbwbQlr7cMkB/wte6Mw/+ksWSd/3NS
 /g8yRrJ3wdH9Rrq+arrGJ/jX4bEHaROj/hh9+JmFFHpNZqUBDz/usUxEz
 Bf55osftKtl+nc1L9/dEZxurPt7vks68JlTxsq7RLi6v9fita5h3UTTUV A==;
X-CSE-ConnectionGUID: qAnmI5jETYG4e8zibVhVKg==
X-CSE-MsgGUID: 4TK5OQEqTI2KiyRRXS2KoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="44885863"
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="44885863"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 08:23:20 -0700
X-CSE-ConnectionGUID: NjnJ7fZ2Tzuka5PIWEQ8jA==
X-CSE-MsgGUID: 4Os6XpuARa66jLDVOLVgVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="131717721"
Received: from carterle-desk.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.81])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 08:23:18 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH i-g-t,
 v2 02/11] lib/intel_compute: Use common constant for dynamic state
 size
Date: Wed,  2 Apr 2025 17:20:00 +0200
Message-ID: <20250402152256.173562-3-francois.dugast@intel.com>
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
 lib/intel_compute.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 824f73dbd..941a6d9ed 100644
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
@@ -1892,7 +1893,7 @@ static void xe2lpg_compute_preempt_exec(int fd, const unsigned char *long_kernel
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

