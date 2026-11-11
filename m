Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8813606A31C
	for <igt-dev@archiver.kernel.org>; Wed, 11 Nov 2026 12:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lOjAb59R
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 505BA10FB31;
	Wed, 11 Nov 2026 12:10:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 861AA10EE94
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2026 12:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794398947; x=1825934947;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nQfEiege8cwxvIcSzjfVhrMZrixZSQi4t9U/6g9y4+g=;
 b=lOjAb59ReXQU5CH6Hz/PJ3re47GZDlQfUsyEtfnrQ5wqwvRA+JuuEmOj
 QgXNdepf7QFy1rF2z3e6EICOwXUlhiJ53tmMEfijkPkwbQCj/zIUm/PAZ
 oM+wZ7sCu05zHMEmT3ctshasKL4rDxu6o/iBzxZ/YwyK8kzhX2vfDK2mi
 3+h7AEXG7BABeA0TjfkIU+l34Y0BEeipcDiQCS1E16un9dyzqAdlaqX9t
 R3u/A2gW1Uq9ohqqqA+gvu0WiYZLKcqD4YRf8hL00s7fl2yNgsnkJ0OdH
 g2jBSVrmBHGQ1XtFm+wOV60gP632t/sG+Kw2m9s8SFY+pNPErHZWU/iiv A==;
X-CSE-ConnectionGUID: IuiDjCrRQGG25ngA4546Qw==
X-CSE-MsgGUID: XjBoHBQAQjmNUbZ3Nf4COQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3212750"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3212750"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 04:09:06 -0800
X-CSE-ConnectionGUID: ex+f6hlYSjaTYVPduVj/gQ==
X-CSE-MsgGUID: Ks7Vk4+PSBOpa3k7wDROHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="8323967"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by orviesa007.jf.intel.com with ESMTP; 11 Nov 2026 04:09:04 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 Jeevan B <jeevan.b@intel.com>, Swati Sharma <swati2.sharma@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Pranay Samala <pranay.samala@intel.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH i-g-t v3 1/3] tests/intel/xe_fault_injection: Reload audio
 driver on exit
Date: Wed, 11 Nov 2026 17:15:58 +0530
Message-ID: <20261111114600.4104768-1-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.50.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Commit 117e9ecbdd1d ("xe/igt_kmod_unbind: release audio before
unbinding xe") made igt_audio_driver_unload() be called before
unbinding xe to avoid the audio-component bind warnings/errors that
happen if xe is removed while snd_hda_intel is still attached. These
call sites passed NULL for the unloaded driver name, so it was never
tracked, and nothing in this file ever reloaded it afterwards.

As a result snd_hda_intel/snd_hdmi_lpe_audio is left unloaded for the
rest of the boot even when every subtest passes, since the test's own
teardown only ever rebinds xe, never the audio driver.

Capture the unloaded driver name and reload it from the exit handler,
which IGT guarantees runs on both normal completion and a fatal abort.

Add igt_audio_driver_load(), the reload counterpart of
igt_audio_driver_unload(), to lib/igt_kmod.c instead of open-coding the
reload at each call site.

v2:
- Add Fixes tag (Pranay)
- Move the audio reload ahead of injection_list_clear() in
  cleanup_injection_fault() to avoid failures leading to audio
  driver remaining unloaded (Pranay)
- Warn via igt_warn() if the reload fails (Pranay)
- Add and use igt_audio_driver_load() instead of open-coding the
  reload at each call site (Dnyaneshwar)

v3:
- Remove free()/NULL from igt_audio_driver_load() and free
  snd_driver explicitly at each call site instead (Dnyaneshwar)

Cc: Michał Grzelak <michal.grzelak@intel.com>
Cc: Jeevan B <jeevan.b@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Pranay Samala <pranay.samala@intel.com>
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Fixes: 117e9ecbdd1d ("xe/igt_kmod_unbind: release audio before unbinding xe")
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 lib/igt_kmod.c                   | 28 ++++++++++++++++++++++++++++
 lib/igt_kmod.h                   |  1 +
 tests/intel/xe_fault_injection.c | 11 ++++++++---
 3 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 1776bb415..76680fca5 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -557,6 +557,34 @@ int igt_audio_driver_unload(char **who)
 	return igt_always_unload_audio_driver(who);
 }
 
