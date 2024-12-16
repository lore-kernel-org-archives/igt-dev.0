Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFA0E7717F
	for <igt-dev@archiver.kernel.org>; Mon, 16 Dec 2024 15:31:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E07710E6D4;
	Mon, 16 Dec 2024 15:31:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hCfZ0uj4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98E5C10E6D4
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Dec 2024 15:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734363100; x=1765899100;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XVfaF+vZd9zro6ytsumCV+uHUPHvFF+6uOT5E1M2DyI=;
 b=hCfZ0uj47sPgGXYBWsSYwuUVwhCdl9hyQqwSfVrt3s9P20k/cUAjCACf
 2KOcJ+ykN0C2SLAd3ojbrCp02tZosD4dZApVfDlJ3vww8wY6cvS8eRLod
 GFqRZgx0hf2fjf5lV5yacan5dr2MG/3i/l6rVx6AVTEsE67hWDBnHh2RW
 W4NdXJth52uYxIdhdBS7iYcYKJ6Aq46D1+LfX0md5skMvDBaJ++ge2nf6
 jLKFkRJvO8doYdW8RARneBimCpLfqF5+Z0jD8KTNZ2CXi9dyd+zNl1HM2
 yti0aUt+1ru+2KT4wX/TjXydBSmD5Et7/QPHyTELAfgEn19iEQ4A53x6Q w==;
X-CSE-ConnectionGUID: QgXFyh/iQx+8ZW4qdxoqFQ==
X-CSE-MsgGUID: d1/47AcuQM+L+NRFGzueQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="52274480"
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; d="scan'208";a="52274480"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 07:31:39 -0800
X-CSE-ConnectionGUID: lbIeHas9S4W+KxUqK5S9GQ==
X-CSE-MsgGUID: eCTKcVTsSA6urENvxlbCpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102221267"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.213])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 07:31:37 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: [PATCH i-g-t] tests/intel/gem_pxp: Fix requirements
Date: Mon, 16 Dec 2024 16:31:29 +0100
Message-ID: <20241216153129.50964-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.47.1
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

Requirements should either be global in first igt_fixture or
should be placed in each subtests. Placing them in later
fixtures results in misleading reports like:

sudo ./gem_pxp --r hw-rejects-pxp-context
Subtest hw-rejects-pxp-context: SUCCESS (0,001s)
Test requirement not met in [...] ../tests/intel/gem_pxp.c:1317:
Test requirement: pxp_supported

Created few helpers and used them in each subtest, also
fixed closing power debugfs fd.

Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/gem_pxp.c | 157 +++++++++++++++++++++++++++---------------
 1 file changed, 101 insertions(+), 56 deletions(-)

diff --git a/tests/intel/gem_pxp.c b/tests/intel/gem_pxp.c
index 94544240d..d1562a165 100644
--- a/tests/intel/gem_pxp.c
+++ b/tests/intel/gem_pxp.c
@@ -1282,11 +1282,33 @@ static void test_display_protected_crc(int i915, igt_display_t *display)
 	igt_remove_fb(i915, &protected_fb);
 }
 
