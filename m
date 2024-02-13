Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA3FC4829A
	for <igt-dev@archiver.kernel.org>; Tue, 13 Feb 2024 06:30:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B170710E177;
	Tue, 13 Feb 2024 06:29:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TwA0zTXm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 977BD10E177
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Feb 2024 06:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707805796; x=1739341796;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fSq1TXEtMblixJiQzHZpqhKrltfJXbKkj7hgtLpSK+s=;
 b=TwA0zTXm31GCmaJ7alU1xeymp9FlJcsho6jL0ARtdknhv0UhsmSf+Hxk
 z0Mr7Efd0oYhQWJScYr2eNktvs9d5ad43Byn5JHvenLTWOHkCv9alXMij
 j2YBU/bO64Hp8Tey1LIxe61t1flun7Uo/9ipqUhqHeZ1WL0IPDQSasXXl
 WIoI/nM+PwFzf9f3GILJ+87GxFk0Qv4qUimHaHFptrty7i8mP+RfnL1lR
 xk8cyWZ+tmLF3j1QfuEwap8fv5zFQKZIiBuqxWYDH2+HG5ttgrXawHOQ1
 vipCqJWKAr2XpcNioVzxxsJY4sjp0ADTykAYmNmXogqOBQnY0MKRLyeSl Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="13195866"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; d="scan'208";a="13195866"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 22:29:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="2977934"
Received: from dut7231atsm.jf.intel.com ([10.98.51.28])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 22:29:56 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: [PATCH i-g-t] i915/pmu: Add pmu tests to catch unbind cleanup issues
Date: Mon, 12 Feb 2024 22:29:48 -0800
Message-Id: <20240213062948.32735-1-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.34.1
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

Doing an flr (unbind followed by bind) on i915 device while a user holds
a reference to the PMU events results in null-pointer-dereferences
(npd). Add some tests to validate the fix for this issue.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/perf_pmu.c | 202 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 202 insertions(+)

diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
index 4ae2b60ae..4d60c8bd3 100644
--- a/tests/intel/perf_pmu.c
+++ b/tests/intel/perf_pmu.c
@@ -249,6 +249,41 @@
  * Description: Test the i915 pmu perf interface
  * Feature: i915 pmu perf interface, pmu
  * Test category: Perf
+ *
+ * SUBTEST: flr-npd
+ * Description: Test null pointer dereference case
+ * Feature: i915 pmu perf interface, pmu
+ * Test category: Perf
+ *
+ * SUBTEST: flr-npd-close-after-unbind
+ * Description: Test null pointer dereference close perf after unbind
+ * Feature: i915 pmu perf interface, pmu
+ * Test category: Perf
+ *
+ * SUBTEST: flr-npd-event-group
+ * Description: Test null pointer dereference case with event groups
+ * Feature: i915 pmu perf interface, pmu
+ * Test category: Perf
+ *
+ * SUBTEST: flr-npd-separate-events
+ * Description: Test null pointer dereference case with separate events
+ * Feature: i915 pmu perf interface, pmu
+ * Test category: Perf
+ *
+ * SUBTEST: forked-flr-npd
+ * Description: Test null pointer dereference case with forked FLR
+ * Feature: i915 pmu perf interface, pmu
+ * Test category: Perf
+ *
+ * SUBTEST: forked-flr-npd-event-group
+ * Description: Test null pointer dereference case with forked FLR and event groups
+ * Feature: i915 pmu perf interface, pmu
+ * Test category: Perf
+ *
+ * SUBTEST: forked-flr-npd-separate-events
+ * Description: Test null pointer dereference case with forked FLR and separate events
+ * Feature: i915 pmu perf interface, pmu
+ * Test category: Perf
  */
 
 IGT_TEST_DESCRIPTION("Test the i915 pmu perf interface");
@@ -2417,6 +2452,151 @@ static void test_unload(unsigned int num_engines)
 	igt_assert_eq(__igt_i915_driver_unload(NULL), 0);
 }
 
