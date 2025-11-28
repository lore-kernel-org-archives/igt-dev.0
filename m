Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE27DCFD376
	for <igt-dev@archiver.kernel.org>; Fri, 28 Nov 2025 11:43:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 937EF10E12E;
	Fri, 28 Nov 2025 11:43:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GIJjz83+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B6D10E12E
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Nov 2025 11:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764330191; x=1795866191;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3zFbs5I6E2QTv/2eGZ/WoLF8DlxvlThSWIUe/iZnk2w=;
 b=GIJjz83+ZwPveHnPMoOTpIFN33RCG0JElXMz2qlU417qkE4MlHEGwyJP
 j+zGL4GfgoRRVqW+7/f7ZEjET0XZy+7IbDNcKFwltlpSXBBJ0D4xzysSt
 dr7TG8jqv3uMTVCCUQXbfD7WP4RTdrUiPwllIppxpxDN8vFsCW+2hf7gz
 5jFGV+ptnbMZ1HIT+zn91x2iqTQL31Ef/3B48qsZGjpj7Bz6xakS3uoqw
 aLvo/PVMGdXSV/htEw2lj4Fa/KE4xjiCq350yp0+3gqh6S76HRwj86TZY
 IjxddN00x5AVdP9tawvaNnhs3DhS39iVHKlulW643q1Of1fPsjc/SgOyT w==;
X-CSE-ConnectionGUID: mDqwdg4LTSy/I2oS6RwEJw==
X-CSE-MsgGUID: t0+2Szg3SumoHXDLW+HwKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66527629"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; d="scan'208";a="66527629"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 03:43:10 -0800
X-CSE-ConnectionGUID: oR5lgRjHRWa1h7e5k4IVxQ==
X-CSE-MsgGUID: UYNXrCIhSBGQVrTpwI893g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; d="scan'208";a="197782641"
Received: from mkrakus-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.246.23.186])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2025 03:43:07 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>
Subject: [PATCH i-g-t v2] tests/intel/xe_sriov_auto_provisioning: Add
 restore_auto_provisioning tests
Date: Fri, 28 Nov 2025 12:43:00 +0100
Message-ID: <20251128114300.669377-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add subtests that verify restore_auto_provisioning with:
- disabled VFs (succeeds; idempotent)
- enabled VFs in auto mode (no-op)
- enabled VFs in custom mode (-EBUSY; succeeds after disable)

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
---
v2: address Lukasz's review comments:
 - Fix comment style
 - Add blank line between prerequisites and subtest body
 - Correct subtest name
 - Add assertion that dummy_value is applied
---
 tests/intel/xe_sriov_auto_provisioning.c | 142 ++++++++++++++++++++++-
 1 file changed, 141 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_sriov_auto_provisioning.c b/tests/intel/xe_sriov_auto_provisioning.c
index 451c3c5ca..e6350bc68 100644
--- a/tests/intel/xe_sriov_auto_provisioning.c
+++ b/tests/intel/xe_sriov_auto_provisioning.c
@@ -290,6 +290,104 @@ static void check_selfconfig(int pf_fd, unsigned int vf_num, unsigned int flags)
 	igt_fail_on_f(fails, "selfconfig check failed\n");
 }
 