+static void require_nopxp(bool pxp_supported, uint32_t devid)
+{
+	igt_require_f(!pxp_supported, "HW supports PXP, devid=%x\n", devid);
+}
+
+static void require_pxp(bool pxp_supported, uint32_t devid)
+{
+	igt_require_f(pxp_supported, "HW do not supports PXP, devid=%x\n", devid);
+}
+
+static void require_pxp_render(bool pxp_supported, uint32_t devid, igt_render_copyfunc_t rendercopy)
+{
+	require_pxp(pxp_supported, devid);
+	igt_require_f(rendercopy, "No rendercopy found for devid=%x\n", devid);
+}
+
+static void require_init_powermgt(int i915, struct powermgt_data *pm)
+{
+	if (pm->debugfsdir == -1)
+		init_powermgt_resources(i915, pm);
+}
+
 igt_main
 {
 	int i915 = -1;
 	bool pxp_supported = false;
-	struct powermgt_data pm = {0};
+	struct powermgt_data pm = {-1};
 	igt_render_copyfunc_t rendercopy = NULL;
 	uint32_t devid = 0;
 	igt_display_t display;
@@ -1296,110 +1318,133 @@ igt_main
 		i915 = drm_open_driver(DRIVER_INTEL);
 		igt_require(i915);
 		igt_require_gem(i915);
+		devid = intel_get_drm_devid(i915);
+		igt_assert(devid);
 		pxp_supported = is_pxp_hw_supported(i915);
+		rendercopy = igt_get_render_copyfunc(devid);
 	}
 
 	igt_subtest_group {
-		igt_fixture {
-			igt_require((pxp_supported == 0));
-		}
-
 		igt_describe("Verify protected buffer on unsupported hw:");
-		igt_subtest("hw-rejects-pxp-buffer")
+		igt_subtest("hw-rejects-pxp-buffer") {
+			require_nopxp(pxp_supported, devid);
 			test_bo_alloc_pxp_nohw(i915);
+		}
 		igt_describe("Verify protected context on unsupported hw:");
-		igt_subtest("hw-rejects-pxp-context")
+		igt_subtest("hw-rejects-pxp-context") {
+			require_nopxp(pxp_supported, devid);
 			test_ctx_alloc_pxp_nohw(i915);
+		}
 	}
 
 	igt_subtest_group {
-		igt_fixture {
-			igt_require(pxp_supported);
-		}
-
 		igt_describe("Verify protected buffer on supported hw:");
-		igt_subtest("create-regular-buffer")
+		igt_subtest("create-regular-buffer") {
+			require_pxp(pxp_supported, devid);
 			test_bo_alloc_pxp_off(i915);
-		igt_subtest("create-protected-buffer")
+		}
+		igt_subtest("create-protected-buffer") {
+			require_pxp(pxp_supported, devid);
 			test_bo_alloc_pxp_on(i915);
+		}
 
 		igt_describe("Verify protected context on supported hw:");
-		igt_subtest("create-regular-context-1")
+		igt_subtest("create-regular-context-1") {
+			require_pxp(pxp_supported, devid);
 			test_ctx_alloc_recover_off_protect_off(i915);
-		igt_subtest("create-regular-context-2")
+		}
+		igt_subtest("create-regular-context-2") {
+			require_pxp(pxp_supported, devid);
 			test_ctx_alloc_recover_on_protect_off(i915);
-		igt_subtest("fail-invalid-protected-context")
+		}
+		igt_subtest("fail-invalid-protected-context") {
+			require_pxp(pxp_supported, devid);
 			test_ctx_alloc_recover_on_protect_on(i915);
-		igt_subtest("create-valid-protected-context")
+		}
+		igt_subtest("create-valid-protected-context") {
+			require_pxp(pxp_supported, devid);
 			test_ctx_alloc_recover_off_protect_on(i915);
+		}
 
 		igt_describe("Verify protected context integrity:");
-		igt_subtest("reject-modify-context-protection-on")
+		igt_subtest("reject-modify-context-protection-on") {
+			require_pxp(pxp_supported, devid);
 			test_ctx_mod_regular_to_all_valid(i915);
-		igt_subtest("reject-modify-context-protection-off-1")
+		}
+		igt_subtest("reject-modify-context-protection-off-1") {
+			require_pxp(pxp_supported, devid);
 			test_ctx_mod_recover_off_to_on(i915);
-		igt_subtest("reject-modify-context-protection-off-2")
+		}
+		igt_subtest("reject-modify-context-protection-off-2") {
+			require_pxp(pxp_supported, devid);
 			test_ctx_mod_protected_on_to_off(i915);
-		igt_subtest("reject-modify-context-protection-off-3")
+		}
+		igt_subtest("reject-modify-context-protection-off-3") {
+			require_pxp(pxp_supported, devid);
 			test_ctx_mod_protected_to_all_invalid(i915);
+		}
 	}
 	igt_subtest_group {
-		igt_fixture {
-			igt_require(pxp_supported);
-			devid = intel_get_drm_devid(i915);
-			igt_assert(devid);
-			rendercopy = igt_get_render_copyfunc(devid);
-			igt_require(rendercopy);
-		}
-
 		igt_describe("Verify protected render operations:");
-		igt_subtest("regular-baseline-src-copy-readible")
+		igt_subtest("regular-baseline-src-copy-readible") {
+			require_pxp_render(pxp_supported, devid, rendercopy);
 			test_render_baseline(i915);
-		igt_subtest("protected-raw-src-copy-not-readible")
+		}
+		igt_subtest("protected-raw-src-copy-not-readible") {
+			require_pxp_render(pxp_supported, devid, rendercopy);
 			test_render_pxp_src_to_protdest(i915);
-		igt_subtest("protected-encrypted-src-copy-not-readible")
+		}
+		igt_subtest("protected-encrypted-src-copy-not-readible") {
+			require_pxp_render(pxp_supported, devid, rendercopy);
 			test_render_pxp_protsrc_to_protdest(i915);
-		igt_subtest("dmabuf-shared-protected-dst-is-context-refcounted")
+		}
+		igt_subtest("dmabuf-shared-protected-dst-is-context-refcounted") {
+			require_pxp_render(pxp_supported, devid, rendercopy);
 			test_pxp_dmabuffshare_refcnt(i915);
+		}
 	}
 	igt_subtest_group {
-		igt_fixture {
-			igt_require(pxp_supported);
-			devid = intel_get_drm_devid(i915);
-			igt_assert(devid);
-			rendercopy = igt_get_render_copyfunc(devid);
-			igt_require(rendercopy);
-			init_powermgt_resources(i915, &pm);
-		}
 		igt_describe("Verify suspend-resume teardown management:");
-		igt_subtest("verify-pxp-key-change-after-suspend-resume")
+		igt_subtest("verify-pxp-key-change-after-suspend-resume") {
+			require_pxp_render(pxp_supported, devid, rendercopy);
+			require_init_powermgt(i915, &pm);
 			test_pxp_pwrcycle_teardown_keychange(i915, &pm);
-		igt_subtest("verify-pxp-stale-ctx-execution")
+		}
+		igt_subtest("verify-pxp-stale-ctx-execution") {
+			require_pxp_render(pxp_supported, devid, rendercopy);
+			require_init_powermgt(i915, &pm);
 			test_pxp_stale_ctx_execution(i915);
-		igt_subtest("verify-pxp-stale-buf-execution")
+		}
+		igt_subtest("verify-pxp-stale-buf-execution") {
+			require_pxp_render(pxp_supported, devid, rendercopy);
+			require_init_powermgt(i915, &pm);
 			test_pxp_stale_buf_execution(i915);
-		igt_subtest("verify-pxp-stale-buf-optout-execution")
+		}
+		igt_subtest("verify-pxp-stale-buf-optout-execution") {
+			require_pxp_render(pxp_supported, devid, rendercopy);
+			require_init_powermgt(i915, &pm);
 			test_pxp_stale_buf_optout_execution(i915);
-		igt_subtest("verify-pxp-execution-after-suspend-resume")
+		}
+		igt_subtest("verify-pxp-execution-after-suspend-resume") {
+			require_pxp_render(pxp_supported, devid, rendercopy);
+			require_init_powermgt(i915, &pm);
 			test_pxp_pwrcycle_staleasset_execution(i915, &pm);
+		}
 	}
 	igt_subtest_group {
-		igt_fixture {
-			igt_require(pxp_supported);
-			devid = intel_get_drm_devid(i915);
-			igt_assert(devid);
-			rendercopy = igt_get_render_copyfunc(devid);
-			igt_require(rendercopy);
-
+		igt_describe("Test the display CRC");
+		igt_subtest("display-protected-crc") {
+			require_pxp_render(pxp_supported, devid, rendercopy);
 			igt_require_pipe_crc(i915);
 			igt_display_require(&display, i915);
-		}
-		igt_describe("Test the display CRC");
-		igt_subtest("display-protected-crc")
 			test_display_protected_crc(i915, &display);
+		}
 	}
 
 	igt_fixture {
+		if (pm.debugfsdir != -1)
+			close(pm.debugfsdir);
+
 		drm_close_driver(i915);
 	}
 }
-- 
2.47.1

