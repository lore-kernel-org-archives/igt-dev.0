Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A436FE7717F
	for <igt-dev@archiver.kernel.org>; Fri, 13 Dec 2024 07:59:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C6EE10EF29;
	Fri, 13 Dec 2024 07:59:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ou8fdbxW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35D6010EF34
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Dec 2024 07:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734076794; x=1765612794;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xdwDZzsRbd7lsx8z0YgE5oL5OYyE5u2K0N4Rt/M3vWA=;
 b=Ou8fdbxWpSsz/TCJv6GELTXhgwnB7XH1C9fHedcMUXUAbjCb8SwGvBU2
 j7Qv72076R5yqQlxWHiM5QfdkuUZfWtbhy/3geJoU++8hHyN8tNb5sXO2
 Hbe6yK2lUGegm+MNlZfGbaa2Olq+qsP+eEp7VIPNt72E+OwQDcXxJm4br
 4SGiMTJIWHT1C+Yi4Oc3TNDiIWFTvMN49+zXCf1CMe5b2fcpaRS+ELX/z
 Yq7J6QUqmRfpgpoWW5pGtTyYtcKv9N3vwxOKfgFDOU7UG8gP6l8bQ0F33
 KoOI0MyMwSW6sS+dczShQ/nJQdXSc4aezzUCesnQFi15/FqhAhkTD5VX4 g==;
X-CSE-ConnectionGUID: pvY3zznIT3mRM0HjaTO4yA==
X-CSE-MsgGUID: 8EB9DfsfR3mhcZ2yJR7SZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="38201509"
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; d="scan'208";a="38201509"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 23:59:54 -0800
X-CSE-ConnectionGUID: MNabcEYGSm+mfJRATCK12Q==
X-CSE-MsgGUID: 1wCGs0eXS/K2FEvaE88WCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="101433929"
Received: from pgurram-desk.iind.intel.com ([10.145.169.87])
 by orviesa005.jf.intel.com with ESMTP; 12 Dec 2024 23:59:53 -0800
From: Pravalika Gurram <pravalika.gurram@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH] tests/intel/xe_vm_create: Check negative cases for vm_create
 ioctl
Date: Fri, 13 Dec 2024 13:27:24 +0530
Message-Id: <20241213075724.641859-1-pravalika.gurram@intel.com>
X-Mailer: git-send-email 2.34.1
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

Negative test to check vm_create ioctl returns expected error when
invalid flags, extensions, reserved  param is used.

Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
---
 tests/intel/xe_vm_create.c | 104 +++++++++++++++++++++++++++++++++++++
 tests/meson.build          |   1 +
 2 files changed, 105 insertions(+)
 create mode 100644 tests/intel/xe_vm_create.c

diff --git a/tests/intel/xe_vm_create.c b/tests/intel/xe_vm_create.c
new file mode 100644
index 000000000..2430e6739
--- /dev/null
+++ b/tests/intel/xe_vm_create.c
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2024 Intel Corporation
+ */
+
+#include "igt.h"
+#include "xe_drm.h"
+
+/**
+ * TEST: Negative test for vm create ioctl
+ * Category: Core
+ * Mega feature: General Core features
+ * Sub-category: Synchronization
+ * Functionality: vm create
+ * Test category: negative test
+ */
+
+/**
+ * SUBTEST: invalid-flag-%s
+ * Description:  function %arg[1] used in vm create IOCTL to make it fail
+ * Functionality: fault
+ *
+ * arg[1]:
+ * @xe_vm_create_fault:  xe_vm_create_fault
+ * @xe_vm_create_scrach_fault: xe_vm_create_scrach_fault
+ * @xe_vm_create_scrach_fault_lr:    xe_vm_create_scrach_fault_lr
+ */
+
+static void invalid_flag(int fd, __u32 flags)
+{
+	struct drm_xe_vm_create create = {
+		.flags = flags,
+	};
+
+	do_ioctl_err(fd, DRM_IOCTL_XE_VM_CREATE, &create, EINVAL);
+
+}
+
+/**
+ * SUBTEST: invalid-extensions
+ * Description: Check query with invalid extensions returns expected error code
+ *
+ * SUBTEST: invalid-reserved
+ * Description: Check query with invalid reserved value returns expected error code
+ */
+
+static void inavlid_extensions(int fd)
+{
+	struct drm_xe_vm_create create = {
+		.extensions = -1,
+	};
+
+	do_ioctl_err(fd, DRM_IOCTL_XE_VM_CREATE, &create, EINVAL);
+
+}
+
+static void inavlid_reserved(int fd)
+{
+	struct drm_xe_vm_create create = {
+		.reserved[0] = 0xffff,
+	};
+
+	do_ioctl_err(fd, DRM_IOCTL_XE_VM_CREATE, &create, EINVAL);
+
+}
+
+igt_main
+{
+	int fd;
+
+	const struct section {
+		const char *name;
+		__u32 flags;
+	} vm_create_flags_fail_functions[] = {
+		{ "xe_vm_create_fault", DRM_XE_VM_CREATE_FLAG_FAULT_MODE },
+		{ "xe_vm_create_scrach_fault",
+			DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE |
+			DRM_XE_VM_CREATE_FLAG_FAULT_MODE },
+		{ "xe_vm_create_scrach_fault_lr",
+			~(DRM_XE_VM_CREATE_FLAG_LR_MODE |
+			DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE |
+			DRM_XE_VM_CREATE_FLAG_FAULT_MODE) },
+		{ }
+	};
+
+	igt_fixture
+		fd = drm_open_driver(DRIVER_XE);
+
+	for (const struct section *s = vm_create_flags_fail_functions; s->name; s++) {
+		igt_subtest_f("invalid-flag-%s", s->name)
+			invalid_flag(fd, s->flags);
+	}
+
+	igt_subtest("invalid-extensions")
+			inavlid_extensions(fd);
+
+	igt_subtest("invalid-reserved")
+			inavlid_reserved(fd);
+
+	igt_fixture {
+		drm_close_driver(fd);
+	}
+
+}
diff --git a/tests/meson.build b/tests/meson.build
index 2724c7a9a..fb9fc75d8 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -321,6 +321,7 @@ intel_xe_progs = [
 	'xe_sysfs_scheduler',
         'xe_sysfs_timeslice_duration',
         'xe_tlb',
+        'xe_vm_create',
 ]
 
 intel_xe_eudebug_progs = [
-- 
2.34.1

