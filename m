Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78F066E248
 for <igt-dev@lists.freedesktop.org>; Tue,  5 May 2020 13:32:44 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Tue,  5 May 2020 18:50:30 +0530
Message-Id: <20200505132032.827-5-anshuman.gupta@intel.com>
In-Reply-To: <20200505132032.827-1-anshuman.gupta@intel.com>
References: <20200505132032.827-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v6 4/6] test/i915_pm_lpsp: Skip
 screens-disabled test for DC state platforms
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

screens-disabled test is only valid for the plaforms like HSW/BDW
where PG1 is Always-ON power domain, so these platform test lpsp
with all screen disabled i.e validate PG2 when all screen are
disabled.
DC state i.e DMC f/w supported platforms don't have any ROI to validate
screen-disabled subtest as existing dc*-dpms i915_pm_dc subtest
already validate it implicitly.
This should save some CI-Cycles.

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/i915/i915_pm_lpsp.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/i915/i915_pm_lpsp.c b/tests/i915/i915_pm_lpsp.c
index 8d2e23fe..56980de2 100644
--- a/tests/i915/i915_pm_lpsp.c
+++ b/tests/i915/i915_pm_lpsp.c
@@ -172,8 +172,11 @@ igt_main
 	}
 
 	igt_describe("This test validates lpsp while all crtc are disabled");
-	igt_subtest("screens-disabled")
+	igt_subtest("screens-disabled") {
+		igt_skip_on_f(openat(data.debugfs_fd, "i915_dmc_info", O_RDONLY) > 0,
+			      "DC states supported platform don't have ROI for this subtest\n");
 		screens_disabled_subtest(&data);
+	}
 
 	igt_describe("This test validates lpsp on all connected outputs on low power PIPE_A");
 	igt_subtest_with_dynamic_f("kms-lpsp") {
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
