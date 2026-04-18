Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF22F99C73
	for <igt-dev@archiver.kernel.org>; Sat, 18 Apr 2026 10:27:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CAF810E0B9;
	Sat, 18 Apr 2026 10:27:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H3h7iaL1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE43310E0B9
 for <igt-dev@lists.freedesktop.org>; Sat, 18 Apr 2026 10:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776507994; x=1808043994;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Pm/YE9HLXjiWVAI/Ljoql+Gaaa/xY4RQZzq8jFAN3uA=;
 b=H3h7iaL1hBRwmLRb29tz3rqFmrljKiJ/ouUI0LGMmEUv0NWrUWhAfLkJ
 +2AzhQxpv0mD9w3uI8fh2HvAw7Byh6r2atyltIicImql63R37dG+QWY7L
 N6b0BXKqZ/XIXi9EDlDEU+G8CRZDsx0jMupOwjsbyzgtFn7hn8duocfK/
 I1pxX6XGgvC5t7BV/WxUjebRdCVW/YyBI4sTlHebAt+mpWmMVMmIIOXw1
 kurP3c9EIzehpdpVOc4/nz1xigV/RjHPMd8+CSkVJKAWXqHZS2a5KizuP
 pyencFVXwkSl9PGiNZV3ClT6WC7B9OWhdjEjFY+EDfrBjfNf94U3+gj32 Q==;
X-CSE-ConnectionGUID: UlHAT59dQTCKHTnlrqC52A==
X-CSE-MsgGUID: F40fIdJCSbm07wdf8GPsgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="88575003"
X-IronPort-AV: E=Sophos;i="6.23,186,1770624000"; d="scan'208";a="88575003"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2026 03:26:33 -0700
X-CSE-ConnectionGUID: DyAAdQaqSoGJoHCShfPAAA==
X-CSE-MsgGUID: XuoMrgTDShyjWcfczZArCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,186,1770624000"; d="scan'208";a="254729406"
Received: from ddelane1-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.3.48])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2026 03:26:31 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 1/2] tests/intel/xe_sriov_flr: Add vf-driver option
Date: Sat, 18 Apr 2026 12:26:20 +0200
Message-ID: <20260418102621.467394-2-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260418102621.467394-1-marcin.bernatowicz@linux.intel.com>
References: <20260418102621.467394-1-marcin.bernatowicz@linux.intel.com>
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

Replace the boolean no-xe-vfio-pci switch with an explicit vf-driver
mode selection: xe-vfio-pci, xe, and none.
This allows to cover FLR behavior with different VF driver bindings.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/intel/xe_sriov_flr.c | 236 +++++++++++++++++++++++++++++--------
 1 file changed, 186 insertions(+), 50 deletions(-)

diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
index be949fe01..370cb8e1b 100644
--- a/tests/intel/xe_sriov_flr.c
+++ b/tests/intel/xe_sriov_flr.c
@@ -65,11 +65,21 @@ IGT_TEST_DESCRIPTION("Xe tests for SR-IOV VF FLR (Functional Level Reset)");
 static const char STOP_REASON_ABORT[] = "ABORT";
 static const char STOP_REASON_FAIL[]  = "FAIL";
 static const char STOP_REASON_SKIP[]  = "SKIP";
+static const char XE_VFIO_PCI_MODULE[] = "xe_vfio_pci";
+static const char XE_VFIO_PCI_DRIVER[] = "xe-vfio-pci";
+static const char XE_DRIVER[] = "xe";
+static const char VF_DRIVER_MODE_NONE[] = "none";
 
 #define DRIVER_OVERRIDE_TIMEOUT_MS 200
 
+enum vf_driver_mode {
+	VF_DRIVER_XE_VFIO_PCI,
+	VF_DRIVER_XE,
+	VF_DRIVER_NONE,
+};
+
 static int g_wait_flr_ms = 200;
