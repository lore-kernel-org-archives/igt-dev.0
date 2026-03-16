Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E71F3028C
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 06:29:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 988F410E0B1;
	Mon, 16 Mar 2026 06:29:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fg3akgpw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 481DD10E0B1
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 06:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773642572; x=1805178572;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TpW1AaygBBKARS3DpMFKJs8YvOdhxtY3bNBXRttUmAQ=;
 b=Fg3akgpwAs73AYcA84KUlVLj9NFdDU6IO9XlK0+aefqb0CYnynr40eGd
 pYl7jbOJ8IbWtQs3EgIBIeYrhdXd4JY8xI6tm02vr3YE0GeEPkl/4ao3h
 LCvKTqUACtmKm1W+ST8Q7rxsU5jeyNHwPJ91aaIv9NDlomrBUEaFPzRDl
 rAcQ8sLBVbgW9NR0DfiXQwheFyerPb8QkbrGTFe2RoUChpI2jHXrNRaPy
 jygBVgAVJyt/gXWTQ4IqULoq3ZHgOTKsulP37pNdYXLEeaIHYI25muMLT
 Vii8nJk/bFg89SRUgX9Rl/xZX2BQvgb7acnxQmPKymIId95zl1dkhPM5J A==;
X-CSE-ConnectionGUID: N/2iwWILSkGNPK3PA1//MQ==
X-CSE-MsgGUID: z1/62+U6RN2D96POB29Y9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="74544700"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="74544700"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2026 23:29:31 -0700
X-CSE-ConnectionGUID: dLplVOnmSDeydWVRkT/MpA==
X-CSE-MsgGUID: N1LsekykReS4NljYXtm2dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="259713622"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2026 23:29:29 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 Sk Anirban <sk.anirban@intel.com>, Tauro Riana <riana.tauro@intel.com>,
 Gupta Anshuman <anshuman.gupta@intel.com>
Subject: [PATCH] tests/intel/xe_fault_injection: Add fault-injection tests for
 CRI Freq Throttle Reasons
Date: Mon, 16 Mar 2026 11:59:03 +0530
Message-Id: <20260316062903.2070445-1-ravi.kishore.koppuravuri@intel.com>
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

Add IGT test to verify CRI frequency throttling reason reporting with
the help of kernel's fault-injection framework. This test validates the
robustness of the throttle reason detection under various failure
scenarios by injecting faults into xe_gt_throttle_get_limit_reasons()
function. This test covers all the supported throttling reason types.

Dependencies:
	- Requires xe kernel patch from PR-1876
	- Kernel fault injection support (CONFIG_FAIL_FUNCTION=y)

This test is verified on BMG platform and below are the results

---
Test Execution

