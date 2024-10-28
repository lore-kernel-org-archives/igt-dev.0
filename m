Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BBC0D13570
	for <igt-dev@archiver.kernel.org>; Mon, 28 Oct 2024 10:39:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF10610E468;
	Mon, 28 Oct 2024 10:39:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AJlQjUAC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB93410E468
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Oct 2024 10:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730111952; x=1761647952;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lPmjwKRqsHDm9qIHuytu6aEkWDBvYZ+ZHs6rsNqW5vk=;
 b=AJlQjUACZb8fO5AaYsd4QJT8iKeH5iwDXoFKf7aXb4445JcDkE9+SpU/
 4Wq91OYMTEh1BcpxYI3c/v269suZGI4THMHMEZk/k6DC+UT5da4HCeWhN
 9QroIKF0K9gnFwNpaceJ/gGlW2RpM07QZ1sUiWS5tBIQIExdaRQ0hZc/Q
 /G9NYCp/DPib0xJuc30sP6AYqIm2oIWHSCN4WRjFEdOFH+0xnupFj1iai
 Ixpf7b/5ga9McSHOJXjx2JmnynG7ERTcb/qjfNaQQV0cJwbMSq5OntM1T
 zdXkNaxyrO7er/1gd6AOEbt6voqWgimDPhcwitzitWU2ZLWV1eN6cRJv5 w==;
X-CSE-ConnectionGUID: ZL4A1yfXTY2E229/oFOC4g==
X-CSE-MsgGUID: T/6akTsVQQ+B9bEIfBGeRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11238"; a="33619800"
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; d="scan'208";a="33619800"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 03:39:11 -0700
X-CSE-ConnectionGUID: 804J/0mySiaMbmltayOq8w==
X-CSE-MsgGUID: zH8R9VGuRXiUp7vfqYLp+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; d="scan'208";a="86715858"
Received: from rahul-super-server.iind.intel.com ([10.145.169.156])
 by orviesa004.jf.intel.com with ESMTP; 28 Oct 2024 03:39:09 -0700
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com
Cc: lucas.demarchi@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_exec_reset: Add mocs reset test
Date: Mon, 28 Oct 2024 16:17:48 +0530
Message-Id: <20241028104748.3507388-1-janga.rahul.kumar@intel.com>
X-Mailer: git-send-email 2.25.1
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

Check mocs configuration over GT reset.

Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 tests/intel/xe_exec_reset.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 43ef1e334..f4129dbd7 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -715,6 +715,37 @@ gt_reset(int fd, int n_threads, int n_sec)
 	free(threads);
 }
 
+/**
+ * SUBTEST: gt-mocs-reset
+ * Description: Validate mocs register contents over GT reset
+ * Test category: mocs
+ * Functionality: mocs
+ *
+ */
+static void
+gt_mocs_reset(int fd, int gt)
+{
+	char path[256];
+
+	// Mocs debugfs contents before and after suspend-resume
+	char mocs_content_pre[4096], mocs_contents_post[4096];
+
+	sprintf(path, "gt%d/mocs", gt);
+	igt_assert(igt_debugfs_exists(fd, path, O_RDONLY));
+	igt_debugfs_dump(fd, path);
+	igt_debugfs_read(fd, path, mocs_content_pre);
+
+	xe_force_gt_reset_sync(fd, gt);
+	usleep(250000); /* 250 ms */
+
+	igt_assert(igt_debugfs_exists(fd, path, O_RDONLY));
+	igt_debugfs_dump(fd, path);
+	igt_debugfs_read(fd, path, mocs_contents_post);
+
+	igt_assert(strcmp(mocs_content_pre, mocs_contents_post) == 0);
+
+}
+
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -820,6 +851,10 @@ igt_main
 	igt_subtest("gt-reset-stress")
 		gt_reset(fd, 4, 1);
 
+	igt_subtest("gt-mocs-reset")
+		xe_for_each_gt(fd, gt)
+			gt_mocs_reset(fd, gt);
+
 	igt_fixture
 		drm_close_driver(fd);
 }
-- 
2.25.1