+/**
+ * igt_audio_driver_load:
+ * @who: Pointer to a string with the name of the audio driver to be
+ * (re)loaded, as previously filled in by igt_audio_driver_unload().
+ *
+ * Reloads the audio driver previously unloaded by igt_audio_driver_unload(),
+ * if any. This is a no-op if @who is NULL or points to NULL. The caller
+ * keeps ownership of @who; it is left untouched here, so the caller can
+ * free it (or call igt_audio_driver_unload() again) whenever it sees fit,
+ * typically on testcase cleanup.
+ *
+ * Returns: 0 in case of success or -errno in case the module could not
+ * be loaded.
+ */
+int igt_audio_driver_load(char **who)
+{
+	int ret;
+
+	if (!who || !*who)
+		return 0;
+
+	ret = igt_kmod_load(*who, NULL);
+	if (ret)
+		igt_warn("Could not load audio driver %s (%s)\n", *who, strerror(-ret));
+
+	return ret;
+}
+
 int __igt_intel_driver_unload(char **who, const char *driver)
 {
 	int ret;
diff --git a/lib/igt_kmod.h b/lib/igt_kmod.h
index c9700240c..f6c17ff73 100644
--- a/lib/igt_kmod.h
+++ b/lib/igt_kmod.h
@@ -50,6 +50,7 @@ __attribute__((nonnull)) int igt_kmod_rebind(const char *mod_name,
 					     const char *pci_device);
 
 int igt_audio_driver_unload(char **whom);
+int igt_audio_driver_load(char **whom);
 
 int igt_intel_driver_load(const char *opts, const char *driver);
 int igt_intel_driver_unload(const char *driver);
diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index e0a461820..f3c4ad3ac 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -31,6 +31,7 @@
 #define MAX_INJECTIONS_PER_ITER	100
 
 int32_t inject_iters_raw;
+static char *snd_driver;
 struct fault_injection_params {
 	/* @probability: Likelihood of failure injection, in percent. */
 	uint32_t probability;
@@ -195,6 +196,10 @@ static void setup_injection_fault(const struct fault_injection_params *fault_par
 
 static void cleanup_injection_fault(int sig)
 {
+	igt_audio_driver_load(&snd_driver);
+	free(snd_driver);
+	snd_driver = NULL;
+
 	injection_list_clear();
 }
 
@@ -311,7 +316,7 @@ static void probe_fail_guc(const char pci_slot[], const char function_name[],
 		fault_params->times = MAX_INJECTIONS_PER_ITER;
 		setup_injection_fault(fault_params);
 		inject_fault_probe(pci_slot, function_name);
-		igt_audio_driver_unload(NULL);
+		igt_audio_driver_unload(&snd_driver);
 		igt_kmod_unbind("xe", pci_slot);
 
 		/*
@@ -666,7 +671,7 @@ int igt_main_args("I:", NULL, help_str, opt_handler, NULL)
 	igt_fixture() {
 		close(sysfs);
 		drm_close_driver(fd);
-		igt_audio_driver_unload(NULL);
+		igt_audio_driver_unload(&snd_driver);
 		igt_kmod_unbind("xe", pci_slot);
 	}
 
@@ -678,7 +683,7 @@ int igt_main_args("I:", NULL, help_str, opt_handler, NULL)
 			err = inject_fault_probe(pci_slot, s->name);
 
 			igt_assert_eq(should_pass ? 0 : INJECT_ERRNO, err);
-			igt_audio_driver_unload(NULL);
+			igt_audio_driver_unload(&snd_driver);
 			igt_kmod_unbind("xe", pci_slot);
 		}
 
-- 
2.50.1

