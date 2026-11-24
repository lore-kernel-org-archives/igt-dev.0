Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC68606A321
	for <igt-dev@archiver.kernel.org>; Tue, 24 Nov 2026 04:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BfH46HCW
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE8FA10E4D5;
	Tue, 24 Nov 2026 04:52:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 000F310E4EA
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Nov 2026 04:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795495635; x=1827031635;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vXyIQoP3xklBzZWoi1Kver4knq53rRQtObXUajUpyJ8=;
 b=BfH46HCWPN5NL0a6yuydLChWHVoLwTu7JZK1ZSx+5ta/5TaRG4PEeo1W
 /JVC72ZK1U1+L1mleS+iyVKNgVQdyMyAqfpvzV5m6C9U9MkcWJ+IFxCSs
 1jOryi9w9nL/n7bH6K+/sNuzpG8iJUUTPyENfUKv8YwMvcYBNJeBHchE1
 /Kmm7KJK+wvRk4mOr0NLGPk+hVzEqDq7w/s1HOVTIeCSZy+iDr3zmdd9O
 LVqSeh/cylqgLbg1Ea4SPY6v5c09iRFDRRxuKt6AckOBu4s2HNd5U8eB8
 IDttria1sTv4tN5U1/567tQre7O91AdWEohSfF0MStopYfOm9Qo+CNMvu w==;
X-CSE-ConnectionGUID: OjwJWs6xQY68Z7Ne/k4NaA==
X-CSE-MsgGUID: FBA2mcgrRuCMlFeqyO15eQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4193619"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4193619"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 20:47:14 -0800
X-CSE-ConnectionGUID: V3YOxmesRFuF8BnWNiD+kQ==
X-CSE-MsgGUID: kyXNu8E0Q6Gx3HVh+RuXZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; d="scan'208";a="11444972"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 jeevan-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.190.238.87])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 20:47:13 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, jani.nikula@intel.com, Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 2/4] lib/igt_kmod: Handle the dedicated intel_display
 module
Date: Tue, 24 Nov 2026 10:15:57 +0530
Message-ID: <20261124044559.897167-3-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124044559.897167-1-jeevan.b@intel.com>
References: <20261124044559.897167-1-jeevan.b@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With display built as intel-display.ko, loading i915/xe pulls it in as a
dependency but unloading the GPU driver leaves it loaded, which leaks
state into following tests.

Unload intel_display after the GPU driver once nothing else holds it,
both in __igt_intel_driver_unload() and igt_xe_driver_unload(); the GPU
driver always goes first, as it calls into display.

Add helpers for tests that need to control the module explicitly:
igt_intel_display_load()/igt_intel_display_unload() to load it alone and
to unload it together with its holders, igt_intel_display_try_unload()
to attempt a direct removal, igt_intel_driver_unload_keep_display() to
remove only the GPU driver, and igt_intel_display_has_holders().

The module file is intel-display.ko but the kernel registers it as
intel_display; document that and the unload ordering.

The dedicated module needs a kernel that builds display as
intel-display.ko; on older kernels the new helpers fail or are no-ops.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 lib/igt_kmod.c | 209 +++++++++++++++++++++++++++++++++++++++++++++++--
 lib/igt_kmod.h |   7 ++
 2 files changed, 210 insertions(+), 6 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 76680fca5..276ea0c89 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -585,19 +585,129 @@ int igt_audio_driver_load(char **who)
 	return ret;
 }
 
