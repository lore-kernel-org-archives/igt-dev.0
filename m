Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ACEAC369C2
	for <igt-dev@archiver.kernel.org>; Thu, 17 Apr 2025 13:13:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3057410EB09;
	Thu, 17 Apr 2025 13:13:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SBbueU/G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1798410EB03
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Apr 2025 13:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744895607; x=1776431607;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HyxSdISgE3bLnk8/IzdFW3OuNC2gxLr0PL9rFPmpIWI=;
 b=SBbueU/GdUGM0QXPPBWzCb045OPJGVZTHVURj5IZUGethxl0S2Jn1QA1
 z+mEm/C2tLVq11SRPpAHpYctk1/Dnmeoio0TBUWMtcIq0K54Lb5rTH/9N
 1eFxP94sRh6qeFerJGyTTre58n6oM9xi478G8CdBpuQfu+vMGwB7zTPyQ
 WpM9eGtI0PB/y9wUdt9ZJkApf0xNDefztY1xKXjGvD5xN2c4qxEhL5nBH
 /PmZmekZZSrl2a8i2t2Fv/jCWizT+hfTH6O+zE6kJaCVEcmnX4Rxj/V34
 DkMprSapp5j8as7Ukg1Sjg1noURwsFobH7/tVtuJA/c+d5jo9L95FvqrW A==;
X-CSE-ConnectionGUID: MfLpflLBS5aDGkJ9ih6yBg==
X-CSE-MsgGUID: p7ygr9NQSB+nc72QQqsxWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="68972705"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; d="scan'208";a="68972705"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 06:13:26 -0700
X-CSE-ConnectionGUID: a7WVTksyQrqaipoGdRReGQ==
X-CSE-MsgGUID: Bz8sDjboSdKIgmxSZDPRvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; d="scan'208";a="130802700"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.80.165])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 06:13:25 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Francois Dugast <francois.dugast@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH i-g-t 1/2] tests/intel/xe_fault_injection: Return probe result
 from inject_fault_probe
Date: Thu, 17 Apr 2025 15:13:11 +0200
Message-Id: <20250417131312.1016503-2-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20250417131312.1016503-1-marcin.bernatowicz@linux.intel.com>
References: <20250417131312.1016503-1-marcin.bernatowicz@linux.intel.com>
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

Refactor inject_fault_probe() to return the result of the probe instead
of asserting internally. This defers the decision of whether to assert
or how to handle the result to the caller.

This change allows more flexibility for test cases that may expect the
probe to succeed despite an injected fault. If strict checking is still
desired, a wrapper such as:

  static void assert_inject_fault_probe(...) {
      igt_assert_eq(INJECT_ERRNO, inject_fault_probe(...));
  }

can be introduced to preserve the old behavior.

Follow-up patches will demonstrate use cases where fault injection does
not cause the probe to fail, justifying this change in behavior.

Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 tests/intel/xe_fault_injection.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 24d3df572..dc8005dc8 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -186,9 +186,11 @@ static void set_retval(const char function_name[], long long retval)
  * @xe_wa_init:				xe_wa_init
  * @xe_wopcm_init:			xe_wopcm_init
  */
-static void
+static int
 inject_fault_probe(int fd, char pci_slot[], const char function_name[])
 {
+	int err = 0;
+
 	igt_info("Injecting error \"%s\" (%d) in function \"%s\"\n",
 		 strerror(-INJECT_ERRNO), INJECT_ERRNO, function_name);
 
@@ -197,9 +199,10 @@ inject_fault_probe(int fd, char pci_slot[], const char function_name[])
 	set_retval(function_name, INJECT_ERRNO);
 
 	igt_kmod_bind("xe", pci_slot);
-
-	igt_assert_eq(-errno, INJECT_ERRNO);
+	err = -errno;
 	injection_list_remove(function_name);
+
+	return err;
 }
 
 /**
@@ -478,7 +481,7 @@ igt_main
 
 	for (const struct section *s = probe_fail_functions; s->name; s++)
 		igt_subtest_f("inject-fault-probe-function-%s", s->name)
-			inject_fault_probe(fd, pci_slot, s->name);
+			igt_assert_eq(INJECT_ERRNO, inject_fault_probe(fd, pci_slot, s->name));
 
 	igt_fixture {
 		close(sysfs);
-- 
2.31.1

