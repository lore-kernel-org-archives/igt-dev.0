Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C76FD10E67E
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Sep 2022 09:33:37 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 13 Sep 2022 15:04:46 +0530
Message-Id: <20220913093446.27842-6-swati2.sharma@intel.com>
In-Reply-To: <20220913093446.27842-1-swati2.sharma@intel.com>
References: <20220913093446.27842-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 5/5] tests/i915/i915_pm_dc: Sleep not reqd.
 to reset counter
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Sleep is not required since we are polling for the same condition.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Imre Deak <imre.deak@intel.com>
---
 tests/i915/i915_pm_dc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
index 1e7b6177f..506aff5a2 100644
--- a/tests/i915/i915_pm_dc.c
+++ b/tests/i915/i915_pm_dc.c
@@ -472,7 +472,6 @@ static void setup_dc9_dpms(data_t *data, int dc_target)
 	}
 	prev_rpm = read_runtime_suspended_time(data->drm_fd);
 	dpms_off(data);
-	sleep(1); /* wait for counters reset*/
 	check_dc9(data, dc_target, prev_dc, prev_rpm);
 	dpms_on(data);
 }
-- 
2.25.1