-int __igt_intel_driver_unload(char **who, const char *driver)
+/*
+ * The module file is intel-display.ko, but the kernel registers module names
+ * with underscores (/sys/module, /proc/modules), which is what
+ * igt_kmod_is_loaded() matches against. modprobe/libkmod accept either form.
+ *
+ * Dependency order is always intel_display -> i915/xe: the core drivers call
+ * into display, so display can only be removed once every GPU driver holding
+ * it is gone. modprobe loads intel_display automatically as a dependency, but
+ * unloading a module does not remove its dependencies, hence the explicit
+ * unload below.
+ */
+#define INTEL_DISPLAY_MODULE "intel_display"
+
+/**
+ * igt_intel_display_has_holders:
+ *
+ * Returns: true if any module (i915, xe, ...) still depends on intel_display,
+ * as listed in /sys/module/intel_display/holders.
+ */
+bool igt_intel_display_has_holders(void)
+{
+	DIR *d = opendir("/sys/module/" INTEL_DISPLAY_MODULE "/holders");
+	struct dirent *de;
+	bool held = false;
+
+	if (!d)
+		return false;
+
+	while ((de = readdir(d))) {
+		if (de->d_name[0] != '.') {
+			held = true;
+			break;
+		}
+	}
+	closedir(d);
+
+	return held;
+}
+
+/**
+ * igt_intel_display_load:
+ * @opts: options to pass to the intel_display module, or NULL
+ *
+ * Loads the dedicated intel_display module. This is a no-op returning 0 if
+ * the module is already loaded. Returns a negative errno if the module
+ * does not exist, e.g. on kernels with display built into the GPU driver.
+ */
+int igt_intel_display_load(const char *opts)
+{
+	if (igt_kmod_is_loaded(INTEL_DISPLAY_MODULE))
+		return 0;
+
+	return igt_kmod_load(INTEL_DISPLAY_MODULE, opts);
+}
+
+/**
+ * igt_intel_display_unload:
+ *
+ * Unloads the dedicated intel_display module. Any GPU driver (i915 and/or xe)
+ * holding it is unloaded first. Returns 0 if the module is not loaded.
+ */
+int igt_intel_display_unload(void)
+{
+	if (!igt_kmod_is_loaded(INTEL_DISPLAY_MODULE))
+		return 0;
+
+	return igt_kmod_unload(INTEL_DISPLAY_MODULE);
+}
+
+/**
+ * igt_intel_display_try_unload:
+ *
+ * Attempts to remove the intel_display module directly, without first
+ * unloading the modules that hold it. This is expected to fail while i915 or
+ * xe is loaded, as the core drivers call into display: with -EWOULDBLOCK when
+ * other modules depend on it (libkmod removes modules non-blocking), or
+ * -EBUSY when the module is otherwise in use.
+ *
+ * Returns: 0 on success or a negative errno.
+ */
+int igt_intel_display_try_unload(void)
+{
+	struct kmod_module *kmod;
+	int err;
+
+	err = kmod_module_new_from_name(kmod_ctx(), INTEL_DISPLAY_MODULE, &kmod);
+	if (err < 0)
+		return err;
+
+	err = kmod_module_remove_module(kmod, 0);
+	kmod_module_unref(kmod);
+
+	return err;
+}
+
+/*
+ * Unload intel_display once the GPU driver using it is gone. Leave it alone
+ * while another GPU driver still holds it.
+ */
+static int intel_display_unload_if_unused(char **who)
 {
 	int ret;
 
+	if (!igt_kmod_is_loaded(INTEL_DISPLAY_MODULE) ||
+	    igt_intel_display_has_holders())
+		return 0;
+
+	ret = igt_kmod_unload(INTEL_DISPLAY_MODULE);
+	if (ret && who)
+		*who = strdup_realloc(*who, INTEL_DISPLAY_MODULE);
+
+	return ret;
+}
+
+/* Unload modules that only have a soft dependency on the GPU driver */
+static int unload_aux_modules(char **who)
+{
 	const char *aux[] = {
 		/* gen5: ips uses symbol_get() so only a soft module dependency */
 		"intel_ips",
 		NULL,
 	};
-
-	ret = igt_audio_driver_unload(who);
-	if (ret)
-		return ret;
+	int ret;
 
 	for (const char **m = aux; *m; m++) {
 		if (!igt_kmod_is_loaded(*m))
@@ -612,6 +722,90 @@ int __igt_intel_driver_unload(char **who, const char *driver)
 		}
 	}
 
