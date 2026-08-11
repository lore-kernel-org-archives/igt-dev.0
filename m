Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C997C5B574
	for <igt-dev@archiver.kernel.org>; Tue, 11 Aug 2026 08:09:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18F6210EABC;
	Tue, 11 Aug 2026 08:09:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YmAb0GOC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B39D310EAC0
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Aug 2026 08:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786435717; x=1817971717;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4qKT5/HgSmCgfpoAYSy8YM2vEnPW0+ju0vsBMLgJ9vU=;
 b=YmAb0GOCWXENMBKTQ2RpzbF2S9H943RKdWZFOE5q3R8IVBsz5Wztww0a
 IQYZyFhdY2Hoysqrny8AeUCPCmriepY4Tp6ZGT/aigSbLZrLhGBAh4yCl
 KWpFxFESDJFLi9cSRoFoQRWGVjEFfY9VZr9lCpW3CCa5kjrTWjWGER8Nh
 jHMm3o2jSsI9qjOF4sStSKPacQaloOT6TTelMbd0sQH3Oij8E9ZhYR78e
 fURVb2FSQDpIt12cGjTOGdqnU3SNEgffIHAazqistk4zY6QzBYgMa8FMs
 U/+uwsDWbbs7q3wqVy5WSjGdI9VREShuZ1HmFeHGeCg1URi3eTJgNj4fT g==;
X-CSE-ConnectionGUID: GRhuHoBNTgKxIK4dERLf+Q==
X-CSE-MsgGUID: Rc7GiqRHQdenzvAZ6zN/4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="86837047"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="86837047"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 01:08:37 -0700
X-CSE-ConnectionGUID: Hb4jMC8KRVetWpTzXtvKpQ==
X-CSE-MsgGUID: 9RS3JDIATLq918NEyRvsIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="287981173"
Received: from dut1121bmgfrd.igk.intel.com ([10.211.178.40])
 by fmviesa001.fm.intel.com with ESMTP; 11 Aug 2026 01:08:35 -0700
From: shivtej.eknath.patil@intel.com
To: igt-dev@lists.freedesktop.org, sobin.thomas@intel.com,
 smitha.balasubramanyam@intel.com, nishit.sharma@intel.com
Cc: Shivtej Patil <shivtej.eknath.patil@intel.com>
Subject: [PATCH v4] tests/intel/xe_pm: add coverage for xe_device_sysfs
Date: Tue, 11 Aug 2026 08:08:31 +0000
Message-ID: <20260811080831.20455-1-shivtej.eknath.patil@intel.com>
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

From: Shivtej Patil <shivtej.eknath.patil@intel.com>

Modify xe_pm subtests to exercise the following
xe_device_sysfs.c functions:

- vram_d3cold_threshold_show()
- vram_d3cold_threshold_store()
- lb_fan_control_version_show()
- lb_voltage_regulator_version_show()
- auto_link_downgrade_capable_show()
- auto_link_downgrade_status_show()

The subtests validate the corresponding sysfs
attributes and improve code coverage for
xe_device_sysfs.c.

Signed-off-by: Shivtej Patil <shivtej.eknath.patil@intel.com>
---
 tests/intel-ci/xe.pm.d3cold.testlist |   6 ++
 tests/intel/xe_pm.c                  | 154 ++++++++++++++++++++++++++-
 2 files changed, 158 insertions(+), 2 deletions(-)

diff --git a/tests/intel-ci/xe.pm.d3cold.testlist b/tests/intel-ci/xe.pm.d3cold.testlist
index 783859fc7..e240fe7fb 100644
--- a/tests/intel-ci/xe.pm.d3cold.testlist
+++ b/tests/intel-ci/xe.pm.d3cold.testlist
@@ -9,3 +9,9 @@ igt@xe_pm@d3cold-mmap-system
 igt@xe_pm@d3cold-mmap-vram
 igt@xe_pm@d3cold-mocs
 igt@xe_pm@vram-d3cold-threshold
+igt@xe_pm@vram-d3cold-threshold-show
+igt@xe_pm@vram-d3cold-threshold-store
+igt@xe_pm@lb-fan-control-version-show
+igt@xe_pm@lb-voltage-regulator-version-show
+igt@xe_pm@auto-link-downgrade-capable-show
+igt@xe_pm@auto-link-downgrade-status-show
diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 6fbc13e43..cf3f1fd22 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -141,6 +141,11 @@ static void set_vram_d3cold_threshold(int sysfs, uint64_t threshold)
 	igt_assert_lt(0, ret);
 }
 