$ ./build/tests/xe_fault_injection --run-subtest 'throttle*'
IGT-Version: 2.3-g06706ff21 (x86_64) (Linux: 7.0.0-rc2-throttle-reason-injection-test x86_64)
Using IGT_SRANDOM=1773144939 for randomisation
Opened device: /dev/dri/card0
Starting subtest: throttle-reason-fail-soc_thermal
Injecting error (-1) in function "xe_gt_throttle_inject_errno"
Reason for Throttling is : thermal
Subtest throttle-reason-fail-soc_thermal: SUCCESS (0.022s)
Starting subtest: throttle-reason-fail-mem_thermal
Injecting error (-2) in function "xe_gt_throttle_inject_errno"
Reason for Throttling is : none
Subtest throttle-reason-fail-mem_thermal: SUCCESS (0.023s)
Starting subtest: throttle-reason-fail-vr_thermal
Injecting error (-3) in function "xe_gt_throttle_inject_errno"
Reason for Throttling is : none
Subtest throttle-reason-fail-vr_thermal: SUCCESS (0.031s)
Starting subtest: throttle-reason-fail-iccmax
Injecting error (-4) in function "xe_gt_throttle_inject_errno"
Reason for Throttling is : none
Subtest throttle-reason-fail-iccmax: SUCCESS (0.034s)
Starting subtest: throttle-reason-fail-ratl
Injecting error (-5) in function "xe_gt_throttle_inject_errno"
Reason for Throttling is : ratl
Subtest throttle-reason-fail-ratl: SUCCESS (0.042s)
Starting subtest: throttle-reason-fail-soc_avg_thermal
Injecting error (-6) in function "xe_gt_throttle_inject_errno"
Reason for Throttling is : vr_thermalert
Subtest throttle-reason-fail-soc_avg_thermal: SUCCESS (0.042s)
Starting subtest: throttle-reason-fail-fastvmode
Injecting error (-7) in function "xe_gt_throttle_inject_errno"
Reason for Throttling is : vr_tdc
Subtest throttle-reason-fail-fastvmode: SUCCESS (0.030s)
Starting subtest: throttle-reason-fail-pl4_limit
Injecting error (-8) in function "xe_gt_throttle_inject_errno"
Reason for Throttling is : pl4
Subtest throttle-reason-fail-pl4_limit: SUCCESS (0.030s)
Starting subtest: throttle-reason-fail-max_vid
Injecting error (-9) in function "xe_gt_throttle_inject_errno"
Reason for Throttling is : none
Subtest throttle-reason-fail-max_vid: SUCCESS (0.018s)
Starting subtest: throttle-reason-fail-pkg_pl1
Injecting error (-10) in function "xe_gt_throttle_inject_errno"
Reason for Throttling is : pl1
Subtest throttle-reason-fail-pkg_pl1: SUCCESS (0.033s)
Starting subtest: throttle-reason-fail-pkg_pl2
Injecting error (-11) in function "xe_gt_throttle_inject_errno"
Reason for Throttling is : pl2
Subtest throttle-reason-fail-pkg_pl2: SUCCESS (0.031s)
Starting subtest: throttle-reason-fail-psys_pl1
Injecting error (-12) in function "xe_gt_throttle_inject_errno"
Reason for Throttling is : none
Subtest throttle-reason-fail-psys_pl1: SUCCESS (0.022s)
Starting subtest: throttle-reason-fail-psys_pl2
Injecting error (-13) in function "xe_gt_throttle_inject_errno"
Reason for Throttling is : none
Subtest throttle-reason-fail-psys_pl2: SUCCESS (0.035s)
Starting subtest: throttle-reason-fail-p0_freq
Injecting error (-14) in function "xe_gt_throttle_inject_errno"
Reason for Throttling is : none
Subtest throttle-reason-fail-p0_freq: SUCCESS (0.030s)
Starting subtest: throttle-reason-fail-psys_crit
Injecting error (-15) in function "xe_gt_throttle_inject_errno"
Reason for Throttling is : none
Subtest throttle-reason-fail-psys_crit: SUCCESS (0.034s)
---
---

Cc: Sk Anirban <sk.anirban@intel.com>
Cc: Tauro Riana <riana.tauro@intel.com>
Cc: Gupta Anshuman <anshuman.gupta@intel.com>
Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
---
 tests/intel/xe_fault_injection.c | 172 +++++++++++++++++++++++++++++++
 1 file changed, 172 insertions(+)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 4f4a7922c..05f5125cf 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -234,6 +234,66 @@ static void ignore_fail_dump_in_dmesg(const char function_name[], bool enable)
 	}
 }
 
