Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04883CAC5A7
	for <igt-dev@archiver.kernel.org>; Thu, 25 Sep 2025 15:34:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD09D10E97D;
	Thu, 25 Sep 2025 15:33:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d1hbejJn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED40610E983
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Sep 2025 15:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758814438; x=1790350438;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HL3A7z7s4nfethdxvenKHiDwzSnLUGZcqR4VhVF4+Sw=;
 b=d1hbejJnOGg+xSbgUsL3BNZHUJF1XiNKqTkt6Pqa8aNZ8sMdFGuH/JhD
 mSBnwa/bVtSMRHbd8HW+dmrA87jJ7cG7pTxnZH8d1ebst5rsbl6zFdeK6
 0ZxXoSAiOr0Z9VTc7DY3hugwp7N8vE0ceggd5E8NhVUYjrHi80oN0tCsP
 AtbHO7Vs2BR3TZ358rdMRPhyhuOo/GBxVQJ6rlBWPbrLdlCYTuqBtggIi
 mnCVtarNTb85NHJqnDi58ZCjBF1q94Q8pWTeqMnlQhZ5dGZ038P6llUvB
 Q61ms2ZE7RznpfVeGL20p9O97fYmPXPz0dNJK7zbIyQISWTddZkEF/Zhm g==;
X-CSE-ConnectionGUID: lhoKTPw0SKuzdNT036BBbg==
X-CSE-MsgGUID: N9t0bFnvTDipl3PY4DPhGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="72239925"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="72239925"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 08:33:58 -0700
X-CSE-ConnectionGUID: O0rFhOKqT5i35nTgLbXW5A==
X-CSE-MsgGUID: RkHvQb5wRwG8nFb/yiUVVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; d="scan'208";a="182627967"
Received: from sinjan-super-server.iind.intel.com ([10.190.239.39])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2025 08:33:55 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 rodrigo.vivi@intel.com, raag.jadav@intel.com, sk.anirban@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t] test/intel/xe_pm_residency: Add support for ASPM Link
 state residency
Date: Thu, 25 Sep 2025 21:03:46 +0530
Message-Id: <20250925153346.1028542-1-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
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

Add support to check ASPM Link state residency entry using
counters from PMT Telemetry.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 tests/intel/xe_pm_residency.c | 108 ++++++++++++++++++++++++++++++++++
 1 file changed, 108 insertions(+)
 mode change 100644 => 100755 tests/intel/xe_pm_residency.c

diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
old mode 100644
new mode 100755
index 1749d6467..38b013ef1
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
+ * Description: Check if ASPM link states entry while device is in D0.
  */
 IGT_TEST_DESCRIPTION("Tests for gtidle properties");
 
@@ -370,6 +394,85 @@ static void cpg_gt_toggle(int fd)
 		powergate_status(fd, gt, "down");
 }
 
+static void test_aspm_link_residency(int fd_xe, uint8_t aspm_link_state)
+{
+	struct pci_device *pci_dev;
+	int fd_pci_usp = 0, fd_debugfs_dir = 0;
+	char name[PATH_MAX], *ptr;
+	int ret = 0;
+	char path[256] = {0}, buf[1024] = {0};
+	uint64_t residency_pre = 0, residency_post = 0;
+
+	/* Get upstream port pci_dev */
+	pci_dev = igt_device_get_pci_device(fd_xe);
+	pci_dev = pci_device_get_parent_bridge(pci_dev);
+	pci_dev = pci_device_get_parent_bridge(pci_dev);
+	igt_debug("USP BDF: %04x:%02x:%02x.%01x\n", pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
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
+	/* Save current state of all link sysfs entries and enable only the one needed. */
+	for (int i = 0 ; i < MAX_LINK_STATES ; i++) {
+		sprintf(path, "%s", link_state_sysfs[i].filename);
+		igt_require_f(!faccessat(fd_pci_usp, path, R_OK, 0), "%s is not present\n", path);
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
+
+		igt_assert_lt(0, ret);
+	}
+
+	fd_debugfs_dir = igt_debugfs_dir(fd_xe);
+	igt_assert(fd_debugfs_dir >= 0);
+
+	/* Read ASPM link residencies from Xe debugfs "dgfx_pcie_link_residencies". */
+	ret = igt_debugfs_simple_read(fd_debugfs_dir, "dgfx_pcie_link_residencies", buf, sizeof(buf));
+	igt_assert_f(ret >= 0, "cannot read pre dgfx_pcie_link_residencies.\n");
+	ptr = strstr(buf, link_state_sysfs[aspm_link_state].parse_str);
+	igt_assert_f((ptr != NULL), "cannot find residency string %s\n", link_state_sysfs[aspm_link_state].parse_str);
+	if (ptr != NULL) {
+		sprintf(path, "%s%%lu", link_state_sysfs[aspm_link_state].parse_str);
+		igt_debug("searching for-%s\n", path);
+		sscanf(ptr, path, &residency_pre);
+		igt_info("Waiting to enter ASPM....\n");
+		sleep(5);
+		ret = igt_debugfs_simple_read(fd_debugfs_dir, "dgfx_pcie_link_residencies", buf, sizeof(buf));
+		igt_assert_f(ret >= 0, "cannot read post dgfx_pcie_link_residencies.\n");
+		sscanf(ptr, path, &residency_post);
+	}
+
+	igt_info("Link residency before %"PRIu64", after %"PRIu64"\n", residency_pre, residency_post);
+
+	/* Restore all states of L1 sysfs entries. */
+	for (int i = 0 ; i < MAX_LINK_STATES ; i++) {
+		sprintf(path, "%s", link_state_sysfs[i].filename);
+		igt_require_f(!faccessat(fd_pci_usp, path, R_OK, 0), "%s is not present\n", path);
+		ret = igt_sysfs_printf(fd_pci_usp, path, "%c", link_state_sysfs[i].state);
+		igt_debug("restored %s to %c\n", link_state_sysfs[i].filename , link_state_sysfs[i].state);
+	}
+
+	igt_assert_f((residency_post > residency_pre) , "Link idle entry didn't happen\n");
+	igt_restore_runtime_pm();
+	close(fd_debugfs_dir);
+	close(fd_pci_usp);
+	close(fd_xe);
+}
+
 igt_main
 {
 	uint32_t d3cold_allowed;
@@ -444,6 +547,11 @@ igt_main
 		cpg_gt_toggle(fd);
 	}
 
+	igt_describe("ASPM Link residency validation");
+	igt_subtest("aspm_link_residency") {
+               test_aspm_link_residency(fd, LINK_STATE_ASPM);
+	}
+
 	igt_fixture {
 		close(fd);
 	}
-- 
2.25.1

