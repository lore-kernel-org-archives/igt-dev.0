Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD5DC61DC2
	for <igt-dev@archiver.kernel.org>; Tue, 25 Aug 2026 14:19:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF9D910EA6A;
	Tue, 25 Aug 2026 14:19:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kJBpI0VO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7D6310E1E0
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Aug 2026 14:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787667498; x=1819203498;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HQobj5aAT2ALOcYY0AJ19gf8jIbM/HEgYI7IPTm8qmE=;
 b=kJBpI0VOjiECIKWuYQCkeL/vKKDqK5AiCS02hsxNjxXD13cBeP9AaYbN
 TuVbMcEIEEWLmeq1/F+kV0PcNce32YCeH2fGFSqVQvADyYlvIHaAfP2bP
 DMuAEcuXikr3krHAPBWNPIKAROrRVOXZKVNtF0kffPUOcN1w8i0U7zlVt
 XkvIUMNbp3AvcTslZCR/UUIFfBfb1qn9/JZsv4AGwC8TF+ZUHoFPV3X9Q
 cF89y1306JgYwVs+Yhv8Rqo0kZQkHnfPMCLwrejJPMzyp0yNuE5o7oFW4
 Jz8+Tk0n4cwwFHVrnSJEokqE46v+S+qdnwui3jF49esvPBbawt0t+JZ/Q g==;
X-CSE-ConnectionGUID: ChIMOULpSr+SGPJ0A/oKbw==
X-CSE-MsgGUID: CF2QibbeSXeEuvYOj1Arqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="99659498"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="99659498"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 07:18:18 -0700
X-CSE-ConnectionGUID: OYeRbLIWT3WmnHkg9hH+iQ==
X-CSE-MsgGUID: /fSXWqDQSCOSMOhfnPjdsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; d="scan'208";a="266737713"
Received: from dev-150.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2026 07:18:17 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com, jakub1.kolakowski@intel.com,
 adam.miszczak@linux.intel.com, lukasz.laguna@intel.com
Subject: [PATCH v1 2/2] tests/intel/xe_sriov_vram: Support execution with
 pre-enabled VFs
Date: Tue, 25 Aug 2026 16:18:06 +0200
Message-ID: <20260825141806.2278653-3-lukasz.laguna@intel.com>
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

Allow the vf-access-provisioned and vf-access-beyond subtests to run in
environment where VFs are already enabled. To do that, the VFS_ENABLED=1
environment variable needs to be set.

When VFs are pre-enabled, the test reuses the existing VFs and skips the
subtests that require test managed VF enabling.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 lib/igt_sriov_device.c      | 26 ++++++++++------
 tests/intel/xe_sriov_vram.c | 59 +++++++++++++++++++++++++++----------
 2 files changed, 61 insertions(+), 24 deletions(-)

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
diff --git a/tests/intel/xe_sriov_vram.c b/tests/intel/xe_sriov_vram.c
index 4d80ab700..23dce3892 100644
--- a/tests/intel/xe_sriov_vram.c
+++ b/tests/intel/xe_sriov_vram.c
@@ -33,7 +33,7 @@
 
 IGT_TEST_DESCRIPTION("Xe tests for VRAM in SR-IOV context");
 
-static bool extended_scope, verbose;
+static bool extended_scope, verbose, use_existing_vfs;
 const size_t STEP = SZ_1M;
 
 static uint64_t get_provisioned_vram(unsigned int pf_fd, unsigned int vf_id)
@@ -144,8 +144,10 @@ static void access_provisioned(unsigned int pf_fd, unsigned int num_vfs)
 	uint64_t vram_bar_size;
 	bool passed = true;
 
-	igt_sriov_disable_driver_autoprobe(pf_fd);
-	igt_sriov_enable_vfs(pf_fd, num_vfs);
+	if (!use_existing_vfs) {
+		igt_sriov_disable_driver_autoprobe(pf_fd);
+		igt_sriov_enable_vfs(pf_fd, num_vfs);
+	}
 
 	for_each_sriov_enabled_vf(pf_fd, vf_id) {
 		provisioned_vram = get_provisioned_vram(pf_fd, vf_id);
@@ -156,7 +158,8 @@ static void access_provisioned(unsigned int pf_fd, unsigned int num_vfs)
 		igt_debug("VF%u VRAM BAR size: %" PRIu64 "\n", vf_id, vram_bar_size);
 
 		if (vram_bar_size < provisioned_vram) {
-			igt_sriov_disable_vfs(pf_fd);
+			if (!use_existing_vfs)
+				igt_sriov_disable_vfs(pf_fd);
 			igt_skip("VRAM BAR size is smaller than provisioned VRAM\n");
 		}
 
@@ -168,7 +171,8 @@ static void access_provisioned(unsigned int pf_fd, unsigned int num_vfs)
 		intel_vram_munmap(&vram);
 	}
 
