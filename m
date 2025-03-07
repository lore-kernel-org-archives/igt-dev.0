Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCDF4C19F32
	for <igt-dev@archiver.kernel.org>; Fri,  7 Mar 2025 10:40:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 891DC10EB37;
	Fri,  7 Mar 2025 10:40:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZqE+H1lJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3478210EB37
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Mar 2025 10:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741344001; x=1772880001;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Dp5DSV88cbB6u/o03tyBAtAPU80lVN/U64uLGeJ0aB8=;
 b=ZqE+H1lJ7Yr3RKsc7buBRr7V4zZBoyk850cspyzExcVV5uvNmTciZ/Vi
 bJpGWd9MBsemgSNTKg3WMuHEDMIbnvfYa7hKQAdjCFdykV4gV2dS38xs0
 K3iwDPkfRDzUribF8udbMWutJa/c66zKO/tDcPeq5P6LCZUa5ZpJi+pOo
 KhEncp4S3x65CAi4/KR6zYeQv2HEXm6vyT5NoHJ/FA63YDiAv3n4PUiXZ
 ItOmBMEFgq5rNSiNhdxMBdiqZ/2AvsEC2kLdqbYSJG4pxyWnxV5VryGk4
 PUxtMuMuCnUjisoQY7DlY1A8U7NYUDxIZvn+jouaH+WHEdxp2ZG1rm8Zt g==;
X-CSE-ConnectionGUID: U5SKyPk1RPCEEe/xoaP2+Q==
X-CSE-MsgGUID: r9VYGNNUS02w3zlissqnpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="41642522"
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; d="scan'208";a="41642522"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 02:40:01 -0800
X-CSE-ConnectionGUID: gW9BEgMXQ+iBuIBhZtquBQ==
X-CSE-MsgGUID: V+3Z4bEkSbi01pVjizsa3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; d="scan'208";a="119796405"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO fdugast-desk.home)
 ([10.245.246.218])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 02:39:59 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t] lib/intel_compute: Align objects on 64K for xelpg
Date: Fri,  7 Mar 2025 11:39:51 +0100
Message-ID: <20250307103951.16567-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
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

Ensure 64K alignment to be consistent with xehp and xehpc. Especially
the binding table offset was changed to 0x10000 but this had not been
taken into account for xelpg, so fix it.

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 lib/intel_compute.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index dd9c83c9c..28149db53 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -1339,7 +1339,7 @@ static void xelpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
-	addr_bo_buffer_batch[b++] = 0x00001080;
+	addr_bo_buffer_batch[b++] = 0x00010080;
 	addr_bo_buffer_batch[b++] = 0x0c000020;
 
 	addr_bo_buffer_batch[b++] = 0x00000008;
@@ -1551,10 +1551,10 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
 		  .size = 0x100000,
 		  .name = "dynamic state base"},
 		{ .addr = ADDR_SURFACE_STATE_BASE,
-		  .size = 0x1000,
+		  .size = 0x10000,
 		  .name = "surface state base"},
 		{ .addr = ADDR_GENERAL_STATE_BASE + OFFSET_INDIRECT_DATA_START,
-		  .size =  0x1000,
+		  .size =  0x10000,
 		  .name = "indirect object base"},
 		{ .addr = ADDR_INPUT, .size = SIZE_BUFFER_INPUT,
 		  .name = "addr input"},
@@ -1563,7 +1563,7 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
 		{ .addr = ADDR_GENERAL_STATE_BASE, .size = 0x100000,
 		  .name = "general state base" },
 		{ .addr = ADDR_SURFACE_STATE_BASE + OFFSET_BINDING_TABLE,
-		  .size = 0x1000,
+		  .size = 0x10000,
 		  .name = "binding table" },
 		{ .addr = ADDR_BATCH,
 		  .size = SIZE_BATCH,
@@ -1576,7 +1576,7 @@ static void xelpg_compute_exec(int fd, const unsigned char *kernel,
 	bo_execenv_create(fd, &execenv, eci, user);
 
 	/* Sets Kernel size */
-	bo_dict[0].size = ALIGN(size, 0x1000);
+	bo_dict[0].size = ALIGN(size, 0x10000);
 
 	bo_execenv_bind(&execenv, bo_dict, XELPG_BO_DICT_ENTRIES);
 
-- 
2.43.0

