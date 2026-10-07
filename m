Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 808CBCA5FFF
	for <igt-dev@archiver.kernel.org>; Wed,  7 Oct 2026 05:11:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E322E10E0C2;
	Wed,  7 Oct 2026 05:11:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WbBtvQa0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5519610E0C2
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Oct 2026 05:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791349852; x=1822885852;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AQUQ4ufzyoIt9RuWVw3ls4z5LwC02LZwUuXJ6v6PHsg=;
 b=WbBtvQa0GTRnUjXofMLsEErTyP7SoVG4K9NjNSoJzvjYIAaY8uxOciu8
 1xOEHh3ygCntyW/JqN5NE6TI3qK9Ic65PJKbJr89vRGAahka/ISR724Mr
 TR9W5dkbc7AqrXGZazGhq2CzTxD/zprmltWguscEHM1mknSBCUusAcA2O
 suH+3t+xtrj0vM9+aijtX//QemfQfR2rdc07mkt3/hMkDpsGmtLeMbm7D
 ak0AMtYjmvUvvel5M8lzpMy/EUJFC1QoVatwc25ZV35WGTa22Szp1w8Je
 R+C1iPQhJaJcRmiSFJ4eJ+LA2QK0oH8a0J0Gre0u4jj9sf2xBu7i6khSy g==;
X-CSE-ConnectionGUID: 0oAj0NtJREaNF6OhfqgEFQ==
X-CSE-MsgGUID: OqWYS5FeRlW+1GcxE0OUuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="108710"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="108710"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 22:10:51 -0700
X-CSE-ConnectionGUID: nz75bw+ORqWD1nTczen4fg==
X-CSE-MsgGUID: /sB1hYmKSm2FRZ0F4Ezisg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; d="scan'208";a="305313011"
Received: from dut1129bmgfrd.igk.intel.com ([10.211.178.46])
 by fmviesa001.fm.intel.com with ESMTP; 06 Oct 2026 22:10:49 -0700
From: shivtej.eknath.patil@intel.com
To: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 nishit.sharma@intel.com, smitha.balasubramanyam@intel.com
Cc: karthik.poosa@intel.com, dwarakanath.ramadeva@intel.com,
 Shivtej Patil <shivtej.eknath.patil@intel.com>
Subject: [PATCH v1] Revert "tests/intel/xe_pm: add coverage for
 xe_device_sysfs"
Date: Wed,  7 Oct 2026 05:10:44 +0000
Message-ID: <20261007051044.6399-1-shivtej.eknath.patil@intel.com>
X-Mailer: git-send-email 2.43.0
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

The added subtests exercise sysfs interfaces exposed by
xe_device_sysfs.c. Subsequent discussion identified that
these checks are better suited for a dedicated xe_sysfs
test rather than xe_pm.
 
Revert the xe_pm coverage for now. The sysfs coverage will
be revisited and reintroduced in a more appropriate test.

This reverts commit 92dd3081aa8de197a5dc37b9799526a0de183c8f.

Signed-off-by: Shivtej Patil <shivtej.eknath.patil@intel.com>
---
 tests/intel/xe_pm.c | 176 ++++++++------------------------------------
 1 file changed, 31 insertions(+), 145 deletions(-)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 9a70b1645..543f46f5b 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -111,9 +111,34 @@ static bool runtime_usage_available(struct pci_device *pci)
 	return access(name, F_OK) == 0;
 }
 
