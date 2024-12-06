Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C1B6E77179
	for <igt-dev@archiver.kernel.org>; Fri,  6 Dec 2024 21:55:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94DB510E22E;
	Fri,  6 Dec 2024 21:55:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kfLuJgom";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10A1210E22E
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Dec 2024 21:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733522101; x=1765058101;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8LN7yU3pM4UkoUlEPJNHUwwh/8+Ui5bVOWvLuDSDA50=;
 b=kfLuJgom2CMxgWtObSMlD73QFuiFR00/lv3lNOMvqPAv8UtvC8bDeKX3
 GHTPl4pJjXC5wsgOJJq/VJpwnRMAx8A/SucxUYVZvJKcCzAJNtl3lJgFV
 GEQaT/7MBIYyhJo+wyPJ/MzwqKx2bZkJUuDL66ZdjAszZkGM9KxF7Pne4
 R4KioEIr4pDJfm2bxdosv0c4Y91Tsyh+N8M6xdDGf0anUMQQAvy++YUIs
 u5lZBqNXImfjVH5SE6UHstJE/A2w7M/EHhAyYrrSowGX9NchjzidYlR2e
 MDqrMvKGJ4sk0Y8/hD/7i175Ua6eFYFY9T4rSlqgeZsZcb6R/KPo6R/t7 Q==;
X-CSE-ConnectionGUID: ZCBCLNf0RX2Kmp/jidmBjw==
X-CSE-MsgGUID: 7rED+ySyRnS77pBeKSfbXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="56376494"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="56376494"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 13:55:00 -0800
X-CSE-ConnectionGUID: TOqBY2EbTLKSN5DLkM2y2A==
X-CSE-MsgGUID: APqj3RSpQBag80yQpy4HSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="99560890"
Received: from dut4066lnl.fm.intel.com ([10.105.10.226])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 13:55:00 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com,
	kamil.konieczny@linux.intel.com
Subject: [PATCH 2/2] tests/intel/xe_sysfs_timeslice_duration: Restore preempt
 timeout
Date: Fri,  6 Dec 2024 21:54:59 +0000
Message-ID: <20241206215459.128077-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241206215459.128077-1-jonathan.cavitt@intel.com>
References: <20241206215459.128077-1-jonathan.cavitt@intel.com>
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

The subtests of sysfs_timeslice_duration modify the preempt_timeout_us
and timeslice_duration_us values.  However, while the test does restore
the timeslice_duration_us value at the end of execution, it does not do
the same for preempt_timeout_us.  Because the value is not properly
restored, future tests can end up using the unexpected preempt timeout
value and thus have unexpected behavior.

Save and restore the preempt_timeout_us value during the test.

This fix does not apply to xe_sysfs_preempt_timeout because only the
preempt_timeout_us is modified during those tests, and the value is
correcty restored before the tests end.

v2: Also restore preempt_timeout_us on test failure (Kamil)

v3: Abort on restore failure (Kamil)

v4: Use a correct Closes link

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3198
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_sysfs_timeslice_duration.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_sysfs_timeslice_duration.c b/tests/intel/xe_sysfs_timeslice_duration.c
index 899093a9df..752672691f 100644
--- a/tests/intel/xe_sysfs_timeslice_duration.c
+++ b/tests/intel/xe_sysfs_timeslice_duration.c
@@ -115,10 +115,11 @@ static uint64_t __test_timeout(int fd, int engine, unsigned int timeout, uint16_
 static void test_timeout(int fd, int engine, const char **property, uint16_t class, int gt)
 {
 	uint64_t delays[] = { 1000, 50000, 100000, 500000 };
-	unsigned int saved;
+	unsigned int saved, old_pt;
 	uint64_t elapsed;
 	uint64_t epsilon;
 
+	igt_assert(igt_sysfs_scanf(engine, "preempt_timeout_us", "%u", &old_pt) == 1);
 	igt_require(igt_sysfs_printf(engine, "preempt_timeout_us", "%u", 1) == 1);
 	igt_assert(igt_sysfs_scanf(engine, property[0], "%u", &saved) == 1);
 	igt_debug("Initial %s:%u\n", property[0], saved);
@@ -140,6 +141,9 @@ static void test_timeout(int fd, int engine, const char **property, uint16_t cla
 	}
 
 	set_timeslice_duration(engine, saved);
+	igt_assert_lte(0, igt_sysfs_printf(engine, "preempt_timeout_us", "%u", old_pt));
+	igt_sysfs_scanf(engine, "preempt_timeout_us", "%u", &saved);
+	igt_assert_eq(saved, old_pt);
 }
 
 #define	MAX_GTS	8
@@ -159,6 +163,7 @@ igt_main
 	int gt_count = 0;
 	int fd = -1, sys_fd, gt;
 	int engines_fd[MAX_GTS], gt_fd[MAX_GTS];
+	unsigned int pts[MAX_GTS][XE_MAX_ENGINE_INSTANCE];
 	unsigned int tds[MAX_GTS][XE_MAX_ENGINE_INSTANCE];
 	int *engine_list[MAX_GTS];
 
@@ -184,6 +189,8 @@ igt_main
 			while (list[i] != -1) {
 				igt_require(igt_sysfs_scanf(list[i], "timeslice_duration_us", "%u",
 							    &tds[gt_count][i]) == 1);
+				igt_require(igt_sysfs_scanf(list[i], "preempt_timeout_us", "%u",
+							    &pts[gt_count][i]) == 1);
 				i++;
 			}
 
@@ -215,8 +222,16 @@ igt_main
 			while (list[j] != -1) {
 				unsigned int store = UINT_MAX;
 
+				igt_sysfs_printf(list[j], "preempt_timeout_us",
+						 "%u", pts[i][j]);
+				igt_sysfs_scanf(list[j], "preempt_timeout_us",
+						"%u", &store);
+				igt_abort_on_f(store != pts[i][j],
+					       "preempt_timeout_us not restored!\n");
+
+				store = UINT_MAX;
 				igt_sysfs_printf(list[j], "timeslice_duration_us",
-						"%u", tds[i][j]);
+						 "%u", tds[i][j]);
 				igt_sysfs_scanf(list[j], "timeslice_duration_us",
 						"%u", &store);
 				igt_abort_on_f(store != tds[i][j],
-- 
2.43.0