+static int sysfs_driver(int i915)
+{
+	int dir, drv;
+
+	dir = igt_sysfs_open(i915);
+	igt_assert(dir != -1);
+
+	drv = openat(dir, "device/driver", O_DIRECTORY);
+	close(dir);
+
+	igt_assert(drv != -1);
+	return drv;
+}
+
+#define CLOSE_FD_AFTER_UNBIND	0x00000001
+#define GROUP_FDS		0x00000002
+#define SEPARATE_FDS		0x00000004
+
+#define NPD_MAX_FDS 4
+static void test_flr_npd(uint32_t flags)
+{
+	struct pci_device *pdev;
+	int fd[NPD_MAX_FDS], i915, drv;
+	uint64_t buf[NPD_MAX_FDS];
+	int count = 0, i;
+	char *snd = NULL;
+	char addr[80];
+
+	i915 = __drm_open_driver(DRIVER_INTEL);
+	pdev = igt_device_get_pci_device(i915);
+
+	snprintf(addr, sizeof(addr), "%04x:%02x:%02x.%d",
+		 pdev->domain, pdev->bus, pdev->dev, pdev->func);
+	igt_debug("Opened %s\n", addr);
+
+	if (flags & GROUP_FDS) {
+		fd[count++] = open_group(i915, I915_PMU_REQUESTED_FREQUENCY, -1);
+		fd[count++] = open_group(i915, I915_PMU_ACTUAL_FREQUENCY, fd[0]);
+		fd[count++] = open_group(i915, I915_PMU_RC6_RESIDENCY, fd[0]);
+		fd[count++] = open_group(i915, I915_PMU_SOFTWARE_GT_AWAKE_TIME, fd[0]);
+		pmu_read_multi(fd[0], count, buf);
+	} else if (flags & SEPARATE_FDS) {
+		fd[count++] = open_pmu(i915, I915_PMU_REQUESTED_FREQUENCY);
+		fd[count++] = open_pmu(i915, I915_PMU_ACTUAL_FREQUENCY);
+		fd[count++] = open_pmu(i915, I915_PMU_RC6_RESIDENCY);
+		fd[count++] = open_pmu(i915, I915_PMU_SOFTWARE_GT_AWAKE_TIME);
+		pmu_read_single(fd[0]);
+		pmu_read_single(fd[1]);
+		pmu_read_single(fd[2]);
+		pmu_read_single(fd[3]);
+	} else {
+		fd[0] = open_pmu(i915, I915_PMU_ACTUAL_FREQUENCY);
+		pmu_read_single(fd[0]);
+	}
+
+	drv = sysfs_driver(i915);
+	close(i915);
+	igt_audio_driver_unload(&snd);
+
+	igt_set_timeout(30, "Driver unbind timeout!");
+	igt_assert_f(igt_sysfs_set(drv, "unbind", addr),
+		     "Driver unbind failure (%s)!\n", addr);
+	igt_reset_timeout();
+
+	if (flags & CLOSE_FD_AFTER_UNBIND)
+		for (i = 0; i < count; i++)
+			close(fd[i]);
+
+	igt_set_timeout(30, "Driver bind timeout!");
+	igt_assert_f(igt_sysfs_set(drv, "bind", addr),
+		     "Driver bind failure (%s)!\n", addr);
+	igt_reset_timeout();
+
+	close(drv);
+
+	if (!(flags & CLOSE_FD_AFTER_UNBIND))
+		for (i = 0; i < count; i++)
+			close(fd[i]);
+}
+
+static void test_forked_flr_npd(uint32_t flags)
+{
+	struct pci_device *pdev;
+	int fd[NPD_MAX_FDS], i915, drv;
+	uint64_t buf[NPD_MAX_FDS];
+	int count = 0, i;
+	char *snd = NULL;
+	char addr[80];
+
+	/* not supported for the forked version */
+	igt_assert(!(flags & CLOSE_FD_AFTER_UNBIND));
+
+	i915 = __drm_open_driver(DRIVER_INTEL);
+	pdev = igt_device_get_pci_device(i915);
+
+	snprintf(addr, sizeof(addr), "%04x:%02x:%02x.%d",
+		 pdev->domain, pdev->bus, pdev->dev, pdev->func);
+	igt_debug("Opened %s\n", addr);
+
+	if (flags & GROUP_FDS) {
+		fd[count++] = open_group(i915, I915_PMU_REQUESTED_FREQUENCY, -1);
+		fd[count++] = open_group(i915, I915_PMU_ACTUAL_FREQUENCY, fd[0]);
+		fd[count++] = open_group(i915, I915_PMU_RC6_RESIDENCY, fd[0]);
+		fd[count++] = open_group(i915, I915_PMU_SOFTWARE_GT_AWAKE_TIME, fd[0]);
+		pmu_read_multi(fd[0], count, buf);
+	} else if (flags & SEPARATE_FDS) {
+		fd[count] = open_pmu(i915, I915_PMU_REQUESTED_FREQUENCY);
+		pmu_read_single(fd[count++]);
+		fd[count] = open_pmu(i915, I915_PMU_ACTUAL_FREQUENCY);
+		pmu_read_single(fd[count++]);
+		fd[count] = open_pmu(i915, I915_PMU_RC6_RESIDENCY);
+		pmu_read_single(fd[count++]);
+		fd[count] = open_pmu(i915, I915_PMU_SOFTWARE_GT_AWAKE_TIME);
+		pmu_read_single(fd[count++]);
+	} else {
+		fd[count] = open_pmu(i915, I915_PMU_ACTUAL_FREQUENCY);
+		pmu_read_single(fd[count++]);
+	}
+
+	drv = sysfs_driver(i915);
+	close(i915);
+	igt_audio_driver_unload(&snd);
+
+	igt_fork(child, 1) {
+		igt_set_timeout(30, "Driver unbind timeout!");
+		igt_assert_f(igt_sysfs_set(drv, "unbind", addr),
+				"Driver unbind failure (%s)!\n", addr);
+		igt_reset_timeout();
+	}
+	igt_waitchildren();
+
+
+	igt_fork(child, 1) {
+		igt_set_timeout(30, "Driver bind timeout!");
+		igt_assert_f(igt_sysfs_set(drv, "bind", addr),
+				"Driver bind failure (%s)!\n", addr);
+		igt_reset_timeout();
+	}
+	igt_waitchildren();
+
+	close(drv);
+	for (i = 0; i < count; i++)
+		close(fd[i]);
+}
+
 static void pmu_read(int i915)
 {
 	char val[128];
@@ -2810,4 +2990,26 @@ igt_main
 		for (int pass = 0; pass < 3; pass++)
 			test_unload(num_engines);
 	}
+
+	igt_subtest("flr-npd")
+		test_flr_npd(0);
+
+	igt_subtest("flr-npd-close-after-unbind")
+		test_flr_npd(CLOSE_FD_AFTER_UNBIND);
+
+	igt_subtest("flr-npd-event-group")
+		test_flr_npd(GROUP_FDS);
+
+	igt_subtest("flr-npd-separate-events")
+		test_flr_npd(SEPARATE_FDS);
+
+	igt_subtest("forked-flr-npd")
+		test_forked_flr_npd(0);
+
+	igt_subtest("forked-flr-npd-event-group")
+		test_forked_flr_npd(GROUP_FDS);
+
+	igt_subtest("forked-flr-npd-separate-events")
+		test_forked_flr_npd(SEPARATE_FDS);
+
 }
-- 
2.34.1

