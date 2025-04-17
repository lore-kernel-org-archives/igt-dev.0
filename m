Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EBFDC369B2
	for <igt-dev@archiver.kernel.org>; Thu, 17 Apr 2025 13:13:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 153F810EB07;
	Thu, 17 Apr 2025 13:13:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fbXcBnNK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CB6E10EB16
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Apr 2025 13:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744895611; x=1776431611;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q7jeAnaxdx6NEhKZIFa1IViuTwDAV9Vux9nuntqoVVs=;
 b=fbXcBnNKRd+RVPkPAuAkUEnUvw3w20yPK1FPkAa+gABgezbdg7cbjSJz
 HBhu/UB20PwT0SUPaVun/wgHaCWMgJMFsy5cWQyMdeEAfwMh564o3Irov
 NAWtroS2DqpiUxqhHaPAuuykE4mSMMssHm5db0Qo8Ky05WPiaBIL1C8yC
 2uXZ6ZFs3uGgKv/mskB0M+FvcsQJbqFs80si73dia/k/ENarUZZNTftst
 1uRNZxsk5nJqbRkerAhoNMsjwOfA7Y1+SpPmvsn2io3xGGKeuu7joYYou
 eNoO+7RB/1RNlQmWxzLURAOMBTLifEnoVejB386xes5ooDgzp4ypZf5cV Q==;
X-CSE-ConnectionGUID: L9R6eOdiTpinvKHi/hP+wQ==
X-CSE-MsgGUID: naNAp/isRme5m1wMj4IZ3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="68972711"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; d="scan'208";a="68972711"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 06:13:31 -0700
X-CSE-ConnectionGUID: o0tFhm+XQ3ay79TT+QTHCw==
X-CSE-MsgGUID: N6PRi2PqQrigmwVBFqoPxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; d="scan'208";a="130802740"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.80.165])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 06:13:30 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/xe_fault_injection: Make
 inject-fault-probe-function* tests VF-aware
Date: Thu, 17 Apr 2025 15:13:12 +0200
Message-Id: <20250417131312.1016503-3-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250417131312.1016503-1-marcin.bernatowicz@linux.intel.com>
References: <20250417131312.1016503-1-marcin.bernatowicz@linux.intel.com>
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

Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 tests/intel/xe_fault_injection.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index dc8005dc8..818f62ceb 100644
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
@@ -385,18 +386,20 @@ igt_main
 	struct drm_xe_engine_class_instance *hwe;
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
@@ -405,7 +408,7 @@ igt_main
 		{ "xe_tile_init_early" },
 		{ "xe_uc_fw_init" },
 		{ "xe_wa_init" },
-		{ "xe_wopcm_init" },
+		{ "xe_wopcm_init", 0, true },
 		{ }
 	};
 	const struct section vm_create_fail_functions[] = {
@@ -449,6 +452,7 @@ igt_main
 		igt_device_get_pci_slot_name(fd, pci_slot);
 		setup_injection_fault();
 		igt_install_exit_handler(cleanup_injection_fault);
+		is_vf_device = intel_is_vf_device(fd);
 	}
 
 	for (const struct section *s = vm_create_fail_functions; s->name; s++)
@@ -480,8 +484,15 @@ igt_main
 	}
 
 	for (const struct section *s = probe_fail_functions; s->name; s++)
-		igt_subtest_f("inject-fault-probe-function-%s", s->name)
-			igt_assert_eq(INJECT_ERRNO, inject_fault_probe(fd, pci_slot, s->name));
+		igt_subtest_f("inject-fault-probe-function-%s", s->name) {
+			bool should_pass = s->pf_only && is_vf_device;
+			int err;
+
+			err = inject_fault_probe(fd, pci_slot, s->name);
+
+			igt_assert_eq(should_pass ? 0 : INJECT_ERRNO, err);
+			igt_kmod_unbind("xe", pci_slot);
+		}
 
 	igt_fixture {
 		close(sysfs);
-- 
2.31.1

