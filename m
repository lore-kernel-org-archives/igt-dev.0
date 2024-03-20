Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E028EC6FD1F
	for <igt-dev@archiver.kernel.org>; Wed, 20 Mar 2024 15:57:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 521A610FDB4;
	Wed, 20 Mar 2024 15:57:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b8eolzCF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD0110FDAB
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2024 15:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710950237; x=1742486237;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cFvHDlDPvtNgVsUk4I0ZQHsgsWlbZzkTqhvMETJdbdU=;
 b=b8eolzCFnyZPjD3Dy5bL38qgoWeFHl61gBgVS3W8AN6k4p2/skmWfnC/
 DgRdQzBK7FmY5jwbo8XkUlGCLu0iuJd1OWgT8SYzpU+PpCCQR+wxK38b3
 kmvos9IT1KU/KCZirw7fNtqeRNwpRT3zCaBkz156Xh8LAqmdr5mYJshZZ
 oeeNVuE1bQH86VbGW/Qe0RUC9l7HwoTqkUIDmnCxc71FrR9ZVWlfsRgap
 Gkn6h6pCFnxYKVhnJGCcL5uZ2NhC1ONN3pMi4SE/XpQ0FMsIaQwH7shkM
 V6DF1gyVVMzHmVIUjZ2p+HwWhkvPjIExCsUrBlKNsDUeIBdQwtRSQOmGg A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="6002383"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="6002383"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 08:57:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; d="scan'208";a="14076114"
Received: from unknown (HELO localhost) ([10.245.246.243])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 08:57:15 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, 
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v14 3/5] lib/igt_multigpu: Introduce library for
 multi-GPU scenarios
Date: Wed, 20 Mar 2024 16:56:57 +0100
Message-ID: <20240320155659.33518-4-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240320155659.33518-1-kamil.konieczny@linux.intel.com>
References: <20240320155659.33518-1-kamil.konieczny@linux.intel.com>
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

Implemented igt_require_multigpu in order to replace
igt_require(gpu_count > 1), as well as printing available
PCI devices if requirement fails.

Introduced igt_multigpu_count_class function that returns an actual
number of GPUs present in system, which allows for writing multi-GPU
test scenarios that does not require filter
--device pci:vendor=intel,device=discrete,card=all
to run as intended. Based on patch by Chris Wilson.

Introduced igt_multi_fork_foreach_gpu macro that helps with
writing multi-GPU test scenarios in idiomatic form:

igt_multi_fork_foreach_gpu(i915, DRIVER_INTEL)
	test_function(i915);
igt_waitchildren();

This is multi-GPU ready as it will run also on single GPU
board. For running tests on two or more GPUs there is new
igt_multi_fork_foreach_multigpu macro.

v10: squashed two commits which introduce multigpu functions (Zbigniew)
  renamed __id and id__ into __chipset/chipset__ (Zbigniew)
  used __drm_close_driver() instead of close() in first macro (Kamil)
v11: added functions descriptions (Janusz)
v12: moved to igt_multigpu.c/h (Janusz)
 changed names from gem_ to igt_, removed '\' from end of macro (Janusz)
v13: added new macro igt_multi_fork_foreach_multigpu which will require
 two or more GPUs, changing old igt_multi_fork_foreach_gpu to work with
 one or more GPUs, so tests using _gpu will be multi-GPU ready (Janusz)
v14: dropped multigpu_open_another and replace it with
 drm_open_driver_another, extending description (Janusz)

Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Signed-off-by: "Dominik Karol Piątkowski" <dominik.karol.piatkowski@intel.com>
[Kamil: fixed whitespace and tabs, moved to lib/igt_multigpu.*]
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_multigpu.c | 88 ++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_multigpu.h | 36 +++++++++++++++++++
 lib/meson.build    |  1 +
 3 files changed, 125 insertions(+)
 create mode 100644 lib/igt_multigpu.c
 create mode 100644 lib/igt_multigpu.h

