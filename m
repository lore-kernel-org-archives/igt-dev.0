Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F185AC36014
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 10:59:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAFB210E9E5;
	Fri, 28 Mar 2025 10:59:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GfEMLFv6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 619B410E9E3
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 10:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743159592; x=1774695592;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s3OeRMf2mc2ngNPjE9aHLj5g6UDGhyCWG1y6LcpymXE=;
 b=GfEMLFv6Ow/QsT1QYw5WRyqxQz1bh/x9xN/thzSC9dgxy2LNpUaBgZW6
 siyHz78kJHoHZ7YDEmaeAWzgYKHXRplzGIAgRMP3oM2B3TZSdwTxvj27m
 NxJT+2Hp/SMTNAvgXNNSNkcK6+d2Dw3i5njtYEtrwthzqYMMyCA11FvyM
 x24AKOHdvDqhMwfuieZXV0mxKnzZ2FjumTCSi2rft3fGvbjGr5g3o+hDj
 VmPfBzOKmCA23leRnr6ySpbDrTMGetiqMxyBhGP9G9AX1RfTTDzOicKCY
 HCHXzk5JNAiuJP7JKaWajuev2wVMcN1jwfmMUXf8w5VqlzjgQD9D5sZ92 g==;
X-CSE-ConnectionGUID: hHIXtJMORAiZ7FJAPQwX2Q==
X-CSE-MsgGUID: PDRrW1uFTSq/BbkZxMKxnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="55886306"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="55886306"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 03:59:52 -0700
X-CSE-ConnectionGUID: XDDQdqNPTcmRj7NKIAd8nA==
X-CSE-MsgGUID: qGJeQmJGSs64qVJnwIrBZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; d="scan'208";a="130271409"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa003.jf.intel.com with ESMTP; 28 Mar 2025 03:59:51 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: lucas.demarchi@intel.com,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t v4 3/3] tests/intel/xe_fault_injection: Do not assert
 for probe_guc_fail_* functions.
Date: Fri, 28 Mar 2025 16:45:32 +0530
Message-Id: <20250328111532.16620-4-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20250328111532.16620-1-satyanarayana.k.v.p@intel.com>
References: <20250328111532.16620-1-satyanarayana.k.v.p@intel.com>
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

In the current implementation, test asserts if the captured error is not same as
injected error. It is possible that the error received is translated to other
error which can be returned to application and in some scenarios driver retries
in case of failure and so, no error might be captured.

Considering above cases, added flags to control the assertion after injecting
error. Test does not assert for probe_guc_fail_* functions as driver some times
retries in case of failure. The main idea of injecting errors for these guc
functions is to check the robustness of the driver.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
---
 tests/intel/xe_fault_injection.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index a49070b4d..a03dd3fbe 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -33,6 +33,11 @@ enum injection_list_action {
 	INJECTION_LIST_REMOVE,
 };
 
+enum assert_flags {
+	INJECT_ASSERT_ON_FAIL,
+	INJECT_NOASSERT_ON_FAIL,
+};
+
 struct fault_injection_params {
 	/* @probability: Likelihood of failure injection, in percent. */
 	uint32_t probability;
@@ -234,7 +239,7 @@ static void set_retval(const char function_name[], long long retval)
  * @xe_wopcm_init:		xe_wopcm_init
  */
 static void
-inject_fault_probe(int fd, char pci_slot[], const char function_name[])
+inject_fault_probe(int fd, int flags, char pci_slot[], const char function_name[])
 {
 	igt_info("Injecting error \"%s\" (%d) in function \"%s\"\n",
 		 strerror(-INJECT_ERRNO), INJECT_ERRNO, function_name);
@@ -243,7 +248,8 @@ inject_fault_probe(int fd, char pci_slot[], const char function_name[])
 	injection_list_do(INJECTION_LIST_ADD, function_name);
 	set_retval(function_name, INJECT_ERRNO);
 	xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_TRY_BIND);
-	igt_assert_eq(-errno, INJECT_ERRNO);
+	if (flags & INJECT_ASSERT_ON_FAIL)
+		igt_assert_eq(-errno, INJECT_ERRNO);
 	injection_list_do(INJECTION_LIST_REMOVE, function_name);
 }
 
@@ -270,7 +276,7 @@ static void probe_fail_guc(int fd, char pci_slot[], const char function_name[],
 	for (int i = iter_start; i < iter_end; i++) {
 		fault_params->space = i;
 		setup_injection_fault(fault_params);
-		inject_fault_probe(fd, pci_slot, function_name);
+		inject_fault_probe(fd, INJECT_NOASSERT_ON_FAIL, pci_slot, function_name);
 		igt_kmod_unbind("xe", pci_slot);
 	}
 }
@@ -557,7 +563,7 @@ igt_main
 
 	for (const struct section *s = probe_fail_functions; s->name; s++)
 		igt_subtest_f("inject-fault-probe-function-%s", s->name)
-			inject_fault_probe(fd, pci_slot, s->name);
+			inject_fault_probe(fd, INJECT_ASSERT_ON_FAIL, pci_slot, s->name);
 
    for (const struct section *s = guc_fail_functions; s->name; s++)
        igt_subtest_f("probe-fail-guc-%s", s->name) {
-- 
2.35.3

