Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A2AC46CD2
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jan 2024 20:42:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FAEA10F645;
	Wed, 24 Jan 2024 20:42:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6602910F645
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jan 2024 20:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706128921; x=1737664921;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BKo63Wbod0Hrg+2V7vAJYc+S1GudTDga5/Z0P92Kip8=;
 b=SM8PcPZbfAcI4bEUgOjGbCefixpOuCd4aO0H4iFoADjQ2jJn3EZycGlO
 OCdnmsYjjPcLX2BS7JV8lVF/Vz79ui8Mn6YQdRiQe/4zfrYG1vYQQsHmg
 P5cyDb2rJidXcAkCa43knprwA1Pq7nUBTgH6ip3pEyMmb+v46mAWStFk9
 LCYjo02FCsJ4bBfGe7jlG9J8cQHP+netJwiKdA+QvHIVQO13iDYDLWrV1
 RxUw7EVJrmbZ1/e5Js1Nz+6gSy8r6FtbtmfVJ4Y681RNZIXN5YDRuIOya
 p/Y7gzManF0ac/HyxRjv2c3A20jkyxYXbj9UQ2UoE0RtKr+8bRBYhZLc1 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="399121838"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="399121838"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 12:42:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="28250944"
Received: from unknown (HELO localhost) ([10.245.100.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 12:41:58 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 4/8] lib/intel_multigpu: Introduce library for
 multi-GPU scenarios
Date: Wed, 24 Jan 2024 21:41:30 +0100
Message-ID: <20240124204134.71451-5-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240124204134.71451-1-kamil.konieczny@linux.intel.com>
References: <20240124204134.71451-1-kamil.konieczny@linux.intel.com>
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
index 000000000..988c20033
--- /dev/null
+++ b/lib/intel_multigpu.c
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include "intel_multigpu.h"
+#include "igt_core.h"
+#include "igt_device_scan.h"
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

