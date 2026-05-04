Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97AE8FF886F
	for <igt-dev@archiver.kernel.org>; Mon,  4 May 2026 12:16:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EDAD10E28D;
	Mon,  4 May 2026 12:16:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MfrhoQoY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 683B610E28D
 for <igt-dev@lists.freedesktop.org>; Mon,  4 May 2026 12:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777896979; x=1809432979;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=npltYHC3v5qvn2plC2MeZ+U/KKweqhrVbQehSekZScs=;
 b=MfrhoQoYclDishMUbkTNRVLncgnjzFGjOPnOzdBr3pM8i5Y3vuejlDx6
 eek20pHz8XZGaqF8oodDkbHpnirqmrFGNfto6E7cyl3EQ4uZh0ao4spka
 N4RMPwdeb5HOKNArqcSbMDTEOOZbAvo4kmqGIvReJfwZuuK4mICRxKseN
 RJsID9UdMJ54DUvDwDC/EeZG+/kS8ZHJLkOH/mo5pOGOLL2MbDa+Ld7jm
 jIpUq9FpWQ6DLe2580gJxwdKGf7qZNHon4Uae/KVINsyeFG9JVqIY6vd5
 Q4e2brDm04liZqACs7NfHYFxI3ZMq/BZhkj7apTdBqKarjFRaXo1UBeAW g==;
X-CSE-ConnectionGUID: plyiPkd0TBuutO8WO7e5Yg==
X-CSE-MsgGUID: fRbUz5d6Sz+fySCS9TahRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="66282600"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="66282600"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 05:16:19 -0700
X-CSE-ConnectionGUID: XvRYBcNRS/yiFLULXRWoaA==
X-CSE-MsgGUID: 7b3B/3rYSl6TJN1DuMtTqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="239469465"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.189])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 05:16:17 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_sriov_flr: Restore xe_vfio_pci module
 state
Date: Mon,  4 May 2026 14:16:09 +0200
Message-ID: <20260504121609.2819906-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

Record the initial xe_vfio_pci module state in the test fixture
and restore it during cleanup.
This ensures xe_sriov_flr leaves xe_vfio_pci loaded or unloaded exactly
as it was before test execution.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/7699
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/intel/xe_sriov_flr.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
index be949fe01..861e647e4 100644
--- a/tests/intel/xe_sriov_flr.c
+++ b/tests/intel/xe_sriov_flr.c
@@ -65,12 +65,14 @@ IGT_TEST_DESCRIPTION("Xe tests for SR-IOV VF FLR (Functional Level Reset)");
 static const char STOP_REASON_ABORT[] = "ABORT";
 static const char STOP_REASON_FAIL[]  = "FAIL";
 static const char STOP_REASON_SKIP[]  = "SKIP";
+static const char XE_VFIO_PCI_MODULE[] = "xe_vfio_pci";
 
 #define DRIVER_OVERRIDE_TIMEOUT_MS 200
 
 static int g_wait_flr_ms = 200;
 static bool g_use_xe_vfio_pci = true;
 static bool g_extended_scope;
+static bool g_xe_vfio_loaded_initially;
 
 static struct g_mmio {
 	struct xe_mmio *mmio;
@@ -332,6 +334,28 @@ static void vf_unbind_driver_override(int pf_fd, unsigned int vf_id)
 	free(slot);
 }
 
+static void restore_xe_vfio_module(void)
+{
+	bool loaded = igt_kmod_is_loaded(XE_VFIO_PCI_MODULE);
+	int ret;
+
+	if (loaded == g_xe_vfio_loaded_initially)
+		return;
+
+	ret = g_xe_vfio_loaded_initially ?
+		igt_kmod_load(XE_VFIO_PCI_MODULE, NULL) :
+		igt_kmod_unload(XE_VFIO_PCI_MODULE);
+	igt_abort_on_f(ret,
+		       "Failed to %s %s during cleanup\n",
+		       g_xe_vfio_loaded_initially ? "load" : "unload",
+		       XE_VFIO_PCI_MODULE);
+
+	loaded = igt_kmod_is_loaded(XE_VFIO_PCI_MODULE);
+	igt_abort_on_f(loaded != g_xe_vfio_loaded_initially,
+		       "%s should be %s after cleanup\n",
+		       XE_VFIO_PCI_MODULE,
+		       g_xe_vfio_loaded_initially ? "loaded" : "unloaded");
+}
 /**
  * flr_exec_strategy - Function pointer for FLR execution strategy
  * @pf_fd: File descriptor for the Physical Function (PF).
@@ -395,7 +419,7 @@ static void verify_flr(int pf_fd, int num_vfs, struct subcheck *checks,
 
 	xe_vfio_loaded = false;
 	if (g_use_xe_vfio_pci)
-		xe_vfio_loaded = igt_kmod_load("xe_vfio_pci", NULL) >= 0;
+		xe_vfio_loaded = igt_kmod_load(XE_VFIO_PCI_MODULE, NULL) >= 0;
 	if (xe_vfio_loaded) {
 		vf_bound = calloc(num_vfs + 1, sizeof(*vf_bound));
 		igt_assert(vf_bound);
@@ -1030,7 +1054,7 @@ static void reset_only_subcheck_init(struct subcheck_data *data)
 		return;
 	}
 
-	if (!igt_kmod_is_loaded("xe_vfio_pci"))
+	if (!igt_kmod_is_loaded(XE_VFIO_PCI_MODULE))
 		set_skip_reason(data, "xe_vfio_pci is not loaded\n");
 }
 
@@ -1205,6 +1229,7 @@ int igt_main_args("evw:", long_options, help_str, opt_handler, NULL)
 		igt_require(igt_sriov_is_pf(pf_fd));
 		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
 		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
+		g_xe_vfio_loaded_initially = igt_kmod_is_loaded(XE_VFIO_PCI_MODULE);
 	}
 
 	igt_describe("Initiate FLR without any additional state checks.");
@@ -1254,6 +1279,7 @@ int igt_main_args("evw:", long_options, help_str, opt_handler, NULL)
 			    igt_sriov_disable_driver_autoprobe(pf_fd);
 		igt_abort_on_f(autoprobe != igt_sriov_is_driver_autoprobe_enabled(pf_fd),
 			       "Failed to restore sriov_drivers_autoprobe value\n");
+		restore_xe_vfio_module();
 		close(pf_fd);
 	}
 }
-- 
2.43.0