-	igt_sriov_disable_vfs(pf_fd);
+	if (!use_existing_vfs)
+		igt_sriov_disable_vfs(pf_fd);
 
 	igt_assert(passed);
 }
@@ -231,8 +235,10 @@ static void access_beyond(unsigned int pf_fd, unsigned int num_vfs)
 	uint64_t vram_bar_size;
 	bool passed = true;
 
-	igt_sriov_disable_driver_autoprobe(pf_fd);
-	igt_sriov_enable_vfs(pf_fd, num_vfs);
+	if (!use_existing_vfs) {
+		igt_sriov_disable_driver_autoprobe(pf_fd);
+		igt_sriov_enable_vfs(pf_fd, num_vfs);
+	}
 
 	for_each_sriov_enabled_vf(pf_fd, vf_id) {
 		provisioned_vram = get_provisioned_vram(pf_fd, vf_id);
@@ -243,7 +249,8 @@ static void access_beyond(unsigned int pf_fd, unsigned int num_vfs)
 		igt_debug("VF%u VRAM BAR size: %" PRIu64 "\n", vf_id, vram_bar_size);
 
 		if (vram_bar_size <= provisioned_vram) {
-			igt_sriov_disable_vfs(pf_fd);
+			if (!use_existing_vfs)
+				igt_sriov_disable_vfs(pf_fd);
 			igt_skip("VRAM BAR size is smaller or equal to provisioned VRAM\n");
 		}
 
@@ -255,7 +262,8 @@ static void access_beyond(unsigned int pf_fd, unsigned int num_vfs)
 		intel_vram_munmap(&vram);
 	}
 
-	igt_sriov_disable_vfs(pf_fd);
+	if (!use_existing_vfs)
+		igt_sriov_disable_vfs(pf_fd);
 
 	igt_assert(passed);
 }
@@ -309,6 +317,12 @@ static void resize_and_access(unsigned int pf_fd, bool resize_up)
 	igt_assert(passed);
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
@@ -337,6 +351,7 @@ static const char help_str[] =
 
 int igt_main_args("", long_opts, help_str, opts_handler, NULL)
 {
+	unsigned int enabled_vfs;
 	bool autoprobe;
 	int pf_fd;
 	static struct subtest_resize_variants {
@@ -352,14 +367,19 @@ int igt_main_args("", long_opts, help_str, opts_handler, NULL)
 		pf_fd = drm_open_driver(DRIVER_XE);
 		igt_require(xe_has_vram(pf_fd));
 		igt_require(igt_sriov_is_pf(pf_fd));
-		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
+		use_existing_vfs = igt_check_boolean_env_var("VFS_ENABLED", false);
+		enabled_vfs = igt_sriov_get_enabled_vfs(pf_fd);
+		igt_require(use_existing_vfs ? enabled_vfs > 0 : enabled_vfs == 0);
 		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
 		igt_sriov_install_exit_handler(pf_fd, NULL, NULL);
 	}
 
 	igt_describe("Verify that VF can access all the provisioned memory via VRAM BAR");
 	igt_subtest_with_dynamic_f("vf-access-provisioned") {
-		if (extended_scope) {
+		if (use_existing_vfs) {
+			igt_dynamic_f("numvfs-%d", enabled_vfs)
+				access_provisioned(pf_fd, enabled_vfs);
+		} else if (extended_scope) {
 			for_each_sriov_num_vfs(pf_fd, num_vfs)
 				igt_dynamic_f("numvfs-%d", num_vfs)
 					access_provisioned(pf_fd, num_vfs);
@@ -375,7 +395,10 @@ int igt_main_args("", long_opts, help_str, opts_handler, NULL)
 
 	igt_describe("Verify that VF cannot access memory beyond what's provisioned via VRAM BAR");
 	igt_subtest_with_dynamic_f("vf-access-beyond") {
-		if (extended_scope) {
+		if (use_existing_vfs) {
+			igt_dynamic_f("numvfs-%d", enabled_vfs)
+				access_beyond(pf_fd, enabled_vfs);
+		} else if (extended_scope) {
 			for_each_sriov_num_vfs(pf_fd, num_vfs)
 				igt_dynamic_f("numvfs-%d", num_vfs)
 					access_beyond(pf_fd, num_vfs);
@@ -394,6 +417,7 @@ int igt_main_args("", long_opts, help_str, opts_handler, NULL)
 		igt_subtest_f("vf-access-after-resize-%s", s->name) {
 			unsigned int total_vfs = igt_sriov_get_total_vfs(pf_fd);
 
+			skip_when_using_existing_vfs();
 			igt_require(total_vfs > 1);
 
 			resize_and_access(pf_fd, s->resize_up);
@@ -401,9 +425,14 @@ int igt_main_args("", long_opts, help_str, opts_handler, NULL)
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

