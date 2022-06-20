Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DB2110E9B5
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jun 2022 08:56:14 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 20 Jun 2022 14:23:06 +0530
Message-Id: <20220620085306.147014-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=a
Content-Transfer-Encoding: 8bit
Subject: [igt-dev]
 =?a?q?=5BPATCH=20v2=C2=A0=5D=20tests/i915/i915=5Fpm=5Fdc=3A=20Check=20dc3co=20count=20to=20skip=20the=20test?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: nischal.varide@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

If dc3co is not enabled in driver, counter will always be zero and we
can simply skip the test.

Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/4364

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
Reviewed-by:  Swati Sharma <swati2.sharma@intel.com>
---
 tests/i915/i915_pm_dc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
index 2c2c5086..a780f2cb 100644
--- a/tests/i915/i915_pm_dc.c
+++ b/tests/i915/i915_pm_dc.c
@@ -274,7 +274,8 @@ static void check_dc3co_with_videoplayback_like_load(data_t *data)
 		usleep(delay);
 	}
 
-	check_dc_counter(data, CHECK_DC3CO, dc3co_prev_cnt);
+	igt_require_f(dc_state_wait_entry(data->debugfs_fd,
+		      CHECK_DC3CO, dc3co_prev_cnt), "dc3co-vpb-simulation not enabled\n");
 }
 
 static void require_dc_counter(int debugfs_fd, int dc_flag)
-- 
2.25.1
