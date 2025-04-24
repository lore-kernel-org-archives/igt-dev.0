Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BDACC369D7
	for <igt-dev@archiver.kernel.org>; Thu, 24 Apr 2025 09:59:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B94BF10E7BC;
	Thu, 24 Apr 2025 09:59:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RDUeoDo7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C59610E7BC
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Apr 2025 09:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745488748; x=1777024748;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wW+BO27xijXeQuYJt1li77CdvnsUH2YPrxIReE1Qztg=;
 b=RDUeoDo7MFqzYWI2JMcF3qJzklPOCv2K+HtBUgGkWTyTj4i4Hzel186w
 2cGEcn+duLCU33Nz9oqkTDONxlC8N84S0IyTG1UgZjTYDfcNvxhtPfa5F
 4qKmf3pjHtJzGc0ts2RxXF+fz5QR8699ZL3Sp85A61ZhnaO43jHbVFHdd
 qRJk4+GfL54U9YuEp1X3IH1+7MGL/GQwafFFvbBarK0QJCRR9p6BpDhFs
 4Q08OTMpCD9sZN7UCHjeQfWuFmcI3Ey33oSoBBxLqcz8QLwpWgxdo4Cdn
 uVP9O4iZpx1OMwwAQqVGI81es8xtnWCfBdwXhoA8bf/qTd2+QNneZf7YU A==;
X-CSE-ConnectionGUID: s+faanNWQbGeMcGxSnQJXw==
X-CSE-MsgGUID: 2PTaF8DSSGeAZaPsl3dgPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="46982365"
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; d="scan'208";a="46982365"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 02:59:07 -0700
X-CSE-ConnectionGUID: hpPNkmHFRoG6tpN0zYusIA==
X-CSE-MsgGUID: P1cOC5q+RvyoUsaKm6AHYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; d="scan'208";a="132476371"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.101.99])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2025 02:59:06 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH i-g-t 1/1] tests/intel/xe_fault_injection: Make
 inject-fault-probe-function* tests VF-aware
Date: Thu, 24 Apr 2025 11:58:53 +0200
Message-Id: <20250424095853.1396156-2-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250424095853.1396156-1-marcin.bernatowicz@linux.intel.com>
References: <20250424095853.1396156-1-marcin.bernatowicz@linux.intel.com>
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

Not all probe functions are invoked and cause a failure when fault
injection is performed in a Virtual Function (VF) context. Some of
these functions are only relevant for Physical Function (PF).

Mark such functions with a `pf_only` flag and update the fault injection
test logic to handle VF environments appropriately. When a PF-only
function is tested on a VF device, expect the probe to succeed and
validate accordingly.

This ensures that tests do not produce false failures when run on VFs.

v2: Resolve merge conflicts.

Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 tests/intel/xe_fault_injection.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 98a414bd3..11b21301a 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -16,6 +16,7 @@
 #include "igt.h"
 #include "igt_device.h"
 #include "igt_kmod.h"
+#include "igt_sriov_device.h"
 #include "igt_sysfs.h"
 #include "lib/igt_syncobj.h"
 #include "lib/intel_pat.h"
@@ -480,18 +481,20 @@ igt_main_args("I:", NULL, help_str, opt_handler, NULL)
 	struct fault_injection_params fault_params;
 	static uint32_t devid;
 	char pci_slot[NAME_MAX];
+	bool is_vf_device;
 	const struct section {
 		const char *name;
 		unsigned int flags;
+		bool pf_only;
 	} probe_fail_functions[] = {
 		{ "wait_for_lmem_ready" },
 		{ "xe_add_hw_engine_class_defaults" },
 		{ "xe_device_create" },
 		{ "xe_device_probe_early" },
 		{ "xe_ggtt_init_early" },
-		{ "xe_guc_ads_init" },
+		{ "xe_guc_ads_init", 0, true },
 		{ "xe_guc_ct_init" },
-		{ "xe_guc_log_init" },
+		{ "xe_guc_log_init", 0, true },
 		{ "xe_guc_relay_init" },
 		{ "xe_mmio_probe_early" },
 		{ "xe_pcode_probe_early" },
@@ -500,7 +503,7 @@ igt_main_args("I:", NULL, help_str, opt_handler, NULL)
 		{ "xe_tile_init_early" },
 		{ "xe_uc_fw_init" },
 		{ "xe_wa_init" },
-		{ "xe_wopcm_init" },
+		{ "xe_wopcm_init", 0, true },
 		{ }
 	};
 	const struct section vm_create_fail_functions[] = {
@@ -550,6 +553,7 @@ igt_main_args("I:", NULL, help_str, opt_handler, NULL)
 		igt_device_get_pci_slot_name(fd, pci_slot);
 		setup_injection_fault(&default_fault_params);
 		igt_install_exit_handler(cleanup_injection_fault);
+		is_vf_device = intel_is_vf_device(fd);
 	}
 
 	for (const struct section *s = vm_create_fail_functions; s->name; s++)
@@ -581,9 +585,15 @@ igt_main_args("I:", NULL, help_str, opt_handler, NULL)
 	}
 
 	for (const struct section *s = probe_fail_functions; s->name; s++)
-		igt_subtest_f("inject-fault-probe-function-%s", s->name)
-			igt_assert_eq(INJECT_ERRNO, inject_fault_probe(fd,
-						pci_slot, s->name));
+		igt_subtest_f("inject-fault-probe-function-%s", s->name) {
+			bool should_pass = s->pf_only && is_vf_device;
+			int err;
+
+			err = inject_fault_probe(fd, pci_slot, s->name);
+
+			igt_assert_eq(should_pass ? 0 : INJECT_ERRNO, err);
+			igt_kmod_unbind("xe", pci_slot);
+		}
 
 	for (const struct section *s = guc_fail_functions; s->name; s++)
 		igt_subtest_f("probe-fail-guc-%s", s->name) {
-- 
2.31.1

