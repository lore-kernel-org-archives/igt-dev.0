Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22CEACD5BD0
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 14:54:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB16510E22B;
	Wed, 27 May 2026 14:54:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g1uVYLoD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EE0910E84D
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 14:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779893651; x=1811429651;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AHZba9aqY2fhyhpyriLBUbPQLjEhzSZF2S+N1ZWKso4=;
 b=g1uVYLoDsdMVGqf/cqaNiXyFbXeYhJuXk3sM3G4K7xCQEvpWbaQ2Y2px
 Qrh6ynJa8F/Nzva0zMhl4ngxmOngGP4Co322MZncx0R/9qFw42fduJN6k
 sDvtKO7WZGC62rgNPcGgPSoQkzb9Jfrr7mHUqs+jy7UVP9Pkf26R6zsPi
 rvQFVbNviyTeycl1enj1GQ+T2/NwGiMQLnJOqTiHeBybrVYy50cRL2YLf
 tUAuxzYcuuV/OJEoEsdyQiBYzT0kWeEtTKoLByVp3Y8Xo5q0jW93IYNcf
 qc+zd78w3ZCiwcxAlBugrKt7AI0YT/g1lwEBTJMN6J89pMyEkpRfHm6sX A==;
X-CSE-ConnectionGUID: 1rdGQ87oRra46jlWdFrduQ==
X-CSE-MsgGUID: b9S/ujjCSZCswufOsc6yQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80912112"
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="80912112"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 07:54:10 -0700
X-CSE-ConnectionGUID: I4UMzEmgRnKt8oYBWp1aFg==
X-CSE-MsgGUID: zLXIGVo2Rpea5e6LnY+HGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,171,1774335600"; d="scan'208";a="266143911"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 07:54:08 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sk.anirban@intel.com, riana.tauro@intel.com, anshuman.gupta@intel.com,
 mallesh.koujalagi@intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [i-g-t,
 v2 1/1] tests/intel/xe_fault_injection: Add fault-injection tests for
 Freq Throttle Reasons
Date: Wed, 27 May 2026 20:23:55 +0530
Message-Id: <20260527145355.1652727-2-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260527145355.1652727-1-ravi.kishore.koppuravuri@intel.com>
References: <20260527145355.1652727-1-ravi.kishore.koppuravuri@intel.com>
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

Add IGT test to verify frequency throttling reason reporting with
the help of kernel's fault-injection framework. This test validates the
robustness of the throttle reason detection under various failure
scenarios by injecting faults into xe_gt_throttle_get_limit_reasons()
function. This test covers all the supported throttling reason types.

Dependencies:
	- Requires xe patch https://patchwork.freedesktop.org/patch/711954/
	- Kernel fault injection support (CONFIG_FAIL_FUNCTION=y)

Cc: Sk Anirban <sk.anirban@intel.com>
Cc: Tauro Riana <riana.tauro@intel.com>
Cc: Gupta Anshuman <anshuman.gupta@intel.com>
Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
---
 tests/intel/xe_fault_injection.c | 242 +++++++++++++++++++++++++++++++
 1 file changed, 242 insertions(+)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 4f4a7922c..2ebf91dff 100644
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
@@ -529,6 +589,137 @@ oa_add_config_fail(int fd, int sysfs, int devid,
 	igt_assert_eq(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_REMOVE_CONFIG, &config_id), 0);
 }
 
