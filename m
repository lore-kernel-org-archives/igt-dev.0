Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A766C5AD49
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 05:37:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84BA610E1BD;
	Tue,  3 Jun 2025 05:37:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FDMk+oss";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48D2B10E1BD
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 05:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748929037; x=1780465037;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nhftqBGWrzyt9E8PORI55EWUPQvdkwQIonldGodCTTg=;
 b=FDMk+ossOJz8SFpBf/5FOYhASOWenIfxmIu7Jgm5VSDYHMKKse4pl2Uo
 Cjk1986/rNHGgewLzfj8jyd1AMLGCJ6v4bWEaAwl7MCg63coWbcSjRmx4
 AY233fnSfZfGsCgFQ1e6lRpqVTlUyoqMuLIPLmOWR5utVmib0ZS+2MEwo
 21rvQy+7MxFSb5Gwm2JGk2+/DNDyYG7DV7ykhU9nt3ON/OhjY+DVlsBAp
 Ctaw8PPDoLtvBlSQ+U9VJGvovX/I8n9nWzpQ6n6VDbrxGzi/3jC9f2K9S
 aOZJASh9X9QAGtXnpAHwk4Jjc/Ib/d3739IZgXkAHHKuWisjXU3ZjFSp/ A==;
X-CSE-ConnectionGUID: eQO1g2aiTUaKLj0MSb5JAA==
X-CSE-MsgGUID: dX2BK+q0RamWVMKYmEEbTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="50868578"
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="50868578"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 22:37:17 -0700
X-CSE-ConnectionGUID: RTqzPnKiTR2xhNoWAVM9Dw==
X-CSE-MsgGUID: xTmgzumETI2GPxTxU5fz3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="149627482"
Received: from cml-cometlake-client-platform.iind.intel.com ([10.227.88.163])
 by fmviesa005.fm.intel.com with ESMTP; 02 Jun 2025 22:36:30 -0700
From: aditya.chauhan@intel.com
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] Revert "tests/intel/xe_exec_system_allocator: Add GPU
 platform PTL for sys allocator tests"
Date: Tue,  3 Jun 2025 11:06:29 +0530
Message-Id: <20250603053629.222192-1-aditya.chauhan@intel.com>
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

This reverts commit c7c948b8de5dc4178ee5ed2106f7c3f160def170.
SVM development is limited to post PV platforms as of now.

Signed-off-by: Aditya Chauhan <aditya.chauhan@intel.com>
Cc: Ramadevi Gandi<ramadevi.gandi@intel.com>
Cc: Himanshu Girotra <himanshu.girotra@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index 06daac8c2..9528c9449 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -9,7 +9,7 @@
  * Mega feature: USM
  * Sub-category: System allocator
  * Functionality: fault mode, system allocator
- * GPU: LNL, BMG, PVC, PTL
+ * GPU: LNL, BMG, PVC
  */
 
 #include <fcntl.h>
-- 
2.34.1

