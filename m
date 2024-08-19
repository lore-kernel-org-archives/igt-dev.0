Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F01C3DA4A
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 09:48:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C04EA10E236;
	Mon, 19 Aug 2024 09:48:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lZIJF2FT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F41A310E236
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 09:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724060894; x=1755596894;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Rn7yNR4dvd4l9qLDnczniVgkVc3oZgYspkA9YCA3IlM=;
 b=lZIJF2FTIJBjg91Fq0EQkkuauPRthZ1KpjRI9UoRynEkkRrSK0QSolR6
 xUJtLH+SfblpXO+1ca35pCIsr013ddz8yiI39pJaRpQwvfuzOeGah6hDO
 dXBYVJO3IdKXF+jeDv0T/vFei4N1TAGIfCI+E2Cy75rpXQq+aOmtgWsr4
 qjbzThgdqGZufgDG33Fj8WrYZO9cBZDPOJOR0gVKRbUlY/yYEmXkF6Opw
 QK0fb7h6H341Sa8Y+OR7hefolgENq8iUBItL2N7o+0F+FEPxzW9hf4Pz0
 UAMukS74jcocVI+c5+UEnjBOMIa35xf6v7bSxQW9REokAKJ5dXlVTZXrP A==;
X-CSE-ConnectionGUID: GretPpAgRpmJqnctruUCxg==
X-CSE-MsgGUID: Jx49JAfWScac67C/aQb78A==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="22143933"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="22143933"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 02:48:14 -0700
X-CSE-ConnectionGUID: xzfOv0aTSXOOMhvPKrUwEQ==
X-CSE-MsgGUID: fDOfrASuST+ipZXMHkk2dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; d="scan'208";a="65150200"
Received: from sinjan-super-server.iind.intel.com ([10.145.169.153])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 02:48:11 -0700
From: Karthik Poosa <karthik.poosa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com,
 vinay.belgaumkar@intel.com, riana.tauro@intel.com,
 Karthik Poosa <karthik.poosa@intel.com>
Subject: [PATCH i-g-t v3 1/2] tests/intel/xe_gt_freq: Rename
 ACT_FREQ_LATENCY_US to SLPC_FREQ_LATENCY_US
Date: Mon, 19 Aug 2024 15:31:45 +0530
Message-Id: <20240819100146.3130945-2-karthik.poosa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240819100146.3130945-1-karthik.poosa@intel.com>
References: <20240819100146.3130945-1-karthik.poosa@intel.com>
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

Rename ACT_FREQ_LATENCY_US to SLPC_FREQ_LATENCY_US as this delay is
not specific to actual frequency. We may need a wait after gt reset
also for min and max frequencies to get set where this can be used.

Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
---
 tests/intel/xe_gt_freq.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
index 171f9cb44..56cc10ade 100644
--- a/tests/intel/xe_gt_freq.c
+++ b/tests/intel/xe_gt_freq.c
@@ -34,7 +34,7 @@
  * Too many intermediate components and steps before freq is adjusted
  * Specially if workload is under execution, so let's wait 100 ms.
  */
-#define ACT_FREQ_LATENCY_US 100000
+#define SLPC_FREQ_LATENCY_US 100000
 
 static int set_freq(int fd, int gt_id, const char *freq_name, uint32_t freq)
 {
@@ -194,7 +194,7 @@ static void test_freq_fixed(int fd, int gt_id, bool gt_idle)
 	 */
 	igt_assert_lt(0, set_freq(fd, gt_id, "min", rpn));
 	igt_assert_lt(0, set_freq(fd, gt_id, "max", rpn));
-	usleep(ACT_FREQ_LATENCY_US);
+	usleep(SLPC_FREQ_LATENCY_US);
 	igt_assert_eq_u32(get_freq(fd, gt_id, "cur"), rpn);
 
 	if (gt_idle) {
@@ -208,7 +208,7 @@ static void test_freq_fixed(int fd, int gt_id, bool gt_idle)
 
 	igt_assert_lt(0, set_freq(fd, gt_id, "min", rpmid));
 	igt_assert_lt(0, set_freq(fd, gt_id, "max", rpmid));
-	usleep(ACT_FREQ_LATENCY_US);
+	usleep(SLPC_FREQ_LATENCY_US);
 	cur_freq = get_freq(fd, gt_id, "cur");
 	/* If rpmid is around RPe, we could see SLPC follow it */
 	igt_assert_lte_u32((rpmid - FREQ_UNIT_MHZ), cur_freq);
@@ -224,7 +224,7 @@ static void test_freq_fixed(int fd, int gt_id, bool gt_idle)
 
 	igt_assert_lt(0, set_freq(fd, gt_id, "min", rp0));
 	igt_assert_lt(0, set_freq(fd, gt_id, "max", rp0));
-	usleep(ACT_FREQ_LATENCY_US);
+	usleep(SLPC_FREQ_LATENCY_US);
 	/*
 	 * It is unlikely that PCODE will *always* respect any request above RPe
 	 * So for this level let's only check if GuC PC is doing its job
@@ -259,7 +259,7 @@ static void test_freq_range(int fd, int gt_id, bool gt_idle)
 
 	igt_assert_lt(0, set_freq(fd, gt_id, "min", rpn));
 	igt_assert_lt(0, set_freq(fd, gt_id, "max", rpmid));
-	usleep(ACT_FREQ_LATENCY_US);
+	usleep(SLPC_FREQ_LATENCY_US);
 	cur = get_freq(fd, gt_id, "cur");
 	igt_assert(rpn <= cur && cur <= rpmid + FREQ_UNIT_MHZ);
 
@@ -292,7 +292,7 @@ static void test_freq_low_max(int fd, int gt_id)
 	 */
 	igt_assert_lt(0, set_freq(fd, gt_id, "min", rpmid));
 	igt_assert_lt(0, set_freq(fd, gt_id, "max", rpn));
-	usleep(ACT_FREQ_LATENCY_US);
+	usleep(SLPC_FREQ_LATENCY_US);
 
 	/* Cur freq will follow RPe, which could be higher than min freq */
 	igt_assert_lte_u32((rpmid - FREQ_UNIT_MHZ),
@@ -310,7 +310,7 @@ static void test_suspend(int fd, int gt_id)
 
 	igt_assert_lt(0, set_freq(fd, gt_id, "min", rpn));
 	igt_assert_lt(0, set_freq(fd, gt_id, "max", rpn));
-	usleep(ACT_FREQ_LATENCY_US);
+	usleep(SLPC_FREQ_LATENCY_US);
 	igt_assert_eq_u32(get_freq(fd, gt_id, "cur"), rpn);
 
 	igt_system_suspend_autoresume(SUSPEND_STATE_S3,
@@ -337,7 +337,7 @@ static void test_reset(int fd, int gt_id, int cycles)
 			     "Failed after %d good cycles\n", i);
 		igt_assert_f(set_freq(fd, gt_id, "max", rpn) > 0,
 			     "Failed after %d good cycles\n", i);
-		usleep(ACT_FREQ_LATENCY_US);
+		usleep(SLPC_FREQ_LATENCY_US);
 		igt_assert_f(get_freq(fd, gt_id, "cur") == rpn,
 			     "Failed after %d good cycles\n", i);
 
-- 
2.25.1

