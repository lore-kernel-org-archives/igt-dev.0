Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C28B9D5C0CD
	for <igt-dev@archiver.kernel.org>; Tue, 16 Dec 2025 08:10:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69B9C10E743;
	Tue, 16 Dec 2025 08:10:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ffXuvcGL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C4BC10E766
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Dec 2025 08:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765872614; x=1797408614;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HC04hyF7KQybntiIbqKZj1YE3Nd9LljuLJh2KmtO6PE=;
 b=ffXuvcGLZDdpiBDNgxiA0gIWOFFOcJ2ym8BWldnXnkNznX+kcpAFBFAC
 5KcX/cWkts6ZjR3nerrSn4mhRzjYJc0qupLjbm3NfQcwekvHjm0xze7qZ
 lRIPQwx3JKwWma7+ShdlrHGIY78IKjh+d9vaHOj8e51rVdcGTinUzDR13
 Foyg2mFNILejcyjiWW5YETtwP9PZWYR4/IG46w/Ycf/GYKCwDJW/eUDR8
 xceXgeNBCB98o5Kymn3pSUJleR52UYdg/jgJkpPg2WWDkIJtkXNDLb6+s
 e4l7YsaudCaFk65YwzMC90vBcB91CAj+kYLq/77eAq1f1lPkPu6gMI4wv Q==;
X-CSE-ConnectionGUID: 7JH1qbyfTWaVzXl8qWVT6g==
X-CSE-MsgGUID: dmduFwdETXCm8ZwYIXJVOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="66773082"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="66773082"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 00:10:13 -0800
X-CSE-ConnectionGUID: BWVgDTJhSYm7wR/ehzh6+g==
X-CSE-MsgGUID: BydVvUrKR76nUnQ5PwQ9wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="198443665"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 00:10:12 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 rodrigo.vivi@intel.com, kamil.konieczny@linux.intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t v8 2/2] tests/intel/xe_pm_residency: Add subtest for
 ASPM Link state residency
Date: Tue, 16 Dec 2025 13:39:51 +0530
Message-Id: <20251216080951.199893-3-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251216080951.199893-1-karthik.poosa@intel.com>
References: <20251216080951.199893-1-karthik.poosa@intel.com>
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
This test uses link state counters from debugfs - dgfx_pcie_link_residencies
to verify this.

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

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
---
 tests/intel/xe_pm_residency.c | 179 ++++++++++++++++++++++++++++++++++
 1 file changed, 179 insertions(+)
 mode change 100644 => 100755 tests/intel/xe_pm_residency.c

diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
old mode 100644
new mode 100755
index d33a87b13..04e560f9b
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -37,6 +37,27 @@ enum test_type {
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
+} link_state_sysfs [] = {
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
@@ -64,6 +85,10 @@ enum test_type {
  * SUBTEST: cpg-gt-toggle
  * Description: Toggle GT coarse power gating states by acquiring/releasing
  *		forcewake.
+ *
+ * SUBTEST: aspm_link_residency
+ * Description: Check for PCIe ASPM (Active State Power Management) link states
+ * entry while device is in D0.
  */
 IGT_TEST_DESCRIPTION("Tests for gtidle properties");
 
@@ -255,6 +280,24 @@ static void idle_residency_on_exec(int fd, struct drm_xe_engine_class_instance *
 	munmap(done, 4096);
 }
 
+static void do_exec(int fd, struct drm_xe_engine_class_instance *hwe)
+{
+	unsigned long *done;
+
+	igt_info("Running on %s:%d\n",
+		 xe_engine_class_string(hwe->engine_class), hwe->engine_instance);
+	done = mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
+	igt_assert(done != MAP_FAILED);
+	memset(done, 0, 4096);
+
+	igt_fork(child, 1)
+		exec_load(fd, hwe, done);
+
+	*done = 1;
+	igt_waitchildren();
+	munmap(done, 4096);
+}
+
 static void measure_power(struct igt_power *gpu, double *power)
 {
 	struct power_sample power_sample[2];
@@ -370,6 +413,127 @@ static void cpg_gt_toggle(int fd)
 		powergate_status(fd, gt, "down");
 }
 
+static uint64_t get_link_state_residency(int fd_xe, const char *parse_str)
+{
+	int fd_debugfs_dir = 0;
+	int ret = 0;
+	char *ptr = NULL;
+	char path[256] = {0}, buf[1024] = {0};
+	uint64_t residency = 0;
+
+	fd_debugfs_dir = igt_debugfs_dir(fd_xe);
+	igt_assert(fd_debugfs_dir >= 0);
+
+	ret = igt_debugfs_simple_read(fd_debugfs_dir, "dgfx_pcie_link_residencies" , buf, sizeof(buf));
+	igt_assert_f(ret >= 0, "cannot read link residency file\n");
+	ptr = strstr(buf, parse_str);
+	igt_assert_f((ptr != NULL), "cannot find residency string %s\n", parse_str);
+	if (ptr != NULL) {
+		sprintf(path, "%s%%llu", parse_str);
+		igt_debug("searching for-%s\n", parse_str);
+		sscanf(ptr + strlen(parse_str), "%lu", &residency);
+		igt_info("Link residency %"PRIu64"\n", residency);
+	}
+	close(fd_debugfs_dir);
+	return residency;
+}
+
+static void save_and_disable_link_states(int fd_pci_usp)
+{
+	int i = 0;
+	int ret = 0;
+	char path[256] = {0};
+
+	for (i = 0 ; i < MAX_LINK_STATES ; i++) {
+		sprintf(path, "%s", link_state_sysfs[i].filename);
+		if (faccessat(fd_pci_usp, path, R_OK, 0)) {
+			igt_debug("%s not present to save\n", path);
+			continue;
+		}
+		ret = igt_sysfs_scanf(fd_pci_usp, path, "%c", &link_state_sysfs[i].state);
+		igt_assert_lt(0, ret);
+		igt_debug("saved %s = %c\n", link_state_sysfs[i].filename , link_state_sysfs[i].state);
+
+		ret = igt_sysfs_printf(fd_pci_usp, path, "%c", '0');
+		igt_assert_lt(0, ret);
+	}
+}
+
+static void restore_link_states(int fd_pci_usp)
+{
+	int i = 0;
+	int ret = 0;
+	char path[256] = {0};
+
+	/* Restore saved states of L1 sysfs entries. */
+	for (i = 0 ; i < MAX_LINK_STATES ; i++) {
+		sprintf(path, "%s", link_state_sysfs[i].filename);
+		if (faccessat(fd_pci_usp, path, R_OK, 0)) {
+			igt_debug("%s not present to restore\n", path);
+			continue;
+		}
+		ret = igt_sysfs_printf(fd_pci_usp, path, "%c", link_state_sysfs[i].state);
+		igt_assert_lt(0, ret);
+		igt_debug("restored %s to %c\n", link_state_sysfs[i].filename , link_state_sysfs[i].state);
+	}
+}
+
+static void test_aspm_link_residency(int fd_xe, uint8_t aspm_link_state)
+{
+	struct pci_device *pci_dev;
+	int fd_pci_usp = 0;
+	char name[PATH_MAX];
+	int ret = 0;
+	char path[256] = {0};
+	uint64_t residency_pre = 0, residency_post = 0;
+
+	igt_assert(aspm_link_state <= LINK_STATE_ASPM_L1_2);
+
+	/* Get upstream port pci_dev */
+	pci_dev = igt_device_get_pci_upstream_port(fd_xe);
+	igt_assert_f(pci_dev != NULL, "Couldn't get pci device of upstream port\n");
+	igt_debug("Upstream port PCI device: %04x:%02x:%02x.%01x\n", pci_dev->domain,
+		  pci_dev->bus, pci_dev->dev, pci_dev->func);
+
+	snprintf(name, sizeof(name), "/sys/bus/pci/devices/%04x:%02x:%02x.%01x/link",
+		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
+	fd_pci_usp = open(name, O_DIRECTORY);
+	igt_assert_f((fd_pci_usp >= 0), "Can't open link directory upstream port %s, ret %d\n", name, fd_pci_usp);
+
+	/* Disable runtime PM as link ASPM entry happens during device is in D0 only. */
+	igt_assert(igt_setup_runtime_pm(fd_xe));
+	igt_disable_runtime_pm();
+
+	/* Check if ASPM sysfs is present. */
+	sprintf(path, "%s", link_state_sysfs[aspm_link_state].filename);
+	igt_require_f(!faccessat(fd_pci_usp, path, R_OK, 0), "%s is not present\n", path);
+	ret = igt_sysfs_scanf(fd_pci_usp, path, "%c", &link_state_sysfs[aspm_link_state].state);
+	igt_assert_f((ret > 0), "couldn't read residency for %s", path);
+
+	/* Save current state of all available link sysfs entries and disable all link states. */
+	save_and_disable_link_states(fd_pci_usp);
+
+	/* Enable only the ASPM link state needed for test. */
+	igt_debug("Enabling %s\n", link_state_sysfs[aspm_link_state].filename);
+	sprintf(path, "%s", link_state_sysfs[aspm_link_state].filename);
+	ret = igt_sysfs_printf(fd_pci_usp, path, "%c", '1');
+
+	/* Read link state residencies before and after idle wait time. */
+	residency_pre = get_link_state_residency(fd_xe, link_state_sysfs[aspm_link_state].parse_str);
+	igt_info("Waiting for link to enter idle....\n");
+	sleep(5);
+	residency_post = get_link_state_residency(fd_xe, link_state_sysfs[aspm_link_state].parse_str);
+
+	/* Restore saved link states. */
+	restore_link_states(fd_pci_usp);
+
+	igt_restore_runtime_pm();
+	close(fd_pci_usp);
+	close(fd_xe);
+
+	igt_assert_f(residency_post > residency_pre, "ASPM entry failed, pre %"PRIu64", post %"PRIu64"\n",
+		     residency_pre, residency_post);
+}
 int igt_main()
 {
 	uint32_t d3cold_allowed;
@@ -444,6 +608,21 @@ int igt_main()
 		cpg_gt_toggle(fd);
 	}
 
+	igt_describe("ASPM Link residency validation");
+	igt_subtest_with_dynamic("aspm_link_residency") {
+		igt_require(xe_has_vram(fd));
+		xe_for_each_gt(fd, gt) {
+			xe_for_each_engine(fd, hwe) {
+				if (gt == hwe->gt_id && !hwe->engine_instance) {
+					igt_dynamic_f("gt%u-engine-%s", gt,
+						      xe_engine_class_string(hwe->engine_class))
+						do_exec(fd, hwe);
+				}
+			}
+		}
+		test_aspm_link_residency(fd, LINK_STATE_ASPM);
+	}
+
 	igt_fixture() {
 		close(fd);
 	}
-- 
2.25.1

