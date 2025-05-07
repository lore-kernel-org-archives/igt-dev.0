Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1BA5C3ABC0
	for <igt-dev@archiver.kernel.org>; Wed,  7 May 2025 08:12:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B58A10E165;
	Wed,  7 May 2025 08:12:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="egZbckMv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92B4F10E165
 for <igt-dev@lists.freedesktop.org>; Wed,  7 May 2025 08:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746605562; x=1778141562;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TcfyGL5QQrQFDPsJCiWIK8A/J95gayTQOljDqXOf7wo=;
 b=egZbckMvKnkaGFcuNNCbW4G1S4T6tl5BI82uL0UWiKv0e/Thlq6z9NWH
 O34S17vjEjnfwPgLeEAiv4h1gtPVZWkZa9XuborSGY9+1qIEZ9RXwHRao
 UiYW4ZULeXJuIpgpofpCE0QqlKcjhU6KVEz2FG4fBM1Zcf0bDseipdOVa
 eHDPeZoKUJbva+xybho+K64sPKhoA3z/Y+LabRKmO31VEu+s6wlrGDh2k
 8NJ6921mtXnrMPnqaJ0MbYJVMb6Yz+38jVD6qxfsjO1Zpc8St+cIw2cv2
 77sFDIKfQnYuJ0T738pqHp4ew8ceqdskpLDRPdUQqxs9XuS7pnXUcXQUH Q==;
X-CSE-ConnectionGUID: Q7+6/lgrQ82lYxdnBAE6ZA==
X-CSE-MsgGUID: M1oFDTsHQpeiY9BPjJPBtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48330682"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; d="scan'208";a="48330682"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 01:12:40 -0700
X-CSE-ConnectionGUID: 1Hx3GlLhTl6kVsVr2/x84g==
X-CSE-MsgGUID: gxpWoxh8SXSxMyuXy++hTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; d="scan'208";a="141001011"
Received: from cml-cometlake-client-platform.iind.intel.com ([10.227.88.163])
 by orviesa005.jf.intel.com with ESMTP; 07 May 2025 01:12:39 -0700
From: aditya.chauhan@intel.com
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com
Subject: [PATCH v2 i-g-t] tests/intel/xe_exec_system_allocator: Add GPU
 platform PTL for sys allocator tests
Date: Wed,  7 May 2025 13:42:38 +0530
Message-Id: <20250507081238.62865-1-aditya.chauhan@intel.com>
X-Mailer: git-send-email 2.34.1
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

From: Aditya Chauhan <aditya.chauhan@intel.com>

Add PTL to the list of GPUs applicable for the test

Signed-off-by: Aditya Chauhan <aditya.chauhan@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index c2daf3712..bae8144ef 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -9,7 +9,7 @@
  * Mega feature: USM
  * Sub-category: System allocator
  * Functionality: fault mode, system allocator
- * GPU: LNL, BMG, PVC
+ * GPU: LNL, BMG, PVC, PTL
  */
 
 #include <fcntl.h>
-- 
2.34.1

