Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 565EFC47DDB
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jan 2024 20:16:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F6A610E8B8;
	Tue, 23 Jan 2024 20:16:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC0410E8B8
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jan 2024 20:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706040963; x=1737576963;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w8m2ee0dcnFq3NlUa3k/QUSphbR8gMk3ekvJtSBp9cM=;
 b=JH7oDKI2P5DopN3b8ANH5jRmeaR0nPiVgG2v8MNuwOiGmweVcEqDb0a4
 wUbYglqQz8soLvExPwbM3oMTLdvtMUmPCdbg6fnCe9hLbyo4Rr4/jaKGi
 4ZE/kGTi7nZG2/uTAqOB4Khz5m0jgWs/3PShq1DXpX20RZ4a0gYKEmvWc
 IPUvTJ73PKeGRkvL1qDepmBvMtu0+7gawaQauA9aYBQAIuOGRm+LzExYx
 hXxJbQeZpQTfp3QyoxYEmGcDzaw4ovl4+R8Pcbh+PFoGSBTz5wX+RPtCr
 z6n6p6w85i/UJbmmKT/OTANRnP0/nEOncwxWNbRKMOFpgg4ABuhSxBKnR A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8755554"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="8755554"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 12:16:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="1663034"
Received: from unknown (HELO localhost) ([10.246.3.60])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 12:16:00 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v1 4/8] lib/intel_multigpu: Introduce library for
 multi-GPU scenarios
Date: Tue, 23 Jan 2024 21:15:31 +0100
Message-ID: <20240123201535.108793-5-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240123201535.108793-1-kamil.konieczny@linux.intel.com>
References: <20240123201535.108793-1-kamil.konieczny@linux.intel.com>
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
[Kamil: fixed whitespace and tabs, moved to intel_multigpu.*]
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/intel_multigpu.c | 29 +++++++++++++++++++++++++++++
 lib/intel_multigpu.h | 26 ++++++++++++++++++++++++++
 lib/meson.build      |  1 +
 3 files changed, 56 insertions(+)
 create mode 100644 lib/intel_multigpu.c
 create mode 100644 lib/intel_multigpu.h

diff --git a/lib/intel_multigpu.c b/lib/intel_multigpu.c
new file mode 100644
index 000000000..446e3ff5f
--- /dev/null
+++ b/lib/intel_multigpu.c
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include "drmtest.h"
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
index 000000000..5f98307fd
--- /dev/null
+++ b/lib/intel_multigpu.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef __INTEL_MULTIGPU_H
+#define __INTEL_MULTIGPU_H
+
+#include "igt_core.h"
+#include "igt_device_scan.h"
+
+void gem_require_multigpu(int count);
+int gem_multigpu_count_class(int class);
+
+#define igt_foreach_gpu(fd__, id__) \
+	for (int igt_unique(i) = 0, fd__; \
+		(fd__ = __drm_open_driver_another(igt_unique(i)++, id__)) >= 0; \
+		close(fd__))
+
+#define igt_multi_fork_foreach_gpu(__fd, id) \
+	igt_multi_fork(igt_unique(__i), gem_multigpu_count_class(id)) \
+		for (int __fd = __drm_open_driver_another(igt_unique(__i), id); \
+			__fd >= 0; \
+			close(__fd), __fd = -1) \
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

