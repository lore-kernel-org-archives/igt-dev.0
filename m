Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8460C5B543
	for <igt-dev@archiver.kernel.org>; Wed, 28 May 2025 12:50:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAFF110E2C2;
	Wed, 28 May 2025 12:49:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ko2HCkv5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B90110E2C2
 for <igt-dev@lists.freedesktop.org>; Wed, 28 May 2025 12:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748436594; x=1779972594;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=V7cjKis3k84e6Er58LhDoMGJWyc2NwB13d2cUv62Bdw=;
 b=ko2HCkv59BuHQ36tLRaeKC/uogAsW2hOh7kyLSPfxrvZLzQ42hIGK16q
 nY3oEYhaSmMyvO+WP/IcuUnseKI+tWoA6NYOkjO6KHof8t90KpoZw6s8Q
 RgvGROwacu9nZ9G2oGbBdZZOjTWDvWt5zbqEB8jN1MLNcr253T2n1IftV
 E4P2YlnA9VPMzaBoXbCJNP4O1jybBpXGdndeSA7FlvGNgx/d/MCu153cQ
 ooh4cxPyYb9cCWpetQS9wIQMoJWxVh6YPG5KZmXhuht7kBiJ6VBPMn7l7
 EZJ9Dk7BWuK6H3wobwz/MNJBzLafYpz8RrGxkk9YuQ1q5g8SBVeBBsDY7 w==;
X-CSE-ConnectionGUID: 7VhlN1xwR26ESGfysmYyLA==
X-CSE-MsgGUID: jgddVxaTS1yXmdJbyf91OQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="50344604"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; d="scan'208";a="50344604"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 05:49:46 -0700
X-CSE-ConnectionGUID: AmP5/uFzSuWzcG69fN/AYg==
X-CSE-MsgGUID: rFub4KfARuWjZmtO9x0kPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; d="scan'208";a="180462526"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa001.jf.intel.com with ESMTP; 28 May 2025 05:49:43 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: [RFC] [PATCH i-g-t v2] tests/intel/xe_fault_injection: Inject errors
 for VF provision
Date: Wed, 28 May 2025 18:36:03 +0530
Message-ID: <20250528130603.32274-1-satyanarayana.k.v.p@intel.com>
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
igt@xe_fault_injection@probe-fail-vf-provision-xe_should_fail_vf_provisioning

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Test-With: 20250523073638.24842-1-satyanarayana.k.v.p@intel.com

V1 -> V2:
- Fixed review comments.
---
 tests/intel/xe_fault_injection.c | 102 +++++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index f9bd5c761..18ea78bfb 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -29,6 +29,19 @@
 #define BO_SIZE		(1024*1024)
 #define INJECT_ITERATIONS	100
 
+#define VF_PROVISION_MAX_PARAMS	4
+#define INJECT_VF_PROVISION_ERR_MAX	6
+
+int vf_provision_err_inject_list[INJECT_VF_PROVISION_ERR_MAX] = {
+	-22, 	/* -EINVAL */
+	-28, 	/* -ENOSPC */
+	-61, 	/* -ENODATA */
+	-69, 	/* -ESRMNT */
+	-78,	/* -EREMCHG */
+	-122, 	/* -EDQUOT */
+};
+
+
 int32_t inject_iters_raw;
 struct fault_injection_params {
 	/* @probability: Likelihood of failure injection, in percent. */
@@ -71,6 +84,11 @@ static bool function_is_part_of_guc(const char function_name[])
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
@@ -87,6 +105,19 @@ static void ignore_faults_in_dmesg(const char function_name[])
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
 
@@ -278,6 +309,65 @@ static void probe_fail_guc(int fd, char pci_slot[], const char function_name[],
 	}
 }
 
+static void vf_provision_inject_fault(int fd,  const char func_name[],
+				      struct fault_injection_params *fault_params)
+{
+	int auto_probe_en = igt_sriov_is_driver_autoprobe_enabled(fd);
+	unsigned int totalvfs = igt_sriov_get_total_vfs(fd);
+	int i;
+
+	for (i = 0; i < INJECT_VF_PROVISION_ERR_MAX; i++) {
+		if (igt_sriov_get_enabled_vfs(fd))
+			igt_sriov_disable_vfs(fd);
+
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
+/**
+ * SUBTEST: probe-fail-vf-provision-%s
+ * Description: inject an error in the injectable function %arg[1] then reprobe driver
+ * Functionality: fault
+ *
+ * arg[1]:
+ * @xe_should_fail_vf_provisioning:     Inject an error when provisioning VF.
+ */
+static void probe_fail_vf_provision(int fd, char pci_slot[], const char function_name[],
+               struct fault_injection_params *fault_params)
+{
+	int space, times, interval;
+	/* We donot have LMEM for IGPU. */
+	int end = xe_has_vram(fd) ?
+		  (VF_PROVISION_MAX_PARAMS):(VF_PROVISION_MAX_PARAMS - 1);
+
+	igt_skip_on(!igt_sriov_is_pf(fd));
+	igt_assert(fault_params);
+
+	ignore_faults_in_dmesg(function_name);
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
@@ -551,6 +641,11 @@ igt_main_args("I:", NULL, help_str, opt_handler, NULL)
 		{ }
 	};
 
+	const struct section vf_proviosin_fail_functions[] = {
+		{ "xe_should_fail_vf_provisioning" },
+		{}
+	};
+
 	igt_fixture {
 		igt_require(fail_function_injection_enabled());
 		fd = drm_open_driver(DRIVER_XE);
@@ -586,6 +681,13 @@ igt_main_args("I:", NULL, help_str, opt_handler, NULL)
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

