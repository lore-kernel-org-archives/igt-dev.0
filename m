Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E82CD609CE
	for <igt-dev@archiver.kernel.org>; Wed, 27 Nov 2024 10:36:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E691210E031;
	Wed, 27 Nov 2024 10:36:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kv3BicXJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A16710E031
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Nov 2024 10:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732703799; x=1764239799;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FAu+iXdEHlWjyO7hTmOW4Y65IPfsB2fK6o70y9YQWdk=;
 b=kv3BicXJzFcGLHjmN6WlNsAkTUvM2rVMJ2LuGzKA0YpLJHCfOXPMhIOw
 Hr1ODpWaPW2DP5WPA3cY32HWj5I6yXGHtlzzOPnk/PNvAo+/lkofBP5rD
 rinowRrKDY2XwrJRq9W9/1ae9R0mnQ9NesNzXut5y7k6a8fs5tnI5eDp4
 0jRP36AUfzdG54lAg1Lg+PeTvPcnrXcTcr0KiJlU15eiyGaPsXxIwfI7j
 QXMF2e3nxFAoacArqiuChkuW7rz0idHBBYm0CCRAwAdJynq+GfHQiV3BJ
 8c3XdnNvPWUUHFHKAUJc/Mlq7Lno6YadhkeSKuthcmmXFEZgInw6iCc7D w==;
X-CSE-ConnectionGUID: syHbp+EeSPqznKj4waFHHA==
X-CSE-MsgGUID: 0687lF7vTZuNdDh5G4yXsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="36567320"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; d="scan'208";a="36567320"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2024 02:36:38 -0800
X-CSE-ConnectionGUID: YMUlUU+lR4ikDAuG1+sn0g==
X-CSE-MsgGUID: uVKgCeRKSbqSuuHAjUmz3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; d="scan'208";a="95991299"
Received: from nakshtra-system-product-name.iind.intel.com ([10.145.169.86])
 by fmviesa003.fm.intel.com with ESMTP; 27 Nov 2024 02:36:36 -0800
From: nakshtra.goyal@intel.com
To: igt-dev@lists.freedesktop.org,
	ramadevi.gandi@intel.com
Cc: matthew.d.roper@intel.com
Subject: [PATCH v7 i-g-t] tests/intel/xe_exec_reset: Add mocs reset test
Date: Wed, 27 Nov 2024 16:08:23 +0530
Message-Id: <20241127103823.3888581-1-nakshtra.goyal@intel.com>
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

From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Check mocs configuration over GT reset.

v2: Address review comments. (Matt Roper)
v3: Correcting documentation for functionality and changing suspend resume
to gt reset,adding required header. (Matt Roper)
v7: correcting s-o-b and comments (Nakshtra)

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
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

