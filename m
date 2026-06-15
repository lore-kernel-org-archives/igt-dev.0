Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EDF7CD98DA
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jun 2026 10:33:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5B5B10E397;
	Mon, 15 Jun 2026 10:33:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="idNgPcVK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B0C10E361
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jun 2026 10:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781519551; x=1813055551;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mMtLtM6P7Ew7gN6FwNqlUJMtOzfUKXmkODO1IApFDFY=;
 b=idNgPcVK5ZnnOMdWqNVfid9aPMhpGf5iPPi+qJv/q8V0R/1XZTezN8Mo
 DNEJ1+Sh9w6tezxvt9IMMUO4IrshQOlojHppiD2+GllGTrzE8fE/Q0s2P
 /bvwj9gf/+bgwgdu2O4MgFxRI17vewDmE1Jfg1q7P3la5XeCJFrR2h+3l
 xwL/FnpnByfiyAttq2y79sj1YkD37B0uEfPldKL+EoF651MiPlCUIMNge
 bP3/8e7nggiouOLt463YkLPVc/lEe4JZYo5yQqsS0mtGROgRuDKl742tS
 Jq4BlgTnIR5eox7/FOvFVutce5qSqTKcqNT0hPheSF7AzSsYiXG73wRYh A==;
X-CSE-ConnectionGUID: 2d1YOo9FQveUZYPmzmQOxA==
X-CSE-MsgGUID: Fsy6C8fkThyMk6dn9049qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="93747676"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="93747676"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 03:32:30 -0700
X-CSE-ConnectionGUID: phGwBQxvTXCub3u8c/Wm9A==
X-CSE-MsgGUID: ZQqueZutTn+s1UG9IVBFnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="241082756"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.80])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 03:32:28 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH v2 i-g-t 1/6] lib/igt_device_sriov: Add generic SR-IOV exit
 cleanup helper
Date: Mon, 15 Jun 2026 12:32:15 +0200
Message-ID: <20260615103220.281656-2-marcin.bernatowicz@linux.intel.com>
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

Add SR-IOV exit-handler helpers.

The handler provides best-effort cleanup on exit: optional callback,
VF disable, and optional autoprobe restore.
Add a helper to clear handler state after normal teardown.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
---
v2: Always try to restore sriov_drivers_autoprobe. (Lukasz)
---
 lib/igt_sriov_device.c | 91 ++++++++++++++++++++++++++++++++++++++++++
 lib/igt_sriov_device.h |  5 +++
 2 files changed, 96 insertions(+)

diff --git a/lib/igt_sriov_device.c b/lib/igt_sriov_device.c
index 8f2cfa50f..da1557010 100644
--- a/lib/igt_sriov_device.c
+++ b/lib/igt_sriov_device.c
@@ -546,3 +546,94 @@ bool intel_is_vf_device(int fd)
 
 	return (value & 1) != 0;
 }
+
+struct sriov_exit_handler_ctx {
+	int pf;
+	bool restore_autoprobe;
+	bool autoprobe;
+	igt_sriov_exit_cleanup_fn cleanup_fn;
+	void *cleanup_data;
+};
+
+static struct sriov_exit_handler_ctx sriov_exit_ctx = {
+	.pf = -1,
+};
+
+static void sriov_exit_handler_release_fd(void)
+{
+	if (sriov_exit_ctx.pf < 0)
+		return;
+
+	__drm_close_driver(sriov_exit_ctx.pf);
+	sriov_exit_ctx.pf = -1;
+}
+
+static void sriov_exit_handler(int sig)
+{
+	if (sriov_exit_ctx.pf < 0)
+		return;
+
+	igt_sriov_disable_vfs(sriov_exit_ctx.pf);
+
+	if (sriov_exit_ctx.cleanup_fn)
+		sriov_exit_ctx.cleanup_fn(sriov_exit_ctx.pf, sig,
+					  sriov_exit_ctx.cleanup_data);
+
+	if (sriov_exit_ctx.autoprobe)
+		igt_sriov_enable_driver_autoprobe(sriov_exit_ctx.pf);
+	else
+		igt_sriov_disable_driver_autoprobe(sriov_exit_ctx.pf);
+}
+
+/**
+ * igt_sriov_install_exit_handler - Install best-effort SR-IOV cleanup handler
+ * @pf: PF device file descriptor
+ * @cleanup_fn: Optional callback invoked after VF disable
+ * @cleanup_data: Opaque callback data
+ *
+ * Registers a process-exit cleanup routine for SR-IOV tests. The handler runs
+ * from normal and signal-triggered exits (when possible), disables VFs,
+ * invokes @cleanup_fn if provided (passing signal number, or 0 on normal
+ * exit), and restores the original autoprobe setting captured at
+ * installation time. Tests that perform full explicit teardown should call
+ * igt_sriov_clear_exit_handler() once that teardown succeeds. An internal
+ * duplicate of @pf is kept so cleanup remains usable even if the caller closes
+ * the original DRM fd before process exit.
+ */
+void igt_sriov_install_exit_handler(int pf,
+				    igt_sriov_exit_cleanup_fn cleanup_fn,
+				    void *cleanup_data)
+{
+	int pf_dup;
+
+	if (!igt_sriov_is_pf(pf))
+		return;
+
+	pf_dup = dup(pf);
+	igt_assert_f(pf_dup >= 0, "Failed to duplicate PF fd (%s)\n",
+		     strerror(errno));
+
+	sriov_exit_handler_release_fd();
+
+	sriov_exit_ctx.pf = pf_dup;
+	sriov_exit_ctx.autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_dup);
+	sriov_exit_ctx.cleanup_fn = cleanup_fn;
+	sriov_exit_ctx.cleanup_data = cleanup_data;
+
+	igt_install_exit_handler(sriov_exit_handler);
+}
+
+/**
+ * igt_sriov_clear_exit_handler - Disable SR-IOV exit cleanup context
+ *
+ * Clears the active SR-IOV cleanup context, used when a test has completed
+ * explicit teardown and no longer needs best-effort cleanup on process exit.
+ */
+void igt_sriov_clear_exit_handler(void)
+{
+	sriov_exit_handler_release_fd();
+	sriov_exit_ctx.restore_autoprobe = false;
+	sriov_exit_ctx.autoprobe = false;
+	sriov_exit_ctx.cleanup_fn = NULL;
+	sriov_exit_ctx.cleanup_data = NULL;
+}
diff --git a/lib/igt_sriov_device.h b/lib/igt_sriov_device.h
index a417b30d8..4e4ba230a 100644
--- a/lib/igt_sriov_device.h
+++ b/lib/igt_sriov_device.h
@@ -36,6 +36,11 @@ bool igt_sriov_device_reset_exists(int pf, unsigned int vf_num);
 bool igt_sriov_device_reset(int pf, unsigned int vf_num);
 bool intel_is_vf_device(int device);
 const char *igt_sriov_func_str(unsigned int vf_num);
+typedef void (*igt_sriov_exit_cleanup_fn)(int pf, int sig, void *user_data);
+void igt_sriov_install_exit_handler(int pf,
+				    igt_sriov_exit_cleanup_fn cleanup_fn,
+				    void *cleanup_data);
+void igt_sriov_clear_exit_handler(void);
 
 /**
  * __is_valid_range - Helper to check VF range is valid
-- 
2.43.0

