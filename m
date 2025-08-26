Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47813CA0FED
	for <igt-dev@archiver.kernel.org>; Tue, 26 Aug 2025 20:18:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 023C710E6A7;
	Tue, 26 Aug 2025 20:18:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="myJqXB38";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0CB610E16A
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Aug 2025 20:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756239513; x=1787775513;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vGeQ1WvtyQ/hP2aidLzZ3DkqyKQoo7LAV75/9VKwPBQ=;
 b=myJqXB38ZaUjD4XbICaX7Pk3l07O3vJSMyxOd4VDUbSaFdBAOB+YY7sO
 EGKXYxE0ePLTwu+BC371+OvEzLMapx9nnRdAYanDISsqzNDfUnc84sYae
 BYFPq9pXb5w8NxQIYVGpO39JTCY1eneYYximQYFyvHqM/gD0TZ2sox3AX
 POPusLSHKTv39Ztl3wDrB5l3hBs3PZ5OIzgHH6zVFMIOSYotIfJbN6yeW
 s60FiHPhj9zVLXdLlnPwncxQRwK5voiuYlOxCPwAW592G8Vqu20UawOja
 aXp8NVQF4jqQSoykwyYIFHJtHXO3tXjD2uZ761lA/b9QnNVXrYuUbjfTT w==;
X-CSE-ConnectionGUID: 27hKHGvVSB6kTVUSRo07MA==
X-CSE-MsgGUID: Y9lKtydrT8WNqbBN0xfTvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="46068142"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="46068142"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 13:18:32 -0700
X-CSE-ConnectionGUID: JB4Klv6vR8i1M9Wv6e2HPA==
X-CSE-MsgGUID: H2J1EUBiRH6DMTPSu+4Xjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="168907880"
Received: from dut4086lnl.fm.intel.com ([10.105.10.138])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 13:18:32 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 john.c.harrison@intel.com, matthew.brost@intel.com
Subject: [PATCH v2 3/4] tests/intel/xe_oa: Move oa fault tests from
 xe_fault_injection to xe_oa
Date: Tue, 26 Aug 2025 20:18:28 +0000
Message-ID: <20250826201829.190241-9-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250826201829.190241-6-jonathan.cavitt@intel.com>
References: <20250826201829.190241-6-jonathan.cavitt@intel.com>
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

Move the fault injection tests that exercise the xe oa ioctl from the
xe_fault_injection test suite to the xe_oa test suite.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 tests/intel/xe_fault_injection.c | 62 ----------------------------
 tests/intel/xe_oa.c              | 71 ++++++++++++++++++++++++++++++++
 2 files changed, 71 insertions(+), 62 deletions(-)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 8fe4f1953a..92b09cbb90 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -270,57 +270,6 @@ vm_bind_fail(int fd, const char pci_slot[], const char function_name[])
 	igt_assert_eq(simple_vm_bind(fd, vm), 0);
 }
 
