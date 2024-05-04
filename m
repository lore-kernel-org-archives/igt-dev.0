Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7425C4345F
	for <igt-dev@archiver.kernel.org>; Sat,  4 May 2024 13:04:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F1CD112C0A;
	Sat,  4 May 2024 13:04:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Drkc6yty";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CFA1112C0A
 for <igt-dev@lists.freedesktop.org>; Sat,  4 May 2024 13:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714827854; x=1746363854;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Kn7LAiUIEjzcsqVSmA/5gI6MyT7g3h1ldZZfNsyveow=;
 b=Drkc6ytyiR3t5vraX0FBku/8nr537OKPL69IceFj43mPhKvs0MW25OrG
 kgecVKZxMMSRACKOWMQ3xpUUfrnxfBNqZMr+siIbWRqpVMnXsNYMnmh0r
 +9Hv34q+2yiJJmulvSYcJRNXLhnOAvN6B/sW8VpnwrExj9oOXwmlNwMoq
 WhIyz1Ux35dfxepulL0hCAJ742zbP5f0X2W500p3HGleA/vUXq4YoJB6y
 6xjHU4JcrszmubBFGRGITPkEAtTfb+D2WZmVT2/YYuuKKDhae+8K++eTV
 NyDhmyzGnuJxOIHosQ9OvDxMbIgjBPe5HfxJQmMal0hXmmMXqLWllWKiW A==;
X-CSE-ConnectionGUID: LyUq+GZ7RR6L+4lvB4VNkA==
X-CSE-MsgGUID: 8CQfoZ9ORNGVWioLOoVxtg==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10506813"
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; d="scan'208";a="10506813"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2024 06:04:14 -0700
X-CSE-ConnectionGUID: 7vGpuictQcSzsXIUPGDooQ==
X-CSE-MsgGUID: VB6shrU2QLWiDoZwXKGe+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; d="scan'208";a="27769783"
Received: from rahul-super-server.iind.intel.com ([10.145.169.156])
 by orviesa009.jf.intel.com with ESMTP; 04 May 2024 06:04:12 -0700
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com
Cc: matthew.d.roper@intel.com,
	badal.nilawar@intel.com
Subject: [PATCH i-g-t 2/3] tests/intel/xe_pm: Add mocs runtime suspend resume
 test
Date: Sat,  4 May 2024 18:34:57 +0530
Message-Id: <20240504130458.2102132-3-janga.rahul.kumar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240504130458.2102132-1-janga.rahul.kumar@intel.com>
References: <20240504130458.2102132-1-janga.rahul.kumar@intel.com>
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

Add test to check mocs values are retained over runtime
suspend/resume.

Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 tests/intel/xe_pm.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 51442537b..73fd57636 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -609,6 +609,45 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
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
@@ -767,6 +806,10 @@ igt_main
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

