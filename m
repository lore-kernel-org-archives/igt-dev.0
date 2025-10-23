Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C3FCCD1BF
	for <igt-dev@archiver.kernel.org>; Thu, 23 Oct 2025 20:32:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9141710E1EA;
	Thu, 23 Oct 2025 20:32:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HFNvASWG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B2AC10E1EA
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Oct 2025 20:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761251564; x=1792787564;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sbNC51i7Lghf9wbXMM3X9EkWe8aFBHrnWpAI3E3TKPY=;
 b=HFNvASWG784FH7JDo8tcWNZbQDmB0GRNLgnc6xLPncHB9+pSmtxRKRsS
 DnFbeuGqEwUo5pALL0a0ZKvPAaf9k+Pb3xahXl7frFebXNhUIuHwo5VS8
 ANDqeBCLrKFnFQ5ggQNHtW6+VhwITs1Vkjv5Hbq/jAwW9swLqBr/pUlsA
 9zZPMaNjrB5eD9B/UrZiTqwC+gBy4om2BFxVRnxy41QrL+zqoPsZd5hjL
 0vslUpH6DPvaGUpIEI5Dl+sS6dralEW4/JNPI3LYPqFLM5W0GE6GHV5uG
 2XYwvNzQervs/nukHeVz+xKEvAac1t9xn9C0nlDixXDSHq3u8Nc9pQ8uV A==;
X-CSE-ConnectionGUID: c2dyS75DQE6i4b/P5P1wtg==
X-CSE-MsgGUID: hGJLuqviRL6hIVi9xE6h7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="86063017"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="86063017"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 13:32:44 -0700
X-CSE-ConnectionGUID: sE6kAMo8QFaQX15C6wqlkQ==
X-CSE-MsgGUID: gxGs6qpIRZWxxlOKrMzDnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="221450213"
Received: from pmaziews-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.94.249.25])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 13:32:42 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_sriov_auto_provisioning: Add
 restore_auto_provisioning tests
Date: Thu, 23 Oct 2025 22:32:33 +0200
Message-ID: <20251023203233.592113-1-marcin.bernatowicz@linux.intel.com>
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
 tests/intel/xe_sriov_auto_provisioning.c | 136 ++++++++++++++++++++++-
 1 file changed, 135 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_sriov_auto_provisioning.c b/tests/intel/xe_sriov_auto_provisioning.c
index 451c3c5ca..74cea5422 100644
--- a/tests/intel/xe_sriov_auto_provisioning.c
+++ b/tests/intel/xe_sriov_auto_provisioning.c
@@ -290,6 +290,98 @@ static void check_selfconfig(int pf_fd, unsigned int vf_num, unsigned int flags)
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
+	igt_assert_eq(0, xe_sriov_pf_debugfs_restore_auto_provisioning(pf_fd));
+	igt_assert(empty_shared_res_attributes(pf_fd));
+	// check second call is noop
+	igt_assert_eq(0, xe_sriov_pf_debugfs_restore_auto_provisioning(pf_fd));
+	igt_assert(empty_shared_res_attributes(pf_fd));
+}
+
+/**
+ * SUBTEST: restore-auto-provisioning-enabled-vfs-auto_mode
+ * Description: Verify that restore auto provisioning with VFs enabled in auto mode is noop
+ */
+static void restore_auto_provisioning_enabled_vfs_auto_mode(int pf_fd, unsigned int num_vfs)
+{
+	igt_require(xe_sriov_pf_debugfs_supports_restore_auto_provisioning(pf_fd));
+	igt_skip_on(igt_sriov_get_enabled_vfs(pf_fd));
+	igt_require(empty_shared_res_attributes(pf_fd));
+	// ensure auto provisioning on
+	igt_assert_eq(0, xe_sriov_pf_debugfs_restore_auto_provisioning(pf_fd));
+	igt_assert(empty_shared_res_attributes(pf_fd));
+	igt_sriov_disable_driver_autoprobe(pf_fd);
+	igt_sriov_enable_vfs(pf_fd, num_vfs);
+	// ensure noop
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
+	// ensure auto provisioning on
+	igt_assert_eq(0, xe_sriov_pf_debugfs_restore_auto_provisioning(pf_fd));
+	igt_sriov_disable_driver_autoprobe(pf_fd);
+
+	xe_for_each_gt(pf_fd, gt) {
+		xe_sriov_for_each_provisionable_shared_res(res, pf_fd, gt) {
+			for (unsigned int vf = 1; vf <= num_vfs; vf++) {
+				xe_sriov_pf_set_shared_res_attr(pf_fd, res, vf, gt, dummy_value);
+				expected[vf] = xe_sriov_pf_get_shared_res_attr(pf_fd, res, vf, gt);
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
@@ -432,10 +524,52 @@ igt_main_args("", long_opts, help_str, opts_handler, NULL)
 		}
 	}
 
+	igt_describe("Verify restore-auto-provisioning when VFs are disabled");
+	igt_subtest("restore-auto-provisioning-disabled-vfs") {
+		restore_auto_provisioning_disabled_vfs(pf_fd);
+	}
+
+	igt_describe("Verify that restore auto provisioning with VFs enabled in auto mode is noop");
+	igt_subtest_with_dynamic("restore-auto-provisioning-enabled-vfs-auto_mode") {
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

