Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B64A9C61CE8
	for <igt-dev@archiver.kernel.org>; Thu, 12 Jun 2025 08:11:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5791210E063;
	Thu, 12 Jun 2025 08:11:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c7uQeaNK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75FEA10E063
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jun 2025 08:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749715863; x=1781251863;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WbUoyiPIgeF58Z2e8ri0qqZw9gFAbAk7l7nanvcvvGU=;
 b=c7uQeaNKvRJ72vO6vBcvk+dXIGYprMfftNcrYb/JnqJACWs5Gct38jIn
 dBp12cJXX04vn5hktKA9k6MIxfiknq4NJRQDJklMx17kgmXyW/xJC42J0
 qKvSwR2MHQUb1YOEwmysjDdevqdJJH/IbibRHZXA27vbU5NEE4GJcYmz7
 gljvPIPO2jWzgcApt/+nnsmM/iSMtUKPBmmveDhv2EdBtiUSK3S/c4FJ5
 SoTsT+S+1+7FKdsEUso+5V6Ukq3QjnZIdsWwnJ2dxMiQT6iufLSYI1JJ2
 kfxrRLES/NEUA4nWaDhYE9i/SH1c6O9D270PP+q3OOkDGJIuqw7KrcjnL A==;
X-CSE-ConnectionGUID: W6rsQJLJR+WJ/ARXLqC84w==
X-CSE-MsgGUID: XmVHt1IGRxuAp+vBnBwkmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51757911"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="51757911"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 01:11:01 -0700
X-CSE-ConnectionGUID: Z0ke7+CFRmuWWgROBn/32w==
X-CSE-MsgGUID: rbhogABlQCOI6O6y4GbTpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="152724136"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa005.jf.intel.com with ESMTP; 12 Jun 2025 01:11:00 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH v2] tests/intel/xe_exec_compute_mode: Fix assertion of batch
 buffer size
Date: Thu, 12 Jun 2025 08:09:27 +0000
Message-Id: <20250612080927.3697303-1-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.25.1
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

The batch buffer pointer is data[EXEC_DATA] not data. Correct it in the assertion.
Fix 2 other issues reported by checkpatch.pl:
"
WARNING: please, no space before tabs

ERROR: code indent should use tabs where possible
"

v2: fix issues reported by checkpatch.pl

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 tests/intel/xe_exec_compute_mode.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_exec_compute_mode.c b/tests/intel/xe_exec_compute_mode.c
index 8fba9daef..a7ea56327 100644
--- a/tests/intel/xe_exec_compute_mode.c
+++ b/tests/intel/xe_exec_compute_mode.c
@@ -24,7 +24,7 @@
 #include "xe/xe_spin.h"
 #include <string.h>
 
-#define MAX_N_EXECQUEUES 	16
+#define MAX_N_EXECQUEUES		16
 #define USERPTR				(0x1 << 0)
 #define REBIND				(0x1 << 1)
 #define INVALIDATE			(0x1 << 2)
@@ -272,7 +272,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 				map_fd = open("/tmp", O_TMPFILE | O_RDWR,
 					      0x666);
 				igt_assert_eq(write(map_fd, data, bo_size),
-				              bo_size);
+					      bo_size);
 				data = mmap((void *)MAP_ADDRESS, bo_size,
 					    PROT_READ | PROT_WRITE, MAP_SHARED |
 					    MAP_FIXED, map_fd, 0);
@@ -393,7 +393,7 @@ static void non_block(int fd, int expect)
 	data[EXEC_DATA].batch[b++] = sdi_addr >> 32;
 	data[EXEC_DATA].batch[b++] = value;
 	data[EXEC_DATA].batch[b++] = MI_BATCH_BUFFER_END;
-	igt_assert(b <= ARRAY_SIZE(data->batch));
+	igt_assert(b <= ARRAY_SIZE(data[EXEC_DATA].batch));
 
 	sync[0].addr = addr + (char *)&data[EXEC_DATA].exec_sync - (char *)data;
 	exec.num_syncs = 0;
-- 
2.25.1

