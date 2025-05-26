Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C89C5AD49
	for <igt-dev@archiver.kernel.org>; Mon, 26 May 2025 13:45:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D50F10E2E3;
	Mon, 26 May 2025 13:45:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bREm9l4J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CCC410E2E3
 for <igt-dev@lists.freedesktop.org>; Mon, 26 May 2025 13:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748267125; x=1779803125;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PvdVPLkC1I37JqXXeXJayncp4tuPPn4pOFSZZWwa0w4=;
 b=bREm9l4JSDHT33AVbcNB+G5lVm5T0IBexivRlIUzE9kmhvuLi75qIarW
 U7qFdtdlQckdVRmyTpUHtnf6ijYfFOojfdjimDAUGO/iCy4DcK1wFm2wO
 XRXKWv5qNq384+I/jchlBRIuzWGEXiLbtj6Fl7Or3OS4aG0QFlQgh56u5
 4NI5T+F/HCWJUY1BXncCH/I+kDfphiDAWFplwwhkfMbV7zxn6dyjww5vO
 GvHUbt8o9ykZrgofGWIYrfDCR7Rmw6clQqGdLPhzIby8TBAjCymCnwvmq
 vgGmIlhqfVfqmWD3KcjFxgm5E+7a4DHdD7Eu2XqB9OnK1p4qHyTcjMHDW w==;
X-CSE-ConnectionGUID: hxSfM/oPTiCr0G1NdIVpSg==
X-CSE-MsgGUID: hQVqO6wSQJiaJP6bOnY89w==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="60901484"
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="60901484"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2025 06:45:23 -0700
X-CSE-ConnectionGUID: 2UC9ZTftQ4a78IDs+NBzRQ==
X-CSE-MsgGUID: FYP2ZNwQRCe6jgtBreo+Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; d="scan'208";a="147393457"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa004.jf.intel.com with ESMTP; 26 May 2025 06:45:22 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [RFC] [PATCH i-g-t] tests/intel/xe_fault_injection: Inject errors for
 VF provision
Date: Mon, 26 May 2025 19:31:34 +0530
Message-ID: <20250526140134.21967-1-satyanarayana.k.v.p@intel.com>
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

Use the kernel fault injection infrastructure to test error handling of xe
during VF provisioning of various resources like GGTT, contexts, lmem (in
case of DGFX) and doorbells so that more code paths are tested, such as
error handling and unwinding.

The test injects multiple errors into each resource and tests all possible
ways of error handling.

Error can be injected using:
igt@xe_fault_injection@probe-fail-vf-provision-xe_should_fail_vf_provisioning_ggtt
igt@xe_fault_injection@probe-fail-vf-provision-xe_should_fail_vf_provisioning_ctxs
igt@xe_fault_injection@probe-fail-vf-provision-xe_should_fail_vf_provisioning_dbs
igt@xe_fault_injection@probe-fail-vf-provision-xe_should_fail_vf_provisioning_lmem

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>

Test-With: 20250523073638.24842-1-satyanarayana.k.v.p@intel.com
---
 tests/intel/xe_fault_injection.c | 166 +++++++++++++++++++++++++++++++
 1 file changed, 166 insertions(+)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index f9bd5c761..40b5b2e16 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -29,6 +29,42 @@
 #define BO_SIZE		(1024*1024)
 #define INJECT_ITERATIONS	100
 
