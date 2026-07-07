Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F11EC43458
	for <igt-dev@archiver.kernel.org>; Tue,  7 Jul 2026 16:41:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3F5310EE70;
	Tue,  7 Jul 2026 16:41:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H+qmqRoC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F8E510E119
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jul 2026 16:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783442474; x=1814978474;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4plDKulg5GqaVorka8M3rolrcfC1Noo0oKQdxzCGTGU=;
 b=H+qmqRoCnJHq3XsNuKwvPMlebRJuGgPjao5bzlC/EvOvBEvwCuLg45i9
 He/aCB94YBZ/PKs45BihY3s9aqaS9xlJNJHimQq4YXH5Qp9KTj/TksR5a
 Btk/5D54ee6JL4RDCtMl9c/dXVOSjkWR64b2GDue6QGLjoxWU5wY7H7yR
 hPIqQHpLYohqTUfKTVgVJyHqYKVEVq+xzuYMvgMn8G5UM0Mp5Re+Igi41
 lTCl8en264hQnvCcBzxjzkApIPqtZNXYu0XgBfoQKCJIR2spIVJDfxjHr
 jimFMc039QRMzFkC9HAJlrprT6cGR+KoW4Lryq6Ax13dd3qM42WeRQfWx A==;
X-CSE-ConnectionGUID: /Xad8FSIQSq55kmMPpa+6g==
X-CSE-MsgGUID: asLUG7vXTyKyZ6MU3WRKrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="94737925"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="94737925"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 09:41:14 -0700
X-CSE-ConnectionGUID: DAGSaoaXQEKHkt8YiXp71w==
X-CSE-MsgGUID: bw7zavPTQ/CM3Ap84o6YWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="257925656"
Received: from dut6245dg2frd.fm.intel.com ([10.36.24.131])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 09:41:14 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	daniele.ceraolospurio@intel.com
Cc: Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t] tests/xe_debugfs: add GT debugfs validation and
 gsc_info read tests
Date: Tue,  7 Jul 2026 16:41:01 +0000
Message-ID: <20260707164101.1633424-1-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.52.0
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

Add coverage for GT-specific debugfs entries by introducing a new
gt-dir subtest that validates the presence of required files in the
GT debugfs hierarchy. Currently, the test checks for the existence of
the uc/gsc_info debugfs node.

Also add a gsc-info-read subtest to verify that the gsc_info debugfs
node can be read successfully and returns non-empty content when
present. The test skips gracefully on platforms or GTs where the node
is not exposed.

These additions improve validation of Xe debugfs interfaces and provide
basic functional coverage for the GSC information debugfs node.

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 tests/intel/xe_debugfs.c | 63 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 62 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
index da482157e..8ada52b6e 100644
--- a/tests/intel/xe_debugfs.c
+++ b/tests/intel/xe_debugfs.c
@@ -451,6 +451,29 @@ skip:
 	igt_skip("Failed to open debugfs directory\n");
 }
 
+/**
+ * SUBTEST: gt-dir
+ * Description: Check required debugfs devnodes exist in the GT debugfs directory
+ */
+static void test_gt_dir(struct xe_device *xe_dev, unsigned int gt)
+{
+	const struct check_entry expected_files[] = {
+		{ "uc/gsc_info", O_RDONLY },
+	};
+	int debugfs_fd = igt_debugfs_gt_dir(xe_dev->fd, gt);
+	int missing_count;
+
+	igt_skip_on_f(debugfs_fd < 0, "Failed to open debugfs directory\n");
+
+	missing_count = debugfs_validate_entries(xe_dev, debugfs_fd, expected_files,
+						 ARRAY_SIZE(expected_files));
+
+	close(debugfs_fd);
+
+	igt_fail_on_f(missing_count > 0, "Found %d missing debugfs files (see warnings above)\n",
+		      missing_count);
+}
+
 /**
  * SUBTEST: tile-dir
  * Description: Check required debugfs devnodes exist in the tile debugfs directory
@@ -595,6 +618,31 @@ static void check_gt_reg_sr(int fd, int gt)
 	igt_assert_eq(problems, 0);
 }
 
+/**
+ * SUBTEST: gsc-info-read
+ * Description: Check GSC info debugfs devnode contents
+ */
+static void test_gsc_info_read(struct xe_device *xe_dev, unsigned int gt)
+{
+	int debugfs_fd = igt_debugfs_gt_dir(xe_dev->fd, gt);
+	char *buf;
+
+	igt_skip_on_f(debugfs_fd < 0, "Failed to open debugfs directory\n");
+
+	if (faccessat(debugfs_fd, "uc/gsc_info", F_OK, 0) < 0) {
+		close(debugfs_fd);
+		igt_skip("gsc_info debugfs node not present on gt-%u\n", gt);
+	}
+
+	buf = igt_sysfs_get(debugfs_fd, "uc/gsc_info");
+	close(debugfs_fd);
+
+	igt_assert_f(buf, "Failed to read gsc_info debugfs file\n");
+	igt_assert_f(buf[0] != '\0', "gsc_info debugfs file is empty\n");
+
+	free(buf);
+}
+
 const char *help_str =
 	"  --warn-not-hit|--w\tWarn about devfs nodes that have no tests";
 
@@ -619,8 +667,9 @@ static int opt_handler(int option, int option_index, void *input)
 int igt_main_args("", long_options, help_str, opt_handler, NULL)
 {
 	struct xe_device *xe_dev;
+	unsigned int gt;
 	unsigned int t;
-	int fd = -1, gt;
+	int fd = -1;
 
 	igt_fixture() {
 		fd = drm_open_driver_master(DRIVER_XE);
@@ -633,6 +682,12 @@ int igt_main_args("", long_options, help_str, opt_handler, NULL)
 	igt_subtest("root-dir")
 		test_root_dir(xe_dev);
 
+	igt_describe("Check required debugfs devnodes exist in the GT debugfs directory.");
+	igt_subtest_with_dynamic("gt-dir")
+		xe_for_each_gt(fd, gt)
+			igt_dynamic_f("gt-%u", gt)
+				test_gt_dir(xe_dev, gt);
+
 	igt_describe("Check required debugfs devnodes exist in the tile debugfs directory.");
 	igt_subtest_with_dynamic("tile-dir")
 			xe_for_each_tile(fd, t)
@@ -648,6 +703,12 @@ int igt_main_args("", long_options, help_str, opt_handler, NULL)
 			igt_dynamic_f("gt%d", gt)
 				check_gt_reg_sr(fd, gt);
 
+	igt_describe("Check GSC info debugfs devnode contents.");
+	igt_subtest_with_dynamic("gsc-info-read")
+		xe_for_each_gt(fd, gt)
+			igt_dynamic_f("gt-%u", gt)
+				test_gsc_info_read(xe_dev, gt);
+
 	igt_fixture() {
 		drm_close_driver(fd);
 	}
-- 
2.52.0

