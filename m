Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10DB010E463
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Sep 2022 06:28:45 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 26 Sep 2022 23:28:39 -0700
Message-Id: <20220927062839.2718582-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] i915/i915_pm_rps: Actual freq can be 0 when
 idle or in RC6
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

Actual freq read from sysfs can be 0, i.e. less than RPn, in certain
situations. For example when the device is idle (without the runtime PM
wakeref) actual freq read from sysfs will be 0. Also on Gen12+ actual freq
read from HW will be 0 in RC6. Therefore modify checks comparing actual
freq with RPn.

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/i915_pm_rps.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/i915/i915_pm_rps.c b/tests/i915/i915_pm_rps.c
index db39ec69865c..4865ed1f0042 100644
--- a/tests/i915/i915_pm_rps.c
+++ b/tests/i915/i915_pm_rps.c
@@ -483,14 +483,15 @@ static void idle_check(void)
 		read_freqs(freqs);
 		dump(freqs);
 		check_freq_constraints(freqs);
-		if (freqs[ACT] == freqs[RPn])
+		if (freqs[ACT] <= freqs[RPn])
 			break;
 		usleep(1000 * IDLE_WAIT_TIMESTEP_MSEC);
 		wait += IDLE_WAIT_TIMESTEP_MSEC;
 	} while (wait < IDLE_WAIT_TIMEOUT_MSEC);
 
 	igt_debugfs_dump(drm_fd, "i915_rps_boost_info");
-	igt_assert_eq(freqs[ACT], freqs[RPn]);
+	/* Actual freq may be 0 when idle or in RC6 */
+	igt_assert_lte(freqs[ACT], freqs[RPn]);
 	igt_debug("Required %d msec to reach cur=idle\n", wait);
 }
 
-- 
2.34.1
