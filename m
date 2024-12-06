Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270C6E77173
	for <igt-dev@archiver.kernel.org>; Fri,  6 Dec 2024 21:55:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B939610E1B1;
	Fri,  6 Dec 2024 21:55:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m3kDRkS+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B9FF10E1B1
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Dec 2024 21:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733522101; x=1765058101;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HpL4/c1huc1ubIq0Li11c9hk7jChZaAl90mqH24bY+U=;
 b=m3kDRkS+CHayj6697GOXiBl6eFU/FB90YJx7MFFNJpVjElRAyguR5VF7
 p5UvDf1kbzvH/HsbH8F32cDkw8B1lopBVMqBlL3lMuVlNvLEWmvMTc6jd
 sK9zIaKKstS5hPYb/QIjvytjrpYGPGuCZI2NoEQUSLCDTzlnViUyBUKDZ
 KqP0p8/OaYdYJ1Qii8W3OaC0rqfFlA4maE3LmUWmiQGSCfIQK6XhY6UU4
 CRRlM31Ko7AQY7Yz6fHZ2OduG85eBSp+zIUGs7QxdFalyU2ghXwwUxD7x
 mju1LQA/tRLdTgLpZsLXLRSekVqVPEi8OpdwV5ksTe1kXnj9QBhiyxFS/ A==;
X-CSE-ConnectionGUID: TfZvNE0GRW62T66yy8/tcg==
X-CSE-MsgGUID: kh/V3Cf3QMO8a6mN4RfPxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="56376493"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="56376493"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 13:55:00 -0800
X-CSE-ConnectionGUID: Mcj9TsmUSrGm9BVb2tNHJQ==
X-CSE-MsgGUID: agkRSsF+T2G1OeUK35R6Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="99560887"
Received: from dut4066lnl.fm.intel.com ([10.105.10.226])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 13:55:00 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com,
	kamil.konieczny@linux.intel.com
Subject: [PATCH 1/2] Revert "tests/intel/xe_sysfs_timeslice_duration: Restore
 preempt timeout"
Date: Fri,  6 Dec 2024 21:54:58 +0000
Message-ID: <20241206215459.128077-1-jonathan.cavitt@intel.com>
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

This reverts commit f33842ab06b7470c9c9ec482bfd123b2d58507af.

The commit refers to the wrong link in the Closes field, so that needs
to be changed.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 tests/intel/xe_sysfs_timeslice_duration.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/tests/intel/xe_sysfs_timeslice_duration.c b/tests/intel/xe_sysfs_timeslice_duration.c
index 752672691f..899093a9df 100644
--- a/tests/intel/xe_sysfs_timeslice_duration.c
+++ b/tests/intel/xe_sysfs_timeslice_duration.c
@@ -115,11 +115,10 @@ static uint64_t __test_timeout(int fd, int engine, unsigned int timeout, uint16_
 static void test_timeout(int fd, int engine, const char **property, uint16_t class, int gt)
 {
 	uint64_t delays[] = { 1000, 50000, 100000, 500000 };
-	unsigned int saved, old_pt;
+	unsigned int saved;
 	uint64_t elapsed;
 	uint64_t epsilon;
 
-	igt_assert(igt_sysfs_scanf(engine, "preempt_timeout_us", "%u", &old_pt) == 1);
 	igt_require(igt_sysfs_printf(engine, "preempt_timeout_us", "%u", 1) == 1);
 	igt_assert(igt_sysfs_scanf(engine, property[0], "%u", &saved) == 1);
 	igt_debug("Initial %s:%u\n", property[0], saved);
@@ -141,9 +140,6 @@ static void test_timeout(int fd, int engine, const char **property, uint16_t cla
 	}
 
 	set_timeslice_duration(engine, saved);
-	igt_assert_lte(0, igt_sysfs_printf(engine, "preempt_timeout_us", "%u", old_pt));
-	igt_sysfs_scanf(engine, "preempt_timeout_us", "%u", &saved);
-	igt_assert_eq(saved, old_pt);
 }
 
 #define	MAX_GTS	8
@@ -163,7 +159,6 @@ igt_main
 	int gt_count = 0;
 	int fd = -1, sys_fd, gt;
 	int engines_fd[MAX_GTS], gt_fd[MAX_GTS];
-	unsigned int pts[MAX_GTS][XE_MAX_ENGINE_INSTANCE];
 	unsigned int tds[MAX_GTS][XE_MAX_ENGINE_INSTANCE];
 	int *engine_list[MAX_GTS];
 
@@ -189,8 +184,6 @@ igt_main
 			while (list[i] != -1) {
 				igt_require(igt_sysfs_scanf(list[i], "timeslice_duration_us", "%u",
 							    &tds[gt_count][i]) == 1);
-				igt_require(igt_sysfs_scanf(list[i], "preempt_timeout_us", "%u",
-							    &pts[gt_count][i]) == 1);
 				i++;
 			}
 
@@ -222,16 +215,8 @@ igt_main
 			while (list[j] != -1) {
 				unsigned int store = UINT_MAX;
 
-				igt_sysfs_printf(list[j], "preempt_timeout_us",
-						 "%u", pts[i][j]);
-				igt_sysfs_scanf(list[j], "preempt_timeout_us",
-						"%u", &store);
-				igt_abort_on_f(store != pts[i][j],
-					       "preempt_timeout_us not restored!\n");
-
-				store = UINT_MAX;
 				igt_sysfs_printf(list[j], "timeslice_duration_us",
-						 "%u", tds[i][j]);
+						"%u", tds[i][j]);
 				igt_sysfs_scanf(list[j], "timeslice_duration_us",
 						"%u", &store);
 				igt_abort_on_f(store != tds[i][j],
-- 
2.43.0

