Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A69D4D5C0F8
	for <igt-dev@archiver.kernel.org>; Fri,  8 Nov 2024 16:00:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62EE310E9FF;
	Fri,  8 Nov 2024 16:00:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K7vO+YsK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F20C410E9FC
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Nov 2024 16:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731081640; x=1762617640;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7rK+L42iHdKWY9XvEQVQAqWi1lV5NC4Vb/jxS2C8RKs=;
 b=K7vO+YsKn66e8PCwwwfHITENZlj5QhNnGavDTBinYxoKLwNkCmMev+2r
 E8c46O/SWm72xYpxNrf0X4GQNBPJUXhrWNdHlJJWQtxCYFBooE1v/j0JL
 bQcR5xXHrVVX7HNry3GtqbtXU1R1KaQWDEoZ/+s7nmDqS2XZcYDPlpCqf
 iTv2QqgJT4KQ0x3A6u86rLT8No/0f8AkmwYgHCpaiGR2odgmKJ+XpxczZ
 V087ij+5oHL6WUB0oJ97lTCWib8yW+qkjf19OYJVhAAXjrUIHMAjqCOM4
 n8lz2Tnwkjk9phhzwYnG6Q4Rzs/XPmWR48wJEdT72IWlZO3VrQxEPlRZm Q==;
X-CSE-ConnectionGUID: q9pnwriaQ7OnauaNAdUxqA==
X-CSE-MsgGUID: gF1Pj5WPTDOou3A086vh4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30738397"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30738397"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 08:00:40 -0800
X-CSE-ConnectionGUID: 7GleEBKJQBeNucs6BEwjFw==
X-CSE-MsgGUID: OznJTe/ASNuvcE/Xe3L88g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; d="scan'208";a="86423024"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.246])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2024 08:00:39 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 4/5] tests/intel/xe_fault_injection: Inject errors
 during vm create IOCTL
Date: Fri,  8 Nov 2024 16:59:32 +0100
Message-ID: <20241108160021.1202234-5-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241108160021.1202234-1-francois.dugast@intel.com>
References: <20241108160021.1202234-1-francois.dugast@intel.com>
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

Use the fault injection infrastructure to make targeted internal KMD
functions fail when executing xe_vm_create_ioctl() so that more code
paths are tested, such as error handling and unwinding.

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 tests/intel/xe_fault_injection.c | 55 ++++++++++++++++++++++++++++++--
 1 file changed, 53 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 87e567a54..eb80f6af8 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -17,6 +17,8 @@
 #include "igt_device.h"
 #include "igt_kmod.h"
 #include "igt_sysfs.h"
+#include "xe/xe_ioctl.h"
+#include "xe/xe_query.h"
 
 #define INJECT_ERRNO			-ENOMEM
 
@@ -154,13 +156,47 @@ inject_fault_probe(int fd, char pci_slot[], const char function_name[])
 	injection_list_do(INJECTION_LIST_REMOVE, function_name);
 }
 
+static int
+simple_vm_create(int fd, unsigned int flags)
+{
+	struct drm_xe_vm_create create = {
+		.flags = flags,
+	};
+
+	return igt_ioctl(fd, DRM_IOCTL_XE_VM_CREATE, &create);
+}
+
+/**
+ * SUBTEST: vm-create-fail-%s
+ * Description: inject an error in function %arg[1] used in vm create IOCTL to make it fail
+ * Functionality: fault
+ *
+ * arg[1]:
+ * @xe_pt_create:		xe_pt_create
+ * @xe_exec_queue_create_bind:	xe_exec_queue_create_bind
+ * @xe_vm_create_scratch:	xe_vm_create_scratch
+ */
+static void
+vm_create_fail(int fd, const char function_name[], unsigned int flags)
+{
+	igt_assert_eq(simple_vm_create(fd, flags), 0);
+
+	injection_list_do(INJECTION_LIST_ADD, function_name);
+	set_retval(function_name, INJECT_ERRNO);
+	igt_assert(simple_vm_create(fd, flags) != 0);
+	injection_list_do(INJECTION_LIST_REMOVE, function_name);
+
+	igt_assert_eq(simple_vm_create(fd, flags), 0);
+}
+
 igt_main
 {
 	int fd;
 	char pci_slot[NAME_MAX];
 	const struct section {
 		const char *name;
-	} probe_function_sections[] = {
+		unsigned int flags;
+	} probe_fail_functions[] = {
 		{ "wait_for_lmem_ready" },
 		{ "xe_device_create" },
 		{ "xe_ggtt_init_early" },
@@ -176,16 +212,29 @@ igt_main
 		{ "xe_sriov_init" },
 		{ }
 	};
+	const struct section vm_create_fail_functions[] = {
+		{ "xe_pt_create", 0 },
+		{ "xe_exec_queue_create_bind", 0 },
+		{ "xe_vm_create_scratch", DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE },
+		{ }
+	};
 
 	igt_fixture {
 		igt_require(fail_function_injection_enabled());
 		fd = drm_open_driver(DRIVER_XE);
 		igt_device_get_pci_slot_name(fd, pci_slot);
 		setup_injection_fault();
+	}
+
+	for (const struct section *s = vm_create_fail_functions; s->name; s++)
+		igt_subtest_f("vm-create-fail-%s", s->name)
+			vm_create_fail(fd, s->name, s->flags);
+
+	igt_fixture {
 		xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_UNBIND);
 	}
 
-	for (const struct section *s = probe_function_sections; s->name; s++)
+	for (const struct section *s = probe_fail_functions; s->name; s++)
 		igt_subtest_f("inject-fault-probe-function-%s", s->name)
 			inject_fault_probe(fd, pci_slot, s->name);
 
@@ -193,4 +242,6 @@ igt_main
 		drm_close_driver(fd);
 		xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_BIND);
 	}
+
+
 }
-- 
2.43.0

