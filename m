Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E3C9C021B8
	for <igt-dev@archiver.kernel.org>; Tue,  4 Mar 2025 16:33:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED43010E652;
	Tue,  4 Mar 2025 16:33:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CxZBSwfE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEE8510E652
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Mar 2025 16:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741105983; x=1772641983;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vSNufjRzTAO4dz/DLst8EyHjKXK1tGP/dnlD2zAzS6s=;
 b=CxZBSwfEBKAqXeiwi3rlqYSJq7jfWbZrvsAld1TBiJzP6/Hyj6TuyGoW
 L6zT8ZF1pNZLcAnYzlN89b7ZjQKjVbjmytpXa9xdRKboOQbwgCf64CE50
 cFEucfZdLcOqN1QXZx+j7SIjd1YzYBJABiYmmoTN8gk/HPl8aRnD58Vk6
 XX1Y/OniKH4BDAFbktsFa6e/D2SAdOj+tph9gMqKHpdyrRXD8cwWlMexp
 qhK36t2yU6d6/Y83JWbKnQYb9T84LBuN/HVzXNR5rxGf85sztLieE7H4B
 NHiiUkhuT/Zac8LahrUXC6WDIDshgN9LTrU0S1eQBI1+L0LqoMxGtzC3q w==;
X-CSE-ConnectionGUID: +v5u7HZYRPWYAuzSWjVuGQ==
X-CSE-MsgGUID: cAcR5fpfTYClPKFGV+SwCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="41746079"
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; d="scan'208";a="41746079"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 08:33:02 -0800
X-CSE-ConnectionGUID: QvcnMHgSSkqEHR4158uRLw==
X-CSE-MsgGUID: brPUOOY8Q9uMgU/5bQ06Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; d="scan'208";a="118146983"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.218])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 08:32:59 -0800
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH i-g-t v3 2/2] tests/intel/xe_eudebug: Add subtests for
 eudebug/SR-IOV exclusion
Date: Tue,  4 Mar 2025 17:32:27 +0100
Message-Id: <20250304163227.49986-3-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250304163227.49986-1-christoph.manszewski@intel.com>
References: <20250304163227.49986-1-christoph.manszewski@intel.com>
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

Eudebug is not supported in PF mode with VFs enabled and in VF mode.
Provide subtests to ensure that:
  1. enabling eudebug is not permitted in PF mode with VFs enabled
  2. eudebug sysfs toggle is not available in VF mode
  3. enabling VFs is not permitted when eudebug is enabled

Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
---
 tests/intel/xe_eudebug_sriov.c | 148 +++++++++++++++++++++++++++++++++
 tests/meson.build              |   1 +
 2 files changed, 149 insertions(+)
 create mode 100644 tests/intel/xe_eudebug_sriov.c

