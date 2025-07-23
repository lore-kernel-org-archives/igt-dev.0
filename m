Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61227C83F17
	for <igt-dev@archiver.kernel.org>; Wed, 23 Jul 2025 05:53:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DAAC10E749;
	Wed, 23 Jul 2025 05:53:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kyI0NIQG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA35D10E748
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Jul 2025 05:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753250038; x=1784786038;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q7qsgJ/ihmeFxISqHNnllzMPgFHPVIGjMhy1+0Q0dMo=;
 b=kyI0NIQGajseAW0bL8i7KLC8TQRjtO3v4vXbFfTeS0EKgvAJA6bbhfMf
 HiZ/W3rorsxqz129rrt1QZehq1X/PV+7Xq8OzIfgGuYMyD0RrAPNFNnft
 vzAIu3ohF6KEXVyPv5e50xc58PWhiVE8dDCgs6bRs38Y7NMoCMdMXChPr
 TblqsEGvpf6y3Pa0EhIniW9L7wzfNP1GRRlB5vQQvrwxdV3a5rv0OKgCY
 4gCjfomrNSYlvNEbWhqpSNV3VRMom5g83usP18P1+bnixt9oLgpv4d40z
 QJeaL8hpHKWk+2qRuECw96n6EbmNgp9bpg0oc7XiOxIocbEjeIxhErF18 w==;
X-CSE-ConnectionGUID: FHwzAlcPSsu/q+JFFq0Ahg==
X-CSE-MsgGUID: REBZxZ4VRDitXEMDxuQ39w==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="66950136"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="66950136"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 22:53:58 -0700
X-CSE-ConnectionGUID: LlzpRyUFQGKDvruU7JN1hA==
X-CSE-MsgGUID: ZWDgZlDSRHahWjPAUfe7CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="164794414"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 22:53:56 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: santhosh.reddy.guddati@intel.com, arun.r.murthy@intel.com,
 jeevan.b@intel.com, Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t v3 4/5] lib/igt_pm: Move check_dpms to igt_pm lib
Date: Wed, 23 Jul 2025 11:23:52 +0530
Message-ID: <20250723055353.1137242-4-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250723055353.1137242-1-karthik.b.s@intel.com>
References: <20250723055353.1137242-1-karthik.b.s@intel.com>
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

The check_dpms function in kms_pm_backlight.c is moved to igt_pm lib
to make it accessible to other subtests which need to perform a
simple DPMS toggle.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 lib/igt_pm.c                   | 21 +++++++++++++++++++++
 lib/igt_pm.h                   |  1 +
 tests/intel/kms_pm_backlight.c | 20 ++------------------
 3 files changed, 24 insertions(+), 18 deletions(-)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index 7f9cbd69a..cf1c442f8 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -1487,3 +1487,24 @@ bool igt_has_pci_pm_capability(struct pci_device *pci_dev)
 
 	return (offset > 0);
 }
+
+/**
+ * igt_pm_dpms_toggle:
+ * @output: igt output for which DPMS toggle has to be performed
+ *
+ * Toggles the DPMS state of output to OFF and then back ON.
+ */
+void igt_pm_dpms_toggle(igt_output_t *output)
+{
+	igt_require(igt_setup_runtime_pm(output->display->drm_fd));
+
+	kmstest_set_connector_dpms(output->display->drm_fd,
+				   output->config.connector,
+				   DRM_MODE_DPMS_OFF);
+	igt_require(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+
+	kmstest_set_connector_dpms(output->display->drm_fd,
+				   output->config.connector,
+				   DRM_MODE_DPMS_ON);
+	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_ACTIVE));
+}
diff --git a/lib/igt_pm.h b/lib/igt_pm.h
index c73972f2a..e931e51af 100644
--- a/lib/igt_pm.h
+++ b/lib/igt_pm.h
@@ -98,5 +98,6 @@ uint64_t igt_pm_get_runtime_active_time(struct pci_device *pci_dev);
 int igt_pm_get_runtime_usage(struct pci_device *pci_dev);
 void igt_pm_ignore_slpc_efficient_freq(int i915, int gtfd, bool val);
 bool igt_has_pci_pm_capability(struct pci_device *pci_dev);
+void igt_pm_dpms_toggle(igt_output_t *output);
 
 #endif /* IGT_PM_H */
diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backlight.c
index 9b341c73a..a0ecf2b0e 100644
--- a/tests/intel/kms_pm_backlight.c
+++ b/tests/intel/kms_pm_backlight.c
@@ -142,22 +142,6 @@ static void test_fade(igt_backlight_context_t *context)
 	}
 }
 
-static void
-check_dpms(igt_output_t *output)
-{
-	igt_require(igt_setup_runtime_pm(output->display->drm_fd));
-
-	kmstest_set_connector_dpms(output->display->drm_fd,
-				   output->config.connector,
-				   DRM_MODE_DPMS_OFF);
-	igt_require(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
-
-	kmstest_set_connector_dpms(output->display->drm_fd,
-				   output->config.connector,
-				   DRM_MODE_DPMS_ON);
-	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_ACTIVE));
-}
-
 static void check_dpms_cycle(igt_backlight_context_t *context)
 {
 	int max, val_1, val_2;
@@ -168,7 +152,7 @@ static void check_dpms_cycle(igt_backlight_context_t *context)
 	igt_backlight_write(max / 2, "brightness", context);
 	igt_backlight_read(&val_1, "actual_brightness", context);
 
-	check_dpms(context->output);
+	igt_pm_dpms_toggle(context->output);
 
 	igt_backlight_read(&val_2, "actual_brightness", context);
 	igt_assert_eq(val_1, val_2);
@@ -310,7 +294,7 @@ igt_main
 				test_setup(display, &contexts->output[j]);
 
 				if (tests[i].flags == TEST_DPMS)
-					check_dpms(contexts[j].output);
+					igt_pm_dpms_toggle(contexts[j].output);
 
 				if (tests[i].flags == TEST_SUSPEND)
 					check_suspend(contexts[j].output);
-- 
2.43.0

