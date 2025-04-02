Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C151C3601A
	for <igt-dev@archiver.kernel.org>; Wed,  2 Apr 2025 15:23:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF15C10E819;
	Wed,  2 Apr 2025 15:23:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cBOEdqfR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08F3410E819
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Apr 2025 15:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743607406; x=1775143406;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MUfW62Oq/9JzFrsI8JecOkaGFSTketY0OzBrtq19rQE=;
 b=cBOEdqfRiQKizHlVaurVASvQ0Uv/JZQiRB0thp9cKemXdgj1qrdfGUBi
 m6GmfJTxSK8ZV2rje5GnRLTe1OVoWKaB5T97syzTbVR7z//t/ewzPr43m
 ezfC0qAqCzEgQDWNubqGcZaLMgFSAdnvj0Fnwu8ZqGEfviyrwdXDW/Cfl
 ezNcueS37hlHUywOIITm/0SntF3wZz9Rb5FWD/5mM7qqaq7Grvt3c3OEy
 KzLmv8yeu+ePOLHIxz3XIhjqMzD01KYj9eqb2Nji3oufU8EpRge06lN3j
 iXo/bds4Bes+g9AkuMic34kTTZBz9ibSgQeHr70UXhbHbUbLqCByPTeFz w==;
X-CSE-ConnectionGUID: m2oKc88lSOWbjtRCj4O4pw==
X-CSE-MsgGUID: EwqLZQpAScqpz5clXcnjGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="44885873"
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="44885873"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 08:23:26 -0700
X-CSE-ConnectionGUID: YCEOo+CGQSaxBX6UNdEu6w==
X-CSE-MsgGUID: eTtJ8130SaqYAX6JKhJMkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="131717737"
Received: from carterle-desk.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.81])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 08:23:25 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: [PATCH i-g-t,
 v2 06/11] lib/intel_compute: Use constant for binding table address
Date: Wed,  2 Apr 2025 17:20:04 +0200
Message-ID: <20250402152256.173562-7-francois.dugast@intel.com>
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

The binding address is the same, no need to duplicate its definition
for each pipeline.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 lib/intel_compute.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 46f2ca127..a41680389 100644
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

