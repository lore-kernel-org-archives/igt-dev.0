Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4576BC53219
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jul 2026 07:42:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1D0710E002;
	Wed, 29 Jul 2026 07:42:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IiVo5AuJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B3CA10E002
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2026 07:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785310900; x=1816846900;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ea49v8ZBG01Qa+HTZg7+V7tg4MvP95gtYXpRzm4OfpM=;
 b=IiVo5AuJwMnbH9P6zxGI9+cw8LoJE+y0CKOiKOTUQ56lwhkUq+IBqHv6
 FyH3H22DaguhWRpCcpRsb9V5cKoYO/Y11GLfMYT6Ugafy2+H16fgFyC0S
 Zain3ufzPzE21OfkctOoPaUUsggN+Mq7IsX/NDL2Iabg++U2yf/uI7a4B
 XtqDDLgEze3yjzDsdq4ouer4eJL5MmYMK7jhAycbVjBj1dBU/tghgvwK3
 8HWWkD2moVXk/Y3zlGts7hvSHb2iMZkA+lAC29n7DL+ZCbtWA1LgxreKL
 FzFs9cddbNraKiggJdcDnqmaj02Qit/KnKUSM/DRQ0mpFEJZfiqZi8NsC g==;
X-CSE-ConnectionGUID: vI9DG9DBTtObp7D3DH1UXw==
X-CSE-MsgGUID: RR8B+FdgR9KDt8lOYsMlzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="111452684"
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="111452684"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 00:41:39 -0700
X-CSE-ConnectionGUID: N0q6JVm6Twa2ynkdWD/Bqw==
X-CSE-MsgGUID: 73ueBIEbSEGJlA6j+Mm3vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; d="scan'208";a="263429958"
Received: from dut6245dg2frd.fm.intel.com ([10.36.24.131])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2026 00:41:40 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	daniele.ceraolospurio@intel.com
Cc: kamil.konieczny@intel.com,
	Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_debugfs: add uc debugfs validation and
 read tests
Date: Wed, 29 Jul 2026 07:41:30 +0000
Message-ID: <20260729074130.4499-1-sobin.thomas@intel.com>
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

Add coverage for GT-specific uc debugfs entries by introducing a new
uc-info-read subtest that validates the presence of required files in the
GT debugfs hierarchy. The test currently verifies the existence of
the following debugfs nodes:

  - uc/gsc_info
  - uc/huc_info
  - uc/guc_info
  - uc/guc_pc

These additions improve validation of Xe GT debugfs interfaces and
provide basic functional coverage for the GSC information debugfs node.

v2: Add support for guc and huc info (Daniele)
v3: Added checks for the device nodes.
v4: Consolidated the calls into single test_uc_info_read subtest
v5: Fixed mandatory and optional logs and access check
    is done using igt_sysfs_has_attr. (Daniele)
    Fixed subject nits. (Kamil)

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 tests/intel/xe_debugfs.c | 71 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 70 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
index da482157e..5c045b04f 100644
--- a/tests/intel/xe_debugfs.c
+++ b/tests/intel/xe_debugfs.c
@@ -16,6 +16,18 @@ struct {
 	bool warn_on_not_hit;
 } opt = { 0 };
 
+struct uc_info_node {
+	const char *node;
+	bool mandatory;
+};
+
+static const struct uc_info_node uc_info_nodes[] = {
+	{ "uc/gsc_info", false },
+	{ "uc/huc_info", false },
+	{ "uc/guc_info", true },
+	{ "uc/guc_pc",   true },
+};
+
 /**
  * TEST: Xe debugfs test
  * Description: Xe-specific debugfs tests. These are complementary to the
@@ -595,6 +607,56 @@ static void check_gt_reg_sr(int fd, int gt)
 	igt_assert_eq(problems, 0);
 }
 
+/**
+ * SUBTEST: uc-info-read
+ * Description: This is for reading the uc device nodes.
+ */
+static void test_uc_info_read(struct xe_device *xe_dev, unsigned int gt)
+{
+	int debugfs_fd = igt_debugfs_gt_dir(xe_dev->fd, gt);
+	int i;
+	int fail_count = 0;
+
+	igt_skip_on_f(debugfs_fd < 0, "Failed to open debugfs directory\n");
+
+	for (i = 0; i < ARRAY_SIZE(uc_info_nodes); i++) {
+		const char *node = uc_info_nodes[i].node;
+		bool mandatory = uc_info_nodes[i].mandatory;
+		char *buf;
+
+		if (!igt_sysfs_has_attr(debugfs_fd, node)) {
+			if (mandatory)
+				fail_count++;
+			igt_info("%s debugfs node not present on GT-%u\n", node, gt);
+			continue;
+		}
+		buf = igt_sysfs_get(debugfs_fd, node);
+		if (!buf) {
+			if (mandatory)
+				fail_count++;
+
+			igt_info("Failed to read %s %s debugfs file on GT-%u\n",
+				 mandatory ? "mandatory" : "optional", node, gt);
+			continue;
+		}
+
+		if (buf[0] == '\0') {
+			free(buf);
+			if (mandatory)
+				fail_count++;
+			igt_info("%s %s debugfs file is empty on GT-%u\n",
+				 mandatory ? "mandatory" : "optional", node, gt);
+			continue;
+		}
+		igt_info("GT-%u: successfully read %s (%zu bytes)\n", gt, node, strlen(buf));
+		free(buf);
+	}
+	close(debugfs_fd);
+	igt_fail_on_f(fail_count > 0,
+		      "%d mandatory debugfs node(s) failed (missing/unreadable/empty) on GT-%u\n",
+		      fail_count, gt);
+}
+
 const char *help_str =
 	"  --warn-not-hit|--w\tWarn about devfs nodes that have no tests";
 
@@ -619,8 +681,9 @@ static int opt_handler(int option, int option_index, void *input)
 int igt_main_args("", long_options, help_str, opt_handler, NULL)
 {
 	struct xe_device *xe_dev;
+	int fd = -1;
+	unsigned int gt;
 	unsigned int t;
-	int fd = -1, gt;
 
 	igt_fixture() {
 		fd = drm_open_driver_master(DRIVER_XE);
@@ -648,6 +711,12 @@ int igt_main_args("", long_options, help_str, opt_handler, NULL)
 			igt_dynamic_f("gt%d", gt)
 				check_gt_reg_sr(fd, gt);
 
+	igt_describe("Verify that uC debugfs info nodes are present and readable.");
+	igt_subtest_with_dynamic("uc-info-read")
+		xe_for_each_gt(fd, gt)
+			igt_dynamic_f("gt%d", gt)
+				test_uc_info_read(xe_dev, gt);
+
 	igt_fixture() {
 		drm_close_driver(fd);
 	}
-- 
2.51.0

