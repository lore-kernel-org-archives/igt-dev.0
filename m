Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 185E8CCF9F8
	for <igt-dev@archiver.kernel.org>; Wed,  5 Nov 2025 08:44:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6EA710E6D9;
	Wed,  5 Nov 2025 08:44:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ne44V5xr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98F6610E6D9
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Nov 2025 08:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762332290; x=1793868290;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T6ozTF8vgdSr2aIDU4f2u9Z4NPOn89eplWYCteqj9jE=;
 b=ne44V5xrMzpErmghwLf9X7lv6MGzJgaJ6nUXmDWnNFJ1XpbK9Fc5b4me
 Gs7SJD+rvspLLwJEesrOmtDSIrpVgX80Zj5C2P1xrR4YKHh89jbdAeSwr
 fDRCq+xTKoDjTe4w4YUP4PLjO4y3nfhx6pWTyPw9LCdU7U/Fqz8JfWbvg
 TpeDYq9+26p5tnWg5V+/k95E/E1Xz4GyghIx4k81cXzqznQpgiQYGnTuX
 b+9ebE5oyMLfoHaO0kBJ4GeWh4xkfowKkoLV5D7wKTbD/a/ZmZ4cHN77y
 9rjiivlyCKqc00Cf1cg5p0awee0iENNHBpq5o0aVMfmlfsrzwotaj+ltt g==;
X-CSE-ConnectionGUID: 9r6BhgraRlyk+asqTCh2EA==
X-CSE-MsgGUID: S/7QBqFOQQyWvHS+7lDFdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="74733623"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="74733623"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 00:44:50 -0800
X-CSE-ConnectionGUID: pwz6JLsyTy6S/2biS/4MOA==
X-CSE-MsgGUID: qKakDwPvQGuDvYmNxbMW8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="186685318"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 00:44:48 -0800
From: Karthik Poosa <karthik.poosa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 rodrigo.vivi@intel.com, raag.jadav@intel.com, sk.anirban@intel.com,
 kamil.konieczny@linux.intel.com, Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t v3 2/2] tests/intel/xe_pm_residency: Add subtest for
 ASPM Link state residency
Date: Wed,  5 Nov 2025 14:14:26 +0530
Message-Id: <20251105084426.601123-3-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251105084426.601123-1-karthik.poosa@intel.com>
References: <20251105084426.601123-1-karthik.poosa@intel.com>
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

Add subtest aspm_link_residency to verify ASPM Link state residency
using link state counters from debugfs - dgfx_pcie_link_residencies.

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

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 tests/intel/xe_pm_residency.c | 159 ++++++++++++++++++++++++++++++++++
 1 file changed, 159 insertions(+)
 mode change 100644 => 100755 tests/intel/xe_pm_residency.c

diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
old mode 100644
new mode 100755
index 1749d6467..0db1a6ba5
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
+	const char* filename;
+	char state;
+	const char* parse_str;
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
@@ -64,6 +85,9 @@ enum test_type {
  * SUBTEST: cpg-gt-toggle
  * Description: Toggle GT coarse power gating states by acquiring/releasing
  *		forcewake.
+ *
+ * SUBTEST: aspm_link_residency
+ * Description: Check for ASPM link states entry while device is in D0.
  */
 IGT_TEST_DESCRIPTION("Tests for gtidle properties");
 
@@ -255,6 +279,24 @@ static void idle_residency_on_exec(int fd, struct drm_xe_engine_class_instance *
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
@@ -370,6 +412,109 @@ static void cpg_gt_toggle(int fd)
 		powergate_status(fd, gt, "down");
 }
 
+
+static bool check_link_residency_entry(int fd_xe, const char* filename, uint8_t aspm_link_state)
+{
+	int fd_debugfs_dir = 0;
+	int ret = 0;
+	char *ptr = NULL;
+	char path[256] = {0}, buf[1024] = {0};
+	uint64_t residency_pre = 0, residency_post = 0;
+
+	fd_debugfs_dir = igt_debugfs_dir(fd_xe);
+	igt_assert(fd_debugfs_dir >= 0);
+
+	ret = igt_debugfs_simple_read(fd_debugfs_dir, filename, buf, sizeof(buf));
+	igt_assert_f(ret >= 0, "cannot read pre %s.\n", filename);
+	ptr = strstr(buf, link_state_sysfs[aspm_link_state].parse_str);
+	igt_assert_f((ptr != NULL), "cannot find residency string %s\n", link_state_sysfs[aspm_link_state].parse_str);
+	if (ptr != NULL) {
+		sprintf(path, "%s%%llu", link_state_sysfs[aspm_link_state].parse_str);
+		igt_debug("searching for-%s\n", link_state_sysfs[aspm_link_state].parse_str);
+		sscanf(ptr, path, &residency_pre);
+		igt_info("Link residency before %"PRIu64"\n", residency_pre);
+		igt_info("Waiting for link to enter idle....\n");
+		sleep(5);
+		ret = igt_debugfs_simple_read(fd_debugfs_dir, filename, buf, sizeof(buf));
+		igt_assert_f(ret >= 0, "cannot read post %s.\n", filename);
+		sscanf(ptr, path, &residency_post);
+	}
+
+	igt_info("Link residency after %"PRIu64"\n", residency_post);
+	close(fd_debugfs_dir);
+
+	return (residency_post > residency_pre) ? true : false;
+}
+
+static void test_aspm_link_residency(int fd_xe, uint8_t aspm_link_state)
+{
+	struct pci_device *pci_dev;
+	int fd_pci_usp = 0;
+	char name[PATH_MAX];
+	int ret = 0;
+	char path[256] = {0};
+	bool aspm_entered = 0;
+
+	/* Get upstream port pci_dev */
+	pci_dev = igt_device_get_pci_usp(fd_xe);
+	igt_require(pci_dev);
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
+	sprintf(path, "%s", link_state_sysfs[aspm_link_state].filename);
+	igt_require_f(!faccessat(fd_pci_usp, path, R_OK, 0), "%s is not present\n", path);
+	ret = igt_sysfs_scanf(fd_pci_usp, path, "%c", &link_state_sysfs[aspm_link_state].state);
+	igt_assert_f((ret > 0), "couldn't read residency for %s", path);
+
+	/* Save current state of all available link sysfs entries and enable only the one needed. */
+	for (int i = 0 ; i < MAX_LINK_STATES ; i++) {
+		sprintf(path, "%s", link_state_sysfs[i].filename);
+		if (faccessat(fd_pci_usp, path, R_OK, 0)) {
+			igt_info("%s not present to save\n", path);
+			continue;
+		}
+		ret = igt_sysfs_scanf(fd_pci_usp, path, "%c", &link_state_sysfs[i].state);
+		igt_assert_lt(0, ret);
+		igt_debug("saved %s = %c\n", link_state_sysfs[i].filename , link_state_sysfs[i].state);
+
+		if(i == aspm_link_state) {
+			igt_debug("Enabling %s\n", link_state_sysfs[i].filename);
+			ret = igt_sysfs_printf(fd_pci_usp, path, "%c", '1');
+		}
+		else {
+			ret = igt_sysfs_printf(fd_pci_usp, path, "%c", '0');
+		}
+		igt_assert_lt(0, ret);
+	}
+
+	aspm_entered = check_link_residency_entry(fd_xe, "dgfx_pcie_link_residencies", aspm_link_state);
+
+	/* Restore states of L1 sysfs entries. */
+	for (int i = 0 ; i < MAX_LINK_STATES ; i++) {
+		sprintf(path, "%s", link_state_sysfs[i].filename);
+		if (faccessat(fd_pci_usp, path, R_OK, 0)) {
+			igt_info("%s not present to restore\n", path);
+			continue;
+		}
+		ret = igt_sysfs_printf(fd_pci_usp, path, "%c", link_state_sysfs[i].state);
+		igt_debug("restored %s to %c\n", link_state_sysfs[i].filename , link_state_sysfs[i].state);
+	}
+
+	igt_restore_runtime_pm();
+	close(fd_pci_usp);
+	close(fd_xe);
+	igt_assert_f(aspm_entered , "ASPM Link idle entry failed!\n");
+}
+
 igt_main
 {
 	uint32_t d3cold_allowed;
@@ -444,6 +589,20 @@ igt_main
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
 	igt_fixture {
 		close(fd);
 	}
-- 
2.25.1