+enum {
+	VF_PROVISION_MIN  = 0,
+	VF_PROVISION_GGTT = VF_PROVISION_MIN,
+	VF_PROVISION_LMEM,
+	VF_PROVISION_CTXS,
+	VF_PROVISION_DBS,
+	VF_PROVISION_MAX,
+};
+
+enum {
+	VF_PROVISION_ERR_MIN,
+	/* Force resource location invalid  */
+	VF_PROVISION_ERR_EINVAL = VF_PROVISION_ERR_MIN,
+	/* Force resource size bigger than HW limit */
+	VF_PROVISION_ERR_ENOSPC,
+	/* Force resource size to zero */
+	VF_PROVISION_ERR_ENODATA,
+	/* Force resource size larger than received with invalid base address. */
+	VF_PROVISION_ERR_ESRMNT,
+	/* Force resource size smaller than received */
+	VF_PROVISION_ERR_EREMCHG,
+	/* Force resource size larger than received */
+	VF_PROVISION_ERR_EDQUOT,
+	VF_PROVISION_ERR_MAX
+};
+
+int vf_provision_err_inject_list[VF_PROVISION_ERR_MAX] = {
+	-22 /* VF_PROVISION_ERR_EINVAL */,
+	-28 /* VF_PROVISION_ERR_ENOSPC */,
+	-61 /*VF_PROVISION_ERR_ENODATA */,
+	-69 /* VF_PROVISION_ERR_ESRMNT */,
+	-78 /* VF_PROVISION_ERR_EREMCHG */,
+	-122 /* VF_PROVISION_ERR_EDQUOT */
+};
+
+
 int32_t inject_iters_raw;
 struct fault_injection_params {
 	/* @probability: Likelihood of failure injection, in percent. */
@@ -71,6 +107,11 @@ static bool function_is_part_of_guc(const char function_name[])
 	       strstr(function_name, "_wopcm_") != NULL;
 }
 
+static bool function_is_part_of_vf(const char function_name[])
+{
+	return strstr(function_name, "_vf_") != NULL;
+}
+
 static void ignore_faults_in_dmesg(const char function_name[])
 {
 	/* Driver probe is expected to fail in all cases, so ignore in igt_runner */
@@ -87,6 +128,19 @@ static void ignore_faults_in_dmesg(const char function_name[])
 		strcat(regex, "|GT[0-9a-fA-F]*: GuC PC query task state failed:	-ENOMEM");
 	}
 
+	/*
+	 * If VF provisiong faults are injected, Guc and VF provision is
+	 * expected fail. So, ignore failures in igt_runner.
+	 */
+	if (function_is_part_of_vf(function_name)) {
+		strcat(regex, "|GT[0-9a-fA-F]*: GuC init failed with -ENOMEM");
+		strcat(regex, "|GT[0-9a-fA-F]*: Failed to initialize uC .-ENOMEM");
+		strcat(regex, "|GT[0-9a-fA-F]*: VF: Unexpected GGTT reassignment: [0-9] != [0-9]");
+		strcat(regex, "|GT[0-9a-fA-F]*: VF: Unexpected CTXs reassignment: [0-9] != [0-9]");
+		strcat(regex, "|GT[0-9a-fA-F]*: VF: Unexpected DBs reassignment: [0-9] != [0-9]");
+		strcat(regex, "|GT[0-9a-fA-F]*: VF: Unexpected LMEM reassignment: [0-9] != [0-9]");
+	}
+
 	igt_emit_ignore_dmesg_regex(regex);
 }
 
@@ -278,6 +332,103 @@ static void probe_fail_guc(int fd, char pci_slot[], const char function_name[],
 	}
 }
 
