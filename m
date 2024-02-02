Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7091CC48291
	for <igt-dev@archiver.kernel.org>; Fri,  2 Feb 2024 15:35:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C48C10E7ED;
	Fri,  2 Feb 2024 15:35:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a0CC/jJp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F4FC10EB8A
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Feb 2024 15:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706888141; x=1738424141;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3wv8c5/hT0x5BuvHTmLSKAJ1Ow7R0OLLPPWRSfVU4tY=;
 b=a0CC/jJpc1SlbVf4bIj/1p4fhWzmJbJD1sEQ+ghJDXwvNA/LJbg9EHOS
 u1C2PSu59Ti7tOtA91ekoaFt8VNGBV1Ceeb1RxLY38AxMyTbwprScFv0J
 TRoep8KJIQSyruHEI+pkGo8pzFH/C9vzl2+jbMv1YnMqoVo+VCc8RDJCK
 duwtL2r72JhpTY5f0FkQbeaoh/var4UAu/z2mkcEO8idkVtKYS0pV1B5K
 ouA0tRp+s1zVSOHlp38z5iMfjEc3PTCtbYbn6LytEE7DOqwa9SEKV7Upr
 eftLsKJnREi4u+36y63FOH5BQmsN4xwzp5Rho4CJAMMMJ3oLnsznH4cAi g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="10783759"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="10783759"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 07:35:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="4846339"
Received: from unknown (HELO localhost) ([10.246.4.105])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 07:35:40 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, 
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v7 4/8] lib/intel_multigpu: Introduce library for
 multi-GPU scenarios
Date: Fri,  2 Feb 2024 16:35:13 +0100
Message-ID: <20240202153517.58281-5-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240202153517.58281-1-kamil.konieczny@linux.intel.com>
References: <20240202153517.58281-1-kamil.konieczny@linux.intel.com>
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

Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
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

