Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1753DE77188
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jan 2025 12:44:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B56FE10E2A3;
	Fri,  3 Jan 2025 12:44:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NBe3kUVi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B62C10E89F
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jan 2025 12:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735908254; x=1767444254;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cz78UD0c0c1WZClN5fY326Wt0b1aRcz0D7EPKDkh5sk=;
 b=NBe3kUVi9hbcIREOn/Ng7T6ysK323foZhyPwVJ3bggr5/0gynQh0HyW3
 JVxQoKoombSrVezWBlF+9GR3p1nWq6U5heAyVVl5Ce4NjDuXO2eJ3jpbr
 BPd8KmZ/SX1iu+SGG2U8H32ZkRrR9iXLVaG/dJUmhRb1KruGVy3a/gJz+
 J4PYaqBKDMWmyCkL4EXE/iL/4rMQsP2//cZh5/0drt17bwVTfHSb69cMW
 3QciDjlXrNrMVbktXzQNQL/NjZDUUi5is0Qv0sUSzbao0MvIihY2VdED4
 ySa6w+mDgZIr1cLyWG9C2DP+dH+ElC0M31iAtpAdGjYBcmNjsQLyohenS g==;
X-CSE-ConnectionGUID: mArAtx6kQ4WeTczrEa76SQ==
X-CSE-MsgGUID: agoBkz3zQ5GZF7IMvD7l7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="46830656"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; d="scan'208";a="46830656"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2025 04:44:14 -0800
X-CSE-ConnectionGUID: L2fleNWdQ5GVdNmpzOpTTg==
X-CSE-MsgGUID: 0bOT721WT1WvVH0DK+zUxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="106415900"
Received: from pgurram-desk.iind.intel.com ([10.145.169.87])
 by fmviesa005.fm.intel.com with ESMTP; 03 Jan 2025 04:44:12 -0800
From: Pravalika Gurram <pravalika.gurram@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH v1] tests/intel: Enhance the wedged_mode sysfs support
Date: Fri,  3 Jan 2025 18:11:15 +0530
Message-Id: <20250103124115.765794-1-pravalika.gurram@intel.com>
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
---
 tests/intel/xe_debugfs.c | 2 +-
 tests/intel/xe_wedged.c  | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

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
index 613d571b4..d4acd5f7f 100644
--- a/tests/intel/xe_wedged.c
+++ b/tests/intel/xe_wedged.c
@@ -208,6 +208,7 @@ igt_main
 	struct drm_xe_engine_class_instance *hwe;
 	int fd;
 	char pci_slot[NAME_MAX];
+	char str[150];
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
@@ -228,6 +229,7 @@ igt_main
 		igt_assert_eq(simple_ioctl(fd), 0);
 		xe_for_each_engine(fd, hwe)
 			simple_exec(fd, hwe);
+		igt_debugfs_read(fd, "wedged_mode", str);
 	}
 
 	igt_subtest_f("wedged-at-any-timeout") {
-- 
2.34.1

