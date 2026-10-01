Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D75E4CA5FCB
	for <igt-dev@archiver.kernel.org>; Thu,  1 Oct 2026 12:29:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90EC010E301;
	Thu,  1 Oct 2026 12:29:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RY/pU3jX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1559610E1F7
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Oct 2026 12:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790857629; x=1822393629;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kYSaEVlyCttEz/q8pGvdPmOpi5soqpZ7rrzwunqxjnw=;
 b=RY/pU3jXO+M85JOs0OF0tthl+ZdRhOX58/0LM9fJZdU4JOrYRW76c5VP
 5kv5QPLVRoDbXdxZ9CWln4w8rPwXf7QO3ixVmy/J0qivNbUCwmwK5HT5i
 eWGUyy2ZSVw29ZWXSh3iBQepDfLVQv8pUSzO9wibKjv6vFOteA7AtL2Z2
 72TnByOf391FbiMesUDmCAlBQIg/3BYpFHVe/QKu3M9pHZbNcAINoYBMM
 MamKKAmvNU7SjDqlMsZm308JePIDxdTXdTnlmxPACosjknpjQw9Nzh+y4
 91rbl4RtDMwGADFla6UUiaZ8tIKLRa8kA7LmvRxaqCU6MoO4KdMBrHcvM w==;
X-CSE-ConnectionGUID: ik8RYnBWQSuz/RdyB2PN5A==
X-CSE-MsgGUID: dLAdXxztR56ts5Q2wZUDlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="91710122"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="91710122"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 05:27:09 -0700
X-CSE-ConnectionGUID: 9J+RUR7bRlWNCjG+bhdQhg==
X-CSE-MsgGUID: WrAKf+t5SxmMWFGk2pDBUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="276105620"
Received: from dut1129bmgfrd.igk.intel.com ([10.211.178.46])
 by fmviesa008.fm.intel.com with ESMTP; 01 Oct 2026 05:27:07 -0700
From: shivtej.eknath.patil@intel.com
To: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 nishit.sharma@intel.com, smitha.balasubramanyam@intel.com
Cc: karthik.poosa@intel.com, ramadevi.gandi@intel.com, badal.nilawar@intel.com,
 Shivtej Patil <shivtej.eknath.patil@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH v9 2/3] tests/intel/xe_pm: add coverage for xe_device_sysfs
Date: Thu,  1 Oct 2026 12:26:57 +0000
Message-ID: <20261001122658.6980-3-shivtej.eknath.patil@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001122658.6980-1-shivtej.eknath.patil@intel.com>
References: <20261001122658.6980-1-shivtej.eknath.patil@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add new subtests to exercise the following
xe_device_sysfs.c functions:
 
- vram_d3cold_threshold_show()
- vram_d3cold_threshold_store()
- lb_fan_control_version_show()
- lb_voltage_regulator_version_show()
- auto_link_downgrade_capable_show()
- auto_link_downgrade_status_show()
 
The subtests validate the corresponding sysfs
attributes and improve code coverage.

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Signed-off-by: Shivtej Patil <shivtej.eknath.patil@intel.com>
---
 tests/intel/xe_pm.c | 176 ++++++++++++++++++++++++++++++++++++--------
 1 file changed, 145 insertions(+), 31 deletions(-)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 543f46f5b..9a70b1645 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -111,34 +111,9 @@ static bool runtime_usage_available(struct pci_device *pci)
 	return access(name, F_OK) == 0;
 }
 
-static uint64_t get_vram_d3cold_threshold(int sysfs)
+static bool sysfs_exists(int sysfs_fd, const char *path)
 {
-	uint64_t threshold;
-	char path[64];
-	int ret;
-
-	sprintf(path, "device/vram_d3cold_threshold");
-	igt_require_f(!faccessat(sysfs, path, R_OK, 0), "vram_d3cold_threshold is not present\n");
-
-	ret = igt_sysfs_scanf(sysfs, path, "%"PRIu64"", &threshold);
-	igt_assert_lt(0, ret);
-
-	return threshold;
-}
-
-static void set_vram_d3cold_threshold(int sysfs, uint64_t threshold)
-{
-	char path[64];
-	int ret;
-
-	sprintf(path, "device/vram_d3cold_threshold");
-
-	if (!faccessat(sysfs, path, R_OK | W_OK, 0))
-		ret = igt_sysfs_printf(sysfs, path, "%"PRIu64"", threshold);
-	else
-		igt_warn("vram_d3cold_threshold is not present\n");
-
-	igt_assert_lt(0, ret);
+	return !faccessat(sysfs_fd, path, R_OK, 0);
 }
 
 static void vram_d3cold_threshold_restore(int sig)
@@ -148,7 +123,7 @@ static void vram_d3cold_threshold_restore(int sig)
 	fd = drm_open_driver_master(DRIVER_XE);
 	sysfs_fd = igt_sysfs_open(fd);
 
-	set_vram_d3cold_threshold(sysfs_fd, orig_threshold);
+	igt_sysfs_set_vram_d3cold_threshold(sysfs_fd, orig_threshold);
 
 	close(sysfs_fd);
 	close(fd);
