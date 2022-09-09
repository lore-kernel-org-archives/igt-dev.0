Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E13910ECB0
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Sep 2022 11:48:00 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  9 Sep 2022 17:19:11 +0530
Message-Id: <20220909114911.1852-6-swati2.sharma@intel.com>
In-Reply-To: <20220909114911.1852-1-swati2.sharma@intel.com>
References: <20220909114911.1852-1-swati2.sharma@intel.com>
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
---
 tests/i915/i915_pm_dc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
index 142975e6c..fd5e2c089 100644
--- a/tests/i915/i915_pm_dc.c
+++ b/tests/i915/i915_pm_dc.c
@@ -470,7 +470,6 @@ static void setup_dc9_dpms(data_t *data, int dc_target)
 	}
 	prev_rpm = read_runtime_suspended_time(data->drm_fd);
 	dpms_off(data);
-	sleep(1); /* wait for counters reset*/
 	check_dc9(data, dc_target, prev_dc, prev_rpm);
 	dpms_on(data);
 }
-- 
2.25.1
