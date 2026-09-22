Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29DC0C982F1
	for <igt-dev@archiver.kernel.org>; Tue, 22 Sep 2026 07:11:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFD8A10EBB6;
	Tue, 22 Sep 2026 07:11:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eB7DZ1YI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E762B10E7CF
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Sep 2026 07:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790060989; x=1821596989;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rfwmWQUz57A6Q6cTxGiiLsJmqjMeK0zF+Ro0AMqUdj8=;
 b=eB7DZ1YI7bTWMSPTod7K6b4mZeKrTeUi1PRHpvd6xdzQF1hAh9llBVtd
 hb2iDr0Ao/B1SHXvuOl6mffoGFgfToyG43fCw8NsX+GKf242nsLGBpBEg
 zjnGxcm8jj1NRcCJmhKsQZr+E1WUHDN0KVNJ60UZtngSzPvH2Suy7qA/B
 VaSPNApxC84PYEEOx9emOAr2AuPNsEcm3iUxGgR2A56GaDP3dm9Agda88
 ojI9alsPqnuLluhgkW5SYVQ00tA/LFlwuukD52KUKeJ2yLzhS1eQ9v9c8
 0BjPg3HeWoiVuAKcX5nkfFLAv9H0a8LtA8BNNTFZnKqyyanUIwLv+LvdJ Q==;
X-CSE-ConnectionGUID: YU2iOnBHSIuBxN45EXcjMA==
X-CSE-MsgGUID: rlYrHByvSQSNZCZdq6R/wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="101987106"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="101987106"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 00:09:48 -0700
X-CSE-ConnectionGUID: JZ3GRknlScGz0qbDOkASwA==
X-CSE-MsgGUID: ktNGrvVMRSWXGBGO5CZ65w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="4113973"
Received: from dev-150.igk.intel.com (HELO localhost) ([10.91.214.40])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 00:09:48 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com
Subject: [PATCH v2 1/2] tests/intel/xe_sriov_ggtt: Support execution with
 pre-enabled VFs
Date: Tue, 22 Sep 2026 09:09:39 +0200
Message-ID: <20260922070940.3006983-2-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922070940.3006983-1-lukasz.laguna@intel.com>
References: <20260922070940.3006983-1-lukasz.laguna@intel.com>
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
v2:
 - install exit handler (Marcin),
 - s/skip_when_using_existing_vfs/require_test_managed_vfs (Marcin).
---
 lib/igt_sriov_device.c      | 26 +++++++++++------
 tests/intel/xe_sriov_ggtt.c | 56 +++++++++++++++++++++++++++++--------
 2 files changed, 61 insertions(+), 21 deletions(-)

diff --git a/lib/igt_sriov_device.c b/lib/igt_sriov_device.c
index 6c9fbdf70..26b775b3c 100644
--- a/lib/igt_sriov_device.c
+++ b/lib/igt_sriov_device.c
@@ -550,6 +550,7 @@ bool intel_is_vf_device(int fd)
 struct sriov_exit_handler_ctx {
 	int pf;
 	bool autoprobe;
+	unsigned int num_vfs;
 	igt_sriov_exit_cleanup_fn cleanup_fn;
 	void *cleanup_data;
 };
@@ -572,7 +573,12 @@ static void sriov_exit_handler(int sig)
 	if (sriov_exit_ctx.pf < 0)
 		return;
 