+static void get_fault_params(int fault_type, int has_vram,
+			     struct fault_injection_params *fault_params)
+{
+	igt_assert(fault_params);
+
+	igt_debug("has_vram = %d, fault_type = %d\n", has_vram, fault_type);
+
+	if (has_vram) {
+		switch (fault_type) {
+		case VF_PROVISION_GGTT:
+			fault_params->space = 1;
+			break;
+		case VF_PROVISION_LMEM:
+			fault_params->space = 2;
+			break;
+		case VF_PROVISION_CTXS:
+			fault_params->space = 3;
+			break;
+		case VF_PROVISION_DBS:
+			fault_params->space = 4;
+			break;
+		default:
+			return;
+		}
+	} else {
+		switch (fault_type) {
+		case VF_PROVISION_GGTT:
+			fault_params->space = 1;
+			break;
+		case VF_PROVISION_CTXS:
+			fault_params->space = 2;
+			break;
+		case VF_PROVISION_DBS:
+			fault_params->space = 3;
+			break;
+		default:
+			return;
+		}
+	}
+
+	fault_params->times = 1;
+}
+/**
+ * SUBTEST: probe-fail-vf-provision-%s
+ * Description: inject an error in the injectable function %arg[1] then reprobe driver
+ * Functionality: fault
+ *
+ * arg[1]:
+ * @xe_should_fail_vf_provisioning_ggtt:     Inject an error when provisoning ggtt.
+ * @xe_should_fail_vf_provisioning_lmem:     Inject an error when provisoning lmem.
+ * @xe_should_fail_vf_provisioning_ctxs:     Inject an error when provisoning ctxs.
+ * @xe_should_fail_vf_provisioning_dbs:     Inject an error when provisoning dbs.
+ */
+static void probe_fail_vf_provision(int fd, char pci_slot[], const char function_name[],
+               struct fault_injection_params *fault_params)
+{
+	int auto_probe_en = igt_sriov_is_driver_autoprobe_enabled(fd);
+	const char *func_name = "xe_should_fail_vf_provisioning";
+	unsigned int totalvfs = igt_sriov_get_total_vfs(fd);
+	int fault_type, i;
+
+	igt_skip_on(!totalvfs);
+	igt_assert(fault_params);
+
+	if (!strcmp("xe_should_fail_vf_provisioning_ggtt", function_name))
+		fault_type = VF_PROVISION_GGTT;
+	else if (!strcmp("xe_should_fail_vf_provisioning_lmem", function_name))
+		fault_type = VF_PROVISION_LMEM;
+	else if (!strcmp("xe_should_fail_vf_provisioning_ctxs", function_name))
+		fault_type = VF_PROVISION_CTXS;
+	else if (!strcmp("xe_should_fail_vf_provisioning_dbs", function_name))
+		fault_type = VF_PROVISION_DBS;
+	else
+		fault_type = VF_PROVISION_GGTT;
+
+	igt_skip_on(!strcmp("xe_should_fail_vf_provisioning_lmem", function_name) &&
+		    !xe_has_vram(fd));
+
+	ignore_faults_in_dmesg(function_name);
+	for (i = VF_PROVISION_ERR_MIN; i < VF_PROVISION_ERR_MAX; i++) {
+		if (igt_sriov_get_enabled_vfs(fd))
+			igt_sriov_disable_vfs(fd);
+
+		get_fault_params(fault_type, xe_has_vram(fd), fault_params);
+		setup_injection_fault(fault_params);
+
+		injection_list_add(func_name);
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
 /**
  * SUBTEST: exec-queue-create-fail-%s
  * Description: inject an error in function %arg[1] used in exec queue create IOCTL to make it fail
@@ -551,6 +702,14 @@ igt_main_args("I:", NULL, help_str, opt_handler, NULL)
 		{ }
 	};
 
+	const struct section vf_proviosin_fail_functions[] = {
+		{ "xe_should_fail_vf_provisioning_ggtt" },
+		{ "xe_should_fail_vf_provisioning_lmem" },
+		{ "xe_should_fail_vf_provisioning_ctxs" },
+		{ "xe_should_fail_vf_provisioning_dbs" },
+		{}
+	};
+
 	igt_fixture {
 		igt_require(fail_function_injection_enabled());
 		fd = drm_open_driver(DRIVER_XE);
@@ -586,6 +745,13 @@ igt_main_args("I:", NULL, help_str, opt_handler, NULL)
 		igt_subtest_f("oa-add-config-fail-%s", s->name)
 			oa_add_config_fail(fd, sysfs, devid, s->name);
 
+	for (const struct section *s = vf_proviosin_fail_functions; s->name; s++)
+		igt_subtest_f("probe-fail-vf-provision-%s", s->name) {
+			memcpy(&fault_params, &default_fault_params,
+					sizeof(struct fault_injection_params));
+			probe_fail_vf_provision(fd, pci_slot, s->name, &fault_params);
+		}
+
 	igt_fixture {
 		igt_kmod_unbind("xe", pci_slot);
 	}
-- 
2.43.0

