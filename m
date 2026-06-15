Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7347CD98DA
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jun 2026 10:35:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BDB310E34F;
	Mon, 15 Jun 2026 10:35:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WwhZqLpe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F378D10E350
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jun 2026 10:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781519573; x=1813055573;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WEVDXk7CfMxc774QMEYy/pbfkirKmMrtcixEssiWoaY=;
 b=WwhZqLpeeGamfJlQ4980hGekTxoKK7Fj5v7zk+5hhlyVpbA6r9C4iEQO
 766UaB7r83BCG1+SRnFnslosSmAX21vNa4ylGO+kgF0DTg5TAa3M9Vktz
 xdGcYewO8jqZdPn74FF+kX64dFYJH23joGv/daTOG7OcQwN2cFEoRB6qa
 CexDusSJKJ7Ym+sNhE9JeglXqPJIGchFdkz7NpIaGlueLdd7znY0rYjtM
 3y2WBc0rXQ1b73F8wtTgthveSQBhxfdSahpn3ZkktmVKUkK2m3YPaRXyu
 54Obzdycz27DiYEf1FnnC7EtRF18qBW64BSCAO/MSYqN90A/8thUrStVr A==;
X-CSE-ConnectionGUID: o+FgQvWDTrq+Y/L0aydm1w==
X-CSE-MsgGUID: D9XaokafQWCOcbwVevH3KQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="82319489"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="82319489"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 03:32:52 -0700
X-CSE-ConnectionGUID: F6Lc33VpRMK3j2kNOqUbRQ==
X-CSE-MsgGUID: IPJCzhzrQvuQnKyw6N+Rgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="252391531"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.80])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 03:32:51 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH v2 i-g-t 6/6] tests/intel/xe_sriov_flr: Arm SR-IOV exit cleanup
Date: Mon, 15 Jun 2026 12:32:20 +0200
Message-ID: <20260615103220.281656-7-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615103220.281656-1-marcin.bernatowicz@linux.intel.com>
References: <20260615103220.281656-1-marcin.bernatowicz@linux.intel.com>
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

Install SR-IOV exit handler in xe_sriov_flr.

Refactor xe_vfio_pci module restore helper into shared core with two
wrappers: strict teardown path (abort on failure) and best-effort exit
cleanup callback (warn on failure). Clear exit handler after explicit
teardown succeeds.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/intel/xe_sriov_flr.c | 42 ++++++++++++++++++++++++++++++--------
 1 file changed, 33 insertions(+), 9 deletions(-)

diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
index 861e647e4..bb702d354 100644
--- a/tests/intel/xe_sriov_flr.c
+++ b/tests/intel/xe_sriov_flr.c
@@ -334,28 +334,50 @@ static void vf_unbind_driver_override(int pf_fd, unsigned int vf_id)
 	free(slot);
 }
 
-static void restore_xe_vfio_module(void)
+static bool __restore_xe_vfio_module_state(void)
 {
 	bool loaded = igt_kmod_is_loaded(XE_VFIO_PCI_MODULE);
 	int ret;
 
 	if (loaded == g_xe_vfio_loaded_initially)
-		return;
+		return true;
 
 	ret = g_xe_vfio_loaded_initially ?
 		igt_kmod_load(XE_VFIO_PCI_MODULE, NULL) :
 		igt_kmod_unload(XE_VFIO_PCI_MODULE);
-	igt_abort_on_f(ret,
-		       "Failed to %s %s during cleanup\n",
-		       g_xe_vfio_loaded_initially ? "load" : "unload",
-		       XE_VFIO_PCI_MODULE);
+	if (ret)
+		return false;
 
 	loaded = igt_kmod_is_loaded(XE_VFIO_PCI_MODULE);
-	igt_abort_on_f(loaded != g_xe_vfio_loaded_initially,
-		       "%s should be %s after cleanup\n",
+
+	return loaded == g_xe_vfio_loaded_initially;
+}
+
+static void restore_xe_vfio_module_or_abort(void)
+{
+	igt_abort_on_f(!__restore_xe_vfio_module_state(),
+		       "Failed to restore %s to %s during cleanup\n",
 		       XE_VFIO_PCI_MODULE,
 		       g_xe_vfio_loaded_initially ? "loaded" : "unloaded");
 }
+
+static void restore_xe_vfio_module_best_effort(void)
+{
+	igt_warn_on_f(!__restore_xe_vfio_module_state(),
+		      "Failed to restore %s to %s during exit cleanup\n",
+		      XE_VFIO_PCI_MODULE,
+		      g_xe_vfio_loaded_initially ? "loaded" : "unloaded");
+}
+
+static void exit_cleanup(int pf_fd, int sig, void *data)
+{
+	(void)pf_fd;
+	(void)sig;
+	(void)data;
+
+	restore_xe_vfio_module_best_effort();
+}
+
 /**
  * flr_exec_strategy - Function pointer for FLR execution strategy
  * @pf_fd: File descriptor for the Physical Function (PF).
@@ -1230,6 +1252,7 @@ int igt_main_args("evw:", long_options, help_str, opt_handler, NULL)
 		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
 		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
 		g_xe_vfio_loaded_initially = igt_kmod_is_loaded(XE_VFIO_PCI_MODULE);
+		igt_sriov_install_exit_handler(pf_fd, exit_cleanup, NULL);
 	}
 
 	igt_describe("Initiate FLR without any additional state checks.");
@@ -1279,7 +1302,8 @@ int igt_main_args("evw:", long_options, help_str, opt_handler, NULL)
 			    igt_sriov_disable_driver_autoprobe(pf_fd);
 		igt_abort_on_f(autoprobe != igt_sriov_is_driver_autoprobe_enabled(pf_fd),
 			       "Failed to restore sriov_drivers_autoprobe value\n");
-		restore_xe_vfio_module();
+		restore_xe_vfio_module_or_abort();
+		igt_sriov_clear_exit_handler();
 		close(pf_fd);
 	}
 }
-- 
2.43.0

