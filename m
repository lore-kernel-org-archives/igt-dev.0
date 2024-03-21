Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA31AC54E68
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 15:10:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65C7C10EBE3;
	Thu, 21 Mar 2024 15:10:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y3Uwb4lT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05B3210EBE3
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 15:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711033856; x=1742569856;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o3TJe0YX9ZG/h8bdbRi7JqHR84eh0MjvVrVC0xZqH8Q=;
 b=Y3Uwb4lTlxjF8i9FqAAOcWqIu0ojbmxhoDzbyP8MY7U2u9yMb0MDk/IZ
 SP1fQ47h1STAbrtUej0ufPZ6vySFRNg1zXNxrVU0YIk/MJTpp8VdM/eLA
 EowE55yBFxqn0rrSHQvSQ/Z0R7KxAPOgMulN9ZdWfBFVCKEYUDDtTTTE7
 nbhts5qg6lL5ubceqESC5iwqss++kSISusFWqVf0tbdOGNmKAD50YRqlA
 G1dPO4A44YDMHkEtm0VnFUN89lc9lCJUicgc8Phxi3sWZ6ZB9/iMw3rRc
 3S+b+iYBCWCQWKLCQVINMk/pNoexbbGdpQAYNUSOENxGfMxKMdZbb0P71 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="16575635"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="16575635"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 08:10:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="19011331"
Received: from rahul-super-server.iind.intel.com ([10.145.169.156])
 by fmviesa005.fm.intel.com with ESMTP; 21 Mar 2024 08:10:54 -0700
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com
Cc: matthew.d.roper@intel.com
Subject: [PATCH i-g-t 2/2] tests/intel/xe_pm: Add mocs suspend resume test
Date: Thu, 21 Mar 2024 20:46:37 +0530
Message-Id: <20240321151637.3320911-3-janga.rahul.kumar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240321151637.3320911-1-janga.rahul.kumar@intel.com>
References: <20240321151637.3320911-1-janga.rahul.kumar@intel.com>
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

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 tests/intel/xe_pm.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index fcbed6249..0761d59c4 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -560,6 +560,45 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
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
+static void test_mocs_suspend_resume(device_t device)
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
+		/* Runtime suspend  */
+		close(fw_handle);
+		igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
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
@@ -701,6 +740,10 @@ igt_main
 			dpms_on_off(device, DRM_MODE_DPMS_ON);
 			igt_pm_set_autosuspend_delay(device.pci_xe, delay_ms);
 		}
+
+		igt_subtest("mocs_suspend_resume")
+			test_mocs_suspend_resume(device);
+
 	}
 
 	igt_fixture {
-- 
2.25.1

