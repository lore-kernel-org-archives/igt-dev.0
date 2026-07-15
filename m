Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D89C44508
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 04:21:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D04CA10EE9F;
	Wed, 15 Jul 2026 04:21:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ocy/bop1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC3B910EE9F
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 04:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784089281; x=1815625281;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=70lM8SonYb3p0EyJv/XAw+rmT2kpt6lCrg7r6qaj2Kw=;
 b=Ocy/bop1SHFEoC0tE+qfCVB7KtVB1m9PV4SALhdaJitBEZZjhXryeT0c
 gSkPY08VIqkJUtEBwZaGqhsxRy0zUbwG5Y0hrLznca1JlsJ/D9lOuwVqI
 xYNDLDn2uVEn82ssDMqdRtHzWenjvdXi0Z7xtZ2JKEsRK/ZwcgPZWwFz/
 wkqMqSJVeXodz9tPvYZBnzQ32s/n6YvME9tCmu5LHvTpUEq9VtqVv7HJe
 K/H83WdcCmVsM7uzbwtnk31X1xwPOw/+RR8VzN1mnloQEct3zd4piN/WI
 R9QVJliGRfwJxJOsfLNYhIZsOnDL0lQYDOjwOa8T0RUOXraAzMzDKd+Gt g==;
X-CSE-ConnectionGUID: M9TUJMZgRqmsarfi5bNQfw==
X-CSE-MsgGUID: QehgvXoOSxepgUH8Krfv/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="88617827"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="88617827"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 21:21:21 -0700
X-CSE-ConnectionGUID: Fogppz5pR4CQGHFk/tS9bQ==
X-CSE-MsgGUID: 8ZtRWT2YR0OO+DVdhZIpoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; d="scan'208";a="260951464"
Received: from dut6245dg2frd.fm.intel.com ([10.36.24.131])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2026 21:21:21 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	daniele.ceraolospurio@intel.com
Cc: Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t v2] tests/xe_debugfs: add GT debugfs validation and GSC
 info read tests
Date: Wed, 15 Jul 2026 04:21:13 +0000
Message-ID: <20260715042113.1932212-1-sobin.thomas@intel.com>
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
GT debugfs hierarchy. The test currently verifies the existence of
the following debugfs nodes:

  - uc/gsc_info
  - uc/huc_info
  - uc/guc_info
  - uc/guc_pc

These additions improve validation of Xe GT debugfs interfaces and
provide basic functional coverage for the GSC information debugfs node.

v2: Add support for guc and huc info (Daniele)

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 tests/intel/xe_debugfs.c | 103 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 102 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
index da482157e..bc9a9c27f 100644
--- a/tests/intel/xe_debugfs.c
+++ b/tests/intel/xe_debugfs.c
@@ -451,6 +451,32 @@ skip:
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
+		{ "uc/huc_info", O_RDONLY },
+		{ "uc/guc_info", O_RDONLY },
+		{ "uc/guc_pc", O_RDONLY },
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
@@ -595,6 +621,61 @@ static void check_gt_reg_sr(int fd, int gt)
 	igt_assert_eq(problems, 0);
 }
 
+static void test_uc_info_read(struct xe_device *xe_dev, unsigned int gt, const char *node)
+{
+	int debugfs_fd = igt_debugfs_gt_dir(xe_dev->fd, gt);
+	char *buf;
+
+	igt_skip_on_f(debugfs_fd < 0, "Failed to open debugfs directory\n");
+
+	if (faccessat(debugfs_fd, node, F_OK, 0) < 0) {
+		close(debugfs_fd);
+		igt_skip("%s debugfs node not present on gt-%u\n", node, gt);
+	}
+	buf = igt_sysfs_get(debugfs_fd, node);
+	close(debugfs_fd);
+	igt_assert_f(buf, "Failed to read %s debugfs file\n", node);
+	igt_assert_f(buf[0] != '\0', "%s debugfs file is empty\n", node);
+	free(buf);
+}
+
+/**
+ * SUBTEST: gsc-info-read
+ * Description: Check GSC info debugfs devnode contents
+ */
+static void test_gsc_info_read(struct xe_device *xe_dev, unsigned int gt)
+{
+	test_uc_info_read(xe_dev, gt, "uc/gsc_info");
+}
+
+/**
+ * SUBTEST: huc-info-read
+ * Description: Check HUC info debugfs devnode contents
+ */
+static void test_huc_info_read(struct xe_device *xe_dev, unsigned int gt)
+{
+	test_uc_info_read(xe_dev, gt, "uc/huc_info");
+}
+
+/**
+ * SUBTEST: guc_pc read
+ * Description: Read the guc pc info from the debugfs node contents
+ */
+
+static void test_guc_pc_info(struct xe_device *xe_dev, unsigned int gt)
+{
+	test_uc_info_read(xe_dev, gt, "uc/guc_pc");
+}
+
+/**
+ * SUBTEST: guc-info-read
+ * Description: Check GUC info debugfs devnode contents
+ */
+static void test_guc_info_read(struct xe_device *xe_dev, unsigned int gt)
+{
+	test_uc_info_read(xe_dev, gt, "uc/guc_info");
+}
+
 const char *help_str =
 	"  --warn-not-hit|--w\tWarn about devfs nodes that have no tests";
 
@@ -619,8 +700,9 @@ static int opt_handler(int option, int option_index, void *input)
 int igt_main_args("", long_options, help_str, opt_handler, NULL)
 {
 	struct xe_device *xe_dev;
+	unsigned int gt;
 	unsigned int t;
-	int fd = -1, gt;
+	int fd = -1;
 
 	igt_fixture() {
 		fd = drm_open_driver_master(DRIVER_XE);
@@ -633,6 +715,12 @@ int igt_main_args("", long_options, help_str, opt_handler, NULL)
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
@@ -648,6 +736,19 @@ int igt_main_args("", long_options, help_str, opt_handler, NULL)
 			igt_dynamic_f("gt%d", gt)
 				check_gt_reg_sr(fd, gt);
 
+	igt_describe("Check GSC info debugfs devnode contents.");
+	igt_subtest_with_dynamic("gsc-info-read")
+		xe_for_each_gt(fd, gt)
+			igt_dynamic_f("gt-%u", gt)
+				test_gsc_info_read(xe_dev, gt);
+	igt_describe("Read GuC information from debugfs.");
+	igt_subtest("guc-info-read")
+		test_guc_info_read(xe_dev, gt);
+
+	igt_describe("Read HuC information from debugfs.");
+	igt_subtest("huc-info-read")
+		test_huc_info_read(xe_dev, gt);
+
 	igt_fixture() {
 		drm_close_driver(fd);
 	}
-- 
2.52.0

