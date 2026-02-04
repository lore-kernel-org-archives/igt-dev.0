Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14414EA7942
	for <igt-dev@archiver.kernel.org>; Wed,  4 Feb 2026 18:31:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB2AF10E700;
	Wed,  4 Feb 2026 18:31:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IyvhOh/d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4E6710E736
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Feb 2026 18:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770229906; x=1801765906;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LHwFBV+ipQsNg05mi6Vah6/r92Dk8Umqq8QvTkPdVM8=;
 b=IyvhOh/dSvHWNBIQgFG86OSVsVVjaJneNSAzt1d8afYw9YsVBX+V91vk
 4CQDxvHIa6b/ahj0Er+Bh3hFsBbE7HzE4UiO3PAaNOGbPJqzRdWQeVeos
 nrulkkn4sjws2ccy0EQCiTAjxvEciZ4Lp694glj/3MbZLHHXD3LiUVVDm
 CKF9g6iL1dVuTicfarhvAABOUr4IuWHBVjuA6jav7OdrDzBRPuaGHZu7H
 m1yvo19QzNAY4xj+YDu2LzS9myigUdeLTXE6w4cQnoDHma2IugC1ueU1h
 rPgmxF6Nm/1MiDNfVLDjJvXMgLGJ//h5t30kfK0DolXjUA+NLb2s2Y478 w==;
X-CSE-ConnectionGUID: P8kjUiSwRDedQ3XDXAt0qw==
X-CSE-MsgGUID: oW7lUDajSpSKdhU0B2lrAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="74028412"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="74028412"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 10:31:46 -0800
X-CSE-ConnectionGUID: xmOKYwDxTHWLdUW7n3mNmg==
X-CSE-MsgGUID: VhSThKQpSTKOawZJ6rN+ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="214409430"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 10:31:44 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 rodrigo.vivi@intel.com, kamil.konieczny@linux.intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t v11 2/2] tests/intel/xe_pm_residency: Add subtest for
 ASPM Link state residency
Date: Thu,  5 Feb 2026 00:07:47 +0530
Message-Id: <20260204183747.1960879-3-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260204183747.1960879-1-karthik.poosa@intel.com>
References: <20260204183747.1960879-1-karthik.poosa@intel.com>
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

Add subtest aspm_link_residency to verify PCIe ASPM.
Active State Power Management (ASPM) is a power management mechanism
for PCI Express (PCIe) devices that aims to save power while the devices
are in a fully active state.
This test uses link state counters from the debugfs
dgfx_pcie_link_residencies to verify this.

v2:
 - Add dedicated function to get pcie endpoint upstream port. (Badal)
 - Read residency counter as unsigned long long int instead of
   unsigned long int.
 - Print residency counter before sleep also.
 - Don't assert if sysfs not corresponding to aspm_link_state
   is not present. (Badal)
 - Run workload before validation of aspm link residency. (Anshuman)

v3:
 - Move igt_device_get_pci_usp to separate patch. (Kamil)
 - Move reading of residency to separate function. (Badal)

v4:
 - Add description about PCIe ASPM in commit message and code. (Kamil)
 - Add a NULL check for the return value of igt_device_get_pci_usp().
 - Resolve compilation warnings about using variable as format string
   to sscanf.

v5:
 - Use igt_device_get_pci_upstream_port() which is the renamed version
   of igt_device_get_pci_usp().

v6:
 - Refactor and enhance readability. (Badal)
 - Move save and restore of link states to separate functions. (Badal)

v7:
 - Skip aspm_link_residency on integrated platforms as it not supported.

v8:
 - Address below review comments from Riana.
 - Use igt_sysfs_has_attr() instead of faccess().
 - Remove unnecessary spaces, debug logs, if checks.
 - Wrap line length to 100 chars.
 - Use spinner instead of mmap for workload.

v9:
 - Address review comments from Kamil.
 - Simplify couple of igt_asserts.
 - Remove extra spaces.

v10:
 - Add exit handler for aspm_link_residency test. (Riana)
 - Remove unused and unnecessary variables.

v11:
 - Address below review comments. (Kamil)
 - Improve save_and_disable_link_states() to restore link states on any
   failure.
 - Avoid igt_assert in aspm exit handler.
 - Make subtest non-dynamic.
 - Add a comment explaining the purpose of the spinner.
 - Update conditions and messages of couple of igt_asserts.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 tests/intel/xe_pm_residency.c | 215 ++++++++++++++++++++++++++++++++++
 1 file changed, 215 insertions(+)

diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index d33a87b13..61b63ed4f 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -31,12 +31,36 @@
 
 const double tolerance = 0.1;
 int fw_handle = -1;
+int fd_pci_usp = -1;
+bool rpm_disabled;
 
 enum test_type {
 	TEST_S2IDLE,
 	TEST_IDLE,
 };
 
