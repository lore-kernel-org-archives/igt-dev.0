Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60EFBC61DC4
	for <igt-dev@archiver.kernel.org>; Tue, 25 Aug 2026 14:20:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1456D10EA6A;
	Tue, 25 Aug 2026 14:20:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LDZMwe1R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2104010E1E0
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Aug 2026 14:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787667495; x=1819203495;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V9t9WDHqTjsJniszCeu9C/YNL4YnKRvhUOAC51ConiU=;
 b=LDZMwe1RFk3xNvmNScOZa/zpTWl0y9J+3EF2BmSxDO1hzSmd+JhPy5p+
 3v0fpTybS+Del6FFgtdPDcOgm/yyfzVamU7jbwQjrTDwOI+kBnc5vp7wt
 up2lltPoJeV7Pe1f4DsKYmIAYWm0nYjDVz7b8FBp7My8kp8K1ywmapud/
 L6ik4qBpS6JaoTpJVToo91qGDaNpdML6tbXOneo6YTlU8rSbSptbjRI8d
 Ogd3LJlc/MxYTNHnDAkA4Lt+8DmpDR75CEsy3BgaWuYdABnx+swds8oV1
 wQ3O/acLFnwq+1Xzrr2DrK3n6Udq0ctBDd417R70X7p9zpG9kyfSag8VU Q==;
X-CSE-ConnectionGUID: 18/JmmoLQFyk+bFWo7dpag==
X-CSE-MsgGUID: +liAnJSMSYaV4Y4QRwguAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="87082827"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="87082827"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 07:18:15 -0700
X-CSE-ConnectionGUID: K3mYLV+qRLCwxPMze6qRxA==
X-CSE-MsgGUID: Ini9OBZ6TYic+NTLvaEucA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="267337624"
Received: from dev-150.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 07:18:14 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com, jakub1.kolakowski@intel.com,
 adam.miszczak@linux.intel.com, lukasz.laguna@intel.com
Subject: [PATCH v1 1/2] tests/intel/xe_sriov_ggtt: Support execution with
 pre-enabled VFs
Date: Tue, 25 Aug 2026 16:18:05 +0200
Message-ID: <20260825141806.2278653-2-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260825141806.2278653-1-lukasz.laguna@intel.com>
References: <20260825141806.2278653-1-lukasz.laguna@intel.com>
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

Allow the pf-check-vfs-ids subtest to run in environment where VFs are
already enabled. To do that, the VFS_ENABLED=1 environment variable
needs to be set.

When VFs are pre-enabled, the pf-check-vfs-id subtest uses the existing
VF, while other subtests that require test managed VF enabling are
skipped.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/intel/xe_sriov_ggtt.c | 56 +++++++++++++++++++++++++++++--------
 1 file changed, 44 insertions(+), 12 deletions(-)

diff --git a/tests/intel/xe_sriov_ggtt.c b/tests/intel/xe_sriov_ggtt.c
index 2c2184930..bdce64c77 100644
--- a/tests/intel/xe_sriov_ggtt.c
+++ b/tests/intel/xe_sriov_ggtt.c
@@ -47,6 +47,8 @@ IGT_TEST_DESCRIPTION("Xe tests for SR-IOV GGTT");
 
 #define SRIOV_GGTT_TC(__name)	.test = __name, .name = #__name
 
+static bool use_existing_vfs;
+
 struct ggtt_test_data {
 	int pf_fd;
 	struct xe_mmio mmio;
@@ -399,8 +401,10 @@ static void init_subtest(int pf_fd, int vf_id, uint8_t tile,
 	uint16_t dev_id = intel_get_drm_devid(pf_fd);
 	unsigned int nr_ranges, main_gt;
 
-	igt_sriov_disable_driver_autoprobe(pf_fd);
-	igt_sriov_enable_vfs(pf_fd, num_vfs);
+	if (!use_existing_vfs) {
+		igt_sriov_disable_driver_autoprobe(pf_fd);
+		igt_sriov_enable_vfs(pf_fd, num_vfs);
+	}
 
 	/* refresh PCI state */
 	igt_pci_system_reinit();
@@ -437,7 +441,8 @@ static void fini_subtest(struct xe_sriov_provisioned_range *range,
 		xe_mmio_access_fini(&test_data->pf_mmio);
 	xe_mmio_access_fini(&test_data->mmio);
 
-	igt_sriov_disable_vfs(test_data->pf_fd);
+	if (!use_existing_vfs)
+		igt_sriov_disable_vfs(test_data->pf_fd);
 }
 
 #define for_each_pte_test(tc__, testcases__) \
@@ -663,6 +668,12 @@ static void skip_on_mtl_vf(int pf_fd)
 		      "On MTL VF there is no access to GGTT through MMIO, skip\n");
 }
 
