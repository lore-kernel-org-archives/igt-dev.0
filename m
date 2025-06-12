Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21655C71136
	for <igt-dev@archiver.kernel.org>; Thu, 12 Jun 2025 08:15:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C949D10E7A0;
	Thu, 12 Jun 2025 08:15:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PyMJP0lP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB0FA10E7A0
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jun 2025 08:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749716151; x=1781252151;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cpH2jPqmq3rRFU312T3kfpD3JdVh/QKaxJqDg/4TIqU=;
 b=PyMJP0lPC+DDfOuGK5VM4Hzk3uVlZIEfh9ArV5OR78+Fj+XuUarIC0IZ
 0cNUMTHVDS5w15KoPjT6EM9d0x0Bfq1ssJyqc6UZFmnq82QSgh6yUJtoF
 dyryu94+GIWqWGq3UkOLhGtHEmzbvK1IkxV4XFtwtw0fFG+QG3AnZlTwI
 kasgsLd4vr8XJU8XkT0CakADbdByWmYhVq9gAwXdMfjBi/mgm7KRkfZwl
 IP7lzKh/Dl5iuf2qRq+JDwXPg1JgT5oduaz+43r8/cOhJCSs9LVr0mXax
 YrdynzFpmw8riMjONaQmKXLPTUa3+Rga4QMkAMvo1QLUh4HrmZmi53OgA w==;
X-CSE-ConnectionGUID: GnAEIqwATBumXfyt3U4YSA==
X-CSE-MsgGUID: 7eVP1gxDSyqkIzJzoIVhiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51753465"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="51753465"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 01:15:50 -0700
X-CSE-ConnectionGUID: mvrp+NWSSP+kwB1ZT5+tpw==
X-CSE-MsgGUID: 6o7TjeEzTqmwO+ibYV36uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="147334841"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by fmviesa007.fm.intel.com with ESMTP; 12 Jun 2025 01:15:49 -0700
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH v3] tests/intel/xe_exec_compute_mode: Fix assertion of batch
 buffer size
Date: Thu, 12 Jun 2025 08:14:30 +0000
Message-Id: <20250612081430.3697406-1-shuicheng.lin@intel.com>
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
FILE: tests/intel/xe_exec_compute_mode.c:27:

ERROR: code indent should use tabs where possible
FILE: tests/intel/xe_exec_compute_mode.c:275:
"

v2: fix issues reported by checkpatch.pl
v3: add back the missed checkpatch message

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