-static bool g_use_xe_vfio_pci = true;
+static enum vf_driver_mode g_vf_driver = VF_DRIVER_XE_VFIO_PCI;
 static bool g_extended_scope;
 
 static struct g_mmio {
@@ -139,6 +149,7 @@ struct subcheck_data {
 	int pf_fd;
 	int num_vfs;
 	uint8_t tile;
+	enum vf_driver_mode vf_driver;
 	char *stop_reason;
 };
 
@@ -264,6 +275,61 @@ static bool is_subcheck_skipped(struct subcheck *subcheck)
 	       !strncmp(STOP_REASON_SKIP, subcheck->data->stop_reason, strlen(STOP_REASON_SKIP));
 }
 
+static const char *vf_driver_mode_to_str(enum vf_driver_mode mode)
+{
+	switch (mode) {
+	case VF_DRIVER_XE_VFIO_PCI:
+		return XE_VFIO_PCI_DRIVER;
+	case VF_DRIVER_XE:
+		return XE_DRIVER;
+	case VF_DRIVER_NONE:
+		return VF_DRIVER_MODE_NONE;
+	}
+
+	igt_assert(false);
+	return NULL;
+}
+
+static const char *vf_driver_mode_to_bound_driver(enum vf_driver_mode mode)
+{
+	switch (mode) {
+	case VF_DRIVER_XE_VFIO_PCI:
+		return XE_VFIO_PCI_DRIVER;
+	case VF_DRIVER_XE:
+		return XE_DRIVER;
+	case VF_DRIVER_NONE:
+		return NULL;
+	}
+
+	igt_assert(false);
+	return NULL;
+}
+
+static bool parse_vf_driver_mode(const char *optarg, enum vf_driver_mode *mode)
+{
+	igt_assert(mode);
+
+	if (!optarg)
+		return false;
+
+	if (!strcasecmp(optarg, XE_VFIO_PCI_DRIVER)) {
+		*mode = VF_DRIVER_XE_VFIO_PCI;
+		return true;
+	}
+
+	if (!strcasecmp(optarg, XE_DRIVER)) {
+		*mode = VF_DRIVER_XE;
+		return true;
+	}
+
+	if (!strcasecmp(optarg, VF_DRIVER_MODE_NONE)) {
+		*mode = VF_DRIVER_NONE;
+		return true;
+	}
+
+	return false;
+}
+
 static void subchecks_report_results(struct subcheck *checks, int num_checks)
 {
 	int fails = 0, skips = 0;
@@ -332,6 +398,68 @@ static void vf_unbind_driver_override(int pf_fd, unsigned int vf_id)
 	free(slot);
 }
 
+struct vf_driver_binding {
+	enum vf_driver_mode mode;
+	bool xe_vfio_loaded;
+	bool *vf_bound;
+};
+
+static bool setup_vf_driver(int pf_fd, int num_vfs, enum vf_driver_mode vf_driver,
+			    struct vf_driver_binding *binding,
+			    struct subcheck *checks, int num_checks)
+{
+	igt_assert(binding);
+
+	*binding = (struct vf_driver_binding) {
+		.mode = vf_driver,
+	};
+
+	switch (vf_driver) {
+	case VF_DRIVER_XE_VFIO_PCI:
+		binding->xe_vfio_loaded = igt_kmod_load(XE_VFIO_PCI_MODULE, NULL) >= 0;
+		if (!binding->xe_vfio_loaded) {
+			igt_warn("%s module is not available, continuing without VF driver binding\n",
+				 XE_VFIO_PCI_MODULE);
+			return true;
+		}
+
+		binding->vf_bound = calloc(num_vfs + 1, sizeof(*binding->vf_bound));
+		igt_assert(binding->vf_bound);
+
+		igt_sriov_enable_driver_autoprobe(pf_fd);
+		for (int vf_id = 1; vf_id <= num_vfs; ++vf_id) {
+			binding->vf_bound[vf_id] =
+				vf_bind_driver_override(pf_fd, vf_id, XE_VFIO_PCI_DRIVER);
+		}
+		return true;
+	case VF_DRIVER_XE:
+		igt_sriov_enable_driver_autoprobe(pf_fd);
+		for (int vf_id = 1; vf_id <= num_vfs; ++vf_id)
+			igt_sriov_bind_vf_drm_driver(pf_fd, vf_id);
+		return true;
+	case VF_DRIVER_NONE:
+		return true;
+	}
+
+	igt_assert(false);
+	return false;
+}
+
+static void cleanup_vf_driver(int pf_fd, int num_vfs,
+			      const struct vf_driver_binding *binding)
+{
+	if (!binding)
+		return;
+
+	if (binding->xe_vfio_loaded) {
+		for (int vf_id = 1; vf_id <= num_vfs; ++vf_id)
+			if (binding->vf_bound && binding->vf_bound[vf_id])
+				vf_unbind_driver_override(pf_fd, vf_id);
+	}
+
+	free(binding->vf_bound);
+}
+
 /**
  * flr_exec_strategy - Function pointer for FLR execution strategy
  * @pf_fd: File descriptor for the Physical Function (PF).
@@ -376,13 +504,13 @@ typedef int (*flr_exec_strategy)(int pf_fd, int num_vfs,
  *
  * A timeout is used to wait for FLR operations to complete.
  */
