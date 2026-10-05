Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F24CA5FF0
	for <igt-dev@archiver.kernel.org>; Mon,  5 Oct 2026 22:41:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6055210E1B3;
	Mon,  5 Oct 2026 22:41:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CLbs7+D4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16AB910E1B3
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Oct 2026 22:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791240068; x=1822776068;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=hqlG+miM8rIQO4PMNpl0txNvLUChZHwxu6oPhhynfLY=;
 b=CLbs7+D4RvHIqPHJmfJgESXPLCR4UqPOzw4dHqf23cYv0DFsq0gApU69
 ouczJxkN9srqkmW1kyB0PYBHyxYk2RbMbsR/2+zHSLrQHOAqELrtIlpIT
 uoEfipGC8VoDXXYMXM3DnDk+UX9nFkZCt31QOkBI7P0xvgP77tYIx8TjD
 Ii/lzlURtFa1bIwvrnAlBhrsfukKunTt9wi9jJpxKzsjNnkEVm61RWASu
 67njQWU79j3++CftkkZW44qu7rup2lOgQNNYZh2W80dmIXs3Pswk29Ujq
 LQr6o4Bd0Or09XrnzU/lflcXULFPK86cvH6vrhWpKiV30eDjtJ81TJMoB w==;
X-CSE-ConnectionGUID: +EBV2vpeQMKa+yV+AqyuVA==
X-CSE-MsgGUID: 0Ur/sRG9S46mzaFyHUG+Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="91133981"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="91133981"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 15:41:03 -0700
X-CSE-ConnectionGUID: 1GrCoDUFRcWuX9PeHGzlWg==
X-CSE-MsgGUID: lUKk2cTDSh6NerHW6k2kMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; d="scan'208";a="277062483"
Received: from lstrano-mobl6.amr.corp.intel.com (HELO [192.168.1.16])
 ([10.124.220.73])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 15:41:02 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Mon, 05 Oct 2026 19:40:45 -0300
Subject: [PATCH i-g-t] tests/xe_pmu: Do not enable VFs in unrelated
 subtests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-xe_pmu-do-not-enable-vfs-in-unrelated-subtests-v1-1-ccf95739aacc@intel.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3NQQqDMBBA0avIrDuQhNrSXqUUicloB+xEMokI4
 t0bunyb/w9QykwKz+6ATBsrJ2mwlw7Cx8tMyLEZnHE3a0yPOw3rt2JMKKkgiR8Xwm1SZMEqmRZ
 fKKLWsZAWRXLXYEN89PFuoUXXTBPv/+ELGGcs8D7PHwrceruHAAAA
X-Change-ID: 20261005-xe_pmu-do-not-enable-vfs-in-unrelated-subtests-e24c1cd95d71
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
X-Mailer: b4 0.15-dev
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

The test xe_pmu has a subtest group that enables SRIOV VFs as part of
its fixture.  Even though the fixture is part of a subtest group, the
enabling/disabling will happen regardless of whether those subests are
selected or not (via --run-subtest).

As most subtests in xe_pmu don't need that, avoid doing that as a
fixture and rather incorporate the enabling/disabling as part of a new
macro called test_each_engine_with_vfs().

Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 tests/intel/xe_pmu.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index d41ebba1faef..79d466093d1d 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -124,6 +124,15 @@ static bool has_engine_active_ticks;
 			igt_dynamic_f("engine-%s%d", xe_engine_class_string(hwe->engine_class), \
 				      hwe->engine_instance)
 
+#define test_each_engine_with_vfs(test, fd, hwe, num_vfs) \
+	igt_subtest_with_dynamic(test) \
+		xe_for_each_engine(fd, hwe) \
+			for (num_fns = enable_and_provision_vfs(fd) + 1; \
+			     num_fns; \
+			     unprovision_and_disable_vfs(fd), num_fns = 0) \
+				igt_dynamic_f("engine-%s%d", xe_engine_class_string(hwe->engine_class), \
+					      hwe->engine_instance)
+
 static bool has_event(const char *device, const char *event)
 {
 	char buf[512];
@@ -1192,26 +1201,20 @@ int igt_main()
 	igt_subtest_group() {
 		unsigned int num_fns;
 
-		igt_fixture()
-			num_fns = enable_and_provision_vfs(fd) + 1;
-
 		igt_describe("Validate engine activity on all functions");
-		test_each_engine("all-fn-engine-activity-load", fd, eci)
+		test_each_engine_with_vfs("all-fn-engine-activity-load", fd, eci, num_fns)
 			engine_activity_all_fn(fd, eci, num_fns);
 
 		igt_describe("Validate per-function engine activity");
-		test_each_engine("fn-engine-activity-load", fd, eci)
+		test_each_engine_with_vfs("fn-engine-activity-load", fd, eci, num_fns)
 			for (int fn = 0; fn < num_fns; fn++)
 				engine_activity_fn(fd, eci, fn, XE_SRIOV_SCHED_PRIORITY_LOW);
 
 		igt_describe("Validate per-function engine activity when sched-if-idle is set");
-		test_each_engine("fn-engine-activity-sched-if-idle", fd, eci) {
+		test_each_engine_with_vfs("fn-engine-activity-sched-if-idle", fd, eci, num_fns) {
 			for (int fn = 0; fn < num_fns; fn++)
 				engine_activity_fn(fd, eci, fn, XE_SRIOV_SCHED_PRIORITY_NORMAL);
 		}
-
-		igt_fixture()
-			unprovision_and_disable_vfs(fd);
 	}
 
 	igt_subtest_group() {

---
base-commit: faad2cd0e3e8eb2e18111c2358823a7bdfb56d94
change-id: 20261005-xe_pmu-do-not-enable-vfs-in-unrelated-subtests-e24c1cd95d71

Best regards,
--  
Gustavo Sousa <gustavo.sousa@intel.com>

