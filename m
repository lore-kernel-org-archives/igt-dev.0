Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21F6D89FA6
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Mar 2021 05:23:10 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Wed,  3 Mar 2021 10:37:34 +0530
Message-Id: <20210303050737.22056-3-anshuman.gupta@intel.com>
In-Reply-To: <20210303050737.22056-1-anshuman.gupta@intel.com>
References: <20210303050737.22056-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3 2/5] i915/i915_pm_rpm: optimize
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

modeset-pc8-residency-stress checks PC8 residency with modeset
stress, It is sufficient to validate PC8 while all displays
being off with modeset stress.
Negative testing of PC8 residency on HASWELL/BROADWELL while
display being "on" is removed as it saves CI time and there is
no ROI of such testing. wait_for_active() already covers that
for platform without runtime_pm.

v2: Used optimum pc8 timeout value and commit log changes.

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/i915/i915_pm_rpm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index 067d1b91..c78277aa 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -882,7 +882,7 @@ static void modeset_subtest(enum screen_type type, int rounds, int wait_flags)
 		if (wait_flags & WAIT_STATUS)
 			igt_assert(wait_for_suspended());
 		if (wait_flags & WAIT_PC8_RES)
-			igt_assert(pc8_plus_residency_changed(30));
+			igt_assert(pc8_plus_residency_changed(PC8_TIMEOUT));
 		if (wait_flags & WAIT_EXTRA)
 			sleep(5);
 
@@ -891,8 +891,6 @@ static void modeset_subtest(enum screen_type type, int rounds, int wait_flags)
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
