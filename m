Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E9C5E77188
	for <igt-dev@archiver.kernel.org>; Wed,  8 Jan 2025 06:31:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A799710E25E;
	Wed,  8 Jan 2025 06:31:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d3LOXeDN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F4E110E25E
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Jan 2025 06:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736317907; x=1767853907;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4bFrONCibtJHL7y2N1B34dfOCnKFNeF5v5xkbO7BOA8=;
 b=d3LOXeDNS+4I07RAbYyuqIBogI9KmKzfXmj4IEAcHYBIdC19cjtfwyZ7
 0xoXxhTp1226KEQ1WSTMJ1dQs6tX/RdJrEHXIGmnv4jixHofEMwQz8POo
 zxIftdd8neskiXGK5+PachZMhuogkDuwVTBSJH3HbNG0Zo/za8QjjmP3g
 Tq/d4CK5svTNqHDS4u2yVtg03z3k9h8qNT9i1s3xe9Is8JGBWz0hRiGxt
 xBgmF/twSI+1YMUECVACYnkgHzRkf35L+O2dyuo8Sh0dxG4QjU/XRzCUN
 36xUn50sOmc81sCaWsf8fUJUg4E8n+Dm86gQ0QxudxZRy2qS4Dc5WW/1R Q==;
X-CSE-ConnectionGUID: ll+ydh2+SEeXFhdMEhlulQ==
X-CSE-MsgGUID: aoNGaFyOTMKnQO4/j2QZYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="40297618"
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; d="scan'208";a="40297618"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 22:31:33 -0800
X-CSE-ConnectionGUID: 3efppCDqQAqDq/1uCQah9g==
X-CSE-MsgGUID: BdydsriLQ7+LBNuhpvMJLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="140327945"
Received: from pgurram-desk.iind.intel.com ([10.145.169.87])
 by orviesa001.jf.intel.com with ESMTP; 07 Jan 2025 22:31:31 -0800
From: Pravalika Gurram <pravalika.gurram@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com,
	Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH v2] tests/intel: Enhance the wedged_mode sysfs support
Date: Wed,  8 Jan 2025 11:58:26 +0530
Message-Id: <20250108062826.908027-1-pravalika.gurram@intel.com>
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

1. Added support to read the wedged_mode sysfs
2. Handle the -ETIMEDOUT return value during
forcewake_all sysfs open

Signed-off-by: Pravalika Gurram <pravalika.gurram@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 tests/intel/xe_debugfs.c |  2 +-
 tests/intel/xe_wedged.c  | 12 ++++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
index bcbb5036a..3a83868ba 100644
--- a/tests/intel/xe_debugfs.c
+++ b/tests/intel/xe_debugfs.c
@@ -268,7 +268,7 @@ test_forcewake(int fd)
 {
 	int handle = igt_debugfs_open(fd, "forcewake_all", O_WRONLY);
 
-	igt_assert_neq(handle, -1);
+	igt_assert_lte(0, handle);
 	close(handle);
 }
 
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