@@ -620,6 +595,48 @@ test_exec(device_t device, int n_exec_queues, int n_execs,
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
@@ -670,7 +687,7 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
 	map = xe_bo_map(device.fd_xe, bo, SIZE);
 	memset(map, 0, SIZE);
 	munmap(map, SIZE);
-	set_vram_d3cold_threshold(sysfs_fd, threshold);
+	igt_sysfs_set_vram_d3cold_threshold(sysfs_fd, threshold);
 
 	/* Setup D3Cold but card should be in D3hot */
 	igt_assert(setup_d3(device, IGT_ACPI_D3Cold));
@@ -1082,7 +1099,7 @@ int igt_main()
 		}
 
 		igt_describe_f("Validate mmap memory mappings with vram region,"
-			     "when device along with parent bridge in %s", d->name);
+			       "when device along with parent bridge in %s", d->name);
 		igt_subtest_f("%s-mmap-vram", d->name) {
 			int delay_ms;
 
@@ -1116,11 +1133,108 @@ int igt_main()
 		     "if vram used > vram threshold");
 	igt_subtest("vram-d3cold-threshold") {
 		igt_require_f(has_runtime_pm, "Runtime PM not available\n");
-		orig_threshold = get_vram_d3cold_threshold(sysfs_fd);
+		orig_threshold = igt_sysfs_get_vram_d3cold_threshold(sysfs_fd);
 		igt_install_exit_handler(vram_d3cold_threshold_restore);
 		test_vram_d3cold_threshold(device, sysfs_fd);
 	}
 
+	igt_subtest("vram-d3cold-threshold-show") {
+		uint64_t threshold;
+
+		igt_require(sysfs_exists(sysfs_fd,
+					 "device/vram_d3cold_threshold"));
+
+		threshold = igt_sysfs_get_vram_d3cold_threshold(sysfs_fd);
+
+		igt_info("threshold=%" PRIu64 "\n", threshold);
+	}
+
+	igt_subtest("vram-d3cold-threshold-store") {
+		uint64_t old_val;
+		uint64_t new_val;
+
+		igt_require(sysfs_exists(sysfs_fd,
+					 "device/vram_d3cold_threshold"));
+		old_val = igt_sysfs_get_vram_d3cold_threshold(sysfs_fd);
+		/*
+		 * Ensure the original threshold is restored even if
+		 * an assertion fails later in the test.
+		 */
+		orig_threshold = old_val;
+		igt_install_exit_handler(vram_d3cold_threshold_restore);
+		igt_sysfs_set_vram_d3cold_threshold(sysfs_fd, old_val + 1);
+		new_val = igt_sysfs_get_vram_d3cold_threshold(sysfs_fd);
+		igt_assert_eq(new_val, old_val + 1);
+		/* restore */
+		igt_sysfs_set_vram_d3cold_threshold(sysfs_fd, old_val);
+		igt_info("old=%" PRIu64 " new=%" PRIu64 "\n",
+			 old_val, new_val);
+	}
+
+	igt_subtest("lb-fan-control-version-show") {
+		char version[64];
+		int ret;
+
+		igt_require(sysfs_exists(sysfs_fd,
+					 "device/lb_fan_control_version"));
+
+		ret = igt_sysfs_scanf(sysfs_fd,
+				      "device/lb_fan_control_version",
+				      "%63s", version);
+
+		igt_assert(ret > 0);
+
+		igt_info("lb-fan-control-version=%s\n", version);
+	}
+
+	igt_subtest("lb-voltage-regulator-version-show") {
+		char version[64] = {};
+		int ret;
+
+		igt_require(sysfs_exists(sysfs_fd,
+					 "device/lb_voltage_regulator_version"));
+
+		ret = igt_sysfs_scanf(sysfs_fd,
+				      "device/lb_voltage_regulator_version",
+				      "%63s", version);
+		igt_debug("ret=%d errno=%d\n", ret, errno);
+
+		igt_assert(ret > 0);
+		igt_info("lb-voltage-regulator-version=%s\n", version);
+	}
+
+	igt_subtest("auto-link-downgrade-capable-show") {
+		int val;
+		int ret;
+
+		igt_require(sysfs_exists(sysfs_fd,
+					 "device/auto_link_downgrade_capable"));
+
+		ret = igt_sysfs_scanf(sysfs_fd,
+				      "device/auto_link_downgrade_capable",
+				      "%d", &val);
+
+		igt_assert(ret > 0);
+		igt_info("auto-link-downgrade-capable=%d\n", val);
+		igt_assert(val == 0 || val == 1);
+	}
+
+	igt_subtest("auto-link-downgrade-status-show") {
+		int val;
+		int ret;
+
+		igt_require(sysfs_exists(sysfs_fd,
+					 "device/auto_link_downgrade_status"));
+
+		ret = igt_sysfs_scanf(sysfs_fd,
+				      "device/auto_link_downgrade_status",
+				      "%d", &val);
+
+		igt_assert(ret > 0);
+		igt_info("auto-link-downgrade-status=%d\n", val);
+		igt_assert(val == 0 || val == 1);
+	}
+
 	igt_fixture() {
 		close(sysfs_fd);
 		igt_pm_set_d3cold_allowed(device.pci_slot_name, d3cold_allowed);
-- 
2.43.0