-static void verify_flr(int pf_fd, int num_vfs, struct subcheck *checks,
-		       int num_checks, flr_exec_strategy exec_strategy)
+static void verify_flr(int pf_fd, int num_vfs, enum vf_driver_mode vf_driver,
+		       struct subcheck *checks, int num_checks,
+		       flr_exec_strategy exec_strategy)
 {
 	const int wait_flr_ms = g_wait_flr_ms;
 	int i, vf_id, flr_vf_id = -1;
-	bool xe_vfio_loaded;
-	bool *vf_bound = NULL;
+	struct vf_driver_binding binding = { .mode = vf_driver };
 
 	igt_sriov_disable_driver_autoprobe(pf_fd);
 	igt_sriov_enable_vfs(pf_fd, num_vfs);
@@ -393,17 +521,8 @@ static void verify_flr(int pf_fd, int num_vfs, struct subcheck *checks,
 	if (igt_warn_on(igt_pci_system_reinit()))
 		goto disable_vfs;
 
-	xe_vfio_loaded = false;
-	if (g_use_xe_vfio_pci)
-		xe_vfio_loaded = igt_kmod_load("xe_vfio_pci", NULL) >= 0;
-	if (xe_vfio_loaded) {
-		vf_bound = calloc(num_vfs + 1, sizeof(*vf_bound));
-		igt_assert(vf_bound);
-
-		igt_sriov_enable_driver_autoprobe(pf_fd);
-		for (vf_id = 1; vf_id <= num_vfs; vf_id++)
-			vf_bound[vf_id] = vf_bind_driver_override(pf_fd, vf_id, "xe-vfio-pci");
-	}
+	if (!setup_vf_driver(pf_fd, num_vfs, vf_driver, &binding, checks, num_checks))
+		goto cleanup;
 
 	init_mmio(pf_fd, num_vfs);
 
@@ -426,14 +545,7 @@ cleanup:
 		checks[i].cleanup(checks[i].data);
 
 	cleanup_mmio();
-
-	if (xe_vfio_loaded) {
-		for (vf_id = 1; vf_id <= num_vfs; vf_id++)
-			if (vf_bound && vf_bound[vf_id])
-				vf_unbind_driver_override(pf_fd, vf_id);
-	}
-
-	free(vf_bound);
+	cleanup_vf_driver(pf_fd, num_vfs, &binding);
 
 disable_vfs:
 	igt_sriov_disable_vfs(pf_fd);
@@ -1025,27 +1137,44 @@ static void regs_subcheck_cleanup(struct subcheck_data *data)
 
 static void reset_only_subcheck_init(struct subcheck_data *data)
 {
-	if (!g_use_xe_vfio_pci) {
-		set_skip_reason(data, "xe-vfio-pci binding is disabled\n");
-		return;
-	}
-
-	if (!igt_kmod_is_loaded("xe_vfio_pci"))
-		set_skip_reason(data, "xe_vfio_pci is not loaded\n");
+	if (data->vf_driver == VF_DRIVER_XE_VFIO_PCI &&
+	    !igt_kmod_is_loaded(XE_VFIO_PCI_MODULE))
+		set_skip_reason(data, "%s is not loaded\n", XE_VFIO_PCI_MODULE);
 }
 
 static void reset_only_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
 {
 	char *slot = igt_sriov_get_vf_pci_slot_alloc(data->pf_fd, vf_id);
-	char bound[64];
+	char bound[64] = "none";
+	const char *expected_driver = vf_driver_mode_to_bound_driver(data->vf_driver);
 	int bound_ret;
 
+	if (data->stop_reason)
+		return;
+
 	igt_assert(slot);
 
 	bound_ret = igt_pci_get_bound_driver_name(slot, bound, sizeof(bound));
-	if (bound_ret <= 0 || strcmp(bound, "xe-vfio-pci") != 0)
-		set_skip_reason(data, "VF%u not bound to xe-vfio-pci\n", vf_id);
+	if (bound_ret < 0) {
+		set_abort_reason(data, "Failed to query VF%u driver binding (%d)\n",
+				 vf_id, bound_ret);
+		goto out;
+	}
 
+	if (!expected_driver) {
+		if (bound_ret > 0)
+			set_abort_reason(data,
+					 "VF%u unexpectedly bound to %s in %s mode\n",
+					 vf_id, bound, vf_driver_mode_to_str(data->vf_driver));
+		goto out;
+	}
+
+	if (bound_ret <= 0 || strcmp(bound, expected_driver) != 0)
+		set_skip_reason(data, "VF%u not bound to %s in %s mode\n",
+				vf_id, expected_driver,
+				vf_driver_mode_to_str(data->vf_driver));
+
+out:
 	free(slot);
 }
 
@@ -1057,12 +1186,14 @@ static void noop_subcheck_cleanup(struct subcheck_data *data)
 {
 }
 
-static void reset_only_test(int pf_fd, int num_vfs, flr_exec_strategy exec_strategy)
+static void reset_only_test(int pf_fd, int num_vfs, enum vf_driver_mode vf_driver,
+			    flr_exec_strategy exec_strategy)
 {
 	struct subcheck_data base = {
 		.pf_fd = pf_fd,
 		.num_vfs = num_vfs,
 		.tile = 0,
+		.vf_driver = vf_driver,
 		.stop_reason = NULL,
 	};
 	struct subcheck check = {
@@ -1074,10 +1205,11 @@ static void reset_only_test(int pf_fd, int num_vfs, flr_exec_strategy exec_strat
 		.cleanup = noop_subcheck_cleanup,
 	};
 
-	verify_flr(pf_fd, num_vfs, &check, 1, exec_strategy);
+	verify_flr(pf_fd, num_vfs, vf_driver, &check, 1, exec_strategy);
 }
 
-static void clear_tests(int pf_fd, int num_vfs, flr_exec_strategy exec_strategy)
+static void clear_tests(int pf_fd, int num_vfs, enum vf_driver_mode vf_driver,
+			flr_exec_strategy exec_strategy)
 {
 	const uint8_t num_tiles = xe_tiles_count(pf_fd);
 	struct subcheck_data base;
@@ -1094,7 +1226,8 @@ static void clear_tests(int pf_fd, int num_vfs, flr_exec_strategy exec_strategy)
 		igt_assert_lt(i, num_tiles);
 		base = (struct subcheck_data){ .pf_fd = pf_fd,
 					       .num_vfs = num_vfs,
-					       .tile = t };
+					       .tile = t,
+					       .vf_driver = vf_driver };
 
 		gdata[i] = (struct ggtt_data){
 			.base = base,
@@ -1152,7 +1285,7 @@ static void clear_tests(int pf_fd, int num_vfs, flr_exec_strategy exec_strategy)
 	igt_assert_eq(i, num_tiles);
 	igt_assert_eq(i * subcheck_count, num_checks);
 
-	verify_flr(pf_fd, num_vfs, checks, num_checks, exec_strategy);
+	verify_flr(pf_fd, num_vfs, vf_driver, checks, num_checks, exec_strategy);
 }
 
 static int opt_handler(int opt, int opt_index, void *data)
@@ -1164,9 +1297,10 @@ static int opt_handler(int opt, int opt_index, void *data)
 	case 'e':
 		g_extended_scope = true;
 		break;
-	case 'v':
-		g_use_xe_vfio_pci = false;
-		igt_info("xe-vfio-pci binding: disabled\n");
+	case 'd':
+		if (!parse_vf_driver_mode(optarg, &g_vf_driver))
+			return IGT_OPT_HANDLER_ERROR;
+		igt_info("VF driver mode: %s\n", vf_driver_mode_to_str(g_vf_driver));
 		break;
 	case 'w':
 		errno = 0;
@@ -1185,17 +1319,17 @@ static int opt_handler(int opt, int opt_index, void *data)
 
 static const struct option long_options[] = {
 	{ .name = "extended", .has_arg = false, .val = 'e', },
-	{ .name = "no-xe-vfio-pci", .has_arg = false, .val = 'v', },
+	{ .name = "vf-driver", .has_arg = true, .val = 'd', },
 	{ .name = "wait-flr-ms", .has_arg = true, .val = 'w', },
 	{},
 };
 
 static const char help_str[] =
 	"  --extended\t\tRun extended scope\n"
-	"  --no-xe-vfio-pci\tDo not load/bind xe-vfio-pci for VFs\n"
+	"  --vf-driver=DRIVER\tVF driver mode: xe-vfio-pci, xe, or none (default: xe-vfio-pci)\n"
 	"  --wait-flr-ms=MS\tSleep MS milliseconds after VF reset sysfs write (default: 200)\n";
 
-int igt_main_args("evw:", long_options, help_str, opt_handler, NULL)
+int igt_main_args("ed:w:", long_options, help_str, opt_handler, NULL)
 {
 	int pf_fd;
 	bool autoprobe;
@@ -1214,13 +1348,14 @@ int igt_main_args("evw:", long_options, help_str, opt_handler, NULL)
 				break;
 
 			igt_dynamic_f("numvfs-%u", vf_num)
-				reset_only_test(pf_fd, vf_num, execute_sequential_flr);
+				reset_only_test(pf_fd, vf_num, g_vf_driver,
+						execute_sequential_flr);
 		}
 	}
 
 	igt_describe("Verify LMEM, GGTT, and SCRATCH_REGS are properly cleared after VF1 FLR");
 	igt_subtest("flr-vf1-clear") {
-		clear_tests(pf_fd, 1, execute_sequential_flr);
+		clear_tests(pf_fd, 1, g_vf_driver, execute_sequential_flr);
 	}
 
 	igt_describe("Perform sequential FLR on each VF, verifying that LMEM, GGTT, and SCRATCH_REGS are cleared only on the reset VF.");
@@ -1229,7 +1364,8 @@ int igt_main_args("evw:", long_options, help_str, opt_handler, NULL)
 
 		igt_require(total_vfs > 1);
 
-		clear_tests(pf_fd, total_vfs > 3 ? 3 : total_vfs, execute_sequential_flr);
+		clear_tests(pf_fd, total_vfs > 3 ? 3 : total_vfs,
+			    g_vf_driver, execute_sequential_flr);
 	}
 
 	igt_describe("Perform FLR on all VFs in parallel, ensuring correct behavior during simultaneous resets.");
@@ -1238,12 +1374,12 @@ int igt_main_args("evw:", long_options, help_str, opt_handler, NULL)
 
 		igt_require(total_vfs > 1);
 
-		clear_tests(pf_fd, total_vfs, execute_parallel_flr);
+		clear_tests(pf_fd, total_vfs, g_vf_driver, execute_parallel_flr);
 	}
 
 	igt_describe("Initiate FLR twice in parallel on same VF.");
 	igt_subtest("flr-twice") {
-		clear_tests(pf_fd, 1, execute_parallel_flr_twice);
+		clear_tests(pf_fd, 1, g_vf_driver, execute_parallel_flr_twice);
 	}
 
 	igt_fixture() {
-- 
2.43.0

