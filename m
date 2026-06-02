Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6443CD6E57
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jun 2026 14:18:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BECC113A61;
	Tue,  2 Jun 2026 14:18:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dOBfOIOD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AB1D113A42
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jun 2026 14:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780409820; x=1811945820;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w4y/CyU7IJ4uZ6icJKYKr6tO0b2seVcnD5eXYE+tgNY=;
 b=dOBfOIODr+mpTe17/9rS/w+h0y03Tppgx5j8LBf0QmiGrsz21tDDPXhu
 2/edUK2gL78x6A2tp5LmFFkew/jxjsO7YJ5TmO7mA7GakpppJD3GO2C0F
 sBuLDqSMjBAYgOH2SuNXjIChzEY+uLbwyUBtxEE5PdjAaU9iisav0FmJx
 LJuv0wiiOLzu53AQcbiDBLOkOWp8vP2a8nmwwaOamMALdB/Yq16aRPWNt
 6PTkSiEMIxXiybboN3PIha+NvflifXu+xhoIeU5tZxUZcj8AZUA+iEDVx
 RKmPz8/7HoCHybzr8WSu74eGMP3H0Q1Mi+AVvI79gwKik1UDX3LH6+L4k g==;
X-CSE-ConnectionGUID: kLakU9E8SNKyFWOKm9j3fg==
X-CSE-MsgGUID: 0Cbho2ktQyOE4rO4suLAPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="103856158"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="103856158"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 07:17:00 -0700
X-CSE-ConnectionGUID: 60g+b1BaQIaV9fvvxMox0A==
X-CSE-MsgGUID: l93NLzy/QI6mDKdlfictxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="245725189"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.189])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 07:16:58 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 6/6] tests/intel/xe_sriov_flr: Arm SR-IOV exit cleanup
Date: Tue,  2 Jun 2026 16:16:09 +0200
Message-ID: <20260602141609.3941750-7-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602141609.3941750-1-marcin.bernatowicz@linux.intel.com>
References: <20260602141609.3941750-1-marcin.bernatowicz@linux.intel.com>
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
---
 tests/intel/xe_sriov_flr.c | 42 ++++++++++++++++++++++++++++++--------
 1 file changed, 33 insertions(+), 9 deletions(-)

diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
index 861e647e4..dcc8e633e 100644
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
+		igt_sriov_install_exit_handler(pf_fd, true, exit_cleanup, NULL);
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