+static char *prepare_reasons_path(int fd)
+{
+	char sysfs_path[PATH_MAX];
+	char device_link[PATH_MAX];
+	char pcie_path[PATH_MAX];
+	char reasons_path[PATH_MAX];
+	int ret;
+
+	igt_assert(igt_sysfs_path(fd, sysfs_path, sizeof(sysfs_path)));
+
+	ret = snprintf(device_link, sizeof(device_link), "%s/device", sysfs_path);
+	igt_assert(ret > 0 && ret < sizeof(device_link));
+	igt_assert(realpath(device_link, pcie_path));
+
+	ret = snprintf(reasons_path, sizeof(reasons_path),
+		       "%s/tile0/gt0/freq0/throttle/reasons", pcie_path);
+	igt_assert(ret > 0 && ret < sizeof(reasons_path));
+
+	return strdup(reasons_path);
+}
+
+static char *read_throttle_reasons_from_sysfs(int fd)
+{
+	char *reasons_path = NULL;
+	char *reasons = NULL;
+	int ret = -1;
+	int reason_fd = -1;
+
+	reasons_path = prepare_reasons_path(fd);
+	if (!reasons_path)
+		return NULL;
+
+	reason_fd = open(reasons_path, O_RDONLY);
+	if (reason_fd < 0) {
+		free(reasons_path);
+		return NULL;
+	}
+
+	free(reasons_path);
+	reasons = calloc(1, 256);
+	if (!reasons)
+		goto err;
+
+	ret = read(reason_fd, reasons, 255);
+	if (ret < 0)
+		goto err;
+
+	reasons[ret] = '\0';
+
+	close(reason_fd);
+	return reasons;
+
+err:
+	if (reason_fd >= 0)
+		close(reason_fd);
+	if (reasons)
+		free(reasons);
+	return NULL;
+}
+
 /**
  * SUBTEST: inject-fault-probe-function-%s
  * Description: inject an error in the injectable function %arg[1] then
@@ -529,6 +589,90 @@ oa_add_config_fail(int fd, int sysfs, int devid,
 	igt_assert_eq(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_REMOVE_CONFIG, &config_id), 0);
 }
 
+enum cri_throttle_reason {
+	THROTTLE_REASON_SOC_THERMAL = -1,
+	THROTTLE_REASON_MEM_THERMAL = -2,
+	THROTTLE_REASON_VR_THERMAL = -3,
+	THROTTLE_REASON_ICCMAX = -4,
+	THROTTLE_REASON_RATL = -5,
+	THROTTLE_REASON_SOC_AVG_THERMAL = -6,
+	THROTTLE_REASON_FASTVMODE = -7,
+	THROTTLE_REASON_PL4_LIMIT = -8,
+	THROTTLE_REASON_MAX_VID = -9,
+	THROTTLE_REASON_PKG_PL1 = -10,
+	THROTTLE_REASON_PKG_PL2 = -11,
+	THROTTLE_REASON_PSYS_PL1 = -12,
+	THROTTLE_REASON_PSYS_PL2 = -13,
+	THROTTLE_REASON_P0_FREQ = -14,
+	THROTTLE_REASON_PSYS_CRIT = -15,
+};
+
+static int
+inject_fault_throttle_reason(int fd, const char pci_slot[], const char function_name[],
+			     enum cri_throttle_reason reason)
+{
+	int err = 0;
+	char *throttle_reasons;
+
+	igt_info("Injecting error (%d) in function \"%s\"\n",
+		 reason, function_name);
+
+	ignore_dmesg_errors_from_dut(pci_slot);
+	igt_audio_driver_unload(NULL);
+
+	injection_list_add(function_name);
+	set_retval(function_name, reason);
+
+	throttle_reasons = read_throttle_reasons_from_sysfs(fd);
+	if (throttle_reasons) {
+		igt_info("Reason for Throttling is : %s", throttle_reasons);
+		free(throttle_reasons);
+	} else {
+		igt_warn("Failed to read throttle reasons from sysfs\n");
+		err = -errno;
+	}
+
+	injection_list_remove(function_name);
+	ignore_fail_dump_in_dmesg(function_name, false);
+
+	return err;
+}
+
+/**
+ * SUBTEST: throttle-reason-fail-%s
+ * Description: inject a throttle reason in the injectable function %arg[1] then
+ * read the reasons from sysfs
+ * Functionality: fault
+ *
+ * arg[1]:
+ * @soc_thermal:     Frequency is clipped because of SOC hotspot temperature
+ * @mem_thermal:     Frequency is clipped because of memory hotspot temperature
+ * @vr_thermal:      Frequency is clipped because of VR hotspot temperature
+ * @iccmax:          Frequency is clipped because of ICCMAX limit
+ * @ratl:       Frequency is clipped because of RATL thermal algorithm
+ * @soc_avg_thermal: Frequency is clipped because of SOC average thermal limit
+ * @fastvmode:       Frequency is clipped because of Fast VMode limit
+ * @pl4_limit:       Frequency is clipped because of PL4 limit
+ * @max_vid:       Frequency is clipped because of MAX VID limit
+ * @pkg_pl1:       Frequency is clipped because of PKG PL1 limit
+ * @pkg_pl2:       Frequency is clipped because of PKG PL2 limit
+ * @psys_pl1:       Frequency is clipped because of PSYS PL1 limit
+ * @psys_pl2:       Frequency is clipped because of PSYS PL2 limit
+ * @p0_freq:       Frequency is clipped because of P0 frequency limit
+ * @psys_crit:       Frequency is clipped because of PSYS critical limit
+ */
+static void throttle_reason_fail(int fd, const char pci_slot[], const char function_name[],
+				 struct fault_injection_params *fault_params,
+				 enum cri_throttle_reason reason)
+{
+	int retval = 0;
+
+	igt_assert(fault_params);
+	setup_injection_fault(fault_params);
+	retval = inject_fault_throttle_reason(fd, pci_slot, function_name, reason);
+	igt_assert_eq(retval, 0);
+}
+
 static int opt_handler(int opt, int opt_index, void *data)
 {
 	int in_param;
@@ -625,6 +769,26 @@ int igt_main_args("I:", NULL, help_str, opt_handler, NULL)
 		{ }
 	};
 
