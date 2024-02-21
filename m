Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54288C48BEB
	for <igt-dev@archiver.kernel.org>; Wed, 21 Feb 2024 16:47:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCE9710E1B6;
	Wed, 21 Feb 2024 16:46:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YIh5RXZ6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2B7C10E1B6
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Feb 2024 16:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708534019; x=1740070019;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ilTdxC/Ituu6XwsKANE6gdGR2xzVKjCpN4HnSTAt/Sc=;
 b=YIh5RXZ6Ni6HDeQZ1vtyUHHQNM/GRESjR4bMTabLdrf9Dvb+QFAlqIC8
 s2hU4H2wwDlIxF2TbqkxWmG6CNcvBipGCtNjhPVcz5qqpjjJbWR5lHEVD
 CTZ/ozzVigYIBcMxCxfJi8dMrF32G4UtxZ02H0NKPPAWfTOBbRmcoK/RT
 yweYszjEzmkubc8M7ebG/FCeqEnnOs4V2F6PYeajaxRLuXmNznH/iM0ci
 /PAZ+UgBtj0X+2mppZni+HmeTOU8Jky7fpiskhoG6kdm7IZmZIk1lmdJq
 agqTRlrhizvyStrh2oHJgfuIMNpvuv+J6/ecDDRfbeDC8cz5YoS6tkE6z w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="2851470"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="2851470"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 08:46:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; d="scan'208";a="42663234"
Received: from unknown (HELO localhost) ([10.246.5.230])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 08:46:57 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, 
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v10 3/6] lib/intel_multigpu: Introduce library for
 multi-GPU scenarios
Date: Wed, 21 Feb 2024 17:46:34 +0100
Message-ID: <20240221164637.116048-4-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240221164637.116048-1-kamil.konieczny@linux.intel.com>
References: <20240221164637.116048-1-kamil.konieczny@linux.intel.com>
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

Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Signed-off-by: "Dominik Karol Piątkowski" <dominik.karol.piatkowski@intel.com>
[Kamil: fixed whitespace and tabs, moved to lib/intel_multigpu.*]
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/intel_multigpu.c | 39 +++++++++++++++++++++++++++++++++++++++
 lib/intel_multigpu.h | 26 ++++++++++++++++++++++++++
 lib/meson.build      |  1 +
 3 files changed, 66 insertions(+)
 create mode 100644 lib/intel_multigpu.c
 create mode 100644 lib/intel_multigpu.h

diff --git a/lib/intel_multigpu.c b/lib/intel_multigpu.c
new file mode 100644
index 000000000..0e76d8aa3
--- /dev/null
+++ b/lib/intel_multigpu.c
@@ -0,0 +1,39 @@
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

