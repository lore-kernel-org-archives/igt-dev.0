Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88743D65C46
	for <igt-dev@archiver.kernel.org>; Wed, 17 Dec 2025 13:12:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36CE710EC78;
	Wed, 17 Dec 2025 13:12:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mO6HcapW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81E3810EC76
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Dec 2025 13:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765977176; x=1797513176;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fjLgwEUYhWhllq0OZlFMIsrnpPiEr2c6J7zitEjrRTI=;
 b=mO6HcapWmQpL+QHgrUCihfd+DELemqbFc7yMMtWaLfHWHp4+X5uoEnJ9
 0DBwhX1h5JDHMXuEfKz+NrIzYvqnJ/UsGXRphOHszi8EBJKVvCYFKEVU1
 wYyUmtxmR6ZfzHI5Ef9fAeJ9nUeCI8/+JTMVDtKPwpqo7FXrBnvs5qlF5
 HuE2yo2erl4AK0B/JUyHSBFBisBYbURJnuPE1L6waHkaTuXmCqT/cogE0
 7p8UzDbrdg6L8/FigdigTPVA4V4B6BUHntuMwBGWBFRtDzOnk67xJ+oPR
 TMRrLUSkarsmTREGhsbxGUVZN0Kt2VzfAg7hdsDX2OUlpyqb5QD6mBSkQ w==;
X-CSE-ConnectionGUID: I88FEMBqQiCcAcLZUFYAFg==
X-CSE-MsgGUID: qSce4SwOSHa1bFIFa5vIDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="79030825"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="79030825"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 05:12:55 -0800
X-CSE-ConnectionGUID: Q3ENaQGXSnW7zcWBXdMYjA==
X-CSE-MsgGUID: 48GRsQD3QRC85RF5m4JLEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="202496352"
Received: from bvivekan-desk.iind.intel.com ([10.190.238.63])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 05:12:54 -0800
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
Subject: [PATCH 1/1] tests/xe/xe_fault_injection: Remove probe function
 wait_for_lmem_ready
Date: Wed, 17 Dec 2025 18:44:08 +0530
Message-ID: <20251217131406.2441143-4-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251217131406.2441143-3-balasubramani.vivekanandan@intel.com>
References: <20251217131406.2441143-3-balasubramani.vivekanandan@intel.com>
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

wait_for_lmem_ready function is removed from the driver probe. Discard
it from here as well.

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 tests/intel/xe_fault_injection.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 013b4dc9a..f3bfc4b40 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -242,7 +242,6 @@ static void ignore_fail_dump_in_dmesg(const char function_name[], bool enable)
  *
  * arg[1]:
  * @guc_wait_ucode:			guc_wait_ucode
- * @wait_for_lmem_ready:		wait_for_lmem_ready
  * @xe_add_hw_engine_class_defaults:	xe_add_hw_engine_class_defaults
  * @xe_device_create:			xe_device_create
  * @xe_device_probe_early:		xe_device_probe_early
@@ -567,7 +566,6 @@ int igt_main_args("I:", NULL, help_str, opt_handler, NULL)
 		bool pf_only;
 	} probe_fail_functions[] = {
 		{ "guc_wait_ucode", 0, true },
-		{ "wait_for_lmem_ready" },
 		{ "xe_add_hw_engine_class_defaults" },
 		{ "xe_device_create" },
 		{ "xe_device_probe_early" },
-- 
2.43.0

