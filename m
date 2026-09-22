Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB4BC982F1
	for <igt-dev@archiver.kernel.org>; Tue, 22 Sep 2026 07:12:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E47410E599;
	Tue, 22 Sep 2026 07:12:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e0cDCaxY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 041BB10E7CF
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Sep 2026 07:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790060992; x=1821596992;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3XXvj/UaAWDalHejrUjiljlIkqP0p3WuwoeXnD5AjoQ=;
 b=e0cDCaxYYq4c+ZdIFzU3HKL3Tu0pi2P40HqSQaYBgxv1rbHX18NBI+o+
 cQ3tt6jecLdmwzrmoGSTlL0yajC4PCpGGVm8KoIvnnNChbjYPFWWPZMHc
 Lq0VfJ5r6rnwTE0BI6MxH9PhXENmlj/jvoSH9MI38jWhyRf4Fpx8A7kn+
 Yf5oQpHTfM+bsqcYRZKj/91LkSkU0pGlpPfeDFw49vxXtd7wdc2Tsde5A
 TE3/Awf2kG+4LzNVAagl7+qhFBzQN9FoJgLeenaauDeELI9ObUvfTDxls
 QFWhQ8BwfhUYaiIEfgfeU35LuTzfq26fOuP4DtEAvw3foAaWQF7AEmWbd A==;
X-CSE-ConnectionGUID: aYbRORb3ROKhCdgtgZtEZA==
X-CSE-MsgGUID: gc0buHo8Tp26rxJ8hM40cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="101987110"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="101987110"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 00:09:52 -0700
X-CSE-ConnectionGUID: 7GfmeOsqQAubzK91sMTQjQ==
X-CSE-MsgGUID: wxVxMobfQG6eHbP9X0zM5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="4113989"
Received: from dev-150.igk.intel.com (HELO localhost) ([10.91.214.40])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 00:09:52 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com
Subject: [PATCH v2 2/2] tests/intel/xe_sriov_vram: Support execution with
 pre-enabled VFs
Date: Tue, 22 Sep 2026 09:09:40 +0200
Message-ID: <20260922070940.3006983-3-lukasz.laguna@intel.com>
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

Allow the vf-access-provisioned and vf-access-beyond subtests to run in
environment where VFs are already enabled. To do that, the VFS_ENABLED=1
environment variable needs to be set.

When VFs are pre-enabled, the test reuses the existing VFs and skips the
subtests that require test managed VF enabling.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
v2:
 - s/skip_when_using_existing_vfs/require_test_managed_vfs (Marcin)
---
 tests/intel/xe_sriov_vram.c | 59 +++++++++++++++++++++++++++----------
 1 file changed, 44 insertions(+), 15 deletions(-)

diff --git a/tests/intel/xe_sriov_vram.c b/tests/intel/xe_sriov_vram.c
index 4d80ab700..418c265b1 100644
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
 
+static void require_test_managed_vfs(void)
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
 
+			require_test_managed_vfs();
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

