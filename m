Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7618FC3065A
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jul 2024 14:37:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A5410E452;
	Mon,  1 Jul 2024 14:37:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BCSBStEa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AE9E10E452
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jul 2024 14:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719844631; x=1751380631;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lCzoq0/6Bjh34T7W/mm6I9Iw0WwAXhtSb9HNrFM9KpA=;
 b=BCSBStEa4lIOcY2vnK/IVaJdveoyisiPRTMBLYof5xdneZFgwS9C7cfo
 4IrazV6rGgiuSAG+AngXrlwoGbVDVXGGqGszwVZiU6zAgMbVpwVbIqdD7
 rJIsqtr/eLCXkz/mD+6RSv2i9ApCFBQUS5iVRUFanpOb14VJz5Nw/yK2t
 3hd6Ma6ds0wmdK29thuM8UOnbxLyT2Kjm7d/RBiJp0X2yN0DIHYMLlzS7
 Ks7US7hNPc/Bg7tS40YqGSiogBIUlv1j/0Dakfnmk5sOPbLY4mkLg42LU
 OXZ0TxBKtPBg4J5pQ1omIj94BWjZK2fjkG2PF3gdIxYd8ehoF3ZSjO1pe w==;
X-CSE-ConnectionGUID: 5m0eBJ9hQbKQtZDRzqcN4A==
X-CSE-MsgGUID: oP27/02ATHSd0VXRmmjiTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11120"; a="34422951"
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="34422951"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 07:37:11 -0700
X-CSE-ConnectionGUID: Dtn5IoDjQb+t+imHboudBg==
X-CSE-MsgGUID: Bx5vYCXWQ7ixNLkRrSTzNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="50751499"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.59])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 07:37:09 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com,
	janga.rahul.kumar@intel.com
Subject: [PATCH i-g-t 2/2] tests/intel/xe_pm: Extend mocs-rpm test to support
 D3Cold
Date: Mon,  1 Jul 2024 20:24:39 +0530
Message-Id: <20240701145439.91038-2-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240701145439.91038-1-badal.nilawar@intel.com>
References: <20240701145439.91038-1-badal.nilawar@intel.com>
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

Use existing d3 helpers to cover D3Hot and D3Cold.

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 tests/intel/xe_pm.c | 49 +++++++++++++++++++++++++++++++--------------
 1 file changed, 34 insertions(+), 15 deletions(-)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index b30e94a2a..eac5ea8a7 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -611,10 +611,15 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
 }
 
 /**
- * SUBTEST: mocs-rpm
+ * SUBTEST: %s-mocs-rpm
  * Description:
  *     Validate mocs register contents over suspend resume
  *
+ * arg[2]:
+ *
+ * @d3hot:	d3hot
+ * @d3cold:	d3cold
+ *
  * Functionality: mocs registers
  * Run type: FULL
  */
@@ -629,9 +634,14 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
  * @s3:		s3
  * @s4:		s4
  */
-static void test_mocs_suspend_resume(device_t device, int s_state)
+static void test_mocs_suspend_resume(device_t device, enum igt_suspend_state s_state,
+				     enum igt_acpi_d_state d_state)
 {
 	int gt;
+	uint64_t active_time;
+	bool check_rpm = (d_state == IGT_ACPI_D3Hot ||
+			  d_state == IGT_ACPI_D3Cold);
+
 
 	xe_for_each_gt(device.fd_xe, gt) {
 		char path[256];
@@ -644,19 +654,27 @@ static void test_mocs_suspend_resume(device_t device, int s_state)
 		igt_debugfs_dump(device.fd_xe, path);
 		igt_debugfs_read(device.fd_xe, path, mocs_content_pre);
 
-		if (s_state == NO_SUSPEND) {
+		if (check_rpm) {
+			igt_assert(in_d3(device, d_state));
+			active_time = igt_pm_get_runtime_active_time(device.pci_xe);
+
 			fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
 			igt_assert(fw_handle >= 0);
-			igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
+			igt_assert(igt_pm_get_runtime_active_time(device.pci_xe) >
+				   active_time);
 
 			/* Make sure runtime pm goes back to suspended status after closing forcewake_all */
 			close(fw_handle);
-			igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+			sleep(1);
+
+			igt_assert(in_d3(device, d_state));
 		} else {
-			enum igt_suspend_test test = s_state == SUSPEND_STATE_DISK ?
-				SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
+			if (s_state != NO_SUSPEND) {
+				enum igt_suspend_test test = s_state == SUSPEND_STATE_DISK ?
+					SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
 
-			igt_system_suspend_autoresume(s_state, test);
+				igt_system_suspend_autoresume(s_state, test);
+			}
 		}
 		igt_assert(igt_debugfs_exists(device.fd_xe, path, O_RDONLY));
 		igt_debugfs_dump(device.fd_xe, path);
@@ -766,7 +784,7 @@ igt_main
 		}
 
 		igt_subtest_f("%s-mocs", s->name)
-			test_mocs_suspend_resume(device, s->state);
+			test_mocs_suspend_resume(device, s->state, NO_RPM);
 	}
 
 	igt_fixture {
@@ -825,6 +843,13 @@ igt_main
 
 			igt_pm_set_autosuspend_delay(device.pci_xe, delay_ms);
 		}
+
+		igt_subtest_f("%s-mocs-rpm", d->name) {
+			igt_assert(setup_d3(device, d->state));
+			test_mocs_suspend_resume(device, NO_SUSPEND, d->state);
+			cleanup_d3(device);
+		}
+
 	}
 
 	igt_describe("Validate whether card is limited to d3hot,"
@@ -835,12 +860,6 @@ igt_main
 		test_vram_d3cold_threshold(device, sysfs_fd);
 	}
 
-	igt_subtest("mocs-rpm") {
-		dpms_on_off(device, DRM_MODE_DPMS_OFF);
-		test_mocs_suspend_resume(device, NO_SUSPEND);
-		dpms_on_off(device, DRM_MODE_DPMS_ON);
-	}
-
 	igt_fixture {
 		close(sysfs_fd);
 		igt_pm_set_d3cold_allowed(device.pci_slot_name, d3cold_allowed);
-- 
2.34.1

