Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F82E77188
	for <igt-dev@archiver.kernel.org>; Fri, 20 Dec 2024 09:41:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D6F810EF4F;
	Fri, 20 Dec 2024 09:41:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GGVp6rL9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E4CC10EF4F
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Dec 2024 09:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734687714; x=1766223714;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=K1Y8pVlVCnrF6SVbKh07iX0JkU2U2scNaRDseX+2yzk=;
 b=GGVp6rL95iUdkFgc+7X6jj9SS0yiEFee5rjOAaYlf8hwLCsVGT9ZRGcX
 IykrgtRi2EwlcKXjizif+UrbabS547NbMNPHBO1M7ePphgKEvcFw5qIRg
 jK15ZN2wefZvWCqb98e8tTCO2P4xpbkznCBX9d3Olap2wP8owzh37G9ws
 Ca0f0WvEFMLIy1EiulMrnyJuDphsT+uod7lZNnkNfcQ6Xdn+TezCeCXLg
 9i9H4JP9kkiDd+i8U0SSYbhIsrR3/HeKdob72ZYRklSYIxCJCSjVEfx/f
 IGIFKe7qUuW6da/Afg19YOH5Y32fTbd/eUzhOm8gvAxf88RFpXmW2Juh8 w==;
X-CSE-ConnectionGUID: 4ggRPh8LQDm3UXMhPqOq+Q==
X-CSE-MsgGUID: d1snwiAFQE2g2d0sBw/ryQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="35120781"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; d="scan'208";a="35120781"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2024 01:41:53 -0800
X-CSE-ConnectionGUID: LZSVnGRiSRGFru12YctbbQ==
X-CSE-MsgGUID: bGpdTnIkQ2O1slvj1xPYnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; d="scan'208";a="98296706"
Received: from pgurram-desk.iind.intel.com ([10.145.169.87])
 by fmviesa007.fm.intel.com with ESMTP; 20 Dec 2024 01:41:52 -0800
From: Pravalika Gurram <pravalika.gurram@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com,
 Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH v1] tests/intel: Remove TEST field from test documentation
Date: Fri, 20 Dec 2024 15:09:14 +0530
Message-Id: <20241220093914.706003-1-pravalika.gurram@intel.com>
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

Each test should contain only one TEST field.

Add the Functionality field in the TEST section
to fix the warnings during the addition of subtests.

Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
---
 tests/intel/xe_vm.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index b10269191..b5519c9fc 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -8,6 +8,7 @@
  * Category: Core
  * Mega feature: General Core features
  * Sub-category: VMA
+ * Functionality: ioctl
  */
 
 #include "igt.h"
@@ -2247,15 +2248,6 @@ static void bind_flag_invalid(int fd)
 	xe_vm_destroy(fd, vm);
 }
 
-/**
- * TEST: Negative test for vm create/destroy ioctl
- * Category: Core
- * Mega feature: General Core features
- * Sub-category: Synchronization
- * Functionality: vm create
- * Test category: negative test
- */
-
 /**
  * SUBTEST: invalid-flag-%s
  * Description:  function %arg[1] used in vm create IOCTL to make it fail
-- 
2.34.1

