Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E99EE49B5
	for <igt-dev@archiver.kernel.org>; Wed, 11 Sep 2024 14:14:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F17E510E9A5;
	Wed, 11 Sep 2024 14:14:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DeM+Oiy8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C9AA10E9A5
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Sep 2024 14:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726064050; x=1757600050;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ypU0m8/13CjjIKrmux20i54HdMyVk8fFk0kFG2Ssvfw=;
 b=DeM+Oiy8cOwP03SbX1MCVb23ryWEkUCzMXicBfdJCDR0sRf1bXkz5k9D
 8R2lQ12Kxah2I218Evu5CPEx6dE/Z3ChHoWN+8KsJrUMs6uf968rtvLA1
 Io9gdI5dxX7uA7deYl0tVNwrngyLjLOixa3/yeBcqYGAYEcWavvO2iTdk
 Xt2tMbNYMhGd96wdK3woYG1s8h4aRHwimFnE4KT81OT7D4Gljl7WOlT3v
 Q2LxWb9HTNZfTqduXefX2cmp+JETR+xmBygjGE/w2Wa0cI1Jo8n1sZirK
 FXX3Y2CGyZ/fYfjYaYP63o1i291TX95L5Xg+pmFCWbiEClb7ynBEOYIAW g==;
X-CSE-ConnectionGUID: QrZHg0IHSgqVAu0YsJdHeA==
X-CSE-MsgGUID: NM8PKvdOTSiPqgl+uVbQ7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="25009984"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="25009984"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 07:14:10 -0700
X-CSE-ConnectionGUID: 7gYpcOgGQqS3iyFIG+fsAQ==
X-CSE-MsgGUID: TpEiCXfqTVW0h9eioHzXWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; d="scan'208";a="98220301"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.84.149])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 07:14:07 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>
Subject: [PATCH v2 i-g-t] lib/igt_core: Refactor libpciaccess init/cleanup
 wrappers
Date: Wed, 11 Sep 2024 16:13:49 +0200
Message-Id: <20240911141349.455943-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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

Enable reinitialization of the libpciaccess global state, necessary
to correctly handle dynamic add/remove of PCI devices, such as the
creation/removal of Virtual Functions (VFs). Update
igt_pci_system_cleanup() to conditionally call pci_system_cleanup()
based on the initialization state. Introduce igt_pci_system_reinit()
for explicit reinitialization of the libpciaccess global state,
particularly useful after PCI device changes, to be used in
subsequent patches.

v2:
- Change pci_system_initialized type from int to bool for consistency
  with install_handler (Peter)
- Simplify conditional logic in igt_pci_system_init by removing
  redundant assignments

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Reviewed-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Chris Wilson <chris.p.wilson@intel.com>
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
 lib/igt_core.c | 40 ++++++++++++++++++++++++++++++++++------
 lib/igt_core.h | 36 ++++++++++++++++++++++++------------
 2 files changed, 58 insertions(+), 18 deletions(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 88b5af732..407f7b551 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -3483,23 +3483,51 @@ void igt_srandom(void)
 }
 
 /* IGT wrappers around libpciaccess init/cleanup functions */
+static bool pci_system_initialized;
+static pthread_mutex_t pci_system_mutex = PTHREAD_MUTEX_INITIALIZER;
+
+void igt_pci_system_cleanup(void)
+{
+	pthread_mutex_lock(&pci_system_mutex);
+	if (pci_system_initialized) {
+		pci_system_cleanup();
+		pci_system_initialized = false;
+	}
+	pthread_mutex_unlock(&pci_system_mutex);
+}
 
 static void pci_system_exit_handler(int sig)
 {
-	pci_system_cleanup();
+	igt_pci_system_cleanup();
 }
 
-static void __pci_system_init(void)
+int igt_pci_system_init(void)
 {
-	if (!igt_warn_on_f(pci_system_init(), "Could not initialize libpciaccess global data\n"))
+	int ret = 0;
+	bool install_handler = false;
+
+	pthread_mutex_lock(&pci_system_mutex);
+	if (!pci_system_initialized) {
+		ret = igt_warn_on_f(pci_system_init(),
+				    "Could not initialize libpciaccess global data\n");
+		if (!ret) {
+			pci_system_initialized = true;
+			install_handler = true;
+		}
+	}
+	pthread_mutex_unlock(&pci_system_mutex);
+
+	if (install_handler)
 		igt_install_exit_handler(pci_system_exit_handler);
+
+	return ret;
 }
 
-int igt_pci_system_init(void)
+int igt_pci_system_reinit(void)
 {
-	static pthread_once_t once_control = PTHREAD_ONCE_INIT;
+	igt_pci_system_cleanup();
 
-	return pthread_once(&once_control, __pci_system_init);
+	return igt_pci_system_init();
 }
 
 /**
diff --git a/lib/igt_core.h b/lib/igt_core.h
index 58864c2bc..90f57402f 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -1530,29 +1530,41 @@ void igt_kmsg(const char *format, ...);
  * igt_pci_system_init:
  * IGT wrapper around pci_system_init()
  *
- * Runs pci_system_init() and installs pci_system_cleanup() as IGT exit handler when
- * called first per thread, subsequent calls are noop.  Tests should use this wrapper
+ * Runs pci_system_init() and installs igt_pci_system_cleanup() as IGT exit handler when
+ * called first per thread, subsequent calls are noop. Tests should use this wrapper
  * instead of pci_system_init() to avoid memory leaking which happens each time a call
  * to pci_system_init() is repeated not preceded by pci_system_cleanup() (may easily
  * happen in consequence of long jumps performed by IGT flow control functions).
  *
- * Return value: equal return value of pthread_once() (return value of pci_system_init()
- *		 can't be passed through pthread_once())
+ * Return:
+ * Return value of pci_system_init() or 0 if pci system is already initialized.
  */
 int igt_pci_system_init(void);
 
+/**
+ * igt_pci_system_reinit:
+ * Reinitialize libpciaccess global data.
+ *
+ * Executes igt_pci_system_cleanup() and igt_pci_system_init() to refresh
+ * the PCI system state, typically needed after PCI devices are added or
+ * removed.
+ *
+ * Note: All previously obtained handles (pci_dev, mmio) become invalid
+ * after this call. Do not use old handles post-reinitialization.
+ *
+ * Return: Outcome of igt_pci_system_init().
+ */
+int igt_pci_system_reinit(void);
+
 /**
  * igt_pci_system_cleanup():
- * IGT replacement for pci_system_cleanup()
+ * IGT wrapper around pci_system_cleanup()
  *
- * For use in IGT library and tests to avoid destroying libpciaccess global data.
- * Direct calls to pci_system_cleanup() should be either dropped or replaced with this
- * wrapper (for code clarity), otherwise subsequent access to libpciaccess global data
- * may be lost unless preceded by direct call to pci_system_init() (not recommended).
+ * Runs pci_system_cleanup() if igt_pci_system_init() was successfully called
+ * before. This allows to refresh the libpciaccess global data when followed
+ * by igt_pci_system_init(), see igt_pci_system_reinit().
  */
-static inline void igt_pci_system_cleanup(void)
-{
-}
+void igt_pci_system_cleanup(void);
 
 void igt_emit_ignore_dmesg_regex(const char *ignore_dmesg_regex);
 
-- 
2.31.1