+enum cri_throttle_reason {
+	THROTTLE_REASON_PROCHOT = BIT(0),
+	THROTTLE_REASON_SOC_THERMAL = BIT(1),
+	THROTTLE_REASON_MEM_THERMAL = BIT(2),
+	THROTTLE_REASON_VR_THERMAL = BIT(3),
+	THROTTLE_REASON_ICCMAX = BIT(4),
+	THROTTLE_REASON_RATL = BIT(5),
+	THROTTLE_REASON_SOC_AVG_THERMAL = BIT(6),
+	THROTTLE_REASON_FASTVMODE = BIT(7),
+	THROTTLE_REASON_PL4_LIMIT = BIT(8),
+	THROTTLE_REASON_PKG_PL1 = BIT(10),
+	THROTTLE_REASON_PKG_PL2 = BIT(11),
+	THROTTLE_REASON_PSYS_PL1 = BIT(12),
+	THROTTLE_REASON_PSYS_PL2 = BIT(13),
+	THROTTLE_REASON_P0_FREQ = BIT(14),
+	THROTTLE_REASON_PSYS_CRIT = BIT(15),
+};
+
+enum non_cri_throttle_reason {
+	NON_CRI_THROTTLE_REASON_PROCHOT = BIT(0),
+	NON_CRI_THROTTLE_REASON_THERMAL = BIT(1),
+	NON_CRI_THROTTLE_REASON_RATL = BIT(5),
+	NON_CRI_THROTTLE_REASON_VR_THERMALERT = BIT(6),
+	NON_CRI_THROTTLE_REASON_VR_TDC = BIT(7),
+	NON_CRI_THROTTLE_REASON_PL4 = BIT(8),
+	NON_CRI_THROTTLE_REASON_PL1 = BIT(10),
+	NON_CRI_THROTTLE_REASON_PL2 = BIT(11),
+};
+
+static long long throttle_reason_to_inject_errno(unsigned int reason)
+{
+	igt_assert(reason);
+
+	return -ffs(reason);
+}
+
+static int
+inject_fault_throttle_reason(int fd, const char pci_slot[], const char function_name[],
+			     unsigned int reason,
+			     const char expected_reason_name[])
+{
+	int err = 0, len = -1;
+	char temp[256];
+	char *throttle_reasons;
+	long long injected_reason;
+
+	injected_reason = throttle_reason_to_inject_errno(reason);
+
+	igt_info("Injecting error (%d) into BIT(%d) in function \"%s\"\n",
+		 (int)injected_reason + 1, (int)(-(injected_reason+1)), function_name);
+
+	ignore_dmesg_errors_from_dut(pci_slot);
+	igt_audio_driver_unload(NULL);
+
+	injection_list_add(function_name);
+	set_retval(function_name, injected_reason);
+
+	throttle_reasons = read_throttle_reasons_from_sysfs(fd);
+	if (throttle_reasons) {
+		if (strstr(throttle_reasons, expected_reason_name) == NULL) {
+			memset(temp, 0, sizeof(temp));
+			len = strlen(throttle_reasons) < sizeof(temp) ? strlen(throttle_reasons) + 1 : sizeof(temp) - 1;
+			strncpy(temp, throttle_reasons, len);
+			free(throttle_reasons);
+			injection_list_remove(function_name);
+			ignore_fail_dump_in_dmesg(function_name, false);
+			igt_assert_f(false,
+				     "Expected throttle reason \"%s\" in sysfs output \"%s\"\n",
+				     expected_reason_name, temp);
+		}
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
+ * SUBTEST: throttle-reason-fail
+ * Description: inject throttle reasons in the injectable function
+ *		xe_gt_throttle_inject_errno and read reasons from sysfs
+ * Functionality: fault
+ *
+ * This subtest iterates through platform-specific throttle reasons.
+ * On CRI:
+ * prochot:         Frequency is clipped because of PROCHOT limit
+ * soc_thermal:     Frequency is clipped because of SOC hotspot temperature
+ * mem_thermal:     Frequency is clipped because of memory hotspot temperature
+ * vr_thermal:      Frequency is clipped because of VR hotspot temperature
+ * iccmax:          Frequency is clipped because of ICCMAX limit
+ * ratl:            Frequency is clipped because of RATL thermal algorithm
+ * soc_avg_thermal: Frequency is clipped because of SOC average thermal limit
+ * fastvmode:       Frequency is clipped because of Fast VMode limit
+ * pl4_limit:       Frequency is clipped because of PL4 limit
+ * pkg_pl1:         Frequency is clipped because of PKG PL1 limit
+ * pkg_pl2:         Frequency is clipped because of PKG PL2 limit
+ * psys_pl1:        Frequency is clipped because of PSYS PL1 limit
+ * psys_pl2:        Frequency is clipped because of PSYS PL2 limit
+ * p0_freq:         Frequency is clipped because of P0 frequency limit
+ * psys_crit:       Frequency is clipped because of PSYS critical limit
+ *
+ * On non-CRI:
+ * prochot:              Frequency is clipped because of PROCHOT
+ * thermal:              Frequency is clipped because of THERMAL
+ * ratl:                 Frequency is clipped because of RATL
+ * vr_thermalert:        Frequency is clipped because of VR_THERMALERT
+ * vr_tdc:               Frequency is clipped because of VR_TDC
+ * pl4:                  Frequency is clipped because of PL4
+ * pl1:              Frequency is clipped because of PL1
+ * pl2:              Frequency is clipped because of PL2
+ */
+static void throttle_reason_fail(int fd, const char pci_slot[], const char function_name[],
+				 struct fault_injection_params *fault_params,
+				 unsigned int reason,
+				 const char expected_reason_name[])
+{
+	int retval = 0;
+
+	igt_assert(fault_params);
+	setup_injection_fault(fault_params);
+	retval = inject_fault_throttle_reason(fd, pci_slot, function_name, reason,
+					      expected_reason_name);
+	igt_assert_eq(retval, 0);
+}
+
 static int opt_handler(int opt, int opt_index, void *data)
 {
 	int in_param;
@@ -561,6 +752,7 @@ int igt_main_args("I:", NULL, help_str, opt_handler, NULL)
 	static uint32_t devid;
 	char pci_slot[NAME_MAX];
 	bool is_vf_device;
+	bool is_cri_device;
 	const struct section {
 		const char *name;
 		unsigned int flags;
@@ -625,6 +817,37 @@ int igt_main_args("I:", NULL, help_str, opt_handler, NULL)
 		{ }
 	};
 
+	const struct section throttle_reason_fail_functions_cri[] = {
+		{ "prochot", THROTTLE_REASON_PROCHOT },
+		{ "soc_thermal", THROTTLE_REASON_SOC_THERMAL },
+		{ "mem_thermal", THROTTLE_REASON_MEM_THERMAL },
+		{ "vr_thermal", THROTTLE_REASON_VR_THERMAL },
+		{ "iccmax", THROTTLE_REASON_ICCMAX },
+		{ "ratl", THROTTLE_REASON_RATL },
+		{ "soc_avg_thermal", THROTTLE_REASON_SOC_AVG_THERMAL },
+		{ "fastvmode", THROTTLE_REASON_FASTVMODE },
+		{ "pl4_limit", THROTTLE_REASON_PL4_LIMIT },
+		{ "pkg_pl1", THROTTLE_REASON_PKG_PL1 },
+		{ "pkg_pl2", THROTTLE_REASON_PKG_PL2 },
+		{ "psys_pl1", THROTTLE_REASON_PSYS_PL1 },
+		{ "psys_pl2", THROTTLE_REASON_PSYS_PL2 },
+		{ "p0_freq", THROTTLE_REASON_P0_FREQ },
+		{ "psys_crit", THROTTLE_REASON_PSYS_CRIT },
+		{ }
+	};
+	const struct section throttle_reason_fail_functions_non_cri[] = {
+		{ "prochot", NON_CRI_THROTTLE_REASON_PROCHOT },
+		{ "thermal", NON_CRI_THROTTLE_REASON_THERMAL },
+		{ "ratl", NON_CRI_THROTTLE_REASON_RATL },
+		{ "vr_thermalert", NON_CRI_THROTTLE_REASON_VR_THERMALERT },
+		{ "vr_tdc", NON_CRI_THROTTLE_REASON_VR_TDC },
+		{ "pl4", NON_CRI_THROTTLE_REASON_PL4 },
+		{ "pl1", NON_CRI_THROTTLE_REASON_PL1 },
+		{ "pl2", NON_CRI_THROTTLE_REASON_PL2 },
+		{ }
+	};
+	const char *throttle_reason_function_name = "xe_gt_throttle_inject_errno";
+
 	igt_fixture() {
 		igt_require(fail_function_injection_enabled());
 		fd = drm_open_driver(DRIVER_XE);
@@ -634,12 +857,31 @@ int igt_main_args("I:", NULL, help_str, opt_handler, NULL)
 		setup_injection_fault(&default_fault_params);
 		igt_install_exit_handler(cleanup_injection_fault);
 		is_vf_device = intel_is_vf_device(fd);
+		is_cri_device = IS_CRESCENTISLAND(devid);
 	}
 
 	for (const struct section *s = vm_create_fail_functions; s->name; s++)
 		igt_subtest_f("vm-create-fail-%s", s->name)
 			vm_create_fail(fd, pci_slot, s->name, s->flags);
 
+	igt_subtest("throttle-reason-fail") {
+		const struct section *throttle_reason_fail_functions;
+
+		throttle_reason_fail_functions = is_cri_device ?
+			throttle_reason_fail_functions_cri :
+			throttle_reason_fail_functions_non_cri;
+
+		igt_info("Running throttle-reason-fail with %s mapping\n",
+			 is_cri_device ? "CRI" : "Platform other than CRI");
+
+		for (const struct section *s = throttle_reason_fail_functions; s->name; s++) {
+			memcpy(&fault_params, &default_fault_params,
+			       sizeof(struct fault_injection_params));
+			throttle_reason_fail(fd, pci_slot, throttle_reason_function_name,
+					     &fault_params, s->flags, s->name);
+		}
+	}
+
 	for (const struct section *s = vm_bind_fail_functions; s->name; s++)
 		igt_subtest_f("vm-bind-fail-%s", s->name)
 			vm_bind_fail(fd, pci_slot, s->name);
-- 
2.34.1