-static bool sysfs_exists(int sysfs_fd, const char *path)
+static uint64_t get_vram_d3cold_threshold(int sysfs)
 {
-	return !faccessat(sysfs_fd, path, R_OK, 0);
+	uint64_t threshold;
+	char path[64];
+	int ret;
+
+	sprintf(path, "device/vram_d3cold_threshold");
+	igt_require_f(!faccessat(sysfs, path, R_OK, 0), "vram_d3cold_threshold is not present\n");
+
+	ret = igt_sysfs_scanf(sysfs, path, "%"PRIu64"", &threshold);
+	igt_assert_lt(0, ret);
+
+	return threshold;
+}
+
+static void set_vram_d3cold_threshold(int sysfs, uint64_t threshold)
+{
+	char path[64];
+	int ret;
+
+	sprintf(path, "device/vram_d3cold_threshold");
+
+	if (!faccessat(sysfs, path, R_OK | W_OK, 0))
+		ret = igt_sysfs_printf(sysfs, path, "%"PRIu64"", threshold);
+	else
+		igt_warn("vram_d3cold_threshold is not present\n");
+
+	igt_assert_lt(0, ret);
 }
 
 static void vram_d3cold_threshold_restore(int sig)
@@ -123,7 +148,7 @@ static void vram_d3cold_threshold_restore(int sig)
 	fd = drm_open_driver_master(DRIVER_XE);
 	sysfs_fd = igt_sysfs_open(fd);
 
-	igt_sysfs_set_vram_d3cold_threshold(sysfs_fd, orig_threshold);
+	set_vram_d3cold_threshold(sysfs_fd, orig_threshold);
 
 	close(sysfs_fd);
 	close(fd);
@@ -595,48 +620,6 @@ test_exec(device_t device, int n_exec_queues, int n_execs,
 	active_threads = 0;
 }
 
-/**
- * SUBTEST: vram-d3cold-threshold-show
- * Description:
- *      Validate reading of vram_d3cold_threshold sysfs entry.
- * Functionality: pm-d3cold
- */
-
-/**
- * SUBTEST: vram-d3cold-threshold-store
- * Description:
- *      Validate writing and reading back vram_d3cold_threshold sysfs entry.
- * Functionality: pm-d3cold
- */
-
-/**
- * SUBTEST: lb-fan-control-version-show
- * Description:
- *      Validate reading lb_fan_control_version sysfs entry.
- * Functionality: pm-sysfs
- */
-
-/**
- * SUBTEST: lb-voltage-regulator-version-show
- * Description:
- *      Validate reading lb_voltage_regulator_version sysfs entry.
- * Functionality: pm-sysfs
- */
-
-/**
- * SUBTEST: auto-link-downgrade-capable-show
- * Description:
- *      Validate reading auto_link_downgrade_capable sysfs entry.
- * Functionality: pm-sysfs
- */
-
-/**
- * SUBTEST: auto-link-downgrade-status-show
- * Description:
- *      Validate reading auto_link_downgrade_status sysfs entry.
- * Functionality: pm-sysfs
- */
-
 /**
  * SUBTEST: vram-d3cold-threshold
  * Functionality: pm - d3cold
@@ -687,7 +670,7 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
 	map = xe_bo_map(device.fd_xe, bo, SIZE);
 	memset(map, 0, SIZE);
 	munmap(map, SIZE);
-	igt_sysfs_set_vram_d3cold_threshold(sysfs_fd, threshold);
+	set_vram_d3cold_threshold(sysfs_fd, threshold);
 
 	/* Setup D3Cold but card should be in D3hot */
 	igt_assert(setup_d3(device, IGT_ACPI_D3Cold));
@@ -1099,7 +1082,7 @@ int igt_main()
 		}
 
 		igt_describe_f("Validate mmap memory mappings with vram region,"
-			       "when device along with parent bridge in %s", d->name);
+			     "when device along with parent bridge in %s", d->name);
 		igt_subtest_f("%s-mmap-vram", d->name) {
 			int delay_ms;
 
@@ -1133,108 +1116,11 @@ int igt_main()
 		     "if vram used > vram threshold");
 	igt_subtest("vram-d3cold-threshold") {
 		igt_require_f(has_runtime_pm, "Runtime PM not available\n");
-		orig_threshold = igt_sysfs_get_vram_d3cold_threshold(sysfs_fd);
+		orig_threshold = get_vram_d3cold_threshold(sysfs_fd);
 		igt_install_exit_handler(vram_d3cold_threshold_restore);
 		test_vram_d3cold_threshold(device, sysfs_fd);
 	}
 
