Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6468A6EC1A
 for <igt-dev@lists.freedesktop.org>; Wed, 26 May 2021 07:36:33 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Wed, 26 May 2021 12:50:37 +0530
Message-Id: <20210526072040.2286-3-anshuman.gupta@intel.com>
In-Reply-To: <20210526072040.2286-1-anshuman.gupta@intel.com>
References: <20210526072040.2286-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v4 2/5] i915/i915_pm_rpm: optimize
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
stress. As the platforms followed by SKL can really enter to PC8
with display-on, it is sufficient to validate PC8 while all displays
being off with modeset stress.

For older platforms like HASWELL/BROADWELL negative testing of PC8
residency while display being "on" can be removed as it saves CI time
and there is no ROI of such testing with modeset stress, wait_for_active()
already covers such coverage.

It will keep the code simpler without any platform checks.

v2: Used optimum pc8 timeout value and commit log changes.

v3: commit log improvements.

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/i915/i915_pm_rpm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index 9f5656bb..7a4c9291 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -874,7 +874,7 @@ static void modeset_subtest(enum screen_type type, int rounds, int wait_flags)
 		if (wait_flags & WAIT_STATUS)
 			igt_assert(wait_for_suspended());
 		if (wait_flags & WAIT_PC8_RES)
-			igt_assert(pc8_plus_residency_changed(30));
+			igt_assert(pc8_plus_residency_changed(PC8_TIMEOUT));
 		if (wait_flags & WAIT_EXTRA)
 			sleep(5);
 
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
