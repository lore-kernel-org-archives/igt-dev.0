Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEEE8D277C3
	for <igt-dev@archiver.kernel.org>; Fri,  9 Jan 2026 22:43:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C0810E0D1;
	Fri,  9 Jan 2026 22:43:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cY1Nnm06";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A883910E0D1
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Jan 2026 22:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767998620; x=1799534620;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EzjWS0+20vmCKIm4lNRzGGryEPxcT7kitGBW6GvVK/o=;
 b=cY1Nnm06ayp1mxAu6AggebpFaKnW6DynuhM/Yj+RnyHu28NkTKwtip7L
 kigNIAJ7EBxkz0GaS6zq0oYpzljgk87Qtq+Wk5YwFgU/h77R2NJTFAI9A
 oFEXh56khwpUelscxNAxGt/tUqlX304Q/l8ImZoxP8mvww+SlFogEJFfu
 Vk1PQANYoqhwira5FwkYJgJDd5CThgYiZ+w6K7RSQ4Qr4IwO/rF6090Q0
 ukjgNvIcVPyQyYKKVncJBamfGVJ/03qUvLMC4qEshIWucjkrlmmIn1g1R
 oipGiE60L/froS94oq9aa8vZhcvH79/yPSE3rgYVFBkKsnKUrnkT6aHe4 w==;
X-CSE-ConnectionGUID: kM2WpiXgTHKwSPUjmC3AoA==
X-CSE-MsgGUID: pGPpnNukSW+/k1l6phSz5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="73227743"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; d="scan'208";a="73227743"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2026 14:43:40 -0800
X-CSE-ConnectionGUID: GBcMTRJNSxeSAFciAHO2Ig==
X-CSE-MsgGUID: INzbdfwIRKuwlfF5/kJNlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; d="scan'208";a="208104872"
Received: from osgc-linux-buildserver.sh.intel.com ([10.112.232.103])
 by orviesa004.jf.intel.com with ESMTP; 09 Jan 2026 14:43:38 -0800
From: Shuicheng Lin <shuicheng.lin@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Subject: [PATCH] tests/intel/xe_fault_injection: Close drm fd before unbind
Date: Fri,  9 Jan 2026 22:40:48 +0000
Message-ID: <20260109224047.2483497-2-shuicheng.lin@intel.com>
X-Mailer: git-send-email 2.50.1
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

Close the sysfs and DRM device fd before unbinding the xe driver. Otherwise the
open fd holds a reference, and the subsequent bind can come up with different
card/render minor numbers (e.g. renderD128 -> renderD129, card0 -> card1).

Also drop the unused DRM fd parameter from inject_fault_probe() and
probe_fail_guc() now that these paths don't require it.

Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
---
 tests/intel/xe_fault_injection.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index f3bfc4b40..76d1c6fa3 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -260,7 +260,7 @@ static void ignore_fail_dump_in_dmesg(const char function_name[], bool enable)
  * @xe_wopcm_init:			xe_wopcm_init
  */
 static int
-inject_fault_probe(int fd, const char pci_slot[], const char function_name[])
+inject_fault_probe(const char pci_slot[], const char function_name[])
 {
 	int err = 0;
 	igt_info("Injecting error \"%s\" (%d) in function \"%s\"\n",
@@ -289,7 +289,7 @@ inject_fault_probe(int fd, const char pci_slot[], const char function_name[])
  * @xe_guc_mmio_send_recv:     Inject an error when calling xe_guc_mmio_send_recv
  * @xe_guc_ct_send_recv:       Inject an error when calling xe_guc_ct_send_recv
  */
-static void probe_fail_guc(int fd, const char pci_slot[], const char function_name[],
+static void probe_fail_guc(const char pci_slot[], const char function_name[],
 			   struct fault_injection_params *fault_params)
 {
 	int iter_start = 0, iter_end = 0, iter = 0;
@@ -308,7 +308,7 @@ static void probe_fail_guc(int fd, const char pci_slot[], const char function_na
 		fault_params->space = i;
 		fault_params->times = MAX_INJECTIONS_PER_ITER;
 		setup_injection_fault(fault_params);
-		inject_fault_probe(fd, pci_slot, function_name);
+		inject_fault_probe(pci_slot, function_name);
 		igt_kmod_unbind("xe", pci_slot);
 
 		/*
@@ -662,6 +662,8 @@ int igt_main_args("I:", NULL, help_str, opt_handler, NULL)
 			oa_add_config_fail(fd, sysfs, devid, pci_slot, s->name);
 
 	igt_fixture() {
+		close(sysfs);
+		drm_close_driver(fd);
 		igt_kmod_unbind("xe", pci_slot);
 	}
 
@@ -670,7 +672,7 @@ int igt_main_args("I:", NULL, help_str, opt_handler, NULL)
 			bool should_pass = s->pf_only && is_vf_device;
 			int err;
 
-			err = inject_fault_probe(fd, pci_slot, s->name);
+			err = inject_fault_probe(pci_slot, s->name);
 
 			igt_assert_eq(should_pass ? 0 : INJECT_ERRNO, err);
 			igt_kmod_unbind("xe", pci_slot);
@@ -680,12 +682,10 @@ int igt_main_args("I:", NULL, help_str, opt_handler, NULL)
 		igt_subtest_f("probe-fail-guc-%s", s->name) {
 			memcpy(&fault_params, &default_fault_params,
 					sizeof(struct fault_injection_params));
-			probe_fail_guc(fd, pci_slot, s->name, &fault_params);
+			probe_fail_guc(pci_slot, s->name, &fault_params);
 		}
 
 	igt_fixture() {
-		close(sysfs);
-		drm_close_driver(fd);
 		injection_list_clear();
 		igt_kmod_bind("xe", pci_slot);
 	}
-- 
2.50.1