-	igt_subtest("vram-d3cold-threshold-show") {
-		uint64_t threshold;
-
-		igt_require(sysfs_exists(sysfs_fd,
-					 "device/vram_d3cold_threshold"));
-
-		threshold = igt_sysfs_get_vram_d3cold_threshold(sysfs_fd);
-
-		igt_info("threshold=%" PRIu64 "\n", threshold);
-	}
-
-	igt_subtest("vram-d3cold-threshold-store") {
-		uint64_t old_val;
-		uint64_t new_val;
-
-		igt_require(sysfs_exists(sysfs_fd,
-					 "device/vram_d3cold_threshold"));
-		old_val = igt_sysfs_get_vram_d3cold_threshold(sysfs_fd);
-		/*
-		 * Ensure the original threshold is restored even if
-		 * an assertion fails later in the test.
-		 */
-		orig_threshold = old_val;
-		igt_install_exit_handler(vram_d3cold_threshold_restore);
-		igt_sysfs_set_vram_d3cold_threshold(sysfs_fd, old_val + 1);
-		new_val = igt_sysfs_get_vram_d3cold_threshold(sysfs_fd);
-		igt_assert_eq(new_val, old_val + 1);
-		/* restore */
-		igt_sysfs_set_vram_d3cold_threshold(sysfs_fd, old_val);
-		igt_info("old=%" PRIu64 " new=%" PRIu64 "\n",
-			 old_val, new_val);
-	}
-
-	igt_subtest("lb-fan-control-version-show") {
-		char version[64];
-		int ret;
-
-		igt_require(sysfs_exists(sysfs_fd,
-					 "device/lb_fan_control_version"));
-
-		ret = igt_sysfs_scanf(sysfs_fd,
-				      "device/lb_fan_control_version",
-				      "%63s", version);
-
-		igt_assert(ret > 0);
-
-		igt_info("lb-fan-control-version=%s\n", version);
-	}
-
-	igt_subtest("lb-voltage-regulator-version-show") {
-		char version[64] = {};
-		int ret;
-
-		igt_require(sysfs_exists(sysfs_fd,
-					 "device/lb_voltage_regulator_version"));
-
-		ret = igt_sysfs_scanf(sysfs_fd,
-				      "device/lb_voltage_regulator_version",
-				      "%63s", version);
-		igt_debug("ret=%d errno=%d\n", ret, errno);
-
-		igt_assert(ret > 0);
-		igt_info("lb-voltage-regulator-version=%s\n", version);
-	}
-
-	igt_subtest("auto-link-downgrade-capable-show") {
-		int val;
-		int ret;
-
-		igt_require(sysfs_exists(sysfs_fd,
-					 "device/auto_link_downgrade_capable"));
-
-		ret = igt_sysfs_scanf(sysfs_fd,
-				      "device/auto_link_downgrade_capable",
-				      "%d", &val);
-
-		igt_assert(ret > 0);
-		igt_info("auto-link-downgrade-capable=%d\n", val);
-		igt_assert(val == 0 || val == 1);
-	}
-
-	igt_subtest("auto-link-downgrade-status-show") {
-		int val;
-		int ret;
-
-		igt_require(sysfs_exists(sysfs_fd,
-					 "device/auto_link_downgrade_status"));
-
-		ret = igt_sysfs_scanf(sysfs_fd,
-				      "device/auto_link_downgrade_status",
-				      "%d", &val);
-
-		igt_assert(ret > 0);
-		igt_info("auto-link-downgrade-status=%d\n", val);
-		igt_assert(val == 0 || val == 1);
-	}
-
 	igt_fixture() {
 		close(sysfs_fd);
 		igt_pm_set_d3cold_allowed(device.pci_slot_name, d3cold_allowed);
-- 
2.43.0