+enum link_state_index {
+	LINK_STATE_ASPM,
+	LINK_STATE_ASPM_L1_1,
+	LINK_STATE_ASPM_L1_2,
+	LINK_STATE_PCIPM_L1_1,
+	LINK_STATE_PCIPM_L1_2,
+	MAX_LINK_STATES,
+};
+
+struct link_state_info {
+	const char *filename;
+	char state;
+	const char *parse_str;
+	bool saved;
+} link_state_sysfs[] = {
+	{ "l1_aspm", 0, "PCIE LINK L1 RESIDENCY : "},
+	{ "l1_1_aspm", 0, "NULL"},
+	{ "l1_2_aspm", 0, "PCIE LINK L1.2 RESIDENCY : "},
+	{ "l1_1_pcipm", 0, NULL},
+	{ "l1_2_pcipm", 0, NULL},
+};
+
 /**
  * SUBTEST: gt-c6-on-idle
  * Description: Validate GT C6 state on idle
@@ -64,6 +88,10 @@ enum test_type {
  * SUBTEST: cpg-gt-toggle
  * Description: Toggle GT coarse power gating states by acquiring/releasing
  *		forcewake.
+ *
+ * SUBTEST: aspm_link_residency
+ * Description: Check for PCIe ASPM (Active State Power Management) link states
+ * entry while device is in D0.
  */
 IGT_TEST_DESCRIPTION("Tests for gtidle properties");
 
@@ -255,6 +283,21 @@ static void idle_residency_on_exec(int fd, struct drm_xe_engine_class_instance *
 	munmap(done, 4096);
 }
 
+static void do_spin(int fd, struct drm_xe_engine_class_instance *eci)
+{
+	igt_spin_t *spin;
+	uint64_t vm, ahnd;
+
+	igt_info("Running spinner on %s:%d\n",
+		 xe_engine_class_string(eci->engine_class), eci->engine_instance);
+	vm = xe_vm_create(fd, 0, 0);
+	intel_allocator_init();
+	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
+	spin = igt_spin_new(fd, .ahnd = ahnd, .vm = vm, .hwe = eci);
+	igt_measured_usleep(USEC_PER_SEC);
+	igt_spin_free(fd, spin);
+}
+
 static void measure_power(struct igt_power *gpu, double *power)
 {
 	struct power_sample power_sample[2];
@@ -370,6 +413,159 @@ static void cpg_gt_toggle(int fd)
 		powergate_status(fd, gt, "down");
 }
 
