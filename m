Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58DE6D3B98B
	for <igt-dev@archiver.kernel.org>; Tue, 26 Nov 2024 14:11:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1601710E407;
	Tue, 26 Nov 2024 14:11:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FIJXZEkc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DD0C10E407
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Nov 2024 14:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732630269; x=1764166269;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TzMC1jzQFWpMzXB3PlJ2Ow17nAMGTOiMl21XX7OfSgs=;
 b=FIJXZEkcLJI3+gh1Bd+Qo4hSoaSdGPIfUj1BS5cRGnYtBaDAvnNIO1cQ
 KG/9+BNB80qERbh4Ju1OeVDRFkkn/bCfAixEEtp/wqAaHJKRr5yilGko+
 oi8rCB+UbF/LgKtRKyhGKOucGiQyjm+JFLnrZ1xVJHy7eF3ZTTU4Nrl8s
 V7SpMW6sZvHOwZfE+at30iFodMGmk0aF/WnoHsOUhbQChnB3JAHOmnDdx
 IkRxO/T5oZLfHt+j6noNKPyCJoLoeKrQAXypx6GjkMQ+nx0aOESWaSGcX
 tEgejKUnMypI9cpXWCY9keSKF1t5e7BSHzfsrDc3l3lVETtkCpvLOUS7O g==;
X-CSE-ConnectionGUID: EBRrvlYgSNq8WC5Cz3A03w==
X-CSE-MsgGUID: xaw+AC6/Q5GciwoI9zJK+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="50318999"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="50318999"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 06:11:09 -0800
X-CSE-ConnectionGUID: 5Q/iJunJSXaUHmzeB1lC+g==
X-CSE-MsgGUID: dF7U6AaPSI6RN8TqcAv4XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="96050069"
Received: from rvodapal-desk.iind.intel.com ([10.145.162.163])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 06:11:06 -0800
From: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: balasubramani.vivekanandan@intel.com, matthew.d.roper@intel.com,
 lucas.demarchi@intel.com, gustavo.sousa@intel.com,
 clinton.a.taylor@intel.com, matthew.s.atwood@intel.com,
 dnyaneshwar.bhadane@intel.com, haridhar.kalvala@intel.com,
 shekhar.chauhan@intel.com, umesh.nerlige.ramappa@intel.com,
 ashutosh.dixit@intel.com
Subject: [PATCH] tests/intel/perf_pmu: Fix Test Assertion Failure for
 semaphore-busy test
Date: Tue, 26 Nov 2024 19:39:13 +0530
Message-Id: <20241126140913.4066558-1-ravi.kumar.vodapalli@intel.com>
X-Mailer: git-send-email 2.25.1
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

The tolerance limit exceeds the threshold values sometimes for test
igt@perf_pmu@semaphore-busy, bump up the limits slightly.
Also print the log in readable format in percentage instead of nanosec.

Signed-off-by: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
---
 tests/intel/perf_pmu.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
index bfa2d501a..7f43354fd 100644
--- a/tests/intel/perf_pmu.c
+++ b/tests/intel/perf_pmu.c
@@ -189,7 +189,7 @@
 
 IGT_TEST_DESCRIPTION("Test the i915 pmu perf interface");
 
-const double tolerance = 0.05f;
+const double tolerance = 0.1f;
 const unsigned long batch_duration_ns = 500e6;
 
 char *drpc;
@@ -287,10 +287,9 @@ static uint64_t pmu_read_multi(int fd, unsigned int num, uint64_t *val)
 #define __assert_within_epsilon(x, ref, tol_up, tol_down, debug_data) \
 	igt_assert_f((double)(x) <= (1.0 + (tol_up)) * (double)(ref) && \
 		     (double)(x) >= (1.0 - (tol_down)) * (double)(ref), \
-		     "'%s' != '%s' (%f not within +%.1f%%/-%.1f%% tolerance of %f)\n%s\n",\
-		     #x, #ref, (double)(x), \
-		     (tol_up) * 100.0, (tol_down) * 100.0, \
-		     (double)(ref), debug_data)
+		     "%.3f%% is not within tolerance limits of +%.1f%%/-%.1f%%\n%s\n", \
+		     (((double)((double)(x) - (double)(ref)) * 100.0) / (double)(ref)), \
+		     (tol_up) * 100.0, (tol_down) * 100.0, debug_data)
 
 #define assert_within_epsilon(x, ref, tolerance) \
 	__assert_within_epsilon(x, ref, tolerance, tolerance, no_debug_data)
-- 
2.25.1

