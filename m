Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF1DC79FA1
	for <igt-dev@archiver.kernel.org>; Fri, 11 Sep 2026 07:18:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8ED710E376;
	Fri, 11 Sep 2026 07:18:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lEaDh59l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 413BF10E39C
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Sep 2026 07:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789110867; x=1820646867;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BhIPreLmP9vUqrvg3030H9XuPYcPeMlT4qPvSMbHR6U=;
 b=lEaDh59lRjALJQyz9Pj3+1fwafQQZ/A6LplOWPTw3OF0+SLdwCzYcagz
 OMiPKJ1lLwIB+tB3+PUKt87sa3IHYMuyVwEqdvmD4J5Ho8JeQ0wxXCdP/
 gsyLwPJZst/E4y0leU/E/21BlnFYkFzA9q3DJgaMEFGTee4k5c8VPU4/I
 Fnx/kiHxfTGtF2GuwNP3/O7PVoV7VRCbwcUb7H+1PRtHWlcOe87Jd6pQV
 t14rRSYhmUqFUKNFOBb3rVmwrLveUoRd1h834hgyb2jmjsT17cm6kcXMe
 SgbjKd6Z/KFV/RmPwVjePcaBe0/v9AscwI7IxYeruMN0fRsW+LGbKEX/7 Q==;
X-CSE-ConnectionGUID: u13p2KGPSTigFIf2I1xKMw==
X-CSE-MsgGUID: ECCXckEbRFCY3PTkUWrf6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="115112145"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="115112145"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 00:14:27 -0700
X-CSE-ConnectionGUID: tZI2PEwZSIG9Z8KYRus9Ig==
X-CSE-MsgGUID: gDTELG1WQ0WS2F7zw/bc9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="275989671"
Received: from dut1231bmgfrd.igk.intel.com ([10.211.177.56])
 by orviesa005.jf.intel.com with ESMTP; 11 Sep 2026 00:14:25 -0700
From: shivtej.eknath.patil@intel.com
To: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 nishit.sharma@intel.com, smitha.balasubramanyam@intel.com
Cc: Shivtej Patil <shivtej.eknath.patil@intel.com>
Subject: [PATCH v6 2/3] tests/intel/xe_pm: add coverage for xe_device_sysfs
Date: Fri, 11 Sep 2026 07:13:32 +0000
Message-ID: <20260911071409.56112-3-shivtej.eknath.patil@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911071409.56112-1-shivtej.eknath.patil@intel.com>
References: <20260911071409.56112-1-shivtej.eknath.patil@intel.com>
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
 tests/intel/xe_pm.c | 176 ++++++++++++++++++++++++++++++++++++--------
 1 file changed, 145 insertions(+), 31 deletions(-)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 7faba7c2b..9286233e4 100644
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
@@ -1081,7 +1098,7 @@ int igt_main()
 		}
 
 		igt_describe_f("Validate mmap memory mappings with vram region,"
-			     "when device along with parent bridge in %s", d->name);
+			       "when device along with parent bridge in %s", d->name);
 		igt_subtest_f("%s-mmap-vram", d->name) {
 			int delay_ms;
 
@@ -1115,11 +1132,108 @@ int igt_main()
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
+		igt_info("ret=%d errno=%d version='%s'\n",
+			 ret, errno, version);
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
+		igt_assert(val == 0 || val == 1);
+		igt_info("auto-link-downgrade-capable=%d\n", val);
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
+		igt_assert(val == 0 || val == 1);
+		igt_info("auto-link-downgrade-status=%d\n", val);
+	}
+
 	igt_fixture() {
 		close(sysfs_fd);
 		igt_pm_set_d3cold_allowed(device.pci_slot_name, d3cold_allowed);
-- 
2.43.0

