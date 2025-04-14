Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B7B5C369B4
	for <igt-dev@archiver.kernel.org>; Mon, 14 Apr 2025 14:22:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8E3C10E5F5;
	Mon, 14 Apr 2025 14:22:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LKZhxGdA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2005210E5F5
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Apr 2025 14:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744640564; x=1776176564;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lQr2ug8x7ExWx8wAih44HRe9U9j7/KwRjgUX5qH6cko=;
 b=LKZhxGdA6md8dfOXEfqr1d9pBtOUySQg915d0y/Xxe12ioUuc44sIDky
 +nV9pTENAZ0mnUO6E5PRJmOBgBAm3tnK+JKUj8B7JwoILoGp41Ba4MrIy
 Iu+dwGWSliOo3NZ05dYK+48cmPBUYjMBF8nRapmCe9a41d/X0ChrTEM5N
 d2KrHKTKA4ELnQcF1K/2sLc+Oj4xqguOUIj0s8mV5wXiaVVnIgXK7iY+V
 kSLl/YqcqmWe2prMoWNirE1EPO1sMWDpPlTvzhvE9hPGkkf2w5j3HLtDc
 r3DRBt+Z1eFsWw5NRPqlc5jomPUud9bxfpTUHLvnjA1/+DUjyMXOtuPBF A==;
X-CSE-ConnectionGUID: DCU9XhTYR8Wb4syR48uihg==
X-CSE-MsgGUID: lEHBiAG9SFijIXLmUN1YOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="56770817"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="56770817"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 07:22:44 -0700
X-CSE-ConnectionGUID: tBNC7SzMRA2+ajk2Q98F0g==
X-CSE-MsgGUID: NJxgw31YSseATxs3cv3WKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="130707480"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa009.fm.intel.com with ESMTP; 14 Apr 2025 07:22:42 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t v5 3/3] tests/intel/xe_fault_injection: Do not assert
 for probe_guc_fail_* functions.
Date: Mon, 14 Apr 2025 20:08:42 +0530
Message-ID: <20250414143842.14981-4-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250414143842.14981-1-satyanarayana.k.v.p@intel.com>
References: <20250414143842.14981-1-satyanarayana.k.v.p@intel.com>
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
Reviewed-by: Francois Dugast <francois.dugast@intel.com>
---
 tests/intel/xe_fault_injection.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index adcab2e4d..19353c29a 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -28,6 +28,11 @@
 #define BO_SIZE		(1024*1024)
 #define INJECT_ITERATIONS	100
 
+enum assert_flags {
+	INJECT_ASSERT_ON_FAIL,
+	INJECT_NOASSERT_ON_FAIL,
+};
+
 int32_t inject_iters_raw;
 struct fault_injection_params {
 	/* @probability: Likelihood of failure injection, in percent. */
@@ -222,7 +227,7 @@ static void set_retval(const char function_name[], long long retval)
  * @xe_wopcm_init:			xe_wopcm_init
  */
 static void
-inject_fault_probe(int fd, char pci_slot[], const char function_name[])
+inject_fault_probe(int fd, int flags, char pci_slot[], const char function_name[])
 {
 	igt_info("Injecting error \"%s\" (%d) in function \"%s\"\n",
 		 strerror(-INJECT_ERRNO), INJECT_ERRNO, function_name);
@@ -231,7 +236,8 @@ inject_fault_probe(int fd, char pci_slot[], const char function_name[])
 	injection_list_add(function_name);
 	set_retval(function_name, INJECT_ERRNO);
 	xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_TRY_BIND);
-	igt_assert_eq(-errno, INJECT_ERRNO);
+	if (flags & INJECT_ASSERT_ON_FAIL)
+		igt_assert_eq(-errno, INJECT_ERRNO);
 	injection_list_remove(function_name);
 }
 
@@ -262,7 +268,7 @@ static void probe_fail_guc(int fd, char pci_slot[], const char function_name[],
 	for (int i = iter_start; i < iter_end; i++) {
 		fault_params->space = i;
 		setup_injection_fault(fault_params);
-		inject_fault_probe(fd, pci_slot, function_name);
+		inject_fault_probe(fd, INJECT_NOASSERT_ON_FAIL, pci_slot, function_name);
 		igt_kmod_unbind("xe", pci_slot);
 	}
 }
@@ -575,7 +581,7 @@ igt_main_args("I:", NULL, help_str, opt_handler, NULL)
 
 	for (const struct section *s = probe_fail_functions; s->name; s++)
 		igt_subtest_f("inject-fault-probe-function-%s", s->name)
-			inject_fault_probe(fd, pci_slot, s->name);
+			inject_fault_probe(fd, INJECT_ASSERT_ON_FAIL, pci_slot,	s->name);
 
 	for (const struct section *s = guc_fail_functions; s->name; s++)
 		igt_subtest_f("probe-fail-guc-%s", s->name) {
-- 
2.43.0