+static bool sysfs_exists(int sysfs_fd, const char *path)
+{
+	return !faccessat(sysfs_fd, path, R_OK, 0);
+}
+
 static void vram_d3cold_threshold_restore(int sig)
 {
 	int fd, sysfs_fd;
@@ -620,6 +625,48 @@ test_exec(device_t device, int n_exec_queues, int n_execs,
 	active_threads = 0;
 }
 
+/**
+ * SUBTEST: vram-d3cold-threshold-show
+ * Description:
+ *      Validate reading of vram_d3cold_threshold sysfs entry.
+ * Functionality: pm-d3cold
+ */
+
+/**
+ * SUBTEST: vram-d3cold-threshold-store
+ * Description:
+ *      Validate writing and reading back vram_d3cold_threshold sysfs entry.
+ * Functionality: pm-d3cold
+ */
+
+/**
+ * SUBTEST: lb-fan-control-version-show
+ * Description:
+ *      Validate reading lb_fan_control_version sysfs entry.
+ * Functionality: pm-sysfs
+ */
+
+/**
+ * SUBTEST: lb-voltage-regulator-version-show
+ * Description:
+ *      Validate reading lb_voltage_regulator_version sysfs entry.
+ * Functionality: pm-sysfs
+ */
+
+/**
+ * SUBTEST: auto-link-downgrade-capable-show
+ * Description:
+ *      Validate reading auto_link_downgrade_capable sysfs entry.
+ * Functionality: pm-sysfs
+ */
+
+/**
+ * SUBTEST: auto-link-downgrade-status-show
+ * Description:
+ *      Validate reading auto_link_downgrade_status sysfs entry.
+ * Functionality: pm-sysfs
+ */
+
 /**
  * SUBTEST: vram-d3cold-threshold
  * Functionality: pm - d3cold
@@ -1112,14 +1159,117 @@ int igt_main()
 
 	igt_describe("Validate whether card is limited to d3hot,"
 		     "if vram used > vram threshold");
-	igt_subtest("vram-d3cold-threshold") {
+igt_subtest("vram-d3cold-threshold") {
 		igt_require_f(has_runtime_pm, "Runtime PM not available\n");
 		orig_threshold = get_vram_d3cold_threshold(sysfs_fd);
 		igt_install_exit_handler(vram_d3cold_threshold_restore);
 		test_vram_d3cold_threshold(device, sysfs_fd);
 	}
 
-	igt_fixture() {
+igt_subtest("vram-d3cold-threshold-show")
+{
+	uint64_t threshold;
+
+	igt_require(sysfs_exists(sysfs_fd,
+				 "device/vram_d3cold_threshold"));
+
+	threshold = get_vram_d3cold_threshold(sysfs_fd);
+
+	igt_info("threshold=%" PRIu64 "\n", threshold);
+}
+
+igt_subtest("vram-d3cold-threshold-store")
+{
+	uint64_t old_val;
+	uint64_t new_val;
+
+	igt_require(sysfs_exists(sysfs_fd,
+				 "device/vram_d3cold_threshold"));
+	old_val = get_vram_d3cold_threshold(sysfs_fd);
+	/*
+	 * Ensure the original threshold is restored even if
+	 * an assertion fails later in the test.
+	 */
+	igt_install_exit_handler(vram_d3cold_threshold_restore);
+	set_vram_d3cold_threshold(sysfs_fd, old_val + 1);
+	new_val = get_vram_d3cold_threshold(sysfs_fd);
+	igt_assert_eq(new_val, old_val + 1);
+	/* restore */
+	set_vram_d3cold_threshold(sysfs_fd, old_val);
+	igt_info("old=%" PRIu64 " new=%" PRIu64 "\n",
+		 old_val, new_val);
+}
+
+igt_subtest("lb-fan-control-version-show")
+{
+	char version[64];
+	int ret;
+
+	igt_require(sysfs_exists(sysfs_fd,
+				 "device/lb_fan_control_version"));
+
+	ret = igt_sysfs_scanf(sysfs_fd,
+			      "device/lb_fan_control_version",
+			      "%63s", version);
+
+	igt_assert(ret > 0);
+
+	igt_info("lb-fan-control-version=%s\n", version);
+}
+
+igt_subtest("lb-voltage-regulator-version-show")
+{
+	char version[64] = {};
+	int ret;
+
+	igt_require(sysfs_exists(sysfs_fd,
+				 "device/lb_voltage_regulator_version"));
+
+	ret = igt_sysfs_scanf(sysfs_fd,
+			      "device/lb_voltage_regulator_version",
+			      "%63s", version);
+	igt_info("ret=%d errno=%d version='%s'\n",
+		 ret, errno, version);
+
+	igt_assert(ret > 0);
+	igt_info("lb-voltage-regulator-version=%s\n", version);
+}
+
+igt_subtest("auto-link-downgrade-capable-show")
+{
+	int val;
+	int ret;
+
+	igt_require(sysfs_exists(sysfs_fd,
+				 "device/auto_link_downgrade_capable"));
+
+	ret = igt_sysfs_scanf(sysfs_fd,
+			      "device/auto_link_downgrade_capable",
+			      "%d", &val);
+
+	igt_assert(ret > 0);
+	igt_assert(val == 0 || val == 1);
+	igt_info("auto-link-downgrade-capable=%d\n", val);
+}
+
+igt_subtest("auto-link-downgrade-status-show")
+{
+	int val;
+	int ret;
+
+	igt_require(sysfs_exists(sysfs_fd,
+				 "device/auto_link_downgrade_status"));
+
+	ret = igt_sysfs_scanf(sysfs_fd,
+			      "device/auto_link_downgrade_status",
+			      "%d", &val);
+
+	igt_assert(ret > 0);
+	igt_assert(val == 0 || val == 1);
+	igt_info("auto-link-downgrade-status=%d\n", val);
+}
+
+igt_fixture() {
 		close(sysfs_fd);
 		igt_pm_set_d3cold_allowed(device.pci_slot_name, d3cold_allowed);
 		if (has_runtime_pm)
-- 
2.43.0

