Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51508C53200
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 10:47:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02FB910E1C4;
	Wed, 29 Jul 2026 10:47:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QN+YYqua";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE76A10E002
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 07:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785310852; x=1816846852;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qUfh4eUz5o18o28MskxwbPymLZoOXSkuoRLkBE1on1M=;
 b=QN+YYquauFb0T+4Ja4NKPg93sreB6iWErhqqMh0/uXo7vqQg4tMhVjz7
 4eixhpU+dyC/UT48Nnbt8m75T7N4ZhdwuAT1T/YuzAATgg3+YhslBs2X+
 ZDN8l4Zhd4H63oKW9BDpcbVPm3MremByS5JG5OIbWrhCcjtq+So0fpK7Y
 jJ5S1AQOUMJRlKronYT29y2qFowYpYTdKeORAPZUy4xC+q3X/Z1LCB9NQ
 pXDWDc45iy8CkddaQpKcdfBC8Vs2nBlMML9OCSfx3m/RPiTjcXpqlmovl
 AZoY27GmOTNkTONm2cUnu0Cn9oVuTqUuQ8qZ7Mi3ZJjizrzUqXLJcnIkV A==;
X-CSE-ConnectionGUID: sNr6OH66SkqeGpEN3IosUg==
X-CSE-MsgGUID: pV7ZLjIwS8eOJt551uNn7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="103449502"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="103449502"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 00:40:51 -0700
X-CSE-ConnectionGUID: 4fopU84IS16Bl8+cZcYkuQ==
X-CSE-MsgGUID: iJz+55XyQRGPdZ9G2/AYbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="256020589"
Received: from dut1483bmgfrd.igk.intel.com ([10.211.178.6])
 by fmviesa010.fm.intel.com with ESMTP; 29 Jul 2026 00:40:50 -0700
From: shivtej.eknath.patil@intel.com
To: igt-dev@lists.freedesktop.org,
	pawel.sikora@intel.com
Cc: Shivtej Patil <shivtej.eknath.patil@intel.com>
Subject: [PATCH v2] tests/xe_pm: add coverage for xe_device_sysfs Modify xe_pm
 subtests to exercise the following xe_device_sysfs.c functions:
Date: Wed, 29 Jul 2026 07:40:46 +0000
Message-ID: <20260729074046.42734-1-shivtej.eknath.patil@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 29 Jul 2026 10:46:18 +0000
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
 tests/intel-ci/xe.pm.d3cold.testlist |   8 +-
 tests/intel/xe_pm.c                  | 154 ++++++++++++++++++++++++++-
 2 files changed, 159 insertions(+), 3 deletions(-)

diff --git a/tests/intel-ci/xe.pm.d3cold.testlist b/tests/intel-ci/xe.pm.d3cold.testlist
index 783859fc7..eb1b23ed8 100644
--- a/tests/intel-ci/xe.pm.d3cold.testlist
+++ b/tests/intel-ci/xe.pm.d3cold.testlist
@@ -8,4 +8,10 @@ igt@xe_pm@d3cold-multiple-execs
 igt@xe_pm@d3cold-mmap-system
 igt@xe_pm@d3cold-mmap-vram
 igt@xe_pm@d3cold-mocs
-igt@xe_pm@vram-d3cold-threshold
+igt@xe_pm@vram-d3cold-threshold-show
+igt@xe_pm@vram-d3cold-threshold-store
+igt@xe_pm@lb-fan-control-version-show
+igt@xe_pm@lb-voltage-regulator-version-show
+igt@xe_pm@auto-link-downgrade-capable-show
+igt@xe_pm@auto-link-downgrade-status-show
+vram-d3cold-threshold
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

