Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58836C369D2
	for <igt-dev@archiver.kernel.org>; Mon, 21 Apr 2025 07:29:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE1410E077;
	Mon, 21 Apr 2025 07:29:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EQfkoV3G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9DAF10E077
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Apr 2025 07:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745220596; x=1776756596;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MJsfdGFZeGu0gd+VynRoVJkMCFUyc86fH1wdlnVwZ7M=;
 b=EQfkoV3G3DT1LrKR4M5hZsnz9TYfPo8d8rQp9VscCZq3grR/1bDnc6+n
 y5lIG8YesyXMFHqEr+/rHlLs7tt6XaT/taQj0mHqDyPAzZdOwLHolkYQ5
 G2x1jyZ/iNsvprRdQVPQAU/j/Wy4rEX2oSvPldX7f+dUX1oX69rVdV3Ur
 jkvnXYv/pllKxyV8xqFOBjAiW0OVu8uCg7p7+Lsmp44MyYE/TFubu7LV5
 djBulvqnkxcOc2hUJuzh0dUagLEhwfN7YE1oZuTRNg2QElMr9LWGQV6Qd
 ZG2rkzKH1vx+kKOjDIRhvXKK0LUF+CfFcU2s6w2wtE+XWB9TL+RTjtxdy A==;
X-CSE-ConnectionGUID: qd34PAH6R3SNTDCwJvAhVA==
X-CSE-MsgGUID: 8S2RLgP9TOCOSYHUdn/7Xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="50411610"
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; d="scan'208";a="50411610"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2025 00:29:55 -0700
X-CSE-ConnectionGUID: wccfVhRPQKKwpvdtW2++IA==
X-CSE-MsgGUID: GOVu6EXSR2K6tlljgxoIwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; d="scan'208";a="136508880"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa003.jf.intel.com with ESMTP; 21 Apr 2025 00:29:54 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t v7 3/3] tests/intel/xe_fault_injection: Do not assert
 for probe_guc_fail_* functions.
Date: Mon, 21 Apr 2025 13:15:45 +0530
Message-ID: <20250421074545.5549-4-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250421074545.5549-1-satyanarayana.k.v.p@intel.com>
References: <20250421074545.5549-1-satyanarayana.k.v.p@intel.com>
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

Considering above cases, not asserting the test in inject_fault_probe(), but
returing error to the caller. Caller can check and assert if needed. Test does
not assert for probe_guc_fail_* functions as driver some times retries in case
of failure. The main idea of injecting errors for these guc functions is to
check the robustness of the driver.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 tests/intel/xe_fault_injection.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index d95b51f2d..ae8f79aee 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -224,7 +224,7 @@ static void set_retval(const char function_name[], long long retval)
  * @xe_wa_init:				xe_wa_init
  * @xe_wopcm_init:			xe_wopcm_init
  */
-static void
+static int
 inject_fault_probe(int fd, char pci_slot[], const char function_name[])
 {
 	igt_info("Injecting error \"%s\" (%d) in function \"%s\"\n",
@@ -234,8 +234,8 @@ inject_fault_probe(int fd, char pci_slot[], const char function_name[])
 	injection_list_add(function_name);
 	set_retval(function_name, INJECT_ERRNO);
 	xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_TRY_BIND);
-	igt_assert_eq(-errno, INJECT_ERRNO);
 	injection_list_remove(function_name);
+	return -errno;
 }
 
 /**
@@ -470,7 +470,7 @@ const char *help_str =
 
 igt_main_args("I:", NULL, help_str, opt_handler, NULL)
 {
-	int fd, sysfs;
+	int fd, sysfs, ret;
 	struct drm_xe_engine_class_instance *hwe;
 	struct fault_injection_params fault_params;
 	static uint32_t devid;
@@ -576,8 +576,10 @@ igt_main_args("I:", NULL, help_str, opt_handler, NULL)
 	}
 
 	for (const struct section *s = probe_fail_functions; s->name; s++)
-		igt_subtest_f("inject-fault-probe-function-%s", s->name)
-			inject_fault_probe(fd, pci_slot, s->name);
+		igt_subtest_f("inject-fault-probe-function-%s", s->name) {
+			ret = inject_fault_probe(fd, pci_slot,	s->name);
+			igt_assert_eq(ret, INJECT_ERRNO);
+		}
 
 	for (const struct section *s = guc_fail_functions; s->name; s++)
 		igt_subtest_f("probe-fail-guc-%s", s->name) {
-- 
2.43.0

