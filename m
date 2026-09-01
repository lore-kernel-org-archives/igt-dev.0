Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 011ADC61DD6
	for <igt-dev@archiver.kernel.org>; Tue,  1 Sep 2026 03:59:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DAB610E38F;
	Tue,  1 Sep 2026 03:59:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KvTJrIrL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E49C10E38F
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Sep 2026 03:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788235145; x=1819771145;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=w8ufIaLfDFgXDerQ4y8JB1z/Vbo0/UxleEJNhQvDs1A=;
 b=KvTJrIrLDA36QIUCdyUCDnRUG3/YqMvhEiGHDbv+boIvF6pct1SBjegy
 cW+bmZJdemQOutLsEv7u0/MxdRR49Slc6Jr4Q2DpWNVKmrlYLtT7TDDfz
 R+WqSzKvZ1AKHrfVhimVV5faAnh9mJbUyLvcIA3qngPmEzE2O4Cg2NB5h
 Za+0hHLkLwlfmvUjOD4147CLptmwdnI5VYSWt6Qyph/ySULlkd8ttR4ye
 YFpidKt6PLv1F7jL3fw63IlxqgcyNHRNEotxIV857tK0ATfsS/cvmp45U
 /QuZmzUKueanrlGS5T4H7BoMYKLrVHqqZjazoUN5m0peP4MgEitG2rAgw w==;
X-CSE-ConnectionGUID: emX1ew7mQdOePwhGdOvPJQ==
X-CSE-MsgGUID: Q6kOVIBLS9OdR9ghNgBakQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="111424288"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="111424288"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 20:59:04 -0700
X-CSE-ConnectionGUID: 2asQqnyTTQKHXSRsXEDyzA==
X-CSE-MsgGUID: z3WcBzCQQm2ohUi/9g/eQw==
X-ExtLoop1: 1
Received: from dut2116bmgfrd.iind.intel.com ([10.223.34.13])
 by fmviesa003.fm.intel.com with ESMTP; 31 Aug 2026 20:59:03 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@intel.com
Subject: [PATCH] tests/intel/xe_sysfs_scheduler: fix save/restore array
 indexing
Date: Tue,  1 Sep 2026 03:59:02 +0000
Message-ID: <20260901035902.222919-1-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
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

From: Nishit Sharma <nishit.sharma@intel.com>

The scheduler property save/restore array was declared as
store[MAX_GTS][3][3] but indexed with the per-GT engine index in the
first (GT) dimension:

This drops the GT dimension completely: on multi-GT systems every GT
overwrites the same slots, so teardown restores each engine's
preempt_timeout/timeslice_duration/job_timeout with values from the
last GT that was saved, tripping the "not restored!" abort. It also
overflows the array whenever a GT exposes more than MAX_GTS engines.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_sysfs_scheduler.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_sysfs_scheduler.c b/tests/intel/xe_sysfs_scheduler.c
index 383625064..cbf25762a 100644
--- a/tests/intel/xe_sysfs_scheduler.c
+++ b/tests/intel/xe_sysfs_scheduler.c
@@ -237,7 +237,7 @@ int igt_main()
 				      {"job_timeout_ms", "job_timeout_min", "job_timeout_max"},
 	};
 
-	unsigned int store[MAX_GTS][3][3];
+	unsigned int store[MAX_GTS][XE_MAX_ENGINE_INSTANCE][3][3];
 	int count = sizeof(property) / sizeof(property[0]);
 	int gt_count = 0;
 	int xe = -1;
@@ -271,7 +271,7 @@ int igt_main()
 					const char **pl = property[j];
 
 					for (int k = 0; k < 3; k++) {
-						unsigned int *loc = &store[i][j][k];
+						unsigned int *loc = &store[gt_count][i][j][k];
 
 						igt_require(igt_sysfs_scanf(list[i], pl[k],
 									    "%u", loc) == 1);
@@ -314,7 +314,7 @@ int igt_main()
 
 					for (int k = 2; k >= 0; k--) {
 						unsigned int read = UINT_MAX;
-						unsigned int val = store[i][j][k];
+						unsigned int val = store[gtn][i][j][k];
 
 						igt_sysfs_printf(e, pl[k], "%u", val);
 						igt_sysfs_scanf(e, pl[k], "%u", &read);
-- 
2.43.0

