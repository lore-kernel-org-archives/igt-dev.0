Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B5AC19F4E
	for <igt-dev@archiver.kernel.org>; Wed, 24 Apr 2024 20:08:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BD9E11202C;
	Wed, 24 Apr 2024 20:08:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E9kuS/hC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0E1B11202C
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Apr 2024 20:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713989306; x=1745525306;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zeJ73LrGSYZF2rpqaHuqesLr7k5v/WYgCLJ9WaYA7n4=;
 b=E9kuS/hC2EnJPDQEmKxX8+79ujg9K/fzQRA8h2XvKCy9ttF4ZzQ8uUHw
 ztbJuhT6RFeKeAtP9eih/gTtSpEIL5SusyAu9O2ZP2wCAyxykQyXmnM0G
 H2uc9i30XxcW/jS3qecukkIfXa47npxWldB6VmHZ+iitCGd+RkEIiBJH7
 fndn5+eHb282oeMwZyxKP3Hnwix2FauuMAxYmgmnoMjp5VJLowP4M8PNI
 S/48z76XdIPOVoeWzWtFcsrSgMUWKHWTNtwjJaEAvFTZ+2VnY31DozMCA
 +AIwCWOGDfmr5O3CDce37xAScbFrDLgRzkjRhV9uf10tyMv0opF1KOx7B w==;
X-CSE-ConnectionGUID: PDMomVH1T4u+bYZ/lGXWCQ==
X-CSE-MsgGUID: iopknqaxQ4+pw9iaoScQmA==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="21068044"
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; d="scan'208";a="21068044"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 13:08:26 -0700
X-CSE-ConnectionGUID: chZj12SJSN6i3cKtiY8nrg==
X-CSE-MsgGUID: 0d99a4NoSMOwka1WHMIk7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; d="scan'208";a="24898415"
Received: from rahul-super-server.iind.intel.com ([10.145.169.156])
 by fmviesa010.fm.intel.com with ESMTP; 24 Apr 2024 13:08:23 -0700
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com
Cc: matthew.d.roper@intel.com
Subject: [PATCH i-g-t v2 2/2] tests/intel/xe_pm: Add mocs suspend resume test
Date: Thu, 25 Apr 2024 01:38:56 +0530
Message-Id: <20240424200856.1194881-3-janga.rahul.kumar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240424200856.1194881-1-janga.rahul.kumar@intel.com>
References: <20240424200856.1194881-1-janga.rahul.kumar@intel.com>
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

From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Add test to check mocs values are retained over suspend/resume.

v2: Extend test to check S3/S4 suspend states. (Matt Roper)

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 tests/intel/xe_pm.c | 56 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 51442537b..baec50d7f 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -251,6 +251,11 @@ static void close_fw_handle(int sig)
  * Description: suspend/autoresume on %arg[1] state and exec after RPM
  * Functionality: pm - %arg[1]
  *
+ * SUBTEST: %s-mocs
+ * Description: test checks for mocs state before and after %arg[1] state
+ * Functionality: pm - %arg[1]
+ * GPU requirements: D3 feature should be supported
+ *
  * arg[1]:
  *
  * @s2idle:	s2idle
@@ -609,6 +614,49 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
 	close(fw_handle);
 }
 
+/**
+ * SUBTEST: mocs_suspend_resume
+ * Description:
+ *     Validate mocs register contents over suspend resume
+ *
+ * Functionality: mocs
+ * Run type: FULL
+ */
+static void test_mocs_suspend_resume(device_t device, bool runtime_sr, enum igt_suspend_state state)
+{
+	int gt;
+
+	xe_for_each_gt(device.fd_xe, gt) {
+		char path[256];
+
+		// Mocs debugfs contents before and after suspend-resume
+		char mocs_content_pre[4096], mocs_contents_post[4096];
+
+		sprintf(path, "gt%d/mocs", gt);
+		igt_assert(igt_debugfs_exists(device.fd_xe, path, O_RDONLY));
+		igt_debugfs_dump(device.fd_xe, path);
+		igt_debugfs_read(device.fd_xe, path, mocs_content_pre);
+
+		fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
+		igt_assert(fw_handle >= 0);
+		igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
+
+		if (runtime_sr) {
+			/* Runtime suspend  */
+			close(fw_handle);
+			igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+		} else {
+			igt_system_suspend_autoresume(state, SUSPEND_TEST_NONE);
+		}
+
+		igt_assert(igt_debugfs_exists(device.fd_xe, path, O_RDONLY));
+		igt_debugfs_dump(device.fd_xe, path);
+		igt_debugfs_read(device.fd_xe, path, mocs_contents_post);
+
+		igt_assert(strcmp(mocs_content_pre, mocs_contents_post) == 0);
+	}
+}
+
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -703,6 +751,10 @@ igt_main
 				cleanup_d3(device);
 			}
 		}
+
+		igt_subtest_f("%s-mocs", s->name) {
+			test_mocs_suspend_resume(device, 0, s->state);
+		}
 	}
 
 	for (const struct d_state *d = d_states; d->name; d++) {
@@ -767,6 +819,10 @@ igt_main
 			dpms_on_off(device, DRM_MODE_DPMS_ON);
 			igt_pm_set_autosuspend_delay(device.pci_xe, delay_ms);
 		}
+
+		igt_subtest("mocs_suspend_resume")
+			test_mocs_suspend_resume(device, 1, 0);
+
 	}
 
 	igt_fixture {
-- 
2.25.1

