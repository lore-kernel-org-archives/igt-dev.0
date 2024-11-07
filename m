Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C44D5D69B
	for <igt-dev@archiver.kernel.org>; Thu,  7 Nov 2024 22:52:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 436B710E317;
	Thu,  7 Nov 2024 22:52:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HnF5CWOJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8111D10E23F
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Nov 2024 22:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731019976; x=1762555976;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZH5Tpv4xbeuRhnY/Y6uw0O1WlCGDCQAlbbf2dovO+Ek=;
 b=HnF5CWOJTwOOQz5bthg9DY6O354Di6YkoCOJUmtdcUrk9sIU10U6kciq
 z9okuAGd//EM93qIQem04xA1vW0H/WoZo9gjVRieiY/ZJs1AuuB1khDaJ
 R2MwlfnLqN+dUnkkqdXJu8PsgMpPQx6JDS13WKxrnbn/qcefN23YxHP2A
 GGDULGYuSogCwZ37sYmAcRZKu8w217TeRUWpmjm5aJ94bZOJzYUkFXaWE
 94GwlGQdQfGIqwSdp7IxrwMxF5AcWtZX1NCQXTIx/UT2TqhcMz84KpGyV
 fRigos1XlGYKBEJ9dotruJdxvlzBPdMGEcrIjjNU2Lm39yoWqAO9Pr/MD A==;
X-CSE-ConnectionGUID: W0hb9nz3RRC+Z8MXrDp6Pw==
X-CSE-MsgGUID: H0ITApPBTUiphKJ8RXtQyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11249"; a="31114838"
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; d="scan'208";a="31114838"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 14:52:56 -0800
X-CSE-ConnectionGUID: m/Y1E0CsTyiBFuqJuWIugg==
X-CSE-MsgGUID: ZFstVKWHRqyk5YADmVSs5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,136,1728975600"; d="scan'208";a="85675169"
Received: from dut138lnl.fm.intel.com ([10.105.23.14])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2024 14:52:56 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 kamil.konieczny@linux.intel.com, vinay.belgaumkar@intel.com
Subject: [PATCH v5 3/3] tests/intel/xe_sysfs_timeslice_duration: Restore
 preempt timeout
Date: Thu,  7 Nov 2024 22:52:54 +0000
Message-ID: <20241107225254.302010-4-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241107225254.302010-1-jonathan.cavitt@intel.com>
References: <20241107225254.302010-1-jonathan.cavitt@intel.com>
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

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2976
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_sysfs_timeslice_duration.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_sysfs_timeslice_duration.c b/tests/intel/xe_sysfs_timeslice_duration.c
index 6518086225..c4efd9e11b 100644
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
 
 	igt_fixture {
@@ -177,9 +182,14 @@ igt_main
 			engines_fd[gt_count] = openat(gt_fd[gt_count], "engines", O_RDONLY);
 			igt_require(engines_fd[gt_count] != -1);
 
-			while (igt_sysfs_get_next_engine(engines_fd[gt_count], &engine))
+			while (igt_sysfs_get_next_engine(engines_fd[gt_count], &engine)) {
 				igt_require(igt_sysfs_scanf(engine, "timeslice_duration_us", "%u",
-							    &tds[gt_count][e_count++]) == 1);
+							    &tds[gt_count][e_count]) == 1);
+				igt_require(igt_sysfs_scanf(engine, "preempt_timeout_us", "%u",
+							    &pts[gt_count][e_count]) == 1);
+
+				e_count++;
+			}
 
 			igt_require(e_count > 0);
 			gt_count++;
@@ -206,6 +216,13 @@ igt_main
 			while (igt_sysfs_get_next_engine(engines_fd[i], &engine)) {
 				unsigned int store = UINT_MAX;
 
+				igt_assert_lte(0, igt_sysfs_printf(engine, "preempt_timeout_us",
+								   "%u", pts[i][e_count]));
+				igt_sysfs_scanf(engine, "preempt_timeout_us", "%u", &store);
+				igt_abort_on_f(store != pts[i][e_count],
+					       "preempt_timeout_us not restored!\n");
+
+				store = UINT_MAX;
 				igt_assert_lte(0, igt_sysfs_printf(engine, "timeslice_duration_us",
 								   "%u", tds[i][e_count]));
 				igt_sysfs_scanf(engine, "timeslice_duration_us", "%u", &store);
-- 
2.43.0

