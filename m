Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B538E7719F
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jan 2025 13:54:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D13EF10E68F;
	Mon, 13 Jan 2025 13:54:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Df5R8Udl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8E6310E298
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jan 2025 13:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736776462; x=1768312462;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=220K613BbOcQSUN2PlGRc3WM14LdPTWqOvo9mfH5PGE=;
 b=Df5R8UdlRxSW6NvTshRGfr3yGAgV6sBLjq8T0KvXykJbu+gGCUvO5we2
 XJGtkjf6FWdU4z4rMTjGXVpK7kj0ZnS/5m7h6PkxdRLIlWCfdkFnzU41O
 axMkzN65r+981vaTIALnPFT5q1z9zcYBWrre0mu12iXkEbPgVuu7L+DZN
 L23NpmxN9FyUYpwJlWm0O9uCPkd8f6+JRKDCyJQDfBZQoHEIMh4hj94kR
 B4u7l6d6z5+MPHhbm8t2x8cBWnDXBy8yOMDDBYpOmVsGRf3MEgYCnRgDM
 WKx3Xzcpseqw0LQb6EujmLBAfUlHbMaXVQgpiLNoOrUfgpHm9ZBAPLJwz g==;
X-CSE-ConnectionGUID: fXIs1h32SmS+hKlzwP10zw==
X-CSE-MsgGUID: dtGWIoxrTVe8rS19ghXz8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="37153402"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="37153402"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2025 05:54:17 -0800
X-CSE-ConnectionGUID: 0fjVzZ5YSouN4rl7fehc5g==
X-CSE-MsgGUID: eTWhAVKnRYiEFKEcDmeaDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="109623876"
Received: from pgurram-desk.iind.intel.com ([10.145.169.87])
 by orviesa005.jf.intel.com with ESMTP; 13 Jan 2025 05:54:15 -0800
From: Pravalika Gurram <pravalika.gurram@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com,
 Pravalika Gurram <pravalika.gurram@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH v3] tests/intel: Enhance the wedged_mode sysfs support
Date: Mon, 13 Jan 2025 19:21:03 +0530
Message-Id: <20250113135103.947823-1-pravalika.gurram@intel.com>
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

Added support to read the wedged_mode sysfs

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
---
 tests/intel/xe_wedged.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
index 613d571b4..844ab2809 100644
--- a/tests/intel/xe_wedged.c
+++ b/tests/intel/xe_wedged.c
@@ -203,11 +203,16 @@ simple_hang(int fd, struct drm_xe_sync *sync)
  * SUBTEST: wedged-mode-toggle
  * Description: Test wedged.mode=1 after testing wedged.mode=2
  */
+/**
+ * SUBTEST: basic-wedged-read
+ * Description: Read wedged debugfs
+ */
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe;
 	int fd;
 	char pci_slot[NAME_MAX];
+	char str[150];
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
@@ -279,6 +284,13 @@ igt_main
 		igt_assert_eq(simple_ioctl(fd), 0);
 	}
 
+	igt_subtest_f("basic-wedged-read") {
+		igt_require(igt_debugfs_exists(fd, "wedged_mode", O_RDONLY));
+
+		igt_debugfs_read(fd, "wedged_mode", str);
+		igt_assert_f(str[0] != '\0', "Failed to read wedged_mode from debugfs!\n");
+	}
+
 	igt_fixture {
 		if (igt_debugfs_exists(fd, "fail_gt_reset/probability", O_RDWR)) {
 			igt_debugfs_write(fd, "fail_gt_reset/probability", "0");
-- 
2.34.1

