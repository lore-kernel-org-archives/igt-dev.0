Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F935606A31A
	for <igt-dev@archiver.kernel.org>; Wed, 28 Oct 2026 06:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GJYsk+kF
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC67010F9D5;
	Wed, 28 Oct 2026 06:26:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C8EB10F9D5
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 06:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793168715; x=1824704715;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wnx1iSXjp6je4r+cbLzIhr9HnJP9LNBCg0OAHUgRHHM=;
 b=GJYsk+kFPhRg+e62oLz2lkgKx8OcxA/Gdfan7Nu+ZyaR/nK9+TpAWMMF
 MyDG+NLcfzWqD7YpTFvTo1cOnE+h6xhk0t6NksTbkPdzHFkm9lc46/ySD
 5DjW7VrwLiKjOFygwEBHrvvdRXtl5MTHBka/7ngyI4P+DQJ/Ut1APEF13
 lb9CeanWTUhBEFeIfUybwrEhOjf9zqtT4vmdVlfpDNV9pyYGEBti9DicE
 VSxaHBlh8HjJTDz/rIW3niZwGV3WpDGuaz/jaggOLnpcV6lLT+4HLLBnI
 UvtltTVgH37OqQkrduowEFD0Zg1zRLIDN7nl6cZcYW6jxkMbOkL+Nk2Zz w==;
X-CSE-ConnectionGUID: WUQsm3rgSf+NKnPuS4PJDg==
X-CSE-MsgGUID: TJP6rfxAQ723sT7hmmoUlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1911628"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1911628"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2026 23:25:14 -0700
X-CSE-ConnectionGUID: MLM82RW7RLC2vf9xkk5X0g==
X-CSE-MsgGUID: mScB5LjAT42El3GIozkycA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="5270329"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa010.fm.intel.com with ESMTP; 27 Oct 2026 23:25:12 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 Jeevan B <jeevan.b@intel.com>, Swati Sharma <swati2.sharma@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Pranay Samala <pranay.samala@intel.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH i-g-t v2 1/3] tests/intel/xe_fault_injection: Reload audio
 driver on exit
Date: Wed, 28 Oct 2026 11:32:00 +0530
Message-ID: <20261028060202.2968778-1-chaitanya.kumar.borah@intel.com>
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

Cc: Michał Grzelak <michal.grzelak@intel.com>
Cc: Jeevan B <jeevan.b@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Pranay Samala <pranay.samala@intel.com>
Cc: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Fixes: 117e9ecbdd1d ("xe/igt_kmod_unbind: release audio before unbinding xe")
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 lib/igt_kmod.c                   | 29 +++++++++++++++++++++++++++++
 lib/igt_kmod.h                   |  1 +
 tests/intel/xe_fault_injection.c |  8 +++++---
 3 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 1776bb415..f03f8ae75 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -557,6 +557,35 @@ int igt_audio_driver_unload(char **who)
 	return igt_always_unload_audio_driver(who);
 }
 
+/**
+ * igt_audio_driver_load:
+ * @who: Pointer to a string with the name of the audio driver to be
+ * (re)loaded, as previously filled in by igt_audio_driver_unload(). Set to
+ * NULL on return.
+ *
+ * Reloads the audio driver previously unloaded by igt_audio_driver_unload(),
+ * if any. This is a no-op if @who is NULL or points to NULL.
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
+	free(*who);
+	*who = NULL;
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
index e32f841a3..54b1b980e 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -31,6 +31,7 @@
 #define MAX_INJECTIONS_PER_ITER	100
 
 int32_t inject_iters_raw;
+static char *snd_driver;
 struct fault_injection_params {
 	/* @probability: Likelihood of failure injection, in percent. */
 	uint32_t probability;
@@ -195,6 +196,7 @@ static void setup_injection_fault(const struct fault_injection_params *fault_par
 
 static void cleanup_injection_fault(int sig)
 {
+	igt_audio_driver_load(&snd_driver);
 	injection_list_clear();
 }
 
@@ -312,7 +314,7 @@ static void probe_fail_guc(const char pci_slot[], const char function_name[],
 		fault_params->times = MAX_INJECTIONS_PER_ITER;
 		setup_injection_fault(fault_params);
 		inject_fault_probe(pci_slot, function_name);
-		igt_audio_driver_unload(NULL);
+		igt_audio_driver_unload(&snd_driver);
 		igt_kmod_unbind("xe", pci_slot);
 
 		/*
@@ -668,7 +670,7 @@ int igt_main_args("I:", NULL, help_str, opt_handler, NULL)
 	igt_fixture() {
 		close(sysfs);
 		drm_close_driver(fd);
-		igt_audio_driver_unload(NULL);
+		igt_audio_driver_unload(&snd_driver);
 		igt_kmod_unbind("xe", pci_slot);
 	}
 
@@ -680,7 +682,7 @@ int igt_main_args("I:", NULL, help_str, opt_handler, NULL)
 			err = inject_fault_probe(pci_slot, s->name);
 
 			igt_assert_eq(should_pass ? 0 : INJECT_ERRNO, err);
-			igt_audio_driver_unload(NULL);
+			igt_audio_driver_unload(&snd_driver);
 			igt_kmod_unbind("xe", pci_slot);
 		}
 
-- 
2.50.1

