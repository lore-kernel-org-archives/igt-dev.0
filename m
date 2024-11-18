Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA4FD43FF1
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 09:00:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDD7B10E450;
	Mon, 18 Nov 2024 08:59:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rr9zW8Xc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F210A10E450
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 08:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731920399; x=1763456399;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ur0plXxdaMybUvcxRoPHDe46Sqh2ZMhfjko+baXmq94=;
 b=Rr9zW8XcKav0k/Mn214tbsghyh74s0YJVdULWxjxlJOvSAQxsv/Rb5da
 vIs8Y6/vP6cQVL8U2KoZA1wTyZPjow+p4VjF4qcYRn+TMyUkWvAGJW7Fd
 eRZK1+wZ5m37ERIwKlnUqqYY47U/U4RHIMUPp26W5n80QYZMtTtNfObQL
 7qFLilysxc/nhlMuOxepM1TT28+n/ialKN8FaVNA9qGeTBRnjrBoq9map
 /U+bDc7AlBhB7Qix2+KPEgjD/U4SzoY1VdK03NH3pRyk1BhJYeh05+Lf3
 0Ieo/0mHrDE/WKFpDTiW0e4Rh4Smh9luzOJFsSvrqPdIYGY0pR4iYkPIt Q==;
X-CSE-ConnectionGUID: Y4QvaYpYR9O8FimmyRcbdg==
X-CSE-MsgGUID: XU+6sHUKTziI0PjcRTVR9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="43259470"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="43259470"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 00:59:44 -0800
X-CSE-ConnectionGUID: /LllP230TZSiyRlFdHwsnQ==
X-CSE-MsgGUID: oeCw6u+8QOaPc5bPA+luhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; d="scan'208";a="89079244"
Received: from nakshtra-system-product-name.iind.intel.com ([10.145.169.86])
 by orviesa010.jf.intel.com with ESMTP; 18 Nov 2024 00:59:41 -0800
From: nakshtra.goyal@intel.com
To: igt-dev@lists.freedesktop.org,
	ramadevi.gandi@intel.com
Cc: matthew.d.roper@intel.com
Subject: [PATCH v5 i-g-t] tests/intel/xe_exec_reset: Add mocs reset test
Date: Mon, 18 Nov 2024 14:31:31 +0530
Message-Id: <20241118090131.3233488-1-nakshtra.goyal@intel.com>
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

v3: Correcting documentation for functionality and changing suspend resume
to gt reset,adding required header. (Matt Roper)

Signed-off-by: Nakshtra Goyal <nakshtra.goyal@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 tests/intel/xe_exec_reset.c | 44 +++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 43ef1e334..a3eaf8bbf 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -12,6 +12,8 @@
  * Test category: functionality test
  */
 
+#include <fcntl.h>
+
 #include "igt.h"
 #include "lib/igt_syncobj.h"
 #include "lib/intel_reg.h"
@@ -715,6 +717,44 @@ gt_reset(int fd, int n_threads, int n_sec)
 	free(threads);
 }
 
+/**
+ * SUBTEST: gt-mocs-reset
+ * Description: Validate mocs register contents over GT reset
+ * Test category: mocs
+ *
+ */
+static void
+gt_mocs_reset(int fd, int gt)
+{
+	char path[256];
+
+	/* Mocs debugfs contents before and after GT reset.
+	 * Allocate memory to store 10k characters sufficient enough
+	 * to store global mocs and lncf mocs data.
+	 */
+	char *mocs_content_pre = (char *)malloc(10000 * sizeof(char));
+	char *mocs_contents_post = (char *)malloc(10000 * sizeof(char));
+
+	igt_assert(mocs_content_pre);
+	igt_assert(mocs_contents_post);
+
+	sprintf(path, "gt%d/mocs", gt);
+	igt_assert(igt_debugfs_exists(fd, path, O_RDONLY));
+	igt_debugfs_dump(fd, path);
+	igt_debugfs_read(fd, path, mocs_content_pre);
+
+	xe_force_gt_reset_sync(fd, gt);
+
+	igt_assert(igt_debugfs_exists(fd, path, O_RDONLY));
+	igt_debugfs_dump(fd, path);
+	igt_debugfs_read(fd, path, mocs_contents_post);
+
+	igt_assert(strcmp(mocs_content_pre, mocs_contents_post) == 0);
+
+	free(mocs_content_pre);
+	free(mocs_contents_post);
+}
+
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -820,6 +860,10 @@ igt_main
 	igt_subtest("gt-reset-stress")
 		gt_reset(fd, 4, 1);
 
+	igt_subtest("gt-mocs-reset")
+		xe_for_each_gt(fd, gt)
+			gt_mocs_reset(fd, gt);
+
 	igt_fixture
 		drm_close_driver(fd);
 }
-- 
2.34.1

