Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 265CEE9D83B
	for <igt-dev@archiver.kernel.org>; Mon,  6 Apr 2026 06:00:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0C8510E023;
	Mon,  6 Apr 2026 06:00:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dOJUhpTH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DE6A10E1D8
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2026 06:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775455236; x=1806991236;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=I5acpPhd2FrfbLQnLIfLezryJX31jnurHI2uJAO4G9s=;
 b=dOJUhpTHpkKhRi2xVT1W/QwRviQMQeNNq9TT7s7nrIygF4xTc5g2v896
 NAFEOUb5EMX+aXVmrgp/0NisVwN0Yb61eOBjZUX0PARZJ4pcPfh7t5oto
 pWHEt0h3pTR0Bo1+JEr4lGNZ0Fk6Ybx5zBUGqG0V9tu/v7KTbwmey+a/+
 wPrf7XRQDdojJSojtNKcxPdDuoHJwTpiQEf5m8CQqy/hcdKBDtms58a+x
 03gHp8LQwtSUeZSzA3U0yCRUvp3bxlxCo7pZGLHgkuYo7EusKN6WPqvJ5
 U1qrAtVcV6ezHkeRBjPepcVOXQ776aW/uRoFGdvK8ZJlizOgIRpG87Rzj w==;
X-CSE-ConnectionGUID: 4+JMxQjmRNCZe3qo9t4Bmw==
X-CSE-MsgGUID: xgGeAAmoQ5G1iT9NNzfXVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="75579648"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="75579648"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2026 23:00:36 -0700
X-CSE-ConnectionGUID: e/kPNJNoSGKGt3Gv/OKR+g==
X-CSE-MsgGUID: bkdrxcDhSaamlpHubIHnkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="265768152"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2026 23:00:33 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v4] tests/intel/xe_pm_residency: Fix suspend duration
 calculation
Date: Mon,  6 Apr 2026 11:29:21 +0530
Message-ID: <20260406055920.2622329-2-sk.anirban@intel.com>
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
v3: Use igt_time_elapsed (Riana)
    Remove check (Riana)
v4: Use MSEC_PER_SEC ( Riana)

Fixes: 5c85b336f75b ("tests/xe: Add a test that validates residency during s2idle")
Signed-off-by: Sk Anirban <sk.anirban@intel.com>
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
---
 tests/intel/xe_pm_residency.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
index 61b63ed4f..b9fbc2e14 100644
--- a/tests/intel/xe_pm_residency.c
+++ b/tests/intel/xe_pm_residency.c
@@ -215,18 +215,18 @@ static unsigned long read_idle_residency(int fd, int gt)
 static void test_idle_residency(int fd, int gt, enum test_type flag)
 {
 	unsigned long elapsed_ms, residency_start, residency_end;
+	struct timespec ts_start, ts_end;
 
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
+		elapsed_ms = igt_time_elapsed(&ts_start, &ts_end) * MSEC_PER_SEC;
 	}
 
 	if (flag == TEST_IDLE) {
@@ -238,14 +238,6 @@ static void test_idle_residency(int fd, int gt, enum test_type flag)
 	igt_info("Measured %lums of idle residency in %lums\n",
 		 residency_end - residency_start, elapsed_ms);
 
-	/*
-	 * When suspended (system or runtime suspend), device needs to be woken up to read
-	 * residency. Idle residency may increase during resume thus being greater than
-	 * elapsed ms.
-	 */
-	if ((residency_end - residency_start) >= elapsed_ms)
-		return;
-
 	assert_within_epsilon(residency_end - residency_start, elapsed_ms, tolerance);
 }
 
-- 
2.43.0