+static uint64_t get_link_state_residency(int fd_xe, const char *parse_str)
+{
+	int fd_debugfs_dir = 0;
+	uint64_t residency = 0;
+	char buf[1024] = {0};
+	char *ptr = NULL;
+	int ret = 0;
+
+	fd_debugfs_dir = igt_debugfs_dir(fd_xe);
+	igt_assert(fd_debugfs_dir >= 0);
+	ret = igt_debugfs_simple_read(fd_debugfs_dir, "dgfx_pcie_link_residencies", buf,
+				      sizeof(buf));
+	igt_assert_f(ret >= 0, "Cannot read residency file dgfx_pcie_link_residencies, ret %d\n",
+		     ret);
+
+	ptr = strstr(buf, parse_str);
+	igt_assert_f(ptr, "Cannot find residency string %s\n", parse_str);
+	ret = sscanf(ptr + strlen(parse_str), "%lu", &residency);
+	igt_assert_f(ret > 0, "Couldn't read residency value, ret %d\n", ret);
+	igt_info("Link residency %" PRIu64 "\n", residency);
+	close(fd_debugfs_dir);
+
+	return residency;
+}
+
+static void restore_link_states(void)
+{
+	char path[256] = {0};
+	int ret = 0;
+	int i = 0;
+
+	if (fd_pci_usp >= 0) {
+		/* Restore saved states of L1 sysfs entries. */
+		for (i = 0 ; (i < MAX_LINK_STATES) && link_state_sysfs[i].saved ; i++) {
+			sprintf(path, "%s", link_state_sysfs[i].filename);
+			if (!igt_sysfs_has_attr(fd_pci_usp, path))
+				continue;
+			ret = igt_sysfs_printf(fd_pci_usp, path, "%c", link_state_sysfs[i].state);
+			if (ret != 1) {
+				igt_warn("Couldn't restore %s to %c\n",
+					 link_state_sysfs[i].filename, link_state_sysfs[i].state);
+			} else {
+				link_state_sysfs[i].saved = false;
+				igt_debug("Restored %s to %c\n", link_state_sysfs[i].filename,
+					  link_state_sysfs[i].state);
+			}
+		}
+	}
+}
+
+static void save_and_disable_link_states(void)
+{
+	char path[256] = {0};
+	int ret = 0;
+	int i = 0;
+
+	for (i = 0 ; i < MAX_LINK_STATES ; i++) {
+		sprintf(path, "%s", link_state_sysfs[i].filename);
+		if (!igt_sysfs_has_attr(fd_pci_usp, path))
+			continue;
+		ret = igt_sysfs_scanf(fd_pci_usp, path, "%c", &link_state_sysfs[i].state);
+		if (ret != 1) {
+			igt_warn("Couldn't read file %s\n", path);
+			goto restore;
+		}
+		link_state_sysfs[i].saved = true;
+		igt_debug("saved %s = %c\n", link_state_sysfs[i].filename,
+			  link_state_sysfs[i].state);
+		ret = igt_sysfs_printf(fd_pci_usp, path, "%c", '0');
+		if (ret != 1) {
+			igt_warn("Couldn't write file %s\n", path);
+			goto restore;
+		}
+	}
+	return;
+
+restore:
+	restore_link_states();
+	igt_assert_f((ret == 1), "%s failed, ret %d\n", __func__, ret);
+}
+
+static void aspm_residency_exit_handler(int sig)
+{
+	restore_link_states();
+	if (rpm_disabled) {
+		igt_restore_runtime_pm();
+		rpm_disabled = false;
+	}
+	if (fd_pci_usp != -1) {
+		close(fd_pci_usp);
+		fd_pci_usp = -1;
+	}
+}
+
+static void test_aspm_link_residency(int fd_xe, enum link_state_index aspm_link_state)
+{
+	uint64_t residency_pre = 0, residency_post = 0;
+	struct pci_device *pci_dev;
+	char name[PATH_MAX];
+	int ret = 0;
+
+	igt_assert(aspm_link_state <= LINK_STATE_ASPM_L1_2);
+
+	/* Get upstream port pci_dev */
+	pci_dev = igt_device_get_pci_upstream_port(fd_xe);
+	igt_assert_f(pci_dev, "Couldn't get pci device of upstream port\n");
+	igt_debug("Upstream port PCI device: %04x:%02x:%02x.%01x\n", pci_dev->domain,
+		  pci_dev->bus, pci_dev->dev, pci_dev->func);
+
+	snprintf(name, sizeof(name), "/sys/bus/pci/devices/%04x:%02x:%02x.%01x/link",
+		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
+	fd_pci_usp = open(name, O_DIRECTORY);
+	igt_assert_f((fd_pci_usp >= 0), "Can't open link directory upstream port %s, ret %d\n",
+		     name, fd_pci_usp);
+
+	/* Disable runtime PM as link ASPM entry happens during device is in D0 only. */
+	igt_assert(igt_setup_runtime_pm(fd_xe));
+	igt_disable_runtime_pm();
+	rpm_disabled = true;
+
+	/* Check if ASPM sysfs is present. */
+	igt_require_f(igt_sysfs_has_attr(fd_pci_usp, link_state_sysfs[aspm_link_state].filename),
+		      "%s is not present\n", link_state_sysfs[aspm_link_state].filename);
+	ret = igt_sysfs_scanf(fd_pci_usp, link_state_sysfs[aspm_link_state].filename, "%c",
+			      &link_state_sysfs[aspm_link_state].state);
+	igt_assert_f((ret == 1), "Couldn't read residency for %s\n",
+		     link_state_sysfs[aspm_link_state].filename);
+
+	/* Save current state and disable of all available link sysfs entries. */
+	save_and_disable_link_states();
+
+	/* Enable only the ASPM link state needed for test. */
+	igt_debug("Enabling %s\n", link_state_sysfs[aspm_link_state].filename);
+	ret = igt_sysfs_printf(fd_pci_usp, link_state_sysfs[aspm_link_state].filename, "%c", '1');
+	igt_assert_f((ret == 1), "Failed to enable link state %s\n",
+		     link_state_sysfs[aspm_link_state].filename);
+
+	/* Read link state residencies before and after idle wait time. */
+	residency_pre = get_link_state_residency(fd_xe,
+						 link_state_sysfs[aspm_link_state].parse_str);
+	igt_info("Waiting for link to enter idle....\n");
+	sleep(SLEEP_DURATION);
+	residency_post = get_link_state_residency(fd_xe,
+						  link_state_sysfs[aspm_link_state].parse_str);
+
+	aspm_residency_exit_handler(0);
+	close(fd_xe);
+
+	igt_assert_f(residency_post > residency_pre,
+		     "ASPM entry failed, pre %" PRIu64 ", post %" PRIu64 "\n", residency_pre,
+		     residency_post);
+}
+
 int igt_main()
 {
 	uint32_t d3cold_allowed;
@@ -444,6 +640,25 @@ int igt_main()
 		cpg_gt_toggle(fd);
 	}
 
+	igt_describe("ASPM Link residency validation");
+	igt_subtest("aspm_link_residency") {
+		/* Run this test only for discrete platforms. */
+		igt_require(xe_has_vram(fd));
+		/*
+		 * Run spinner workload to wakeup GPU and ensure its engines execute some workload
+		 * before entering ASPM.
+		 */
+		xe_for_each_gt(fd, gt) {
+			xe_for_each_engine(fd, hwe) {
+				if (gt == hwe->gt_id && !hwe->engine_instance)
+					do_spin(fd, hwe);
+			}
+		}
+
+		igt_install_exit_handler(aspm_residency_exit_handler);
+		test_aspm_link_residency(fd, LINK_STATE_ASPM);
+	}
+
 	igt_fixture() {
 		close(fd);
 	}
-- 
2.25.1