-	igt_sriov_disable_vfs(sriov_exit_ctx.pf);
+	if (!sriov_exit_ctx.num_vfs) {
+		igt_sriov_disable_vfs(sriov_exit_ctx.pf);
+	} else {
+		if (igt_sriov_get_enabled_vfs(sriov_exit_ctx.pf) != sriov_exit_ctx.num_vfs)
+			igt_warn("Test modified number of enabled VFs\n");
+	}
 
 	if (sriov_exit_ctx.cleanup_fn)
 		sriov_exit_ctx.cleanup_fn(sriov_exit_ctx.pf, sig,
@@ -587,17 +593,17 @@ static void sriov_exit_handler(int sig)
 /**
  * igt_sriov_install_exit_handler - Install best-effort SR-IOV cleanup handler
  * @pf: PF device file descriptor
- * @cleanup_fn: Optional callback invoked after VF disable
+ * @cleanup_fn: Optional callback
  * @cleanup_data: Opaque callback data
  *
  * Registers a process-exit cleanup routine for SR-IOV tests. The handler runs
- * from normal and signal-triggered exits (when possible), disables VFs,
- * invokes @cleanup_fn if provided (passing signal number, or 0 on normal
- * exit), and restores the original autoprobe setting captured at
- * installation time. Tests that perform full explicit teardown should call
- * igt_sriov_clear_exit_handler() once that teardown succeeds. An internal
- * duplicate of @pf is kept so cleanup remains usable even if the caller closes
- * the original DRM fd before process exit.
+ * from normal and signal-triggered exits (when possible), disables VFs if no VFs
+ * were enabled at installation time, invokes @cleanup_fn if provided (passing
+ * signal number, or 0 on normal exit), and restores the original autoprobe
+ * setting captured at installation time. Tests that perform full explicit
+ * teardown should call igt_sriov_clear_exit_handler() once that teardown
+ * succeeds. An internal duplicate of @pf is kept so cleanup remains usable even
+ * if the caller closes the original DRM fd before process exit.
  */
 void igt_sriov_install_exit_handler(int pf,
 				    igt_sriov_exit_cleanup_fn cleanup_fn,
@@ -616,6 +622,7 @@ void igt_sriov_install_exit_handler(int pf,
 
 	sriov_exit_ctx.pf = pf_dup;
 	sriov_exit_ctx.autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_dup);
+	sriov_exit_ctx.num_vfs = igt_sriov_get_enabled_vfs(pf_dup);
 	sriov_exit_ctx.cleanup_fn = cleanup_fn;
 	sriov_exit_ctx.cleanup_data = cleanup_data;
 
@@ -632,6 +639,7 @@ void igt_sriov_clear_exit_handler(void)
 {
 	sriov_exit_handler_release_fd();
 	sriov_exit_ctx.autoprobe = false;
+	sriov_exit_ctx.num_vfs = 0;
 	sriov_exit_ctx.cleanup_fn = NULL;
 	sriov_exit_ctx.cleanup_data = NULL;
 }
diff --git a/tests/intel/xe_sriov_ggtt.c b/tests/intel/xe_sriov_ggtt.c
index bcd763eb0..d9b3ccdbb 100644
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
 
+static void require_test_managed_vfs(void)
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
@@ -699,27 +711,40 @@ int igt_main_args("", long_opts, help_str, opts_handler, NULL)
 	{
 		pf_fd = drm_open_driver(DRIVER_XE);
 		igt_require(igt_sriov_is_pf(pf_fd));
-		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
+		use_existing_vfs = igt_check_boolean_env_var("VFS_ENABLED", false);
+		enabled_vfs = igt_sriov_get_enabled_vfs(pf_fd);
+		igt_require(use_existing_vfs ? enabled_vfs > 0 : enabled_vfs == 0);
 		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
 		igt_sriov_install_exit_handler(pf_fd, NULL, NULL);
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
+		require_test_managed_vfs();
 		xe_for_each_tile(pf_fd, tile)
 			igt_dynamic_f("tile-%u", tile)
 				pf_check_vfs_pte(pf_fd, tile);
+	}
 
 	igt_describe("Verify of modifiability of GGTT PTE owned by VF");
 	igt_subtest_with_dynamic("vfs-check-own-pte") {
 		skip_on_mtl_vf(pf_fd);
+		require_test_managed_vfs();
 		for_each_sriov_vf(pf_fd, vf_id)
 			xe_for_each_tile(pf_fd, tile)
 				igt_dynamic_f("vf%u-tile-%u", vf_id, tile)
@@ -730,6 +755,7 @@ int igt_main_args("", long_opts, help_str, opts_handler, NULL)
 	igt_subtest_with_dynamic("vfs-check-other-vfs-pte") {
 		igt_require(igt_sriov_get_total_vfs(pf_fd) > 1);
 		skip_on_mtl_vf(pf_fd);
+		require_test_managed_vfs();
 		for_each_sriov_vf(pf_fd, vf_id)
 			xe_for_each_tile(pf_fd, tile)
 				igt_dynamic_f("vf%u-tile-%u", vf_id, tile)
@@ -739,6 +765,7 @@ int igt_main_args("", long_opts, help_str, opts_handler, NULL)
 	igt_describe("Verify the non-availability of VF to GGTT PTEs owned by PF");
 	igt_subtest_with_dynamic("vfs-check-pf-pte") {
 		skip_on_mtl_vf(pf_fd);
+		require_test_managed_vfs();
 		for_each_sriov_vf(pf_fd, vf_id)
 			xe_for_each_tile(pf_fd, tile)
 				igt_dynamic_f("vf%u-tile-%u", vf_id, tile)
@@ -746,9 +773,14 @@ int igt_main_args("", long_opts, help_str, opts_handler, NULL)
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

