Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD9FF99C7D
	for <igt-dev@archiver.kernel.org>; Sat, 18 Apr 2026 10:26:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 600FD10E32B;
	Sat, 18 Apr 2026 10:26:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UFOenWgo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A35210E33E
 for <igt-dev@lists.freedesktop.org>; Sat, 18 Apr 2026 10:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776507999; x=1808043999;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FSD1h3NKgY7k7Hm+Asiq4TDJV2lmf6sc2lYW4vBxNvA=;
 b=UFOenWgou0eBAXl+QzvAGFebdPlK2vbH+2A0EYwkEl/ZlLLrYMcFZLCx
 LKCwmE4X+0khRs4BR9uStZtCbnrSRQoe4zh0a0N94yZjOQZFNheWhHJCq
 eOGAquR35TqRU/C7Awv5e5GRQ49cVh/mJKy9zqTWt0WIX7koAda0sNqwq
 aYSCLC/6UfhPNiMV3cnyXj3/8/TXYnd9LfUR9bMdNFz1pshntTvcPbWQV
 sALHR1NNfVNeylHV5lZvH1SeB2ZGvSGHQDT3m6NrGV4nwaogJvXL28jCl
 vsEL+K5vTxBeRI50zjKXszRmSB7gasIJbVTDtxEy4J3SeJroeYDdLZhZA Q==;
X-CSE-ConnectionGUID: 4Hd55cmLTA6whGc8hvnnww==
X-CSE-MsgGUID: xMlQ5Z6AShCavtNxI3VtuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="65040641"
X-IronPort-AV: E=Sophos;i="6.23,186,1770624000"; d="scan'208";a="65040641"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2026 03:26:38 -0700
X-CSE-ConnectionGUID: rjqslPEtROeOC+37Mew80g==
X-CSE-MsgGUID: i6FnmrRgRD2PvhAKWRIneA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,186,1770624000"; d="scan'208";a="231526807"
Received: from ddelane1-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.3.48])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2026 03:26:36 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/xe_sriov_flr: Restore xe_vfio_pci
 module state
Date: Sat, 18 Apr 2026 12:26:21 +0200
Message-ID: <20260418102621.467394-3-marcin.bernatowicz@linux.intel.com>
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

Record the initial xe_vfio_pci module state in the test fixture and
restore it during cleanup.
This ensures xe_sriov_flr leaves xe_vfio_pci loaded or unloaded exactly
as it was before test execution.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/intel/xe_sriov_flr.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
index 370cb8e1b..d4a7a7498 100644
--- a/tests/intel/xe_sriov_flr.c
+++ b/tests/intel/xe_sriov_flr.c
@@ -81,6 +81,7 @@ enum vf_driver_mode {
 static int g_wait_flr_ms = 200;
 static enum vf_driver_mode g_vf_driver = VF_DRIVER_XE_VFIO_PCI;
 static bool g_extended_scope;
+static bool g_xe_vfio_loaded_initially;
 
 static struct g_mmio {
 	struct xe_mmio *mmio;
@@ -460,6 +461,29 @@ static void cleanup_vf_driver(int pf_fd, int num_vfs,
 	free(binding->vf_bound);
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
+
 /**
  * flr_exec_strategy - Function pointer for FLR execution strategy
  * @pf_fd: File descriptor for the Physical Function (PF).
@@ -1339,6 +1363,7 @@ int igt_main_args("ed:w:", long_options, help_str, opt_handler, NULL)
 		igt_require(igt_sriov_is_pf(pf_fd));
 		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
 		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
+		g_xe_vfio_loaded_initially = igt_kmod_is_loaded(XE_VFIO_PCI_MODULE);
 	}
 
 	igt_describe("Initiate FLR without any additional state checks.");
@@ -1390,6 +1415,7 @@ int igt_main_args("ed:w:", long_options, help_str, opt_handler, NULL)
 			    igt_sriov_disable_driver_autoprobe(pf_fd);
 		igt_abort_on_f(autoprobe != igt_sriov_is_driver_autoprobe_enabled(pf_fd),
 			       "Failed to restore sriov_drivers_autoprobe value\n");
+		restore_xe_vfio_module();
 		close(pf_fd);
 	}
 }
-- 
2.43.0

