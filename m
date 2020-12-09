Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0C026EACC
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Dec 2020 16:22:01 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Wed,  9 Dec 2020 21:36:39 +0530
Message-Id: <20201209160642.6317-4-anshuman.gupta@intel.com>
In-Reply-To: <20201209160642.6317-1-anshuman.gupta@intel.com>
References: <20201209160642.6317-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/6] i915/i915_pm_rpm: enable
 modeset-pc8-residency-stress test
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
List-ID: <igt-dev@lists.freedesktop.org>

Enable modeset-pc8-residency-stress to check PC8 residency
after modeset.
Negative testing of PC8 residency on HASWELL/BROADWELL while
display being "on" is removed as it saves CI time and there is
no ROI of such testing.

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/i915/i915_pm_rpm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index 42bc44d9..34ec9a6d 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -878,8 +878,10 @@ static void modeset_subtest(enum screen_type type, int rounds, int wait_flags)
 {
 	int i;
 
-	if (wait_flags & WAIT_PC8_RES)
+	if (wait_flags & WAIT_PC8_RES) {
 		igt_require(has_pc8);
+		igt_require(setup_powertop());
+	}
 
 	if (wait_flags & WAIT_EXTRA)
 		rounds /= 2;
@@ -902,8 +904,6 @@ static void modeset_subtest(enum screen_type type, int rounds, int wait_flags)
 		igt_require(enable_one_screen_with_type(&ms_data, type));
 		if (wait_flags & WAIT_STATUS)
 			igt_assert(wait_for_active());
-		if (wait_flags & WAIT_PC8_RES)
-			igt_assert(!pc8_plus_residency_changed(5));
 		if (wait_flags & WAIT_EXTRA)
 			sleep(5);
 	}
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
