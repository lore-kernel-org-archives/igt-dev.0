Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB2BCAC582
	for <igt-dev@archiver.kernel.org>; Tue,  9 Sep 2025 22:52:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14AA910E278;
	Tue,  9 Sep 2025 22:52:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jh/RfUJw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB16610E278
 for <IGT-Dev@lists.freedesktop.org>; Tue,  9 Sep 2025 22:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757458340; x=1788994340;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6OENdLCFyX0Mmd81ILLyatGWp34ATlIjaDH9+mBTOMk=;
 b=Jh/RfUJwjh/S0+CpfBXy1t/YFEgCbu8XKDLVcTqNH6ARF2jV2bZxgHcg
 OfjtK4RGTt7/qkkckcfh7atmGD8wdLYsocBddf4QMTZim9e9d2npLQ0uN
 Zi6hykKlUacUbVqpNo3dbdtj9a/5t8zdTNEei6rXYK4A1QolFs5TqIuJb
 VXo+7baOU9VgeX3CkYkUL56ubECiaTJ0v7j4xKcfH66691eC54M/wu8sc
 gbRLdDFxJvv9Z1W344qGmkvApONVkddt344TNTgZIBBqxRZWwfkVEqdr7
 OW9sKjFUWQGueZmQpS6mbyqNJ0hLrsVjANWvPtgduSkUqw0XtYk5o6cHQ A==;
X-CSE-ConnectionGUID: Rr+aZsTGSUyggZdw+m8pIg==
X-CSE-MsgGUID: yts7xy3rR1acm3gyLE5LaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="47331448"
X-IronPort-AV: E=Sophos;i="6.18,252,1751266800"; d="scan'208";a="47331448"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 15:52:19 -0700
X-CSE-ConnectionGUID: GjvW9A+VTxCZKxG8yiF4tw==
X-CSE-MsgGUID: YOsJEIK/TyelKwgWlgTc1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,252,1751266800"; d="scan'208";a="173315862"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa008.jf.intel.com with ESMTP; 09 Sep 2025 15:52:19 -0700
From: John.C.Harrison@Intel.com
To: IGT-Dev@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_fault_injection: Add GuC load to list of
 injection functions
Date: Tue,  9 Sep 2025 15:52:18 -0700
Message-ID: <20250909225219.547308-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

Failures in the GuC load path had been suppressed by the KMD for
various reasons. They have now been re-instated and support for
injecting failures to test that code path has been added. So add
the matching test.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 tests/intel/xe_fault_injection.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 04de2bfd54a1..9e98b3ada94e 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -241,6 +241,7 @@ static void ignore_fail_dump_in_dmesg(const char function_name[], bool enable)
  * Functionality: fault
  *
  * arg[1]:
+ * @guc_wait_ucode:			guc_wait_ucode
  * @wait_for_lmem_ready:		wait_for_lmem_ready
  * @xe_add_hw_engine_class_defaults:	xe_add_hw_engine_class_defaults
  * @xe_device_create:			xe_device_create
@@ -547,6 +548,7 @@ igt_main_args("I:", NULL, help_str, opt_handler, NULL)
 		unsigned int flags;
 		bool pf_only;
 	} probe_fail_functions[] = {
+		{ "guc_wait_ucode" },
 		{ "wait_for_lmem_ready" },
 		{ "xe_add_hw_engine_class_defaults" },
 		{ "xe_device_create" },
-- 
2.49.0