+	const struct section throttle_reason_fail_functions[] = {
+		{ "soc_thermal", THROTTLE_REASON_SOC_THERMAL },
+		{ "mem_thermal", THROTTLE_REASON_MEM_THERMAL },
+		{ "vr_thermal", THROTTLE_REASON_VR_THERMAL },
+		{ "iccmax", THROTTLE_REASON_ICCMAX },
+		{ "ratl", THROTTLE_REASON_RATL },
+		{ "soc_avg_thermal", THROTTLE_REASON_SOC_AVG_THERMAL },
+		{ "fastvmode", THROTTLE_REASON_FASTVMODE },
+		{ "pl4_limit", THROTTLE_REASON_PL4_LIMIT },
+		{ "max_vid", THROTTLE_REASON_MAX_VID },
+		{ "pkg_pl1", THROTTLE_REASON_PKG_PL1 },
+		{ "pkg_pl2", THROTTLE_REASON_PKG_PL2 },
+		{ "psys_pl1", THROTTLE_REASON_PSYS_PL1 },
+		{ "psys_pl2", THROTTLE_REASON_PSYS_PL2 },
+		{ "p0_freq", THROTTLE_REASON_P0_FREQ },
+		{ "psys_crit", THROTTLE_REASON_PSYS_CRIT },
+		{ }
+	};
+	const char *throttle_reason_function_name = "xe_gt_throttle_inject_errno";
+
 	igt_fixture() {
 		igt_require(fail_function_injection_enabled());
 		fd = drm_open_driver(DRIVER_XE);
@@ -640,6 +804,14 @@ int igt_main_args("I:", NULL, help_str, opt_handler, NULL)
 		igt_subtest_f("vm-create-fail-%s", s->name)
 			vm_create_fail(fd, pci_slot, s->name, s->flags);
 
+	for (const struct section *s = throttle_reason_fail_functions; s->name; s++)
+		igt_subtest_f("throttle-reason-fail-%s", s->name) {
+			memcpy(&fault_params, &default_fault_params,
+			       sizeof(struct fault_injection_params));
+			throttle_reason_fail(fd, pci_slot, throttle_reason_function_name,
+					     &fault_params, s->flags);
+		}
+
 	for (const struct section *s = vm_bind_fail_functions; s->name; s++)
 		igt_subtest_f("vm-bind-fail-%s", s->name)
 			vm_bind_fail(fd, pci_slot, s->name);
-- 
2.34.1

