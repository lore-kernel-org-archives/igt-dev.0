Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B85D36139
	for <igt-dev@archiver.kernel.org>; Tue,  5 Nov 2024 20:11:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 130EE10E605;
	Tue,  5 Nov 2024 20:11:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="btOa8Vao";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E6B810E435
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Nov 2024 20:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730837505; x=1762373505;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KlR+CkWIBXJy1nl2fM8wkerYcsg2uWjGVw3l5viCB4E=;
 b=btOa8Vao5oo3bGSgw2CMhm0HigNvcHaoyKs1/Q7ZbpQf/SiuAbC/BGaF
 zx39ginw8tdGbI8W8lh4OjmiMA5/x2GFP0fAm0bR69Bz0wDb7tIG3J2B5
 OtitR2O/dKJoLyGqWT3YUFBP2IRuQHC+G5Iz64VCq8alBjXRn855vi6LN
 SWgYzzDfkcAOjb9pQSQj4ZBT+mJcgVPJ76N2m4gBrYaewmXo3zXx8d3Z9
 UYkeBGJUyKxrWA40o0/hNzgwFawj2ITB+Isi8nxwK5FW+LYL/l3lNp4Iu
 mKyFTVBoiBvDatl8Eiktu4PRigIo+2esr4q4ZcCYBN68fjq8fDrw/HU2e g==;
X-CSE-ConnectionGUID: OCRr8eNtQc69HOUmBwelhg==
X-CSE-MsgGUID: wWr9+XWITMicftMYu69y7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="34537517"
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; d="scan'208";a="34537517"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 12:11:44 -0800
X-CSE-ConnectionGUID: PG9MLbHcQuS4AZqJukgUJg==
X-CSE-MsgGUID: csEzy06PT1uy8DRJa6P8XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; d="scan'208";a="88108729"
Received: from dut138lnl.fm.intel.com ([10.105.23.14])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 12:11:44 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 kamil.konieczny@linux.intel.com, vinay.belgaumkar@intel.com
Subject: [PATCH v4 2/2] tests/intel/xe_sysfs_timeslice_duration: Restore
 preempt timeout
Date: Tue,  5 Nov 2024 20:11:43 +0000
Message-ID: <20241105201143.159491-3-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105201143.159491-1-jonathan.cavitt@intel.com>
References: <20241105201143.159491-1-jonathan.cavitt@intel.com>
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
 tests/intel/xe_sysfs_timeslice_duration.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_sysfs_timeslice_duration.c b/tests/intel/xe_sysfs_timeslice_duration.c
index dfcdd7335f..4669272719 100644
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
@@ -159,7 +163,7 @@ igt_main
 	int gt_count = 0;
 	int fd = -1, sys_fd, gt;
 	int engines_fd[MAX_GTS], gt_fd[MAX_GTS];
-	unsigned int tds[MAX_GTS];
+	unsigned int tds[MAX_GTS], pts[MAX_GTS];
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
@@ -178,6 +182,9 @@ igt_main
 			igt_require(igt_sysfs_scanf(engines_fd[gt_count],
 						    "timeslice_duration_us",
 						    "%u", &tds[gt_count]) == 1);
+			igt_require(igt_sysfs_scanf(engines_fd[gt_count],
+						    "preempt_timeout_us",
+						    "%u", &pts[gt_count]) == 1);
 			gt_count++;
 		}
 	}
@@ -199,6 +206,12 @@ igt_main
 		for (int i = gt_count - 1; i >= 0; i--) {
 			unsigned int store = UINT_MAX;
 
+			igt_assert_lte(0, igt_sysfs_printf(engines_fd[i], "preempt_timeout_us",
+							   "%u", pts[i]));
+			igt_sysfs_scanf(engines_fd[i], "preempt_timeout_us", "%u", &store);
+			igt_abort_on_f(store != pts[i], "preempt_timeout_us not restored!\n");
+
+			store = UINT_MAX;
 			igt_assert_lte(0, igt_sysfs_printf(engines_fd[i], "timeslice_duration_us",
 							   "%u", tds[i]));
 			igt_sysfs_scanf(engines_fd[i], "timeslice_duration_us", "%u", &store);
-- 
2.43.0

