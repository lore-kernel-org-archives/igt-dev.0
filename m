Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D8A9C19F2E
	for <igt-dev@archiver.kernel.org>; Wed, 26 Feb 2025 23:21:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CDE010E9F4;
	Wed, 26 Feb 2025 23:21:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hqYDSR27";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 818BC10E9F4
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Feb 2025 23:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740612064; x=1772148064;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LSjWrxyRCVJkiY4E3CYu2ehtbkNxEf3DwrtbR0htSGg=;
 b=hqYDSR27QGD9DjjAf2wLH9P9Ncq+WKPqkizkDYvKfun7WU/b6wsFCqEt
 U28U2mpYuvI96bY7v37PyM0qtxaLrAnq73K4rTmo2m8gUy9Wrl++v91PK
 /bIfSuZ5J7j4Pern6IUvly7YVM8uYXyFkSt+kZp81YV3//FfQDuwHWVtw
 WVEnTMG6Z+L96ReNtJ/uMFPeF6Xsk1jlnApaY0JurtMBRul0lTnhynmbO
 0niBDp4DsfSITKrdUKMoCfyHdSa3JOqxLpNLRtCnRwUZsdkC002KhKTV7
 uZtdArGyoqe396NLqHdo6O+SV2qGT+2c+S9vNX/HI7XaKWZ4WjP8Mn/MP A==;
X-CSE-ConnectionGUID: iiCo+0BfT5yWzCvPvzgBEA==
X-CSE-MsgGUID: THs51PvYRMCs2amrjsiDXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="45137539"
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; d="scan'208";a="45137539"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 15:21:03 -0800
X-CSE-ConnectionGUID: BtY5h9DiTLSUL7jYjqLfGA==
X-CSE-MsgGUID: j/Cjs6UfQ1C9PoKvDY8EFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; d="scan'208";a="121786626"
Received: from unknown (HELO nakshtra-System-Product-Name.iind.intel.com)
 ([10.190.238.69])
 by orviesa003.jf.intel.com with ESMTP; 26 Feb 2025 15:21:01 -0800
From: nakshtra.goyal@intel.com
To: igt-dev@lists.freedesktop.org,
	ramadevi.gandi@intel.com
Cc: francois.dugast@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_fault_injection: Inject errors during
 observation IOCTL
Date: Thu, 27 Feb 2025 04:50:55 +0530
Message-Id: <20250226232055.2835226-1-nakshtra.goyal@intel.com>
X-Mailer: git-send-email 2.34.1
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

From: Nakshtra Goyal <nakshtra.goyal@intel.com>

Use the fault injection infrastructure to make targeted internal KMD
functions fail when executing xe_observation_ioctl()
so that more code paths are tested, such as error handling and unwinding.

Signed-off-by: Nakshtra Goyal <nakshtra.goyal@intel.com>
---
 tests/intel/xe_fault_injection.c | 54 +++++++++++++++++++++++++++++++-
 tests/meson.build                |  1 +
 2 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index ede483535..09792bc34 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -20,6 +20,7 @@
 #include "lib/igt_syncobj.h"
 #include "lib/intel_pat.h"
 #include "xe/xe_ioctl.h"
+#include "xe/xe_oa.h"
 #include "xe/xe_query.h"
 
 #define INJECT_ERRNO	-ENOMEM
@@ -281,9 +282,49 @@ vm_bind_fail(int fd, const char function_name[])
 	igt_assert_eq(simple_vm_bind(fd, vm), 0);
 }
 
+/**
+ * SUBTEST: oa-add-config-fail-%s
+ * Description: inject an error in function %arg[1] used in oa add config IOCTL to make it fail
+ * Functionality: fault
+ *
+ * arg[1]:
+ * @xe_oa_alloc_regs:		xe_oa_alloc_regs
+ */
+static void
+oa_add_config_fail(int fd, int sysfs, int devid, const char function_name[])
+{
+	char path[512];
+	uint64_t config_id;
+#define SAMPLE_MUX_REG (intel_graphics_ver(devid) >= IP_VER(20, 0) ?	\
+			0x13000 /* PES* */ : 0x9888 /* NOA_WRITE */)
+
+	uint32_t mux_regs[] = { SAMPLE_MUX_REG, 0x0 };
+	struct drm_xe_oa_config config;
+	const char *uuid = "01234567-0123-0123-0123-0123456789ab";
+
+	memset(&config, 0, sizeof(config));
+	memcpy(config.uuid, uuid, sizeof(config.uuid));
+	config.n_regs = 1;
+	config.regs_ptr = to_user_pointer(mux_regs);
+	snprintf(path, sizeof(path), "metrics/%s/id", uuid);
+
+	igt_assert_lt(0, intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_ADD_CONFIG, &config));
+	if (igt_sysfs_scanf(sysfs, path, "%"PRIu64, &config_id) == 1)
+		igt_assert_eq(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_REMOVE_CONFIG, &config_id), 0);
+
+	ignore_faults_in_dmesg(function_name);
+	injection_list_do(INJECTION_LIST_ADD, function_name);
+	set_retval(function_name, INJECT_ERRNO);
+	igt_assert_lt(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_ADD_CONFIG, &config), 0);
+	injection_list_do(INJECTION_LIST_REMOVE, function_name);
+
+	igt_assert_lt(0, intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_ADD_CONFIG, &config));
+}
+
 igt_main
 {
-	int fd;
+	int fd, sysfs;
+	static uint32_t devid;
 	char pci_slot[NAME_MAX];
 	const struct section {
 		const char *name;
@@ -319,10 +360,16 @@ igt_main
 		{ "xe_sync_entry_parse" },
 		{ }
 	};
+	const struct section oa_add_config_fail_functions[] = {
+		{ "xe_oa_alloc_regs"},
+		{ }
+	};
 
 	igt_fixture {
 		igt_require(fail_function_injection_enabled());
 		fd = drm_open_driver(DRIVER_XE);
+		devid = intel_get_drm_devid(fd);
+		sysfs = igt_sysfs_open(fd);
 		igt_device_get_pci_slot_name(fd, pci_slot);
 		setup_injection_fault();
 	}
@@ -335,6 +382,10 @@ igt_main
 		igt_subtest_f("vm-bind-fail-%s", s->name)
 			vm_bind_fail(fd, s->name);
 
+	for (const struct section *s = oa_add_config_fail_functions; s->name; s++)
+		igt_subtest_f("oa-add-config-fail-%s", s->name)
+			oa_add_config_fail(fd, sysfs, devid, s->name);
+
 	igt_fixture {
 		xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_UNBIND);
 	}
@@ -344,6 +395,7 @@ igt_main
 			inject_fault_probe(fd, pci_slot, s->name);
 
 	igt_fixture {
+		close(sysfs);
 		drm_close_driver(fd);
 		xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_BIND);
 	}
diff --git a/tests/meson.build b/tests/meson.build
index a0f984b34..ca5565c21 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -398,6 +398,7 @@ extra_dependencies = {
 	'perf_pmu':  [ lib_igt_perf ],
 	'sw_sync': [ libatomic ],
 	'xe_oa': [ lib_igt_xe_oa ],
+	'xe_fault_injection': [ lib_igt_xe_oa ],
 }
 
 test_executables = []
-- 
2.34.1

