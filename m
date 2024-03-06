Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 042E9C54E41
	for <igt-dev@archiver.kernel.org>; Wed,  6 Mar 2024 13:32:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 949391131B6;
	Wed,  6 Mar 2024 13:32:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MzNXeqQd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C01C1131B6
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Mar 2024 13:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709731937; x=1741267937;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MEr4EojzbelHuwvloPzmhTq5uot/Brs8CeXM0bG9HuY=;
 b=MzNXeqQduXeM02L+ecL4Q3evOKhsZAxtfeWrWBQ1FUGVS95+2GJy7pT3
 DzttRU0rKojZpfQlU0uQKrQPm+QuN5J6xQSccKJ0XQCOmyifnVyMTvjum
 guYFz+E60Qp7mvn4Laz7HQfGtmJIxaNqxdLlx5776WOcDq6Byzk/btunM
 lUShDeGMRp9j441pOi5sAlA2BV49TsqAVBuYJPikemPoAgRAkYt6cEwO5
 CdLXp8dwmaX88mEAmkSDcG/azF0piGit/2asX4+WDD9Ofg0WwcRyZjspA
 q4Odpoi/6coEVSZ0rNJQAwKdwpLWwcGsCJMcW9s+pPcC4LALCd0L+SKFq w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="21866248"
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; d="scan'208";a="21866248"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 05:32:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; d="scan'208";a="10316107"
Received: from unknown (HELO localhost) ([10.245.244.145])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 05:32:15 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, 
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v11 3/6] lib/intel_multigpu: Introduce library for
 multi-GPU scenarios
Date: Wed,  6 Mar 2024 14:31:55 +0100
Message-ID: <20240306133158.45187-4-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240306133158.45187-1-kamil.konieczny@linux.intel.com>
References: <20240306133158.45187-1-kamil.konieczny@linux.intel.com>
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

Introduced gem_multigpu_count_class function that returns an actual
number of GPUs present in system, which allows for writing multi-GPU
test scenarios that does not require filter
--device pci:vendor=intel,device=discrete,card=all
to run as intended. Based on patch by Chris Wilson.

Introduced igt_multi_fork_foreach_gpu macro that helps with
writing multi-GPU test scenarios in idiomatic form:

igt_multi_fork_foreach_gpu(i915, DRIVER_INTEL)
	test_function(i915);
igt_waitchildren();

v10: squashed two commits which introduce multigpu functions (Zbigniew)
  renamed __id and id__ into __chipset/chipset__ (Zbigniew)
  used __drm_close_driver() instead of close() in first macro (Kamil)
v11: added functions descriptions (Janusz)

Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Signed-off-by: "Dominik Karol Piątkowski" <dominik.karol.piatkowski@intel.com>
[Kamil: fixed whitespace and tabs, moved to lib/intel_multigpu.*]
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/intel_multigpu.c | 62 ++++++++++++++++++++++++++++++++++++++++++++
 lib/intel_multigpu.h | 26 +++++++++++++++++++
 lib/meson.build      |  1 +
 3 files changed, 89 insertions(+)
 create mode 100644 lib/intel_multigpu.c
 create mode 100644 lib/intel_multigpu.h

diff --git a/lib/intel_multigpu.c b/lib/intel_multigpu.c
new file mode 100644
index 000000000..c4e7cf542
--- /dev/null
+++ b/lib/intel_multigpu.c
@@ -0,0 +1,62 @@
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
+/**
+ * gem_multigpu_count_class:
+ * @class: chipset, e.g. DRIVER_XE or DRIVER_INTEL
+ *
+ * Function counts number of GPU cards with the help of opening all of them.
+ *
+ * Returns: number of GPUs cards found
+ */
+int gem_multigpu_count_class(int class)
+{
+	int count = 0;
+
+	igt_foreach_gpu(fd, class)
+		count++;
+
+	return count;
+}
+
+static void print_gpus(int count, int gpu_num)
+{
+	struct igt_devices_print_format fmt = {
+		.type = IGT_PRINT_SIMPLE,
+		.option = IGT_PRINT_PCI,
+	};
+	int devices;
+
+	igt_info("PCI devices available in the system:\n");
+
+	igt_devices_scan(true);
+	devices = igt_device_filter_pci();
+	igt_devices_print(&fmt);
+
+	igt_info("Test requires at least %d GPUs, got %d, available %d\n", count, gpu_num, devices);
+}
+
+/**
+ * gem_require_multigpu:
+ * @count: minimum number of GPUs required found with filters
+ *
+ * Function checks number of filtered GPU cards.
+ * On error prints available GPUs found on PCI bus and skips.
+ */
+void gem_require_multigpu(int gpus_wanted)
+{
+	int gpu_filters = igt_device_filter_count();
+
+	if (gpu_filters >= gpus_wanted)
+		return;
+
+	print_gpus(gpus_wanted, gpu_filters);
+	igt_skip_on(gpu_filters < gpus_wanted);
+}
diff --git a/lib/intel_multigpu.h b/lib/intel_multigpu.h
new file mode 100644
index 000000000..5acfcd5f6
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
+#include "drmtest.h"
+#include "igt_core.h"
+
+void gem_require_multigpu(int count);
+int gem_multigpu_count_class(int chipset);
+
+#define igt_foreach_gpu(fd__, chipset__) \
+	for (int igt_unique(i) = 0, fd__; \
+		(fd__ = __drm_open_driver_another(igt_unique(i)++, chipset__)) >= 0; \
+		__drm_close_driver(fd__))
+
+#define igt_multi_fork_foreach_gpu(__fd, __chipset) \
+	igt_multi_fork(igt_unique(__i), gem_multigpu_count_class(__chipset)) \
+		for (int __fd = drm_open_driver_another(igt_unique(__i), __chipset); \
+			__fd >= 0; \
+			drm_close_driver(__fd), __fd = -1) \
+
+#endif /* __INTEL_MULTIGPU_H */
diff --git a/lib/meson.build b/lib/meson.build
index 6122861d8..8251695e1 100644
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

