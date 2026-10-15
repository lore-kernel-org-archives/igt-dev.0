Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0341CC6B33
	for <igt-dev@archiver.kernel.org>; Thu, 15 Oct 2026 14:24:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 886F310E9F2;
	Thu, 15 Oct 2026 14:24:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7C5110E9F2
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Oct 2026 14:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792074232; x=1823610232;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0gvkIq96L+z80ec7ztbQN6lwLWctr8YwwbEi1B6x7Pg=;
 b=TX5LBMKH93HuL2Hti32HhroraHdWZDSlz6w0SDWdDfhR1SGD7Pge2IQN
 T4mKAnOKB4d8IY+47xARTTbi3SNU87uC2UrL7Qp7n2g2wCduhVAQd0Qjc
 EaAJi35SRudjcthGoQqx8pyPf/cwFRhuhe0qV4ZNhth/39UEqfz3GyhOp
 l9meDWsFtK0pjFxSbebs120beGbvnkfTl6vdg/FVGKZZuufwyb+b6QFYb
 UoIJ6uV+jbsK+bK5bMhfo3P1zHeiYm4j7dc/oe9pevjVImZLlFNkTUPxy
 g9pfFhoht5Kbgcpm0DLesRe417aTf8oE89QWPDcQlkpoIsZQLrBS/u5cB A==;
X-CSE-ConnectionGUID: dWAzRyQWQoiHp5jsLwW5lw==
X-CSE-MsgGUID: Ct5klH2cTZCJRTJHw0TnjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="831666"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="831666"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 07:23:52 -0700
X-CSE-ConnectionGUID: vWgZmICQTtmateYfySgpMQ==
X-CSE-MsgGUID: xuS7Fw5yTt+SORjS8mV70Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="1618010"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by orviesa008.jf.intel.com with ESMTP; 15 Oct 2026 07:23:51 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 Jeevan B <jeevan.b@intel.com>, Swati Sharma <swati2.sharma@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 1/3] tests/intel/xe_fault_injection: Reload audio driver
 on exit
Date: Thu, 15 Oct 2026 19:30:33 +0530
Message-ID: <20261015140035.2686997-1-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Cc: Michał Grzelak <michal.grzelak@intel.com>
Cc: Jeevan B <jeevan.b@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 tests/intel/xe_fault_injection.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index e32f841a3..3713abe23 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -31,6 +31,7 @@
 #define MAX_INJECTIONS_PER_ITER	100
 
 int32_t inject_iters_raw;
+static char *snd_driver;
 struct fault_injection_params {
 	/* @probability: Likelihood of failure injection, in percent. */
 	uint32_t probability;
@@ -196,6 +197,12 @@ static void setup_injection_fault(const struct fault_injection_params *fault_par
 static void cleanup_injection_fault(int sig)
 {
 	injection_list_clear();
+
+	if (snd_driver) {
+		igt_kmod_load(snd_driver, NULL);
+		free(snd_driver);
+		snd_driver = NULL;
+	}
 }
 
 static int get_remaining_injection_count(void)
@@ -312,7 +319,7 @@ static void probe_fail_guc(const char pci_slot[], const char function_name[],
 		fault_params->times = MAX_INJECTIONS_PER_ITER;
 		setup_injection_fault(fault_params);
 		inject_fault_probe(pci_slot, function_name);
-		igt_audio_driver_unload(NULL);
+		igt_audio_driver_unload(&snd_driver);
 		igt_kmod_unbind("xe", pci_slot);
 
 		/*
@@ -668,7 +675,7 @@ int igt_main_args("I:", NULL, help_str, opt_handler, NULL)
 	igt_fixture() {
 		close(sysfs);
 		drm_close_driver(fd);
-		igt_audio_driver_unload(NULL);
+		igt_audio_driver_unload(&snd_driver);
 		igt_kmod_unbind("xe", pci_slot);
 	}
 
@@ -680,7 +687,7 @@ int igt_main_args("I:", NULL, help_str, opt_handler, NULL)
 			err = inject_fault_probe(pci_slot, s->name);
 
 			igt_assert_eq(should_pass ? 0 : INJECT_ERRNO, err);
-			igt_audio_driver_unload(NULL);
+			igt_audio_driver_unload(&snd_driver);
 			igt_kmod_unbind("xe", pci_slot);
 		}
 
-- 
2.50.1

