Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 182FFC53200
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 10:46:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B23A10E1BA;
	Wed, 29 Jul 2026 10:46:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dflIeXEF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF54010EAA5
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 06:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785306616; x=1816842616;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hKHL7JVVyTARMwxWhpUfZzPv7HqhDERHBv16zkOTwGU=;
 b=dflIeXEFIj92VR3IeODZhCC65LAIGMDCTYHdEY14TqDyMvTZWouTWLqQ
 mhFRXgnPZ2IOX83xBpC4L5LVeHUA6biVmBrUXpYYPGTWFqtioTg6BrjQ0
 6fedxW3kkXXZriclvTYAWNYK2L9RO3tw7GsMvuilnGFWCfg9mq8SK7Lxm
 AxdoS/ycPhcYjNeuHnSgMidIAckL6Pe8BDV+4nN9pYRq1yetCvQmhH8wH
 O0j9q26C3Jczc74hoRnE2TItvf2xtbL81C24t4N5UM7cIk0rUCufQ4y0K
 vIuzXLR2pX3j9aK1wKZdnIM7r3VW09v34fsUtpEyslCwfmwS4ZZYGF1EZ A==;
X-CSE-ConnectionGUID: 5c5SMD2pQRa2BxzR+G6pVA==
X-CSE-MsgGUID: TVCxKY++QVCnZg8ag8JBwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="96489790"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="96489790"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2026 23:30:15 -0700
X-CSE-ConnectionGUID: cZgnF3DjSh6KSM3fHV3AeQ==
X-CSE-MsgGUID: GwqkHU7nTB2W7Ug9MRetJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="260549047"
Received: from dut1483bmgfrd.igk.intel.com ([10.211.178.6])
 by orviesa009.jf.intel.com with ESMTP; 28 Jul 2026 23:30:14 -0700
From: shivtej.eknath.patil@intel.com
To: igt-dev@lists.freedesktop.org,
	pawel.sikora@intel.com
Cc: "Patil, Shivtej Eknath" <shivtej.eknath.patil@intel.com>,
	Patil@freedesktop.org
Subject: [PATCH] tests/xe_pm: add sysfs coverage subtests
Date: Wed, 29 Jul 2026 06:30:11 +0000
Message-ID: <20260729063011.29670-1-shivtej.eknath.patil@intel.com>
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

From: "Patil, Shivtej Eknath" <shivtej.eknath.patil@intel.com>

Signed-off-by: Patil, Shivtej Eknath <shivtej.eknath.patil@intel.com>
---
 tests/intel/xe_pm.c | 156 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 156 insertions(+)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 6fbc13e43..51830bffe 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -141,6 +141,11 @@ static void set_vram_d3cold_threshold(int sysfs, uint64_t threshold)
 	igt_assert_lt(0, ret);
 }
 
+static bool sysfs_exists(int sysfs_fd, const char *path)
+{
+    return !faccessat(sysfs_fd, path, R_OK, 0);
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
@@ -1112,6 +1159,115 @@ int igt_main()
 
 	igt_describe("Validate whether card is limited to d3hot,"
 		     "if vram used > vram threshold");
+
+	igt_subtest("vram-d3cold-threshold-show")
+{
+    uint64_t threshold;
+
+    igt_require(sysfs_exists(sysfs_fd,
+                 "device/vram_d3cold_threshold"));
+
+    threshold = get_vram_d3cold_threshold(sysfs_fd);
+
+    igt_info("threshold=%"PRIu64"\n", threshold);
+}
+
+igt_subtest("vram-d3cold-threshold-store")
+{
+    uint64_t old_val;
+    uint64_t new_val;
+
+    igt_require(sysfs_exists(sysfs_fd,
+                 "device/vram_d3cold_threshold"));
+
+    old_val = get_vram_d3cold_threshold(sysfs_fd);
+
+    set_vram_d3cold_threshold(sysfs_fd, old_val + 1);
+
+    new_val = get_vram_d3cold_threshold(sysfs_fd);
+
+    igt_assert_eq(new_val, old_val + 1);
+
+    /* restore */
+    set_vram_d3cold_threshold(sysfs_fd, old_val);
+    igt_info("old=%"PRIu64" new=%"PRIu64"\n",
+         old_val, new_val);
+}
+
+igt_subtest("lb-fan-control-version-show")
+{
+    char version[64];
+    int ret;
+
+    igt_require(sysfs_exists(sysfs_fd,
+                 "device/lb_fan_control_version"));
+
+    ret = igt_sysfs_scanf(sysfs_fd,
+                  "device/lb_fan_control_version",
+                  "%63s",
+                  version);
+
+    igt_assert(ret > 0);
+
+    igt_info("lb-fan-control-version=%s\n", version);
+}
+
+igt_subtest("lb-voltage-regulator-version-show")
+{
+    char version[64] = {};
+    int ret;
+
+    igt_require(sysfs_exists(sysfs_fd,
+                 "device/lb_voltage_regulator_version"));
+
+    ret = igt_sysfs_scanf(sysfs_fd,
+                  "device/lb_voltage_regulator_version",
+                  "%63s",
+                  version);
+	
+    igt_info("ret=%d errno=%d version='%s'\n",
+         ret, errno, version);
+
+    if (ret > 0)
+        igt_info("lb-voltage-regulator-version=%s\n", version);
+}
+
+igt_subtest("auto-link-downgrade-capable-show")
+{
+    int val;
+    int ret;
+
+    igt_require(sysfs_exists(sysfs_fd,
+                 "device/auto_link_downgrade_capable"));
+
+    ret = igt_sysfs_scanf(sysfs_fd,
+                  "device/auto_link_downgrade_capable",
+                  "%d",
+                  &val);
+
+    igt_assert(ret > 0);
+    igt_assert(val == 0 || val == 1);
+    igt_info("auto-link-downgrade-capable=%d\n", val);
+}
+
+igt_subtest("auto-link-downgrade-status-show")
+{
+    int val;
+    int ret;
+
+    igt_require(sysfs_exists(sysfs_fd,
+                 "device/auto_link_downgrade_status"));
+
+    ret = igt_sysfs_scanf(sysfs_fd,
+                  "device/auto_link_downgrade_status",
+                  "%d",
+                  &val);
+
+    igt_assert(ret > 0);
+    igt_assert(val == 0 || val == 1);
+    igt_info("auto-link-downgrade-status=%d\n", val);
+}
+
 	igt_subtest("vram-d3cold-threshold") {
 		igt_require_f(has_runtime_pm, "Runtime PM not available\n");
 		orig_threshold = get_vram_d3cold_threshold(sysfs_fd);
-- 
2.53.0

