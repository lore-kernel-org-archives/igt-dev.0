Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5861C369A2
	for <igt-dev@archiver.kernel.org>; Mon, 14 Apr 2025 14:16:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 588DD10E5F7;
	Mon, 14 Apr 2025 14:16:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P13K8OuA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B7B10E5F7
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Apr 2025 14:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744640217; x=1776176217;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lQr2ug8x7ExWx8wAih44HRe9U9j7/KwRjgUX5qH6cko=;
 b=P13K8OuAz1Akt5Xavks3cc18/53ZijCxDFfPj9uAulPj/rPF/JVzArqF
 8cKI30DjHwMA21lGAAuA6JSmhYeNjCzhtIX8sNvAdUXJneJlOoH0hVvzz
 mQxu8gl6qe4BQqzrFMf6HvWVEPpBCfK210qXAxNPXpl7bvV0DUZog02EL
 tnqY/O20Fiqc8D3FflPgDrefbrZ1DjRc+0zc7Rn2LFuODg50p4HyhDD6+
 mCJbycKWtg37PnxVMuv7lTSSwCHeOU3+4RrG7N7kSMgfWTnv9wl6OPZPo
 vjRbB2rGu5dVYNcdxkhseKx0qG/fKWsegIyaawGYCOQ/rb5RSTur8MVUn Q==;
X-CSE-ConnectionGUID: hGsSJzdISqitCd+rydbmIg==
X-CSE-MsgGUID: yEtivFUZRaGODUgY6qSdRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="45248189"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="45248189"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 07:16:57 -0700
X-CSE-ConnectionGUID: QOB/X/YmSd2jf+GP6DMk8A==
X-CSE-MsgGUID: FE9YQXs6QZ6D5k8N/vxegA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; d="scan'208";a="130811905"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa008.jf.intel.com with ESMTP; 14 Apr 2025 07:16:56 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t v5 3/3] tests/intel/xe_fault_injection: Do not assert
 for probe_guc_fail_* functions.
Date: Mon, 14 Apr 2025 20:02:58 +0530
Message-ID: <20250414143258.12869-4-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250414143258.12869-1-satyanarayana.k.v.p@intel.com>
References: <20250414143258.12869-1-satyanarayana.k.v.p@intel.com>
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

