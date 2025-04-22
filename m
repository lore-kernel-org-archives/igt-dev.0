Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E10C369CB
	for <igt-dev@archiver.kernel.org>; Tue, 22 Apr 2025 10:13:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7019610E1AD;
	Tue, 22 Apr 2025 10:13:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nBfp0qk/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38FC010E2B8
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Apr 2025 10:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745316817; x=1776852817;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=N3WvOg5HYpzZpExPuE5hBsfq+6v1RYNjJdgDJUh4w7A=;
 b=nBfp0qk/Yf2rvd7lxnVP6Um6KPRvngK7minImMO6AARPmhMSus1Pgq7/
 Ud06r4sKJ2vKVeFVSEOs7woPzWsQJCeLC+PIoswFLUHEXqmk6ada8DIVN
 hBUwUrjzaoPgH2ww27q1way78i4OYnyuKJUiipjvOfuCmlgjazebkQKGc
 UiPabK98IqtxPhaVV1d0qzDwbAy22h+D47Ivi+nMDXGfc8SUaatb0FVUV
 aPTvbHE0xCc8FIymtOXJQat6OUnyod20w/clutufJYPHgGhNBLKAgOsLW
 fRK1AhIVh477f4y1o7udlYmPOW1kimwQDtZRJ63YStxSG4ud1ByFQgD2S A==;
X-CSE-ConnectionGUID: UBuwSI8ZSqybU1yYgQ93Nw==
X-CSE-MsgGUID: 17aMz/Y0TAC6yChspmiLmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="47050111"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="47050111"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 03:13:37 -0700
X-CSE-ConnectionGUID: JTANwOTMSxGYfk2kYp1hiQ==
X-CSE-MsgGUID: tuibAZ57TEK72+nAsZ5Z2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; d="scan'208";a="132508613"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa007.jf.intel.com with ESMTP; 22 Apr 2025 03:13:35 -0700
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t v8 3/3] tests/intel/xe_fault_injection: Return result
 from inject_fault_probe()
Date: Tue, 22 Apr 2025 15:59:41 +0530
Message-ID: <20250422102941.1678-4-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422102941.1678-1-satyanarayana.k.v.p@intel.com>
References: <20250422102941.1678-1-satyanarayana.k.v.p@intel.com>
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
returning error to the caller. Caller can check and assert if needed.

Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 tests/intel/xe_fault_injection.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index ced613896..98a414bd3 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -224,9 +224,10 @@ static void set_retval(const char function_name[], long long retval)
  * @xe_wa_init:				xe_wa_init
  * @xe_wopcm_init:			xe_wopcm_init
  */
-static void
+static int
 inject_fault_probe(int fd, char pci_slot[], const char function_name[])
 {
+	int err = 0;
 	igt_info("Injecting error \"%s\" (%d) in function \"%s\"\n",
 		 strerror(-INJECT_ERRNO), INJECT_ERRNO, function_name);
 
@@ -236,8 +237,10 @@ inject_fault_probe(int fd, char pci_slot[], const char function_name[])
 
 	igt_kmod_bind("xe", pci_slot);
 
-	igt_assert_eq(-errno, INJECT_ERRNO);
+	err = -errno;
 	injection_list_remove(function_name);
+
+	return err;
 }
 
 /**
@@ -579,7 +582,8 @@ igt_main_args("I:", NULL, help_str, opt_handler, NULL)
 
 	for (const struct section *s = probe_fail_functions; s->name; s++)
 		igt_subtest_f("inject-fault-probe-function-%s", s->name)
-			inject_fault_probe(fd, pci_slot, s->name);
+			igt_assert_eq(INJECT_ERRNO, inject_fault_probe(fd,
+						pci_slot, s->name));
 
 	for (const struct section *s = guc_fail_functions; s->name; s++)
 		igt_subtest_f("probe-fail-guc-%s", s->name) {
-- 
2.43.0