+static void skip_when_using_existing_vfs(void)
+{
+	igt_skip_on_f(use_existing_vfs,
+		      "This subtest cannot be run with existing VFs\n");
+}
+
 static int opts_handler(int opt, int opt_index, void *data)
 {
 	switch (opt) {
@@ -691,6 +702,7 @@ static const char help_str[] =
 
 int igt_main_args("", long_opts, help_str, opts_handler, NULL)
 {
+	unsigned int enabled_vfs;
 	bool autoprobe;
 	uint8_t tile;
 	int pf_fd;
@@ -699,26 +711,39 @@ int igt_main_args("", long_opts, help_str, opts_handler, NULL)
 	{
 		pf_fd = drm_open_driver(DRIVER_XE);
 		igt_require(igt_sriov_is_pf(pf_fd));
-		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
+		use_existing_vfs = igt_check_boolean_env_var("VFS_ENABLED", false);
+		enabled_vfs = igt_sriov_get_enabled_vfs(pf_fd);
+		igt_require(use_existing_vfs ? enabled_vfs > 0 : enabled_vfs == 0);
 		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
 	}
 
 	igt_describe("Verify that the VF ID in the GGTT PTE has been correctly assigned");
-	igt_subtest_with_dynamic("pf-check-vfs-ids")
-		for_each_sriov_num_vfs(pf_fd, num_vfs)
+	igt_subtest_with_dynamic("pf-check-vfs-ids") {
+		if (use_existing_vfs) {
 			xe_for_each_tile(pf_fd, tile)
-				igt_dynamic_f("numvfs-%u-tile-%u", num_vfs, tile)
-					pf_check_vfs_ids(pf_fd, tile, num_vfs);
+				igt_dynamic_f("numvfs-%u-tile-%u", enabled_vfs, tile)
+					pf_check_vfs_ids(pf_fd, tile, enabled_vfs);
+		} else {
+			for_each_sriov_num_vfs(pf_fd, num_vfs) {
+				xe_for_each_tile(pf_fd, tile)
+					igt_dynamic_f("numvfs-%u-tile-%u", num_vfs, tile)
+						pf_check_vfs_ids(pf_fd, tile, num_vfs);
+			}
+		}
+	}
 
 	igt_describe("Verify on PF the modifiability of GGTT PTE assigned to VFs");
-	igt_subtest_with_dynamic("pf-check-vfs-pte")
+	igt_subtest_with_dynamic("pf-check-vfs-pte") {
+		skip_when_using_existing_vfs();
 		xe_for_each_tile(pf_fd, tile)
 			igt_dynamic_f("tile-%u", tile)
 				pf_check_vfs_pte(pf_fd, tile);
+	}
 
 	igt_describe("Verify of modifiability of GGTT PTE owned by VF");
 	igt_subtest_with_dynamic("vfs-check-own-pte") {
 		skip_on_mtl_vf(pf_fd);
+		skip_when_using_existing_vfs();
 		for_each_sriov_vf(pf_fd, vf_id)
 			xe_for_each_tile(pf_fd, tile)
 				igt_dynamic_f("vf%u-tile-%u", vf_id, tile)
@@ -729,6 +754,7 @@ int igt_main_args("", long_opts, help_str, opts_handler, NULL)
 	igt_subtest_with_dynamic("vfs-check-other-vfs-pte") {
 		igt_require(igt_sriov_get_total_vfs(pf_fd) > 1);
 		skip_on_mtl_vf(pf_fd);
+		skip_when_using_existing_vfs();
 		for_each_sriov_vf(pf_fd, vf_id)
 			xe_for_each_tile(pf_fd, tile)
 				igt_dynamic_f("vf%u-tile-%u", vf_id, tile)
@@ -738,6 +764,7 @@ int igt_main_args("", long_opts, help_str, opts_handler, NULL)
 	igt_describe("Verify the non-availability of VF to GGTT PTEs owned by PF");
 	igt_subtest_with_dynamic("vfs-check-pf-pte") {
 		skip_on_mtl_vf(pf_fd);
+		skip_when_using_existing_vfs();
 		for_each_sriov_vf(pf_fd, vf_id)
 			xe_for_each_tile(pf_fd, tile)
 				igt_dynamic_f("vf%u-tile-%u", vf_id, tile)
@@ -745,9 +772,14 @@ int igt_main_args("", long_opts, help_str, opts_handler, NULL)
 	}
 
 	igt_fixture() {
-		igt_sriov_disable_vfs(pf_fd);
-		/* abort to avoid execution of next tests with enabled VFs */
-		igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0, "Failed to disable VF(s)");
+		if (use_existing_vfs) {
+			if (igt_sriov_get_enabled_vfs(pf_fd) != enabled_vfs)
+				igt_warn("Test modified number of enabled VFs\n");
+		} else {
+			igt_sriov_disable_vfs(pf_fd);
+			/* abort to avoid execution of next tests with enabled VFs */
+			igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0, "Failed to disable VF(s)");
+		}
 		autoprobe ? igt_sriov_enable_driver_autoprobe(pf_fd) :
 			    igt_sriov_disable_driver_autoprobe(pf_fd);
 		igt_abort_on_f(autoprobe != igt_sriov_is_driver_autoprobe_enabled(pf_fd),
-- 
2.43.0

