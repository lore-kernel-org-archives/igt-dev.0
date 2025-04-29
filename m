Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC58C369DC
	for <igt-dev@archiver.kernel.org>; Tue, 29 Apr 2025 13:35:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC0C410E493;
	Tue, 29 Apr 2025 13:35:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c0AUxfSn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF8910E493
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Apr 2025 13:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745933721; x=1777469721;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nkSMivl0fEOxORv2KOeNu/GFw48aKHTqYYJ78p/4lmI=;
 b=c0AUxfSnvgUu9FHHMaRDLTTVdzKn+5I3KNObEWxtEDTbnq/HHyuz7TPM
 DCGX297YeBpImDRUDoR/qic4wVYgpaGsCxdvHGnI4moWr04bHZvcGGp2E
 LNRR+w0HMeYsOFG4duddWW2wzgUQWTFuf1QvFx40/ihv2Lht3mUAo2GYu
 HYnFakH6lMNVT2RW72efK/MJ2Rk3SUyqfV2+LbFSgFVdnpy9TMFTE2XTt
 cRBgk+soFI+hgad3VjsWt4BU+DMG1PXTipC3KZy0spyDFhNMxU3foWNpP
 TwySCFBR7TqP+zYJTNDhOIIj+5zuEjKw8J7u1ZQx2VIR3fVryYZ9B4ebe Q==;
X-CSE-ConnectionGUID: 1Y+AhOQuTF2yCSqT9rmBZQ==
X-CSE-MsgGUID: 34XJdFS+Q2+TnZcQfb4weg==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47566635"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; d="scan'208";a="47566635"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 06:35:21 -0700
X-CSE-ConnectionGUID: 0tPbr5PbQhC/kpyp8OqHEg==
X-CSE-MsgGUID: tzA4JbggRaWStdzxMBFC+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; d="scan'208";a="133777156"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa007.fm.intel.com with ESMTP; 29 Apr 2025 06:35:18 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Aditya Chauhan <aditya.chauhan@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_fault_injection: Suppress Guc CT dumps
 during fault injection
Date: Tue, 29 Apr 2025 19:21:32 +0530
Message-ID: <20250429135132.6493-1-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
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

When injecting fault to xe_guc_ct_send_recv() & xe_guc_mmio_send_recv()
functions, the CI test systems are going out of space and crashing. To
avoid this issue, a new helper function is created and when fault is injected
into this xe_should_fail_ct_dead_capture() helper function, ct dead capture is
avoided which suppresses ct dumps in the log.

Inject fault into xe_should_fail_ct_dead_capture() function along with
xe_guc_ct_send_recv() & xe_guc_mmio_send_recv() to suppress GUC ct dumps.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Suggested-by: John Harrison <John.C.Harrison@Intel.com>
Tested-by: Aditya Chauhan <aditya.chauhan@intel.com>
---
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Test-with: 20250429134649.4747-1-satyanarayana.k.v.p@intel.com
---
 tests/intel/xe_fault_injection.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 602e4cb39..82d730a7c 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -121,6 +121,22 @@ static void injection_list_add(const char function_name[])
 	close(dir);
 }
 
+static void injection_list_append(const char function_name[])
+{
+	int dir, fd, ret;
+
+	dir = fail_function_open();
+	igt_assert_lte(0, dir);
+
+	fd = openat(dir, "inject", O_WRONLY | O_APPEND);
+	ret = write(fd, function_name, strlen(function_name));
+
+	close(fd);
+	close(dir);
+
+	igt_assert_lte(0, ret);
+}
+
 static void injection_list_remove(const char function_name[])
 {
 	int dir;
@@ -234,6 +250,10 @@ inject_fault_probe(int fd, char pci_slot[], const char function_name[])
 
 	ignore_faults_in_dmesg(function_name);
 	injection_list_add(function_name);
+	if (!strcmp(function_name, "xe_guc_ct_send_recv") ||
+	    !strcmp(function_name, "xe_guc_mmio_send_recv"))
+		injection_list_append("xe_should_fail_ct_dead_capture");
+
 	set_retval(function_name, INJECT_ERRNO);
 
 	igt_kmod_bind("xe", pci_slot);
@@ -271,6 +291,8 @@ static void probe_fail_guc(int fd, char pci_slot[], const char function_name[],
 	for (int i = iter_start; i < iter_end; i++) {
 		fault_params->space = i;
 		setup_injection_fault(fault_params);
+		/* Clear the injection list  */
+		injection_list_clear();
 		inject_fault_probe(fd, pci_slot, function_name);
 		igt_kmod_unbind("xe", pci_slot);
 	}
-- 
2.43.0