diff --git a/tests/intel/xe_eudebug_sriov.c b/tests/intel/xe_eudebug_sriov.c
new file mode 100644
index 000000000..eb13981bc
--- /dev/null
+++ b/tests/intel/xe_eudebug_sriov.c
@@ -0,0 +1,148 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+/**
+ * TEST: Test EU Debugger and SR-IOV interaction
+ * Category: Core
+ * Mega feature: EUdebug/SR-IOV
+ * Sub-category: EUdebug tests
+ * Functionality: EU Debugger framework
+ * Test category: functionality test
+ */
+
+#include "igt.h"
+#include "igt_sysfs.h"
+#include "lib/igt_sriov_device.h"
+#include "xe/xe_eudebug.h"
+
+static bool has_vf_enable_eudebug_attr(int fd, unsigned int vf_num)
+{
+	char path[PATH_MAX];
+	int sysfs;
+	bool ret;
+
+	igt_assert(vf_num > 0);
+
+	sysfs = igt_sysfs_open(fd);
+	igt_assert_fd(sysfs);
+	/* vf_num is 1-based, but virtfn is 0-based */
+	snprintf(path, sizeof(path), "device/virtfn%u/enable_eudebug", vf_num - 1);
+	ret = igt_sysfs_has_attr(sysfs, path);
+	close(sysfs);
+
+	return ret;
+}
+
+/**
+ * SUBTEST: deny-eudebug
+ * Description:
+ *	Check that eudebug toggle is not available for VFs, and that enabling
+ *	eudebug with VFs enabled is not permitted.
+ */
+static void test_deny_eudebug(int fd)
+{
+	unsigned int num_vfs = igt_sriov_get_total_vfs(fd);
+	bool err = false;
+	int sysfs;
+
+	igt_debug("Testing %u VFs\n", num_vfs);
+
+	xe_eudebug_enable(fd, false);
+	igt_sriov_enable_driver_autoprobe(fd);
+	igt_sriov_enable_vfs(fd, num_vfs);
+	igt_assert_eq(num_vfs, igt_sriov_get_enabled_vfs(fd));
+
+	for (int vf_num = 1; vf_num <= num_vfs; ++vf_num) {
+		if (!igt_sriov_is_vf_drm_driver_probed(fd, vf_num)) {
+			igt_debug("VF%u probe failed\n", vf_num);
+			err = true;
+		} else if (has_vf_enable_eudebug_attr(fd, vf_num)) {
+			igt_debug("VF%u has enable_eudebug attribute\n", vf_num);
+			err = true;
+		}
+	}
+
+	igt_assert(!err);
+
+	sysfs = igt_sysfs_open(fd);
+	igt_assert_fd(sysfs);
+	igt_assert_eq(igt_sysfs_printf(sysfs, "device/enable_eudebug", "1"), -EPERM);
+	close(sysfs);
+}
+
+/**
+ * SUBTEST: deny-sriov
+ * Description:
+ *	Check that VFs cannot be enabled when eudebug is enabled.
+ */
+static void test_deny_sriov(int fd)
+{
+	unsigned int num_vfs = igt_sriov_get_total_vfs(fd);
+	int sysfs = 0;
+
+	igt_debug("Testing %u VFs\n", num_vfs);
+
+	igt_sriov_disable_vfs(fd);
+	igt_assert_eq(0, igt_sriov_get_enabled_vfs(fd));
+	xe_eudebug_enable(fd, true);
+
+	sysfs = igt_sysfs_open(fd);
+	igt_assert_fd(sysfs);
+	igt_assert_eq(igt_sysfs_printf(sysfs, "device/sriov_numvfs", "%u", num_vfs), -EPERM);
+	close(sysfs);
+}
+
+static void restore_initial_driver_state(int fd, bool eudebug_enabled, bool vf_autoprobe)
+{
+	bool abort = false;
+
+	igt_sriov_disable_vfs(fd);
+	if (igt_sriov_get_enabled_vfs(fd) > 0) {
+		igt_debug("Failed to disable VF(s)\n");
+		abort = true;
+	}
+
+	vf_autoprobe ? igt_sriov_enable_driver_autoprobe(fd) :
+		       igt_sriov_disable_driver_autoprobe(fd);
+	if (vf_autoprobe != igt_sriov_is_driver_autoprobe_enabled(fd)) {
+		igt_debug("Failed to restore sriov_drivers_autoprobe value\n");
+		abort = true;
+	}
+
+	if (__xe_eudebug_enable_getset(fd, NULL, &eudebug_enabled) < 0) {
+		igt_debug("Failed to restore eudebug state\n");
+		abort = true;
+	}
+
+	/* abort to avoid execution of next tests with invalid driver state */
+	igt_abort_on_f(abort, "Failed to restore initial driver state\n");
+}
+
+igt_main
+{
+	bool eudebug_enabled;
+	bool vf_autoprobe;
+	int fd;
+
+	igt_fixture {
+		fd = drm_open_driver(DRIVER_XE);
+		igt_require(igt_sriov_is_pf(fd));
+		igt_require(igt_sriov_vfs_supported(fd));
+		igt_require(igt_sriov_get_enabled_vfs(fd) == 0);
+		igt_require(__xe_eudebug_enable_getset(fd, &eudebug_enabled, NULL) == 0);
+		vf_autoprobe = igt_sriov_is_driver_autoprobe_enabled(fd);
+	}
+
+	igt_subtest("deny-eudebug")
+		test_deny_eudebug(fd);
+
+	igt_subtest("deny-sriov")
+		test_deny_sriov(fd);
+
+	igt_fixture {
+		restore_initial_driver_state(fd, eudebug_enabled, vf_autoprobe);
+		close(fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 711eb899a..a2db178fb 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -333,6 +333,7 @@ intel_xe_eudebug_progs = [
 	'xe_eudebug',
 	'xe_exec_sip_eudebug',
 	'xe_eudebug_online',
+	'xe_eudebug_sriov',
 ]
 
 if build_xe_eudebug
-- 
2.34.1

