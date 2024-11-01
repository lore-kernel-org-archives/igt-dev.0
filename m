Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D38E6F06D
	for <igt-dev@archiver.kernel.org>; Fri,  1 Nov 2024 15:35:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E28710E2EF;
	Fri,  1 Nov 2024 15:35:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MjZNln9Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD87510E2EF
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Nov 2024 15:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730475352; x=1762011352;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nW6R+qQvGnzmwf/B6yik3Z8EwD31CDvnw5vAJ1DGGD0=;
 b=MjZNln9YD+rnxtioIzZj/Q5pCkQydd3pSkljMrZ6JJFtf6yqMbkIGeIF
 DqYlkhoO5Nx5tb0Hk3o/oOY+cvvGcNHKV7nurhTx2bieJ1vUO/u131DrG
 DnVzI82cOgHeTZviEwk1hIDoFRLp/yYsn5DXWJpGmRUc6AgoPRtGkNhwO
 ffnRzjk0QPMNQmKM4RO19iapRvCP+2W70Z2iK4RiRAfyILCs6Q0YfGAU7
 tBIZ1vvb0wN0iWJLzWhqLQ71b36PUW/MJH8if6V4lCd0Vmegf4pynCZ7e
 /Cza+2Vpyw0JOW/Tr3Mt2VcwXSkAZ7ddPUHdEoF4mp3m6p8bFFqAri0uz w==;
X-CSE-ConnectionGUID: O0n7IsTqSUiicYY3MPikEQ==
X-CSE-MsgGUID: CdBX6r61S0e1O2u4g3mU3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40788269"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="40788269"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2024 08:35:52 -0700
X-CSE-ConnectionGUID: /sIOXqrVTdKjxOhOsIfI1A==
X-CSE-MsgGUID: ei0R0mjAQJGxJGqeuP/QLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="87784841"
Received: from rahul-super-server.iind.intel.com ([10.145.169.156])
 by orviesa003.jf.intel.com with ESMTP; 01 Nov 2024 08:35:49 -0700
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com
Cc: matthew.d.roper@intel.com,
	lucas.demarchi@intel.com
Subject: [PATCH i-g-t v2] tests/intel/xe_exec_reset: Add mocs reset test
Date: Fri,  1 Nov 2024 21:14:32 +0530
Message-Id: <20241101154432.3679065-1-janga.rahul.kumar@intel.com>
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

v2: Address review comments. (Matt Roper)

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 tests/intel/xe_exec_reset.c | 43 +++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 43ef1e334..953b5be28 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -715,6 +715,45 @@ gt_reset(int fd, int n_threads, int n_sec)
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
+	/* Mocs debugfs contents before and after suspend-resume.
+	 * Allocate memory to store 10k characters sufficient enough
+	 * to store global mocs and lncf mocs data.
+	 */
+	char *mocs_content_pre = (char *)malloc(10000 * sizeof(char));
+	char *mocs_contents_post = (char *)malloc(10000 * sizeof(char));
+
+	igt_assert(mocs_content_pre);
+	igt_assert(mocs_contents_post);
+
+	sprintf(path, "gt%d/mocs", gt);
+	igt_assert(igt_debugfs_exists(fd, path, O_RDONLY));
+	igt_debugfs_dump(fd, path);
+	igt_debugfs_read(fd, path, mocs_content_pre);
+
+	xe_force_gt_reset_sync(fd, gt);
+
+	igt_assert(igt_debugfs_exists(fd, path, O_RDONLY));
+	igt_debugfs_dump(fd, path);
+	igt_debugfs_read(fd, path, mocs_contents_post);
+
+	igt_assert(strcmp(mocs_content_pre, mocs_contents_post) == 0);
+
+	free(mocs_content_pre);
+	free(mocs_contents_post);
+}
+
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -820,6 +859,10 @@ igt_main
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

