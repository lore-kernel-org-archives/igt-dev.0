Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F01C36002
	for <igt-dev@archiver.kernel.org>; Mon, 24 Mar 2025 07:19:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4785F10E1B6;
	Mon, 24 Mar 2025 07:19:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eW+IoFuf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AE9810E1B6
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Mar 2025 07:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742800776; x=1774336776;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xBlVXXWiMEzFWluWpVUBhE381HDz/H3Wf3MFVbL8FMg=;
 b=eW+IoFuf1dTGBeggVO2GGljIQYc1eR0nSOsIeum2B18dZIVg1ivFG22z
 Coadp/3BPYNpPUg1Bfzl+0BCjTYprNDHwjMn4qrapGYkHjMztRKX0pu6R
 I1IwuL0lrX3d362Rkva85B/LFI6lfw2R/Jud78GzZNDfTWJWrx38OFhUE
 ornjYaoWhacsBTfjb3sLbINlpHYgpK5IelRwHwYaGN2XtE6eBw5ACve0+
 bebCSeKuIDVRZlCRC+5Wx2DdGJe0BCmOtWLM4YNfJs8Z4NVUXjgOiz8/m
 3OulwRARapteSB4se+WaI1cDpuA4QgKcnEin0c9YbVWRrv7sqLDBdrIh+ w==;
X-CSE-ConnectionGUID: XiDMlOrgTii3S8VeYO6QEQ==
X-CSE-MsgGUID: nqu7V/IMQhuYWjlHyKxkPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11382"; a="44172475"
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; d="scan'208";a="44172475"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 00:19:32 -0700
X-CSE-ConnectionGUID: w58DJ9UjQLixTqENZnuvGA==
X-CSE-MsgGUID: XH5bf0IESKa00dF3u1HsJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,271,1736841600"; d="scan'208";a="128113976"
Received: from unknown (HELO nakshtra-System-Product-Name.iind.intel.com)
 ([10.190.238.69])
 by fmviesa003.fm.intel.com with ESMTP; 24 Mar 2025 00:19:30 -0700
From: nakshtra.goyal@intel.com
To: igt-dev@lists.freedesktop.org,
	ramadevi.gandi@intel.com
Cc: francois.dugast@intel.com, sai.teja.pottumuttu@intel.com,
 ashutosh.dixit@intel.com, umesh.nerlige.ramappa@intel.com
Subject: [PATCH v4 i-g-t] tests/intel/xe_fault_injection: Inject errors during
 observation IOCTL
Date: Mon, 24 Mar 2025 12:49:18 +0530
Message-Id: <20250324071918.3119445-1-nakshtra.goyal@intel.com>
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

v1: Adding remove config at end of test , Adding igt_sysfs into igt_assert
so test fails if sysfs read fails (Sai Teja)

v2: Run sysfs check before creating config to destroy prev. config if
present, add one check before creating new config after destroying old
one (Sai Teja)

Signed-off-by: Nakshtra Goyal <nakshtra.goyal@intel.com>
---
 tests/intel/xe_fault_injection.c | 62 +++++++++++++++++++++++++++++++-
 tests/meson.build                |  1 +
 2 files changed, 62 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 5409d19a6..bc117ae40 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -21,6 +21,7 @@
 #include "lib/intel_pat.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
+#include "xe/xe_oa.h"
 
 #define INJECT_ERRNO	-ENOMEM
 #define BO_ADDR		0x1a0000
@@ -314,10 +315,57 @@ vm_bind_fail(int fd, const char function_name[])
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
+	/* Destroy previous configuration if present */
+	if (igt_sysfs_scanf(sysfs, path, "%"PRIu64, &config_id) == 1)
+		igt_assert_eq(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_REMOVE_CONFIG,
+							&config_id), 0);
+
+	memset(&config, 0, sizeof(config));
+	memcpy(config.uuid, uuid, sizeof(config.uuid));
+	config.n_regs = 1;
+	config.regs_ptr = to_user_pointer(mux_regs);
+	snprintf(path, sizeof(path), "metrics/%s/id", uuid);
+
+	igt_assert_lt(0, intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_ADD_CONFIG, &config));
+	igt_assert(igt_sysfs_scanf(sysfs, path, "%"PRIu64, &config_id) == 1);
+	igt_assert_eq(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_REMOVE_CONFIG, &config_id), 0);
+
+	ignore_faults_in_dmesg(function_name);
+	injection_list_do(INJECTION_LIST_ADD, function_name);
+	set_retval(function_name, INJECT_ERRNO);
+	igt_assert_lt(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_ADD_CONFIG, &config), 0);
+	injection_list_do(INJECTION_LIST_REMOVE, function_name);
+
+	igt_assert_lt(0, intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_ADD_CONFIG, &config));
+	igt_assert(igt_sysfs_scanf(sysfs, path, "%"PRIu64, &config_id) == 1);
+	igt_assert_eq(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_REMOVE_CONFIG, &config_id), 0);
+}
+
 igt_main
 {
-	int fd;
+	int fd, sysfs;
 	struct drm_xe_engine_class_instance *hwe;
+	static uint32_t devid;
 	char pci_slot[NAME_MAX];
 	const struct section {
 		const char *name;
@@ -366,9 +414,16 @@ igt_main
 		{ }
 	};
 
+	const struct section oa_add_config_fail_functions[] = {
+		{ "xe_oa_alloc_regs"},
+		{ }
+	};
+
 	igt_fixture {
 		igt_require(fail_function_injection_enabled());
 		fd = drm_open_driver(DRIVER_XE);
+		devid = intel_get_drm_devid(fd);
+		sysfs = igt_sysfs_open(fd);
 		igt_device_get_pci_slot_name(fd, pci_slot);
 		setup_injection_fault();
 	}
@@ -393,6 +448,10 @@ igt_main
 				if (hwe->engine_class == DRM_XE_ENGINE_CLASS_VM_BIND)
 					exec_queue_create_fail(fd, hwe, s->name, s->flags);
 
+	for (const struct section *s = oa_add_config_fail_functions; s->name; s++)
+		igt_subtest_f("oa-add-config-fail-%s", s->name)
+			oa_add_config_fail(fd, sysfs, devid, s->name);
+
 	igt_fixture {
 		xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_UNBIND);
 	}
@@ -402,6 +461,7 @@ igt_main
 			inject_fault_probe(fd, pci_slot, s->name);
 
 	igt_fixture {
+		close(sysfs);
 		drm_close_driver(fd);
 		xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_BIND);
 	}
diff --git a/tests/meson.build b/tests/meson.build
index 2f5406523..c4a9093c4 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -401,6 +401,7 @@ extra_dependencies = {
 	'perf_pmu':  [ lib_igt_perf ],
 	'sw_sync': [ libatomic ],
 	'xe_oa': [ lib_igt_xe_oa ],
+	'xe_fault_injection': [ lib_igt_xe_oa ],
 }
 
 test_executables = []
-- 
2.34.1

