Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6301C47422
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jan 2024 18:36:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71C4010F3A9;
	Thu, 25 Jan 2024 18:36:57 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E782810F3A9
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jan 2024 18:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706207816; x=1737743816;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nXf1ynpTeqRghBjengHWNTHaA6tTU2sQ7f4fOKJxUs4=;
 b=OepuaBMvg5a0Sir02kUF7v/SUmOvW4e/3DLeRuK7NsXRUen/VcPlBRvv
 GU0MAmP0VVSijw6Lfk4XoJRjVXzSeaFHsE07qbWWueIecIiJf7XtaeXgM
 izJo/2rwNbZwRF3Fm0i15uqsdleNMsncyT9w6SVrWYRYUIC3FxtN3P5vZ
 zc7N1kculYj7iHLsYmFIii6f3S/EmRBRY927bDEOUhm82YyeesslY87qL
 PR2Y1GgH5TVONynn3s2yhCjdoHuJm7Z8UZcVd3T9BpqE2vpv11rMptOIV
 n4TDTzt0/Wh+LwcgcIPZahMH/XCDwPSqbFHQnXKuwNck8ZQbZojJfRjk2 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="20800803"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="20800803"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 10:36:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2340245"
Received: from unknown (HELO localhost) ([10.245.100.131])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 10:36:55 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v3 4/8] lib/intel_multigpu: Introduce library for
 multi-GPU scenarios
Date: Thu, 25 Jan 2024 19:36:27 +0100
Message-ID: <20240125183632.50422-5-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240125183632.50422-1-kamil.konieczny@linux.intel.com>
References: <20240125183632.50422-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

Implemented gem_require_multigpu in order to replace
igt_require(gpu_count > 1), as well as printing available
PCI devices if requirement fails.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
[Kamil: fixed whitespace and tabs, moved to lib/intel_multigpu.*]
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/intel_multigpu.c | 28 ++++++++++++++++++++++++++++
 lib/intel_multigpu.h | 11 +++++++++++
 lib/meson.build      |  1 +
 3 files changed, 40 insertions(+)
 create mode 100644 lib/intel_multigpu.c
 create mode 100644 lib/intel_multigpu.h

diff --git a/lib/intel_multigpu.c b/lib/intel_multigpu.c
new file mode 100644
index 000000000..34c9f936d
--- /dev/null
+++ b/lib/intel_multigpu.c
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include "igt_core.h"
+#include "igt_device_scan.h"
+#include "intel_multigpu.h"
+
+void gem_require_multigpu(int count)
+{
+	struct igt_devices_print_format fmt = {
+		.type = IGT_PRINT_SIMPLE,
+		.option = IGT_PRINT_PCI,
+	};
+	int devices;
+
+	if (igt_device_filter_count() >= count)
+		return;
+
+	igt_info("PCI devices available in the system:\n");
+
+	igt_devices_scan(true);
+	devices = igt_device_filter_pci();
+	igt_devices_print(&fmt);
+
+	igt_skip("Test requires at least %d GPUs, %d available.\n", count, devices);
+}
diff --git a/lib/intel_multigpu.h b/lib/intel_multigpu.h
new file mode 100644
index 000000000..98dc5a4ce
--- /dev/null
+++ b/lib/intel_multigpu.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef __INTEL_MULTIGPU_H
+#define __INTEL_MULTIGPU_H
+
+void gem_require_multigpu(int count);
+
+#endif /* __INTEL_MULTIGPU_H */
diff --git a/lib/meson.build b/lib/meson.build
index 0fc11b26c..189017f05 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -65,6 +65,7 @@ lib_sources = [
 	'intel_device_info.c',
 	'intel_mmio.c',
 	'intel_mocs.c',
+	'intel_multigpu.c',
 	'intel_pat.c',
 	'ioctl_wrappers.c',
 	'media_spin.c',
-- 
2.42.0