diff --git a/lib/igt_multigpu.c b/lib/igt_multigpu.c
new file mode 100644
index 000000000..be0c11332
--- /dev/null
+++ b/lib/igt_multigpu.c
@@ -0,0 +1,88 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include "drmtest.h"
+#include "i915/gem.h"
+#include "igt_core.h"
+#include "igt_device_scan.h"
+#include "igt_multigpu.h"
+
+/**
+ * igt_multigpu_count_class:
+ * @class: chipset, e.g. DRIVER_XE or DRIVER_INTEL
+ *
+ * Function counts number of GPU cards with the help of opening all of them.
+ *
+ * Returns: number of GPUs cards found
+ */
+int igt_multigpu_count_class(int class)
+{
+	int count = 0;
+
+	igt_foreach_gpu(fd, class)
+		count++;
+
+	return count;
+}
+
+static int print_gpus(int count, int gpu_num)
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
+	return devices;
+}
+
+/**
+ * igt_require_filtered_multigpu:
+ * @count: minimum number of GPUs required found with filters
+ *
+ * Function checks number of filtered GPU cards.
+ * On error prints available GPUs found on PCI bus and skips.
+ */
+int igt_require_filtered_multigpu(int gpus_wanted)
+{
+	int gpu_count = igt_device_filter_count();
+	int num;
+
+	if (gpu_count >= gpus_wanted)
+		return gpu_count;
+
+	num = print_gpus(gpus_wanted, gpu_count);
+	igt_skip_on_f(gpu_count < gpus_wanted, "Test requires at least %d GPUs, got %d, available: %d\n", gpus_wanted, gpu_count, num);
+
+	return 0; /* unreachable */
+}
+
+/**
+ * igt_require_multigpu:
+ * @count: minimum number of GPUs required
+ * @chipset: for example DRIVER_XE or DRIVER_INTEL
+ *
+ * Function checks number of GPU cards with __drm_open_driver_another()
+ * On error prints available GPUs found on PCI bus and skips.
+ */
+int igt_require_multigpu(int gpus_wanted, unsigned int chipset)
+{
+	int gpu_filters = igt_multigpu_count_class(chipset);
+	int num;
+
+	if (gpu_filters >= gpus_wanted)
+		return gpu_filters;
+
+	num = print_gpus(gpus_wanted, gpu_filters);
+	igt_skip_on_f(gpu_filters < gpus_wanted, "Test requires at least %d GPUs, got %d, available: %d\n", gpus_wanted, gpu_filters, num);
+
+	return 0; /* unreachable */
+}
diff --git a/lib/igt_multigpu.h b/lib/igt_multigpu.h
new file mode 100644
index 000000000..b002f98e0
--- /dev/null
+++ b/lib/igt_multigpu.h
@@ -0,0 +1,36 @@
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
+int igt_multigpu_count_class(int chipset);
+int igt_require_filtered_multigpu(int count);
+int igt_require_multigpu(int count, unsigned int chipset);
+
+#define igt_foreach_gpu(fd__, chipset__) \
+	for (int igt_unique(i) = 0, fd__; \
+		(fd__ = __drm_open_driver_another(igt_unique(i)++, (chipset__))) >= 0; \
+		__drm_close_driver(fd__))
+
+#define igt_multi_fork_foreach_gpu_num(__fd, __gpu_idx, __chipset, __wanted) \
+	for (int igt_unique(__j) = igt_require_multigpu((__wanted), (__chipset)); \
+	     igt_unique(__j) != -1; \
+	     igt_unique(__j) = -1) \
+		igt_multi_fork(__gpu_idx, igt_unique(__j)) \
+			for (int __fd = drm_open_driver_another(__gpu_idx, (__chipset)); \
+			     __fd >= 0; \
+			     drm_close_driver(__fd), __fd = -1)
+
+#define igt_multi_fork_foreach_gpu(__fd, __gpu_idx, __chipset) \
+		igt_multi_fork_foreach_gpu_num(__fd, __gpu_idx, (__chipset), 1)
+
+#define igt_multi_fork_foreach_multigpu(__fd, __gpu_idx, __chipset) \
+		igt_multi_fork_foreach_gpu_num(__fd, __gpu_idx, (__chipset), 2)
+
+#endif /* __INTEL_MULTIGPU_H */
diff --git a/lib/meson.build b/lib/meson.build
index 934bac5c6..a5651571b 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -66,6 +66,7 @@ lib_sources = [
 	'intel_device_info.c',
 	'intel_mmio.c',
 	'intel_mocs.c',
+	'igt_multigpu.c',
 	'intel_pat.c',
 	'ioctl_wrappers.c',
 	'media_spin.c',
-- 
2.42.0