+static bool empty_shared_res_attributes(int pf_fd)
+{
+	struct xe_sriov_provisioned_range *ranges = NULL;
+	enum xe_sriov_shared_res res;
+	unsigned int gt;
+	int fails = 0;
+
+	xe_for_each_gt(pf_fd, gt)
+		xe_sriov_for_each_provisionable_shared_res(res, pf_fd, gt)
+			if (xe_sriov_pf_debugfs_read_check_ranges(pf_fd, res, gt, &ranges, 0))
+				fails++;
+
+	return fails == 0;
+}
+
+/**
+ * SUBTEST: restore-auto-provisioning-disabled-vfs
+ * Description: Verify restore auto provisioning when VFs are disabled
+ */
+static void restore_auto_provisioning_disabled_vfs(int pf_fd)
+{
+	igt_require(xe_sriov_pf_debugfs_supports_restore_auto_provisioning(pf_fd));
+	igt_skip_on(igt_sriov_get_enabled_vfs(pf_fd));
+
+	igt_assert_eq(0, xe_sriov_pf_debugfs_restore_auto_provisioning(pf_fd));
+	igt_assert(empty_shared_res_attributes(pf_fd));
+
+	/* check second call is noop */
+	igt_assert_eq(0, xe_sriov_pf_debugfs_restore_auto_provisioning(pf_fd));
+	igt_assert(empty_shared_res_attributes(pf_fd));
+}
+
+/**
+ * SUBTEST: restore-auto-provisioning-enabled-vfs-auto-mode
+ * Description: Verify that restore auto provisioning with VFs enabled in auto mode is noop
+ */
+static void restore_auto_provisioning_enabled_vfs_auto_mode(int pf_fd, unsigned int num_vfs)
+{
+	igt_require(xe_sriov_pf_debugfs_supports_restore_auto_provisioning(pf_fd));
+	igt_skip_on(igt_sriov_get_enabled_vfs(pf_fd));
+	igt_require(empty_shared_res_attributes(pf_fd));
+
+	/* ensure auto provisioning on */
+	igt_assert_eq(0, xe_sriov_pf_debugfs_restore_auto_provisioning(pf_fd));
+	igt_assert(empty_shared_res_attributes(pf_fd));
+	igt_sriov_disable_driver_autoprobe(pf_fd);
+	igt_sriov_enable_vfs(pf_fd, num_vfs);
+
+	/* ensure noop */
+	igt_assert_eq(0, xe_sriov_pf_debugfs_restore_auto_provisioning(pf_fd));
+	igt_assert(!empty_shared_res_attributes(pf_fd));
+	igt_sriov_disable_vfs(pf_fd);
+	igt_assert(empty_shared_res_attributes(pf_fd));
+}
+
+/**
+ * SUBTEST: restore-auto-provisioning-enabled-vfs-custom-mode
+ * Description: Verify that restore auto provisioning with VFs enabled in custom mode is rejected
+ *		and auto provisioning restored after VFs disabled
+ */
+static void restore_auto_provisioning_enabled_vfs_custom_mode(int pf_fd, unsigned int num_vfs)
+{
+	enum xe_sriov_shared_res res;
+	unsigned int gt;
+	uint64_t dummy_value = 10;
+	uint64_t expected[num_vfs + 1];
+
+	igt_require(xe_sriov_pf_debugfs_supports_restore_auto_provisioning(pf_fd));
+	igt_skip_on(igt_sriov_get_enabled_vfs(pf_fd));
+	igt_require(empty_shared_res_attributes(pf_fd));
+
+	/* ensure auto provisioning on */
+	igt_assert_eq(0, xe_sriov_pf_debugfs_restore_auto_provisioning(pf_fd));
+	igt_sriov_disable_driver_autoprobe(pf_fd);
+
+	xe_for_each_gt(pf_fd, gt) {
+		xe_sriov_for_each_provisionable_shared_res(res, pf_fd, gt) {
+			for (unsigned int vf = 1; vf <= num_vfs; vf++) {
+				xe_sriov_pf_set_shared_res_attr(pf_fd, res, vf, gt, dummy_value);
+				expected[vf] = xe_sriov_pf_get_shared_res_attr(pf_fd, res, vf, gt);
+				igt_assert_lte(dummy_value, expected[vf]);
+			}
+
+			igt_sriov_enable_vfs(pf_fd, num_vfs);
+			igt_assert_eq(xe_sriov_pf_debugfs_restore_auto_provisioning(pf_fd),
+				      -EBUSY);
+
+			for (unsigned int vf = 1; vf <= num_vfs; vf++)
+				igt_assert_eq(expected[vf],
+					      xe_sriov_pf_get_shared_res_attr(pf_fd, res, vf, gt));
+
+			igt_sriov_disable_vfs(pf_fd);
+			igt_assert_eq(0, xe_sriov_pf_debugfs_restore_auto_provisioning(pf_fd));
+			igt_assert(empty_shared_res_attributes(pf_fd));
+		}
+	}
+}
+
 static bool extended_scope;
 
 static int opts_handler(int opt, int opt_index, void *data)
@@ -432,10 +530,52 @@ igt_main_args("", long_opts, help_str, opts_handler, NULL)
 		}
 	}
 
+	igt_describe("Verify restore-auto-provisioning when VFs are disabled");
+	igt_subtest("restore-auto-provisioning-disabled-vfs") {
+		restore_auto_provisioning_disabled_vfs(pf_fd);
+	}
+
+	igt_describe("Verify that restore auto provisioning with VFs enabled in auto mode is noop");
+	igt_subtest_with_dynamic("restore-auto-provisioning-enabled-vfs-auto-mode") {
+		if (extended_scope)
+			for_each_sriov_num_vfs(pf_fd, num_vfs)
+				igt_dynamic_f("numvfs-%d", num_vfs)
+					restore_auto_provisioning_enabled_vfs_auto_mode(pf_fd,
+											num_vfs);
+
+		for_random_sriov_num_vfs(pf_fd, num_vfs) {
+			igt_dynamic_f("numvfs-random") {
+				igt_debug("numvfs=%u\n", num_vfs);
+				restore_auto_provisioning_enabled_vfs_auto_mode(pf_fd,
+										num_vfs);
+			}
+		}
+	}
+
+	igt_describe("Verify restore-auto-provisioning with VFs enabled in custom mode");
+	igt_subtest_with_dynamic("restore-auto-provisioning-enabled-vfs-custom-mode") {
+		if (extended_scope)
+			for_each_sriov_num_vfs(pf_fd, num_vfs)
+				igt_dynamic_f("numvfs-%d", num_vfs)
+					restore_auto_provisioning_enabled_vfs_custom_mode(pf_fd,
+											  num_vfs);
+
+		for_random_sriov_num_vfs(pf_fd, num_vfs) {
+			igt_dynamic_f("numvfs-random") {
+				igt_debug("numvfs=%u\n", num_vfs);
+				restore_auto_provisioning_enabled_vfs_custom_mode(pf_fd,
+										  num_vfs);
+			}
+		}
+	}
+
 	igt_fixture {
 		igt_sriov_disable_vfs(pf_fd);
 		/* abort to avoid execution of next tests with enabled VFs */
-		igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0, "Failed to disable VF(s)");
+		igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0, "Failed to disable VF(s)\n");
+		if (xe_sriov_pf_debugfs_supports_restore_auto_provisioning(pf_fd))
+			igt_abort_on_f(xe_sriov_pf_debugfs_restore_auto_provisioning(pf_fd),
+				       "Failed to restore auto provisioning\n");
 		autoprobe ? igt_sriov_enable_driver_autoprobe(pf_fd) :
 			    igt_sriov_disable_driver_autoprobe(pf_fd);
 		igt_abort_on_f(autoprobe != igt_sriov_is_driver_autoprobe_enabled(pf_fd),
-- 
2.43.0

