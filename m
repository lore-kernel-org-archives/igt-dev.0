Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 662D96EA4A
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Feb 2021 10:18:55 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Wed,  3 Feb 2021 15:33:08 +0530
Message-Id: <20210203100310.19441-3-anshuman.gupta@intel.com>
In-Reply-To: <20210203100310.19441-1-anshuman.gupta@intel.com>
References: <20210203100310.19441-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 2/4] i915/i915_pm_rpm: optimize
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
Cc: rodrigo.vivi@intel.com, chris@chris-wilson.co.uk
List-ID: <igt-dev@lists.freedesktop.org>

modeset-pc8-residency-stress checks PC8 residency with modeset
stress, It is sufficient to validate PC8 while all displays
being off with modeset stress.
Negative testing of PC8 residency on HASWELL/BROADWELL while
display being "on" is removed as it saves CI time and there is
no ROI of such testing.

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/i915/i915_pm_rpm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index 8914f976..a33cc27a 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -883,8 +883,6 @@ static void modeset_subtest(enum screen_type type, int rounds, int wait_flags)
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
