Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD09C3DA42
	for <igt-dev@archiver.kernel.org>; Mon,  8 Jul 2024 14:38:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9B4910E376;
	Mon,  8 Jul 2024 14:38:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dFpTp3+Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE08510E376
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Jul 2024 14:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720449515; x=1751985515;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=253nOXH9x1RP/VDK1fNmB3O2XPJO8RGmDuesq6bEvwY=;
 b=dFpTp3+ZqewxpDZEkcSkUpnkpptT5koF8B1w4e3t904O58x+9YaTg9qo
 zfu2FaVIXmyCrCYRL0kjznpLzJ3MPAY50StgAUp/TfbAZ+Te2Jmxf0u15
 rxRU8fMxjdb5lVpW2Y0BYRtuE5Pchp12g1GdJlWwPRJXYH+2sgVIVHMYQ
 nJ9yR8UXqmNdDKJa92W/N8qsNQAh7xZ37JPzK/ZThHNLaJZUa9eNhJ5Rb
 W7lhETHe8j6Sza92/DGxRslK8NtjtbcD9OFdF+adGk/gbKrLxQyWLsmtj
 5DXvsxETfbgWtanxrU1sQXp6TIeMeZqL7itERpIvRNGajNoWpHuOpgnht Q==;
X-CSE-ConnectionGUID: jVjr1UlzSBSunXrr43sHGQ==
X-CSE-MsgGUID: ddjY5kdXRROPGjPnn6M9AA==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="21465602"
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; d="scan'208";a="21465602"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 07:38:35 -0700
X-CSE-ConnectionGUID: T4gjS3aPTqCYEjwssIKM8w==
X-CSE-MsgGUID: bcBENvtOQYeokh5FoIk++Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; d="scan'208";a="47491442"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.59])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 07:38:32 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, janga.rahul.kumar@intel.com,
 kamil.konieczny@linux.intel.com, riana.tauro@intel.com
Subject: [PATCH i-g-t v2 2/3] tests/intel/xe_pm: Extend mocs-rpm test to
 support D3Cold
Date: Mon,  8 Jul 2024 20:26:06 +0530
Message-Id: <20240708145607.272869-3-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240708145607.272869-1-badal.nilawar@intel.com>
References: <20240708145607.272869-1-badal.nilawar@intel.com>
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

Extend mocs rpm test to support D3Cold using existing d3 helpers.

v2: Update documentation/description (Riana)

Cc: janga.rahul.kumar@intel.com
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 tests/intel/xe_pm.c | 60 +++++++++++++++++++++++++++------------------
 1 file changed, 36 insertions(+), 24 deletions(-)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index b30e94a2a..8b115e2f6 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -610,28 +610,28 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags,
 	close(fw_handle);
 }
 
-/**
- * SUBTEST: mocs-rpm
- * Description:
- *     Validate mocs register contents over suspend resume
- *
- * Functionality: mocs registers
- * Run type: FULL
- */
 /**
  * SUBTEST: %s-mocs
- * Description: test checks for mocs state before and after %arg[1] state
- * Functionality: pm - %arg[1]
+ * Description: Validate contents of mocs registers over suspend resume
+ * Functionality: pm_suspend
  *
  * arg[1]:
  *
  * @s2idle:	s2idle
  * @s3:		s3
  * @s4:		s4
+ *
+ * @d3hot:	d3hot
+ * @d3cold:	d3cold
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
@@ -639,24 +639,34 @@ static void test_mocs_suspend_resume(device_t device, int s_state)
 		// Mocs debugfs contents before and after suspend-resume
 		char mocs_content_pre[4096], mocs_contents_post[4096];
 
+		igt_debug("Running on GT%d\n", gt);
+
 		sprintf(path, "gt%d/mocs", gt);
 		igt_assert(igt_debugfs_exists(device.fd_xe, path, O_RDONLY));
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
@@ -766,7 +776,7 @@ igt_main
 		}
 
 		igt_subtest_f("%s-mocs", s->name)
-			test_mocs_suspend_resume(device, s->state);
+			test_mocs_suspend_resume(device, s->state, NO_RPM);
 	}
 
 	igt_fixture {
@@ -825,6 +835,14 @@ igt_main
 
 			igt_pm_set_autosuspend_delay(device.pci_xe, delay_ms);
 		}
+
+		igt_describe_f("Validate the contents of mocs registers over %s state", d->name);
+		igt_subtest_f("%s-mocs", d->name) {
+			igt_assert(setup_d3(device, d->state));
+			test_mocs_suspend_resume(device, NO_SUSPEND, d->state);
+			cleanup_d3(device);
+		}
+
 	}
 
 	igt_describe("Validate whether card is limited to d3hot,"
@@ -835,12 +853,6 @@ igt_main
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