-/**
- * SUBTEST: oa-add-config-fail-%s
- * Description: inject an error in function %arg[1] used in oa add config IOCTL to make it fail
- * Functionality: fault
- *
- * arg[1]:
- * @xe_oa_alloc_regs:		xe_oa_alloc_regs
- */
-static void
-oa_add_config_fail(int fd, int sysfs, int devid,
-		   const char pci_slot[], const char function_name[])
-{
-	char path[512];
-	uint64_t config_id;
-#define SAMPLE_MUX_REG (intel_graphics_ver(devid) >= IP_VER(20, 0) ?	\
-			0x13000 /* PES* */ : 0x9888 /* NOA_WRITE */)
-
-	uint32_t mux_regs[] = { SAMPLE_MUX_REG, 0x0 };
-	struct drm_xe_oa_config config;
-	const char *uuid = "01234567-0123-0123-0123-0123456789ab";
-	int ret;
-
-	snprintf(path, sizeof(path), "metrics/%s/id", uuid);
-	/* Destroy previous configuration if present */
-	if (igt_sysfs_scanf(sysfs, path, "%" PRIu64, &config_id) == 1)
-		igt_assert_eq(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_REMOVE_CONFIG,
-						  &config_id), 0);
-
-	memset(&config, 0, sizeof(config));
-	memcpy(config.uuid, uuid, sizeof(config.uuid));
-	config.n_regs = 1;
-	config.regs_ptr = to_user_pointer(mux_regs);
-
-	ret = intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_ADD_CONFIG, &config);
-	igt_skip_on_f(ret == -1 && errno == ENODEV, "Xe OA interface not available\n");
-
-	igt_assert_lt(0, ret);
-	igt_assert(igt_sysfs_scanf(sysfs, path, "%" PRIu64, &config_id) == 1);
-	igt_assert_eq(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_REMOVE_CONFIG, &config_id), 0);
-
-	injection_ignore_dmesg_errors_from_dut(pci_slot);
-	injection_list_add(function_name);
-	injection_set_retval(function_name, INJECT_ERRNO);
-	igt_assert_lt(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_ADD_CONFIG, &config), 0);
-	injection_list_remove(function_name);
-
-	igt_assert_lt(0, intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_ADD_CONFIG, &config));
-	igt_assert(igt_sysfs_scanf(sysfs, path, "%" PRIu64, &config_id) == 1);
-	igt_assert_eq(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_REMOVE_CONFIG, &config_id), 0);
-}
-
 static int opt_handler(int opt, int opt_index, void *data)
 {
 	int in_param;
@@ -350,7 +299,6 @@ igt_main_args("I:", NULL, help_str, opt_handler, NULL)
 	int fd, sysfs;
 	struct drm_xe_engine_class_instance *hwe;
 	struct fault_injection_params fault_params;
-	static uint32_t devid;
 	char pci_slot[NAME_MAX];
 	bool is_vf_device;
 	const struct section {
@@ -405,11 +353,6 @@ igt_main_args("I:", NULL, help_str, opt_handler, NULL)
 		{ }
 	};
 
-	const struct section oa_add_config_fail_functions[] = {
-		{ "xe_oa_alloc_regs"},
-		{ }
-	};
-
 	const struct section guc_fail_functions[] = {
 		{ "xe_guc_mmio_send_recv" },
 		{ "xe_guc_ct_send_recv" },
@@ -419,7 +362,6 @@ igt_main_args("I:", NULL, help_str, opt_handler, NULL)
 	igt_fixture {
 		igt_require(fail_function_injection_enabled());
 		fd = drm_open_driver(DRIVER_XE);
-		devid = intel_get_drm_devid(fd);
 		sysfs = igt_sysfs_open(fd);
 		igt_device_get_pci_slot_name(fd, pci_slot);
 		injection_setup_fault(&default_fault_params);
@@ -449,10 +391,6 @@ igt_main_args("I:", NULL, help_str, opt_handler, NULL)
 					exec_queue_create_fail(fd, hwe, pci_slot,
 							       s->name, s->flags);
 
-	for (const struct section *s = oa_add_config_fail_functions; s->name; s++)
-		igt_subtest_f("oa-add-config-fail-%s", s->name)
-			oa_add_config_fail(fd, sysfs, devid, pci_slot, s->name);
-
 	igt_fixture {
 		igt_kmod_unbind("xe", pci_slot);
 	}
diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 63b59028fc..4a513b8e81 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -24,6 +24,7 @@
 #include "igt_device.h"
 #include "igt_syncobj.h"
 #include "igt_sysfs.h"
+#include "xe/xe_fault_injection.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 #include "xe/xe_oa.h"
@@ -4827,6 +4828,56 @@ exit:
 	oa_sync_free(&osync);
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
+oa_add_config_fail(int fd, const char pci_slot[], const char function_name[])
+{
+	char path[512];
+	uint64_t config_id;
+#define SAMPLE_MUX_REG (intel_graphics_ver(devid) >= IP_VER(20, 0) ?	\
+			0x13000 /* PES* */ : 0x9888 /* NOA_WRITE */)
+
+	uint32_t mux_regs[] = { SAMPLE_MUX_REG, 0x0 };
+	struct drm_xe_oa_config config;
+	const char *uuid = "01234567-0123-0123-0123-0123456789ab";
+	int ret;
+
+	snprintf(path, sizeof(path), "metrics/%s/id", uuid);
+	/* Destroy previous configuration if present */
+	if (igt_sysfs_scanf(sysfs, path, "%" PRIu64, &config_id) == 1)
+		igt_assert_eq(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_REMOVE_CONFIG,
+						  &config_id), 0);
+
+	memset(&config, 0, sizeof(config));
+	memcpy(config.uuid, uuid, sizeof(config.uuid));
+	config.n_regs = 1;
+	config.regs_ptr = to_user_pointer(mux_regs);
+
+	ret = intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_ADD_CONFIG, &config);
+	igt_skip_on_f(ret == -1 && errno == ENODEV, "Xe OA interface not available\n");
+
+	igt_assert_lt(0, ret);
+	igt_assert(igt_sysfs_scanf(sysfs, path, "%" PRIu64, &config_id) == 1);
+	igt_assert_eq(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_REMOVE_CONFIG, &config_id), 0);
+
+	injection_ignore_dmesg_errors_from_dut(pci_slot);
+	injection_list_add(function_name);
+	injection_set_retval(function_name, -ENOMEM);
+	igt_assert_lt(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_ADD_CONFIG, &config), 0);
+	injection_list_remove(function_name);
+
+	igt_assert_lt(0, intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_ADD_CONFIG, &config));
+	igt_assert(igt_sysfs_scanf(sysfs, path, "%" PRIu64, &config_id) == 1);
+	igt_assert_eq(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_REMOVE_CONFIG, &config_id), 0);
+}
+
 static const char *xe_engine_class_name(uint32_t engine_class)
 {
 	switch (engine_class) {
@@ -4886,9 +4937,16 @@ igt_main
 		{ "ufence-wait", OA_SYNC_TYPE_UFENCE, WAIT },
 		{ NULL },
 	};
+	const struct fault_section {
+		const char *name;
+	} oa_add_config_fail_functions[] = {
+		{ "xe_oa_alloc_regs" },
+		{ }
+	};
 	struct drm_xe_engine_class_instance *hwe = NULL;
 	struct drm_xe_oa_unit *oau;
 	struct xe_device *xe_dev;
+	char pci_slot[NAME_MAX];
 
 	igt_fixture {
 		struct stat sb;
@@ -5129,6 +5187,19 @@ igt_main
 		}
 	}
 
+	igt_subtest_group {
+		igt_fixture {
+			igt_require(fail_function_injection_enabled());
+			injection_setup_fault(&default_fault_params);
+			injection_exit_handler();
+			igt_device_get_pci_slot_name(drm_fd, pci_slot);
+		}
+		for (const struct fault_section *s = oa_add_config_fail_functions; s->name; s++) {
+			igt_subtest_f("oa-add-config-fail-%s", s->name)
+				oa_add_config_fail(drm_fd, pci_slot, s->name);
+		}
+	}
+
 	igt_fixture {
 		/* leave sysctl options in their default state... */
 		write_u64_file("/proc/sys/dev/xe/observation_paranoid", 1);
-- 
2.43.0

