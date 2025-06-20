Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45FB3C7115C
	for <igt-dev@archiver.kernel.org>; Fri, 20 Jun 2025 13:18:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D00F310EB5B;
	Fri, 20 Jun 2025 13:18:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IAetRmY2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0030110EB59
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Jun 2025 13:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750425519; x=1781961519;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Xy1DxMjLbZwQosDNSrz73bl/VjOp1kCC41heCSJnElE=;
 b=IAetRmY2bvO1Fvq2PdJzl17Uvs5um3i3aUBcL4fhIbcxesLBa4eQ/2pI
 FgWy5Fqm1t6tvBEJNtiLILISuZb2DqqpnLnC0HsomMlHuBvjYAdomV2Vg
 3ab0XfnRkkkvuZrILk+Y/Uo5B8tEcQ708Aht5EIIVcsWImec5g5PF79Hj
 rEUZNpr4pqVjCwCuyDcyO4BoyH/vUG9FSb3d82xNE8fx0B5iFk9eWB8io
 wopiqOXlHkjQIm6cu/VAjI4HHnLUdOoVbMOIcr4fvpFytafWYrL+kfgcu
 sDfScrz9oRjCsq253eLimAfZ4BFXgay/6mW3lCakE3OZWGng2zm44b/eK A==;
X-CSE-ConnectionGUID: GY1suZGpSI+0sqCVHmh7yg==
X-CSE-MsgGUID: f+CNCJ8XRACFbB/Uomtuww==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="55323950"
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; d="scan'208";a="55323950"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2025 06:18:39 -0700
X-CSE-ConnectionGUID: ovtroAofSU6TWJeYIQMs2A==
X-CSE-MsgGUID: b2tnp8oNSBKY+gmEnUbGFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; d="scan'208";a="151443859"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa008.fm.intel.com with ESMTP; 20 Jun 2025 06:18:37 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: [RFC] [PATCH i-g-t v3] tests/intel/xe_fault_injection: Inject errors
 for VF provision
Date: Fri, 20 Jun 2025 19:05:16 +0530
Message-ID: <20250620133516.5523-1-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
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

Use the kernel fault injection infrastructure to test error handling of
the XE during reading VF provisioning data of various resources like GGTT,
contexts, LMEM (in case of DGFX) and doorbells so that more code paths are
tested, such as error handling and unwinding.

The test injects multiple errors into each resource and tests all possible
ways of error handling.

Error can be injected using:
igt@xe_fault_injection@probe-fail-vf-provision

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Test-With: 20250523073638.24842-1-satyanarayana.k.v.p@intel.com

V2 -> V3:
- Rebased with latest igt repo.
- Added some debug prints.
- Updated test name to igt@xe_fault_injection@probe-fail-vf-provision
(Michal Wajdeczko).

V1 -> V2:
- Fixed review comments.
---
 tests/intel/xe_fault_injection.c | 84 ++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 8245c558c..57d0fe6a1 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -29,6 +29,18 @@
 #define BO_SIZE		(1024*1024)
 #define INJECT_ITERATIONS	100
 
+#define INJECT_VF_PROVISION_ERR_COUNT	6
+#define VF_PROVISION_MAX_PARAMS	4
+
+int vf_provision_err_inject_list[INJECT_VF_PROVISION_ERR_COUNT] = {
+	-22, 	/* -EINVAL */
+	-28, 	/* -ENOSPC */
+	-61, 	/* -ENODATA */
+	-69, 	/* -ESRMNT */
+	-78,	/* -EREMCHG */
+	-122, 	/* -EDQUOT */
+};
+
 int32_t inject_iters_raw;
 struct fault_injection_params {
 	/* @probability: Likelihood of failure injection, in percent. */
@@ -298,6 +310,64 @@ static void probe_fail_guc(int fd, const char pci_slot[], const char function_na
 	}
 }
 
+static void vf_provision_inject_fault(int fd,  const char func_name[],
+				      struct fault_injection_params *fault_params)
+{
+	int auto_probe_en = igt_sriov_is_driver_autoprobe_enabled(fd);
+	unsigned int totalvfs = igt_sriov_get_total_vfs(fd);
+	int i;
+
+	for (i = 0; i < INJECT_VF_PROVISION_ERR_COUNT; i++) {
+		if (igt_sriov_get_enabled_vfs(fd))
+			igt_sriov_disable_vfs(fd);
+
+		setup_injection_fault(fault_params);
+
+		injection_list_add(func_name);
+		igt_debug("Injecting error %d\n", vf_provision_err_inject_list[i]);
+		set_retval(func_name, vf_provision_err_inject_list[i]);
+
+		igt_sriov_enable_driver_autoprobe(fd);
+		igt_sriov_enable_vfs(fd, totalvfs);
+		igt_sriov_disable_vfs(fd);
+		if (!auto_probe_en)
+			igt_sriov_disable_driver_autoprobe(fd);
+		injection_list_remove(func_name);
+	}
+}
+/**
+ * SUBTEST: probe-fail-vf-provision
+ * Description: inject an error in the injectable function %arg[1] then reprobe driver
+ * Functionality: fault
+ */
+static void probe_fail_vf_provision(int fd, const char pci_slot[],
+				    const char function_name[],
+				    struct fault_injection_params *fault_params)
+{
+	int space, times, interval;
+	/* We do not have LMEM for IGPU. */
+	int end = xe_has_vram(fd) ?
+		  (VF_PROVISION_MAX_PARAMS) : (VF_PROVISION_MAX_PARAMS - 1);
+
+	igt_skip_on(!igt_sriov_is_pf(fd));
+	igt_assert(fault_params);
+
+	ignore_dmesg_errors_from_dut(pci_slot);
+
+	for (space = 1; space < end; space++) {
+		for (times = 1; times < end; times++) {
+			for (interval = 1; interval < end; interval++) {
+				fault_params->interval = interval;
+				fault_params->times = times;
+				fault_params->space = space;
+
+				vf_provision_inject_fault(fd, function_name,
+							  fault_params);
+
+			}
+		}
+	}
+}
 /**
  * SUBTEST: exec-queue-create-fail-%s
  * Description: inject an error in function %arg[1] used in exec queue create IOCTL to make it fail
@@ -574,6 +644,11 @@ igt_main_args("I:", NULL, help_str, opt_handler, NULL)
 		{ }
 	};
 
+	const struct section vf_proviosin_fail_functions[] = {
+		{ "probe-fail-vf-provision" },
+		{}
+	};
+
 	igt_fixture {
 		igt_require(fail_function_injection_enabled());
 		fd = drm_open_driver(DRIVER_XE);
@@ -611,6 +686,15 @@ igt_main_args("I:", NULL, help_str, opt_handler, NULL)
 		igt_subtest_f("oa-add-config-fail-%s", s->name)
 			oa_add_config_fail(fd, sysfs, devid, pci_slot, s->name);
 
+	for (const struct section *s = vf_proviosin_fail_functions; s->name; s++)
+		igt_subtest_f("probe-fail-vf-provision") {
+			memcpy(&fault_params, &default_fault_params,
+					sizeof(struct fault_injection_params));
+			probe_fail_vf_provision(fd, pci_slot,
+						"xe_should_fail_vf_provisioning",
+						&fault_params);
+		}
+
 	igt_fixture {
 		igt_kmod_unbind("xe", pci_slot);
 	}
-- 
2.43.0

