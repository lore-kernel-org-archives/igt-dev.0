Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DC3E67A70
	for <igt-dev@archiver.kernel.org>; Tue,  3 Mar 2026 06:31:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6FB510E63F;
	Tue,  3 Mar 2026 06:31:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GIjL8dgk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABFA610E63F
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2026 06:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772519517; x=1804055517;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yTLzceCFXIT04O5NJ6cvN+pd4p8+Yup45Eb0IjfQODI=;
 b=GIjL8dgkz6j4e0zEupdSyV350pa1hxA+n4CUCWTpdnV8/NGfksnJ9w5p
 zzx3/54W6mUDF/BedMmz6VEMW7NZKxjK8GKKNMil/7VXjjenJdrtAthFP
 bs9LEM3dpJPfi7isTNuBFMB8SsNmPilmCUrnQ2Z2ENK5QQJBcGTvGjHoB
 h1B7mbfkdwXCY54FSwD8tfRutZYsB0Jy4OqiCTyrDc4KZuvE7TYznpWn4
 wpnWIWitLX3L17CAogM9P8OhRrutJ6Z5MnWyS/clLwIY2yTIU249LYVw3
 5a60onq1B8ynKQcWSX/YNlI5jPyddRnjfxzm75vlI+OT2bP68kNWw+Q9i Q==;
X-CSE-ConnectionGUID: 01lRn/tOSuqYvUOKPGzvWQ==
X-CSE-MsgGUID: aJaRNMJPTRe8qaWDmVeADw==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="96157360"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="96157360"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 22:31:56 -0800
X-CSE-ConnectionGUID: daIGbzMESkyBapLu6HMZNw==
X-CSE-MsgGUID: KIB64/XgQDiHP1nSEYCTCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="222881264"
Received: from nakshtra-system-product-name.iind.intel.com ([10.190.238.69])
 by orviesa005.jf.intel.com with ESMTP; 02 Mar 2026 22:31:55 -0800
From: nakshtra.goyal@intel.com
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@intel.com,
	matthew.brost@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_exec_threads: Initializing exec_threads
 array
Date: Tue,  3 Mar 2026 12:01:54 +0530
Message-Id: <20260303063154.489637-1-nakshtra.goyal@intel.com>
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

From: Nakshtra Goyal <nakshtra.goyal@intel.com>

Initialising exec_threads array to zero as threads-many-queues test
fails on initial check to non_zero condition , it takes garbage
value(non-zero) on first iteration , which call synobj_wait on a
synobj that was never signalled.

Signed-off-by: Nakshtra Goyal <nakshtra.goyal@intel.com>
---
 tests/intel/xe_exec_threads.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
index 27d5a8928..f082a0eda 100644
--- a/tests/intel/xe_exec_threads.c
+++ b/tests/intel/xe_exec_threads.c
@@ -502,7 +502,7 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
 		.num_syncs = 2,
 		.syncs = to_user_pointer(sync),
 	};
-	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
+	uint32_t exec_queues[MAX_N_EXEC_QUEUES] = {};
 	uint32_t bind_exec_queues[MAX_N_EXEC_QUEUES];
 	uint32_t syncobjs[MAX_N_EXEC_QUEUES];
 	size_t bo_size;
-- 
2.34.1

