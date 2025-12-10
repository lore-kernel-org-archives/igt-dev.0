Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A0DD2CE17
	for <igt-dev@archiver.kernel.org>; Wed, 10 Dec 2025 10:44:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A5B210E6D2;
	Wed, 10 Dec 2025 10:44:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dZSSIyrI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF4B10E6D2
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Dec 2025 10:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765363469; x=1796899469;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IiSAoeI+ljTsfPGCzsEyFWCEd7hc0sI0C+POpgQD4qE=;
 b=dZSSIyrIA7d62osmjhZ6991BfodCnfo9Pk3bx2zf9ZrrmxIBhXSuPC8E
 ETkye1OI12Ijp+OlUjb9gCO6GshMK444etlU7351p+YDeQs11fuQF2CQz
 0ww1eqEKjbVK/WclGVN11dxlT0nXNvryob2Q03BRzMmN6rBjJSBIS5MJ5
 ES35N9WyMqj0ofZve2fLRTTQWXSHe6tF4rhbiaoAEb666zWnZbY/XDbNQ
 arjP24F/bcQ5XdtmfrlFiAVHaW6MHTl5jxbq8hooVyccABzdqMRbb9XEa
 dqYm7pkyBeKdFnr93MJM9eHrSm0y+M0pu92Vs4kl7Dq3udB3AEZC4MsMB w==;
X-CSE-ConnectionGUID: /5InelvBST+WAIBIrAHnvg==
X-CSE-MsgGUID: AQ0vnizTSfWoli8M7cUKZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="84742819"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="84742819"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 02:44:25 -0800
X-CSE-ConnectionGUID: EAiRHONKR7aRhyMjBw/Y7w==
X-CSE-MsgGUID: u1nLqQEZQty/ss/sPTyDpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="201598241"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 02:44:21 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 rodrigo.vivi@intel.com, raag.jadav@intel.com, sk.anirban@intel.com,
 kamil.konieczny@linux.intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t v6 2/2] tests/intel/xe_pm_residency: Add subtest for
 ASPM Link state residency
Date: Wed, 10 Dec 2025 16:14:00 +0530
Message-Id: <20251210104400.4141969-3-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251210104400.4141969-1-karthik.poosa@intel.com>
References: <20251210104400.4141969-1-karthik.poosa@intel.com>
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
 - Move save and restore of link states to separate functions. (Badal)
 - Refactor and enhance readability. (Badal)

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 tests/intel/xe_pm_residency.c | 178 ++++++++++++++++++++++++++++++++++
 1 file changed, 178 insertions(+)
 mode change 100644 => 100755 tests/intel/xe_pm_residency.c

diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
old mode 100644
new mode 100755
index d33a87b13..95feb6eb0
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
@@ -444,6 +608,20 @@ int igt_main()
 		cpg_gt_toggle(fd);
 	}
 
+	igt_describe("ASPM Link residency validation");
+	igt_subtest_with_dynamic("aspm_link_residency") {
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