+	return 0;
+}
+
+/**
+ * igt_intel_driver_unload_keep_display:
+ * @driver: GPU driver module to unload, e.g. "i915" or "xe"
+ *
+ * Unloads only the GPU driver, leaving intel_display loaded. Like
+ * igt_intel_driver_unload() it first unloads the audio driver and the
+ * auxiliary modules (e.g. intel_ips) and unbinds @driver from its devices.
+ * Tests use this to check the removal order i915/xe first, intel_display
+ * second, step by step. Regular tests should use igt_intel_driver_unload(),
+ * which also removes an unused intel_display.
+ *
+ * Returns: 0 on success or a negative errno.
+ */
+int igt_intel_driver_unload_keep_display(const char *driver)
+{
+	int ret;
+
+	ret = igt_audio_driver_unload(NULL);
+	if (ret)
+		return ret;
+
+	ret = unload_aux_modules(NULL);
+	if (ret)
+		return ret;
+
+	if (!igt_kmod_is_loaded(driver))
+		return 0;
+
+	igt_kmod_unbind(driver, NULL);
+	ret = igt_kmod_unload(driver);
+
+	return igt_kmod_is_loaded(driver) ? (ret ?: -EBUSY) : 0;
+}
+
+/**
+ * igt_intel_display_prepare_alone:
+ *
+ * Test helper: starts from a state with intel_display loaded on its own, i.e.
+ * without i915 or xe. Any GPU driver still holding the module is unloaded
+ * first, so callers should unload their driver beforehand with the matching
+ * helper. Skips the test if intel_display cannot be unloaded, or if there is
+ * no dedicated intel_display module (kernels with display built into the GPU
+ * driver).
+ */
+void igt_intel_display_prepare_alone(void)
+{
+	int ret;
+
+	igt_require_f(!igt_intel_display_unload(),
+		      "Could not unload intel_display\n");
+
+	ret = igt_intel_display_load(NULL);
+	igt_skip_on_f(ret, "No dedicated intel_display module (%d)\n", ret);
+	igt_assert(igt_kmod_is_loaded(INTEL_DISPLAY_MODULE));
+}
+
+/**
+ * igt_assert_intel_driver_and_display_unloaded:
+ * @driver: GPU driver module, e.g. "i915" or "xe"
+ *
+ * Asserts that neither @driver nor intel_display is loaded.
+ */
+void igt_assert_intel_driver_and_display_unloaded(const char *driver)
+{
+	igt_assert_f(!igt_kmod_is_loaded(driver), "%s still loaded\n", driver);
+	igt_assert_f(!igt_kmod_is_loaded(INTEL_DISPLAY_MODULE),
+		     "%s still loaded\n", INTEL_DISPLAY_MODULE);
+}
+
+int __igt_intel_driver_unload(char **who, const char *driver)
+{
+	int ret;
+
+	ret = igt_audio_driver_unload(who);
+	if (ret)
+		return ret;
+
+	ret = unload_aux_modules(who);
+	if (ret)
+		return ret;
+
 	if (igt_kmod_is_loaded(driver)) {
 		igt_kmod_unbind(driver, NULL);
 
@@ -624,7 +818,7 @@ int __igt_intel_driver_unload(char **who, const char *driver)
 		}
 	}
 
-	return 0;
+	return intel_display_unload_if_unused(who);
 }
 
 static char *kmod_pci_driver_from_module_alloc(const char *mod_name)
@@ -763,6 +957,9 @@ int igt_xe_driver_unload(void)
 	if (igt_kmod_is_loaded("xe"))
 		return IGT_EXIT_FAILURE;
 
+	if (intel_display_unload_if_unused(NULL))
+		return IGT_EXIT_FAILURE;
+
 	return IGT_EXIT_SUCCESS;
 }
 
diff --git a/lib/igt_kmod.h b/lib/igt_kmod.h
index f6c17ff73..141582f15 100644
--- a/lib/igt_kmod.h
+++ b/lib/igt_kmod.h
@@ -55,6 +55,13 @@ int igt_audio_driver_load(char **whom);
 int igt_intel_driver_load(const char *opts, const char *driver);
 int igt_intel_driver_unload(const char *driver);
 int __igt_intel_driver_unload(char **who, const char *driver);
+int igt_intel_display_load(const char *opts);
+int igt_intel_display_unload(void);
+int igt_intel_display_try_unload(void);
+bool igt_intel_display_has_holders(void);
+int igt_intel_driver_unload_keep_display(const char *driver);
+void igt_intel_display_prepare_alone(void);
+void igt_assert_intel_driver_and_display_unloaded(const char *driver);
 
 static inline int igt_i915_driver_load(const char *opts)
 {
-- 
2.43.0

