Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8557CA5FED
	for <igt-dev@archiver.kernel.org>; Tue,  6 Oct 2026 14:13:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52ED010E39B;
	Tue,  6 Oct 2026 14:13:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EfI9JvQ9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4F8110E334
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Oct 2026 14:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791295975; x=1822831975;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=IbLFQ5kFZ9eEJDVxCblO/Rx/njexhGQg6KfpW3MA2nA=;
 b=EfI9JvQ9d3DFzt7AomovGw3Ps6+rphx6FJDYezbh2+alx4Jq0jaZw8nA
 MwsiU2VN2UKZm7Cr57L0eo2ZMpT4y/QDyqsx5pS/tNh7TJw2fxoY71XUD
 iCrvGmLpeq0YeM51WegoW1KkZ38VV0xY+H4CDmUR4KtURl0Jx/Wx4I1eQ
 rFy6FM1T2b9vq2+C8YJ0u7SlKYDU8tH5uf9gdDPtuKI+DeTaRgWAdfvy6
 bcUO+P5jESa9aEPZHKpyhCTnpoQu0gUxPzO+AoMg5dc7HhCG4XywunaRM
 z6BrPTgQoVriUI2AWW+mwH9kOcG8YAeR93d/rt3QwqJw9jpzqZKhdsd00 w==;
X-CSE-ConnectionGUID: 6rvBe88gS8C9Ryo1EnKOhA==
X-CSE-MsgGUID: EQ+JlbOYQ5S1N9S/Cddxjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="44579"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="44579"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 07:12:54 -0700
X-CSE-ConnectionGUID: QyiygfXoRo+E6FDgb4cM6g==
X-CSE-MsgGUID: Nn/IfwCURwmXdS1VcmkRYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="285260764"
Received: from khuang2-desk.gar.corp.intel.com (HELO [192.168.1.16])
 ([10.124.220.175])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 07:12:53 -0700
From: Gustavo Sousa <gustavo.sousa@intel.com>
Date: Tue, 06 Oct 2026 11:11:19 -0300
Subject: [PATCH i-g-t v2] tests/intel/xe_pmu: Do not enable VFs in
 unrelated subtests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-xe_pmu-do-not-enable-vfs-in-unrelated-subtests-v2-1-38f204d54553@intel.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/52OUQqDMBBEryL73S0mrRX71XsUKTFZdUETSWKwi
 Hdv8Aj9fDMwb3YI5JkCPIsdPCUO7GwGeSlAj8oOhGwygyzlQ5RlhRt9lnlF49C6iGRVNxGmPiB
 bXK2nSUUyGNYuUogBSd610KapTC0gjy6eet5O4RsYB4zQ5njkEJ3/njeSOMt/jUmgQK37pqpvj
 VJav9hGmq7azdAex/EDY9EpbfMAAAA=
X-Change-ID: 20261005-xe_pmu-do-not-enable-vfs-in-unrelated-subtests-e24c1cd95d71
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Gustavo Sousa <gustavo.sousa@intel.com>
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

v2:
  - Add "intel" to commit subject prefix. (Kamil)
  - Fix argument name of test_each_engine_with_vfs():
    s/num_vfs/num_fns/. (Kamil)
  - Enable/disable VFs only once per macro call by moving the call to
    xe_for_each_engine() inside the for-loop. (Marcin)

Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
---
 tests/intel/xe_pmu.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
index d41ebba1faef..eda56c078653 100644
--- a/tests/intel/xe_pmu.c
+++ b/tests/intel/xe_pmu.c
@@ -124,6 +124,15 @@ static bool has_engine_active_ticks;
 			igt_dynamic_f("engine-%s%d", xe_engine_class_string(hwe->engine_class), \
 				      hwe->engine_instance)
 
+#define test_each_engine_with_vfs(test, fd, hwe, num_fns) \
+	igt_subtest_with_dynamic(test) \
+		for (num_fns = enable_and_provision_vfs(fd) + 1; \
+		     num_fns; \
+		     unprovision_and_disable_vfs(fd), num_fns = 0) \
+			xe_for_each_engine(fd, hwe) \
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

