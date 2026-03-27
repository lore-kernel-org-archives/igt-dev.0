Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F6E310ED67C
	for <igt-dev@archiver.kernel.org>; Fri, 27 Mar 2026 14:06:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC46010ECA6;
	Fri, 27 Mar 2026 14:06:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U+Y4maXN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E6B10EC90
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Mar 2026 14:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774620398; x=1806156398;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0UdAsdTHyCBDgXojsz2gwVvmAOLkWzySjAjizz+eTnk=;
 b=U+Y4maXNXGOa1VGQTxQ/ey1FUXrSz7r1etQ5rf+ReBLdkKCWGkQwz9mz
 VorZuziZ/JOdHJ0tjoGDhgC4AY7M/J4wTbW3EJg8BH8qvN5BSBgDdqgNF
 W17hrJmjgPdVCnK0rf5foLFyLNDt/a6r/FVjTSDXjFfEhOeghI3JGEnMa
 Wxe700ltxEypsGVJH6DPfqXPRV9Vv3/19zblpipTZTAp1xbw6gHUqxIrO
 NhJyjy2AGPn4jiAK8BG5AHi00DxiwX9M9QIJbMD3qNywulhWiebyMEcG3
 7RfqAJv9GxjPBVrBccZdrz/gywkufSmgmy7jpuJq5MqMqEgHqCYEXUFOu w==;
X-CSE-ConnectionGUID: i6AypbFSR/OKwhOBpyYT5Q==
X-CSE-MsgGUID: +BRrEr9URai/Jydqovjz1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="98309512"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="98309512"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 07:06:38 -0700
X-CSE-ConnectionGUID: 86QdYZsWR3eUkGjtvk1pYg==
X-CSE-MsgGUID: tbk7y048Tj+ihkVyIg1JTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="263267907"
Received: from lvasutx-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.246.16.239])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 07:06:37 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, adam.miszczak@linux.intel.com,
 jakub1.kolakowski@intel.com, lukasz.laguna@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH v2 i-g-t 1/4] tests/intel/xe_sriov_vfio: Add VFIO module
 load/unload subtest
Date: Fri, 27 Mar 2026 15:06:24 +0100
Message-ID: <20260327140627.64574-2-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327140627.64574-1-marcin.bernatowicz@linux.intel.com>
References: <20260327140627.64574-1-marcin.bernatowicz@linux.intel.com>
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

Introduce the load-unload-xe-vfio-pci subtest to verify that the
xe_vfio_pci module can be loaded and unloaded. Skip the test when the
module is already loaded.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
---
v2:
- Merge load/unload into a single subtest (Lukasz)
- Simplify restore_xe_vfio_module  (Lukasz)
---
 tests/intel/xe_sriov_vfio.c | 75 +++++++++++++++++++++++++++++++++++++
 tests/meson.build           |  1 +
 2 files changed, 76 insertions(+)
 create mode 100644 tests/intel/xe_sriov_vfio.c

diff --git a/tests/intel/xe_sriov_vfio.c b/tests/intel/xe_sriov_vfio.c
new file mode 100644
index 000000000..ef92fb233
--- /dev/null
+++ b/tests/intel/xe_sriov_vfio.c
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2026 Intel Corporation. All rights reserved.
+ */
+
+#include "igt_core.h"
+#include "igt_kmod.h"
+
+/**
+ * TEST: xe_sriov_vfio
+ * Category: Core
+ * Mega feature: SR-IOV
+ * Sub-category: SR-IOV VFIO
+ * Functionality: VFIO module
+ * Description: Verify basic xe-vfio-pci module operations.
+ *
+ * SUBTEST: load-unload-xe-vfio-pci
+ * Description: Attempt to load xe_vfio_pci module and then unload it.
+ */
+
+IGT_TEST_DESCRIPTION("Xe SR-IOV VFIO tests (xe-vfio-pci)");
+
+static const char *XE_VFIO_PCI_MOD = "xe_vfio_pci";
+
+static bool xe_vfio_loaded_initially;
+
+static void restore_xe_vfio_module(void)
+{
+	bool loaded;
+	int ret;
+
+	loaded = igt_kmod_is_loaded(XE_VFIO_PCI_MOD);
+
+	if (loaded != xe_vfio_loaded_initially) {
+		ret = xe_vfio_loaded_initially ?
+			igt_kmod_load(XE_VFIO_PCI_MOD, NULL) :
+			igt_kmod_unload(XE_VFIO_PCI_MOD);
+		igt_abort_on_f(ret,
+			       "Failed to %s %s during cleanup\n",
+			       xe_vfio_loaded_initially ? "load" : "unload",
+			       XE_VFIO_PCI_MOD);
+		loaded = igt_kmod_is_loaded(XE_VFIO_PCI_MOD);
+	}
+
+	igt_abort_on_f(loaded != xe_vfio_loaded_initially,
+		       "%s should be %s after cleanup\n",
+		       XE_VFIO_PCI_MOD,
+		       xe_vfio_loaded_initially ? "loaded" : "unloaded");
+}
+
+int igt_main()
+{
+	igt_fixture() {
+		xe_vfio_loaded_initially = igt_kmod_is_loaded(XE_VFIO_PCI_MOD);
+	}
+
+	igt_describe("Attempt to load xe_vfio_pci module and then unload it.");
+	igt_subtest("load-unload-xe-vfio-pci") {
+		int ret;
+
+		igt_skip_on(xe_vfio_loaded_initially);
+
+		ret = igt_kmod_load(XE_VFIO_PCI_MOD, NULL);
+		igt_assert_f(ret == 0, "Failed to load %s (%d)\n", XE_VFIO_PCI_MOD, ret);
+		igt_assert(igt_kmod_is_loaded(XE_VFIO_PCI_MOD));
+
+		ret = igt_kmod_unload(XE_VFIO_PCI_MOD);
+		igt_assert_f(ret == 0, "Failed to unload %s (%d)\n", XE_VFIO_PCI_MOD, ret);
+		igt_assert(igt_kmod_is_loaded(XE_VFIO_PCI_MOD) == false);
+	}
+
+	igt_fixture() {
+		restore_xe_vfio_module();
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index cecb4a8ae..26d9345ec 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -337,6 +337,7 @@ intel_xe_progs = [
 	'xe_sriov_admin',
 	'xe_sriov_auto_provisioning',
 	'xe_sriov_flr',
+	'xe_sriov_vfio',
 	'xe_sriov_scheduling',
         'xe_survivability',
 	'xe_sriov_vram',
-- 
2.43.0

