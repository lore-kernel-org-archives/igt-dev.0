Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B8ACCD193
	for <igt-dev@archiver.kernel.org>; Tue, 14 Oct 2025 17:31:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F1AD10E159;
	Tue, 14 Oct 2025 17:31:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HuJAToxl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C95A10E159
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Oct 2025 17:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760463117; x=1791999117;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=H19PQh7ytjuV7P3LUbIae/Y5Nde11SbU/HOXLOALE88=;
 b=HuJAToxl0W+4TgS7CooOSHNK7tUcOgPA84dOhUFlitcWsTVHbRkcESYB
 qAstJx1Qn1rmZI1Q4f48i0jFCaqItFcNlSjOWcQ0cm7nIf9Advl+ssmWH
 jzUm5oOTGWGJdpE9+YqFrilv01/8ZgFwCkysfqH4+pGEUynzEMfMe8mA1
 b3jEkZab0F5MoKA8uGQUnAmmLi4lI+4oZjCJwyvtX9POJovqPj4ARqivM
 MLtfiDPFAhCrxlGuW2yQsYz1bXZsViMkcKcFsW5SmL5JGbNrWIBMtCyah
 W/lAb6TaoAydN3DIyibaXVNjgIZqms7VnimiGrzk2rIKbSU17fsWAzumt A==;
X-CSE-ConnectionGUID: iQlaJvAbTFm5RrPZT2i+5Q==
X-CSE-MsgGUID: MppVObbpT/uED8pHokMOXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="62725940"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="62725940"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 10:31:57 -0700
X-CSE-ConnectionGUID: Dv7ZH1vOSWKIUjkExz31EA==
X-CSE-MsgGUID: fsAKy2t9TeGL/nnr1Adnuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="182731191"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.39.24])
 by fmviesa010.fm.intel.com with ESMTP; 14 Oct 2025 10:31:57 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, Zhanjun Dong <zhanjun.dong@intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH v2] tests/intel/xe_fault_injection: Set guc_wait_ucode pf only
Date: Tue, 14 Oct 2025 13:31:55 -0400
Message-Id: <20251014173155.800954-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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

guc_wait_ucode is pf only function, set the flag to run it only in the PF
environment.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>

---
History:
v2: Update commit comment.
---
 tests/intel/xe_fault_injection.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index 6cef5578c..621af27d4 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -566,7 +566,7 @@ igt_main_args("I:", NULL, help_str, opt_handler, NULL)
 		unsigned int flags;
 		bool pf_only;
 	} probe_fail_functions[] = {
-		{ "guc_wait_ucode" },
+		{ "guc_wait_ucode", 0, true },
 		{ "wait_for_lmem_ready" },
 		{ "xe_add_hw_engine_class_defaults" },
 		{ "xe_device_create" },
-- 
2.34.1

