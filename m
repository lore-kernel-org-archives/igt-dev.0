Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58DE2106F30F
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 09:30:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D25810EA91;
	Thu, 26 Mar 2026 09:30:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JAeV07cP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2A8410EA91
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 09:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774517423; x=1806053423;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=M+HVgpOUocuEKfih4z5HVFrUm538bCglsdruuk1K4bk=;
 b=JAeV07cPa3Jo/0bTSuDvHwEX/IhcctQXoXo4bNn3l2Yz6qMeZV0uUw5I
 lZNCvaRP5d/vSdjeRGTtHbOc7uhS081i0r3qyc8h2lEF5v13aHhtj1cQQ
 LpZfiTZoRlRXOrycA1g0LvRSDvpahxPFaCU7suPNUdLh46tRw2xtsjKr1
 eUp/feV4T3mVhgk3AdbTmUbK0S4H13A+4Pc59e115NfVG13KB5vBFrtbL
 WszhShCM3hj8RLPwBaanorSM/Rku+P+PPmLbHDYG9N3q8+2dVEptmvTuM
 bWzN6rZp8YrAbDDWfrrz5T8unbuIds2lhCfZOmeCZB8Q/hEWt/qlo1PW7 g==;
X-CSE-ConnectionGUID: fHXN9ZnNTQu2n7tatiDNdw==
X-CSE-MsgGUID: pugfjzIYSnynIunsRynJ/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="101023389"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="101023389"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 02:30:23 -0700
X-CSE-ConnectionGUID: YxUuXYsWSe6nmplgMor56Q==
X-CSE-MsgGUID: KMFeiII4RRqonLELTpvowg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="224014365"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 02:30:20 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v2] tests/intel/xe_pm_residency: Fix suspend duration
 calculation
Date: Thu, 26 Mar 2026 14:59:57 +0530
Message-ID: <20260326092956.2154139-2-sk.anirban@intel.com>
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

Calculate actual suspend duration using CLOCK_BOOTTIME instead of
relying on the autoresume delay approximation. This ensures accurate
validation of idle residency measurements during suspend cycles.

v2: Use CLOCK_BOOTTIME (Ville)
    Use Fixes (Jani)

Fixes: 5c85b336f75b ("tests/xe: Add a test that validates residency during s2idle")
Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel/xe_pm_residency.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index 61b63ed4f..f2b802273 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -215,18 +215,27 @@ static unsigned long read_idle_residency(int fd, int gt)
 static void test_idle_residency(int fd, int gt, enum test_type flag)
 {
 	unsigned long elapsed_ms, residency_start, residency_end;
+	struct timespec ts_start, ts_end;
+	long elapsed_sec, elapsed_nsec;
 
 	igt_assert_f(igt_wait(xe_gt_is_in_c6(fd, gt), 1000, 1), "GT %d not in C6\n", gt);
 
 	if (flag == TEST_S2IDLE) {
-		/*
-		 * elapsed time during suspend is approximately equal to autoresume delay
-		 * when a full suspend cycle(SUSPEND_TEST_NONE) is used.
-		 */
-		elapsed_ms = igt_get_autoresume_delay(SUSPEND_STATE_FREEZE);
+		clock_gettime(CLOCK_BOOTTIME, &ts_start);
 		residency_start = read_idle_residency(fd, gt);
 		igt_system_suspend_autoresume(SUSPEND_STATE_FREEZE, SUSPEND_TEST_NONE);
 		residency_end = read_idle_residency(fd, gt);
+		clock_gettime(CLOCK_BOOTTIME, &ts_end);
+
+		elapsed_sec = ts_end.tv_sec - ts_start.tv_sec;
+		elapsed_nsec = ts_end.tv_nsec - ts_start.tv_nsec;
+
+		if (elapsed_nsec < 0) {
+			elapsed_sec--;
+			elapsed_nsec += NSEC_PER_SEC;
+		}
+
+		elapsed_ms = (elapsed_sec * MSEC_PER_SEC) + (elapsed_nsec / NSEC_PER_MSEC);
 	}
 
 	if (flag == TEST_IDLE) {
-- 
2.43.0

