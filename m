Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13347C282D1
	for <igt-dev@archiver.kernel.org>; Thu,  6 Mar 2025 09:55:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B558610E934;
	Thu,  6 Mar 2025 09:55:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hf788tq6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DADEE10E933
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Mar 2025 09:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741254919; x=1772790919;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TZJBQ4TIxaPBmZjXEkv6OzYTibZUXGcgTooxPZHDWyU=;
 b=Hf788tq6aBj1WITuHoNH1NUS+rojkVLgKSnQL6twowXWELvQFLdY0aKp
 gilyPWDVuFuRbsYOLgCWIgyDgOV5VHtmB5SIDz4i0yBYTUYnqYsA5sooE
 VnVixb0QUSAJE2oT8nJctH0YoVwvPZGG0/U/hGWrjsnMdRvYPPhUHEROH
 QL+qV8FfyMt1ltRVrxwG3Tcr4GgCe+b/64GKVwNBX1JY1BM5CT6fTcWYm
 cTeevUvVSCHscQrHo8ntD1lJ0LIlivPPxOeDrnYW3Ag3ooZmEKXfKP08j
 /+Edl5YwaAkD8TqjwFxJeh6b4NKZVr4/Y9pndM76IHw901p/nPphYbMTI g==;
X-CSE-ConnectionGUID: yIvyDV+lTrWOBRLaG8aLTg==
X-CSE-MsgGUID: jS1cfGmLRIyInCjDkAtYOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="29839198"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="29839198"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 01:55:18 -0800
X-CSE-ConnectionGUID: XD1eD2NSSJGeIzBaOLEqzA==
X-CSE-MsgGUID: 1zE06ZCwSIuS1mmrzDm7iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="119160976"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa008.fm.intel.com with ESMTP; 06 Mar 2025 01:55:16 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t v3 6/6] tests/intel/xe_fault_injection: Do not assert
 for probe_guc_fail_* functions.
Date: Thu,  6 Mar 2025 15:40:41 +0530
Message-Id: <20250306101041.26827-7-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20250306101041.26827-1-satyanarayana.k.v.p@intel.com>
References: <20250306101041.26827-1-satyanarayana.k.v.p@intel.com>
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
 tests/intel/xe_fault_injection.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 10e243679..20fdf46c1 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -32,6 +32,11 @@ enum injection_list_action {
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
@@ -219,7 +224,7 @@ static void set_retval(const char function_name[], long long retval)
  * @xe_wopcm_init:		xe_wopcm_init
  */
 static void
-inject_fault_probe(int fd, char pci_slot[], const char function_name[])
+inject_fault_probe(int fd, int flags, char pci_slot[], const char function_name[])
 {
 	igt_info("Injecting error \"%s\" (%d) in function \"%s\"\n",
 		 strerror(-INJECT_ERRNO), INJECT_ERRNO, function_name);
@@ -228,7 +233,8 @@ inject_fault_probe(int fd, char pci_slot[], const char function_name[])
 	injection_list_do(INJECTION_LIST_ADD, function_name);
 	set_retval(function_name, INJECT_ERRNO);
 	xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_TRY_BIND);
-	igt_assert_eq(-errno, INJECT_ERRNO);
+	if (flags & INJECT_ASSERT_ON_FAIL)
+		igt_assert_eq(-errno, INJECT_ERRNO);
 	injection_list_do(INJECTION_LIST_REMOVE, function_name);
 	xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_TRY_UNBIND);
 }
@@ -256,7 +262,7 @@ static void probe_fail_guc(int fd, char pci_slot[], const char function_name[],
 	for (int i = iter_start; i < iter_end; i++) {
 		fault_params->space = i;
 		setup_injection_fault(fault_params);
-		inject_fault_probe(fd, pci_slot, function_name);
+		inject_fault_probe(fd, INJECT_NOASSERT_ON_FAIL, pci_slot, function_name);
 	}
 }
 
@@ -423,8 +429,8 @@ igt_main
 
 	for (const struct section *s = probe_fail_functions; s->name; s++)
 		igt_subtest_f("inject-fault-probe-function-%s", s->name)
-			inject_fault_probe(fd, pci_slot, s->name);
-	
+			inject_fault_probe(fd, INJECT_ASSERT_ON_FAIL, pci_slot, s->name);
+
 	for (const struct section *s = guc_fail_functions; s->name; s++)
 		igt_subtest_f("probe-fail-guc-%s", s->name) {
 			memcpy(&fault_params, &default_fault_params,
-- 
2.35.3

