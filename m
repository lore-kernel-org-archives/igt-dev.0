Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D9BD41D54
	for <igt-dev@archiver.kernel.org>; Tue, 12 Nov 2024 13:30:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B1F410E5F1;
	Tue, 12 Nov 2024 13:30:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BJmK73sA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F66710E5EE
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Nov 2024 13:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731418253; x=1762954253;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mFxfg7cB2B+jR74ZOANJ1vMC8Pc48JjMbDzZD96hdBY=;
 b=BJmK73sA/J/lR7gXE8oAZDxb7/Tw7XHdDmyoh98DSOKram7ZbCneH69b
 DCDUQf+nV7hzHvk05dD6reLYAflf6SnnkSthdoc2pznV30KJjj0R4tbaa
 O+LkeQAUm2UEE2mclvpLLOJcEhl5zTsnZuox3OHspQGeqdOyo+wmPz00p
 E1e0B9JmEdkQT0WDQNlJX/MFYNLZAmQ08u+bQccCeq41hwWVDurah7MyH
 CT6Cxk1VJLU5H/glPSbUGV1GcwSMINO0709+ZdPPDpmagEMzRHC/dIFY9
 r2u2OHJ4r5zGV3mv/O4rmLn6YzkdZD3ErWa9Yr6Z+mPX3Gx58PCnwCEMh g==;
X-CSE-ConnectionGUID: CTbEXnrbQR6Thu+1GPKNxQ==
X-CSE-MsgGUID: 8iehpGuoRFWCrv41EogruA==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="34118268"
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; d="scan'208";a="34118268"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 05:30:53 -0800
X-CSE-ConnectionGUID: ztWKb94CQX2FVhQa3FjuUA==
X-CSE-MsgGUID: gYP0RF1NRr6eo+AOdS7eNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; d="scan'208";a="92237867"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.113])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 05:30:51 -0800
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t,
 v3 4/5] tests/intel/xe_fault_injection: Inject errors during vm
 create IOCTL
Date: Tue, 12 Nov 2024 14:29:53 +0100
Message-ID: <20241112133034.1919573-5-francois.dugast@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241112133034.1919573-1-francois.dugast@intel.com>
References: <20241112133034.1919573-1-francois.dugast@intel.com>
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

v2: Order function names alphabetically (Rodrigo Vivi)

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 tests/intel/xe_fault_injection.c | 55 ++++++++++++++++++++++++++++++--
 1 file changed, 53 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index f99cc48c6..d321446b5 100644
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
+ * @xe_exec_queue_create_bind:	xe_exec_queue_create_bind
+ * @xe_pt_create:		xe_pt_create
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
 		{ "xe_wopcm_init" },
 		{ }
 	};
+	const struct section vm_create_fail_functions[] = {
+		{ "xe_exec_queue_create_bind", 0 },
+		{ "xe_pt_create", 0 },
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

