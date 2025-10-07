Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF1CCCD187
	for <igt-dev@archiver.kernel.org>; Tue,  7 Oct 2025 23:26:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5968C10E71E;
	Tue,  7 Oct 2025 23:26:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LAVewiE7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43F0310E718
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Oct 2025 23:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759879601; x=1791415601;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1M7dkAvWBsU6ueDY8jhkdI4qjiC0vtdknaFlQINaiIs=;
 b=LAVewiE7rZ8f9zKqtTYGoqAO0HOPG7Sr8rPtwfjpOA3HCznj3OQpuOoe
 AVLAZDtdocqobL7vsqnoXw7BKzzAVRMnKLUclbsmed4WzRVPjckv074pI
 ibEcutME+Cv586MW2CyonFIjHrsIEU/EZXI1u5ILuc0EYxOUxyfTc0uN8
 qRk9dxVJWZ+6Um10rpgXvwKIM2PL6Tck3lPZ//zT5Dch/3i8R1gLY1lM8
 g7hK3nF1sDEtXtjf7cYSjNdpq3zu57JOZmrkkxvFI6a9ldvWZnDhIQDry
 71/GbfyyC8HQ4Ux9c9LzOYNYVvuFCkVanUrFF2YDNayAvbajbaFFy46j7 Q==;
X-CSE-ConnectionGUID: pDNMc+92SHqOSKSyiOk/LA==
X-CSE-MsgGUID: qbZ4lcBhQ2WS7UfOZWtFUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="79717942"
X-IronPort-AV: E=Sophos;i="6.18,322,1751266800"; d="scan'208";a="79717942"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 16:26:41 -0700
X-CSE-ConnectionGUID: 9OmaCydeSDOM6NPknUlxFQ==
X-CSE-MsgGUID: 1MBETh9/RVq695vTepYpAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,322,1751266800"; d="scan'208";a="179882180"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.61])
 by orviesa009.jf.intel.com with ESMTP; 07 Oct 2025 16:26:40 -0700
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, matthew.d.roper@intel.com,
 shuicheng.lin@intel.com, brian3.nguyen@intel.com, alex.zuo@intel.com,
 nakshtra.goyal@intel.com, dnyaneshwar.bhadane@intel.com,
 gustavo.sousa@intel.com, Xin Wang <x.wang@intel.com>
Subject: [PATCH v2 6/6] lib/intel_device_info: Remove hardcoded .graphics_rel
 values
Date: Tue,  7 Oct 2025 23:26:06 +0000
Message-ID: <20251007232606.363629-7-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251007232606.363629-1-x.wang@intel.com>
References: <20251007050554.340485-1-x.wang@intel.com>
 <20251007232606.363629-1-x.wang@intel.com>
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

Remove hardcoded .graphics_rel values from device info structures.
For xe devices, the graphics_rel will be determined at runtime
via GMD_ID queries instead of static values.

Signed-off-by: Xin Wang <x.wang@intel.com>
---
 lib/intel_device_info.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index a853f9ab4..4c35a422f 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -505,7 +505,6 @@ static const struct intel_device_info intel_pontevecchio_info = {
 
 static const struct intel_device_info intel_lunarlake_info = {
 	.graphics_ver = 20,
-	.graphics_rel = 4,
 	.display_ver = 20,
 	.has_4tile = true,
 	.has_flatccs = true,
@@ -517,7 +516,6 @@ static const struct intel_device_info intel_lunarlake_info = {
 
 static const struct intel_device_info intel_battlemage_info = {
 	.graphics_ver = 20,
-	.graphics_rel = 1,
 	.display_ver = 14,
 	.has_4tile = true,
 	.has_flatccs = true,
@@ -529,7 +527,6 @@ static const struct intel_device_info intel_battlemage_info = {
 
 static const struct intel_device_info intel_pantherlake_info = {
 	.graphics_ver = 30,
-	.graphics_rel = 0,
 	.display_ver = 30,
 	.has_4tile = true,
 	.has_flatccs = true,
-- 
2.43.0

