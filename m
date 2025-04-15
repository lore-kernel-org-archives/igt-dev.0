Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 734B9C369B9
	for <igt-dev@archiver.kernel.org>; Tue, 15 Apr 2025 08:12:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2507610E681;
	Tue, 15 Apr 2025 08:12:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xtq6EWRw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8378B10E681
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Apr 2025 08:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744704729; x=1776240729;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Rd7GRsLyXA4fvYjw+DgptcbbZyVqiNMHmHMaYKMEn5A=;
 b=Xtq6EWRwOjp+ejjdt9RtVnychoc7so278XnOWQX8Y+uTEzGc+E+nDrMT
 uUHyQOkxyHeitouAJG5PuizX3XvoU93s0/qI6B8YdGajy9hEEoBgEFF+T
 L8Gel7QtsyPWZkU0wfKVZG5SJhShMF0DaJQwlVKakDqjjpuvK01JCFMB8
 Txg5xIXiblAw9qrMqIWtMePlIhvpJ4ssWsZ9Qj+pxWmGB2xhwvm9pJPZv
 hGnDKBXWFUcj0HuuxIvUGfYzMxUHaFPt3FG5ALs/0cyodxTILmdCkqOAV
 SKz9DTjErni8fyES7LgBvQ7nh4OOKV3Z+YLDLUsskZGOGw236E+nZK3Sq g==;
X-CSE-ConnectionGUID: 1de0/7CAQ8GoTS2jGQK16w==
X-CSE-MsgGUID: S4ZFDlwMR0W9vGI144ybig==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="46334804"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="46334804"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 01:11:33 -0700
X-CSE-ConnectionGUID: 8lD31LmJTwKjlnm+RM06RA==
X-CSE-MsgGUID: g7iyZvY6Scm3WDJ1UAhIJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="129821102"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa009.jf.intel.com with ESMTP; 15 Apr 2025 01:11:31 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t v6 3/3] tests/intel/xe_fault_injection: Do not assert
 for probe_guc_fail_* functions.
Date: Tue, 15 Apr 2025 13:57:11 +0530
Message-ID: <20250415082711.4831-4-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250415082711.4831-1-satyanarayana.k.v.p@intel.com>
References: <20250415082711.4831-1-satyanarayana.k.v.p@intel.com>
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
index 252209308..3c389a268 100644
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
@@ -223,7 +228,7 @@ static void set_retval(const char function_name[], long long retval)
  * @xe_wopcm_init:			xe_wopcm_init
  */
 static void
-inject_fault_probe(int fd, char pci_slot[], const char function_name[])
+inject_fault_probe(int fd, int flags, char pci_slot[], const char function_name[])
 {
 	igt_info("Injecting error \"%s\" (%d) in function \"%s\"\n",
 		 strerror(-INJECT_ERRNO), INJECT_ERRNO, function_name);
@@ -232,7 +237,8 @@ inject_fault_probe(int fd, char pci_slot[], const char function_name[])
 	injection_list_add(function_name);
 	set_retval(function_name, INJECT_ERRNO);
 	xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_TRY_BIND);
-	igt_assert_eq(-errno, INJECT_ERRNO);
+	if (flags & INJECT_ASSERT_ON_FAIL)
+		igt_assert_eq(-errno, INJECT_ERRNO);
 	injection_list_remove(function_name);
 }
 
@@ -263,7 +269,7 @@ static void probe_fail_guc(int fd, char pci_slot[], const char function_name[],
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

