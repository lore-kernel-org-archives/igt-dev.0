Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE7FC369DC
	for <igt-dev@archiver.kernel.org>; Wed,  7 May 2025 06:24:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6F0910E138;
	Wed,  7 May 2025 06:24:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TmyDbbd9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1941910E138
 for <igt-dev@lists.freedesktop.org>; Wed,  7 May 2025 06:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746599043; x=1778135043;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gOq2JGzKZhS1sjepny9wpPyrFF973qgn01kldwsXA8Q=;
 b=TmyDbbd9PjGUKWzOgTsieL3RB9/gPyBC6ADPwx09Zurm5Ti7FhUB8Qoh
 KAiYYWAYqGBbC0oB9Ykx7Y9uZTeSKeS2G7bL3jCMkAqmjRK3BSauvogzg
 0nenBsdZ6fCnzuhE93rMrntYQKjbLLfJKy6bqd2t14owd0C7Nzpm+ZoOD
 iCbzKNFbaU8w1Py1upktn035IrfPssqTciiTZAv86yfYg2YKWp10RKxJI
 StFhqR0k9jzpFD3esOyd1Dz6Z2K7nk+EmFcPh/EGfeioUDj3djeFWkUZk
 FVobOxRHCWqw1k5QjVIKEI0DT54/nIVpgo4Dv1wZ02n1qcPyuCs3zoeU+ A==;
X-CSE-ConnectionGUID: mysFTmgeSCap3yu0TXUIHw==
X-CSE-MsgGUID: lKVRJNduTfet/Q5vxiFbQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="58505251"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; d="scan'208";a="58505251"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 23:24:01 -0700
X-CSE-ConnectionGUID: 3qnYy45HSgmqqlHjr3H4TQ==
X-CSE-MsgGUID: H5A+4tIBRLee61c9xpBjTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; d="scan'208";a="140966151"
Received: from cml-cometlake-client-platform.iind.intel.com ([10.227.88.163])
 by orviesa005.jf.intel.com with ESMTP; 06 May 2025 23:24:00 -0700
From: aditya.chauhan@intel.com
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tests/intel/xe_exec_system_allocator: Add GPU platform
 PTL for sys allocator tests
Date: Wed,  7 May 2025 11:53:59 +0530
Message-Id: <20250507062359.61919-1-aditya.chauhan@intel.com>
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
Cc: Tahvanainen, Jari <jari.tahvanainen@intel.com>
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

